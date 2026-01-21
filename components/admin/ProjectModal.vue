<template>
  <Teleport to="body">
    <div v-if="show" class="overlay" @click.self="$emit('close')">
      <div class="modal">
        <div class="modal-head">
          <h2>{{ isEdit ? 'Edit Project' : 'New Project' }}</h2>
          <button class="close" @click="$emit('close')">×</button>
        </div>

        <form @submit.prevent="handleSubmit">
          <div class="form-body">
            <div class="row">
              <div class="field">
                <label>Name</label>
                <input v-model="form.name" type="text" required />
              </div>
              <div class="field">
                <label>Slug</label>
                <input v-model="form.slug" type="text" required />
              </div>
            </div>

            <div class="row four">
              <div class="field">
                <label>Price (₹)</label>
                <input v-model.number="form.price" type="number" min="0" required />
              </div>
              <div class="field">
                <label>Category</label>
                <input v-model="form.category" type="text" placeholder="e.g. Web, Mobile, API" />
              </div>
              <div class="field">
                <label>Badge</label>
                <select v-model="form.badge">
                  <option value="">None</option>
                  <option value="Bestseller">Bestseller</option>
                  <option value="Popular">Popular</option>
                  <option value="New">New</option>
                  <option value="Hot">Hot</option>
                </select>
              </div>
              <div class="field">
                <label>Status</label>
                <select v-model="form.is_active">
                  <option :value="true">Active</option>
                  <option :value="false">Draft</option>
                </select>
              </div>
            </div>

            <div class="field">
              <label>Description</label>
              <input v-model="form.description" type="text" />
            </div>

            <div class="field">
              <label>Thumbnail</label>
              <div class="upload" @click="triggerUpload" @dragover.prevent @drop.prevent="handleDrop">
                <input ref="fileInput" type="file" accept="image/*" @change="handleFile" hidden />
                <template v-if="form.thumbnail_url">
                  <img :src="form.thumbnail_url" alt="" />
                  <button type="button" class="remove" @click.stop="form.thumbnail_url = ''">×</button>
                </template>
                <template v-else>
                  <span>{{ uploading ? 'Uploading...' : 'Click to upload' }}</span>
                </template>
              </div>
            </div>

            <div class="field">
              <label>Content</label>
              <textarea v-model="form.content" rows="3"></textarea>
            </div>
          </div>

          <div class="modal-foot">
            <button type="button" class="btn-cancel" @click="$emit('close')">Cancel</button>
            <button type="submit" class="btn-save" :disabled="saving">
              {{ saving ? 'Saving...' : 'Save' }}
            </button>
          </div>
        </form>
      </div>
    </div>
  </Teleport>
</template>

<script setup>
const props = defineProps({
  show: Boolean,
  project: Object
});

const emit = defineEmits(['close', 'saved']);

const supabase = useSupabaseClient();
const fileInput = ref(null);
const saving = ref(false);
const uploading = ref(false);

const isEdit = computed(() => !!props.project?.id);

const form = ref({
  name: '',
  slug: '',
  description: '',
  content: '',
  price: 19,
  category: '',
  badge: '',
  thumbnail_url: '',
  is_active: true
});

watch(() => props.project, (p) => {
  if (p) {
    form.value = {
      name: p.name || '',
      slug: p.slug || '',
      description: p.description || '',
      content: p.content || '',
      price: Math.round((p.price || 0) / 100),
      category: p.category || '',
      badge: p.badge || '',
      thumbnail_url: p.thumbnail_url || '',
      is_active: p.is_active ?? true
    };
  } else {
    form.value = { name: '', slug: '', description: '', content: '', price: 19, category: '', badge: '', thumbnail_url: '', is_active: true };
  }
}, { immediate: true });

watch(() => form.value.name, (name) => {
  if (!isEdit.value && name) {
    form.value.slug = name.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '');
  }
});

const triggerUpload = () => fileInput.value?.click();

const handleFile = (e) => uploadFile(e.target.files?.[0]);
const handleDrop = (e) => uploadFile(e.dataTransfer?.files?.[0]);

const uploadFile = async (file) => {
  if (!file?.type.startsWith('image/')) {
    alert('Please upload an image file');
    return;
  }

  uploading.value = true;

  try {
    const ext = file.name.split('.').pop();
    const fileName = `${Date.now()}-${Math.random().toString(36).slice(2, 8)}.${ext}`;
    const filePath = `thumbnails/${fileName}`;

    // Upload with upsert option
    const { data: uploadData, error: uploadError } = await supabase.storage
      .from('project-thumbnails')
      .upload(filePath, file, {
        cacheControl: '3600',
        upsert: true
      });

    if (uploadError) {
      console.error('Upload error:', uploadError);
      alert('Upload failed: ' + uploadError.message);
      return;
    }

    // Get public URL
    const { data: urlData } = supabase.storage
      .from('project-thumbnails')
      .getPublicUrl(filePath);

    form.value.thumbnail_url = urlData.publicUrl;
    console.log('Uploaded successfully:', urlData.publicUrl);

  } catch (e) {
    console.error('Upload error:', e);
    alert('Upload failed: ' + e.message);
  } finally {
    uploading.value = false;
  }
};

const handleSubmit = async () => {
  saving.value = true;
  const data = {
    name: form.value.name,
    slug: form.value.slug.toLowerCase().replace(/\s+/g, '-'),
    description: form.value.description,
    content: form.value.content,
    price: form.value.price * 100,
    category: form.value.category,
    badge: form.value.badge,
    thumbnail_url: form.value.thumbnail_url,
    is_active: form.value.is_active
  };

  try {
    if (isEdit.value) {
      await supabase.from('projects').update(data).eq('id', props.project.id);
    } else {
      await supabase.from('projects').insert([data]);
    }
    emit('saved');
    emit('close');
  } catch (e) {
    alert('Error: ' + e.message);
  } finally {
    saving.value = false;
  }
};
</script>

<style scoped>
.overlay {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.8);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', system-ui, sans-serif;
}

.modal {
  background: #141414;
  border: 1px solid #262626;
  border-radius: 12px;
  width: 100%;
  max-width: 670px;
  max-height: 90vh;
  overflow-y: auto;
}

.modal-head {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 20px;
  border-bottom: 1px solid #262626;
}

.modal-head h2 {
  margin: 0;
  font-size: 16px;
  font-weight: 600;
  color: #fff;
}

.close {
  width: 28px;
  height: 28px;
  background: none;
  border: none;
  color: #888;
  font-size: 20px;
  cursor: pointer;
  border-radius: 4px;
}

.close:hover {
  background: #262626;
  color: #fff;
}

.form-body {
  padding: 20px;
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
}

.row.four {
  grid-template-columns: repeat(4, 1fr);
}

.field {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.field label {
  font-size: 12px;
  color: #888;
  font-weight: 500;
}

.field input,
.field select,
.field textarea {
  padding: 8px 12px;
  background: #0a0a0a;
  border: 1px solid #262626;
  border-radius: 6px;
  color: #fff;
  font-size: 13px;
  font-family: inherit;
}

.field input:focus,
.field select:focus,
.field textarea:focus {
  outline: none;
  border-color: #7c3aed;
}

.upload {
  border: 1px dashed #262626;
  border-radius: 6px;
  padding: 20px;
  text-align: center;
  cursor: pointer;
  color: #666;
  font-size: 13px;
  position: relative;
}

.upload:hover {
  border-color: #7c3aed;
}

.upload img {
  max-height: 80px;
  border-radius: 4px;
}

.upload .remove {
  position: absolute;
  top: 8px;
  right: 8px;
  width: 20px;
  height: 20px;
  background: #f87171;
  border: none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 14px;
}

.modal-foot {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
  padding: 16px 20px;
  border-top: 1px solid #262626;
}

.btn-cancel,
.btn-save {
  padding: 8px 16px;
  border-radius: 6px;
  font-size: 13px;
  font-weight: 500;
  cursor: pointer;
  border: none;
}

.btn-cancel {
  background: #262626;
  color: #fff;
}

.btn-cancel:hover {
  background: #333;
}

.btn-save {
  background: #7c3aed;
  color: #fff;
}

.btn-save:hover {
  background: #6d28d9;
}

.btn-save:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
</style>
