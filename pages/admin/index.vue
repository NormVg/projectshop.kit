<template>
  <div class="admin">
    <header class="header">
      <div class="header-left">
        <div class="logo">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <polygon points="12 2 22 8.5 22 15.5 12 22 2 15.5 2 8.5 12 2" />
          </svg>
          <span>Admin</span>
        </div>
        <h1>Projects</h1>
      </div>
      <div class="header-right">
        <NuxtLink to="/" class="back-link">← Back to Site</NuxtLink>
        <button class="btn-add" @click="openModal()">+ Add Project</button>
      </div>
    </header>

    <div class="stats">
      <div class="stat">
        <span class="num">{{ projects?.length || 0 }}</span>
        <span class="label">Total</span>
      </div>
      <div class="stat">
        <span class="num">{{projects?.filter(p => p.is_active).length || 0}}</span>
        <span class="label">Active</span>
      </div>
      <div class="stat">
        <span class="num">{{projects?.filter(p => p.badge).length || 0}}</span>
        <span class="label">Featured</span>
      </div>
    </div>

    <div class="search-bar">
      <input v-model="search" type="text" placeholder="Search projects..." />
    </div>

    <div v-if="pending" class="loading">Loading...</div>
    <div v-else-if="!filtered.length" class="empty">No projects found</div>
    <AdminProjectTable v-else :projects="filtered" @edit="openModal" @delete="deleteProject" />

    <AdminProjectModal :show="showModal" :project="editing" @close="closeModal" @saved="refresh" />
  </div>
</template>

<script setup>
const supabase = useSupabaseClient();

const showModal = ref(false);
const editing = ref(null);
const search = ref('');

const { data: projects, pending, refresh } = await useAsyncData('admin-projects', async () => {
  const { data } = await supabase.from('projects').select('*').order('created_at', { ascending: false });
  return data || [];
});

const filtered = computed(() => {
  if (!search.value) return projects.value || [];
  const q = search.value.toLowerCase();
  return (projects.value || []).filter(p => p.name.toLowerCase().includes(q) || p.slug.toLowerCase().includes(q));
});

const openModal = (project = null) => {
  editing.value = project;
  showModal.value = true;
};

const closeModal = () => {
  showModal.value = false;
  editing.value = null;
};

const deleteProject = async (id) => {
  if (!confirm('Delete this project?')) return;
  await supabase.from('projects').delete().eq('id', id);
  refresh();
};
</script>

<style scoped>
.admin {
  min-height: 100vh;
  background: #0a0a0a;
  color: #fff;
  padding: 24px 32px;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', system-ui, sans-serif;
  font-size: 14px;
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 24px;
  padding-bottom: 16px;
  border-bottom: 1px solid #262626;
}

.header-left {
  display: flex;
  align-items: center;
  gap: 20px;
}

.logo {
  display: flex;
  align-items: center;
  gap: 8px;
  font-weight: 600;
}

.logo svg {
  width: 20px;
  height: 20px;
  color: #7c3aed;
}

.header h1 {
  font-size: 20px;
  font-weight: 600;
  margin: 0;
}

.header-right {
  display: flex;
  align-items: center;
  gap: 12px;
}

.back-link {
  color: #888;
  text-decoration: none;
  font-size: 13px;
}

.back-link:hover {
  color: #7c3aed;
}

.btn-add {
  background: #7c3aed;
  color: #fff;
  border: none;
  padding: 8px 16px;
  border-radius: 6px;
  font-size: 13px;
  font-weight: 500;
  cursor: pointer;
}

.btn-add:hover {
  background: #6d28d9;
}

.stats {
  display: flex;
  gap: 16px;
  margin-bottom: 20px;
}

.stat {
  background: #141414;
  border: 1px solid #262626;
  border-radius: 8px;
  padding: 12px 20px;
}

.stat .num {
  display: block;
  font-size: 24px;
  font-weight: 600;
}

.stat .label {
  color: #888;
  font-size: 12px;
}

.search-bar {
  margin-bottom: 16px;
}

.search-bar input {
  width: 100%;
  max-width: 280px;
  background: #141414;
  border: 1px solid #262626;
  border-radius: 6px;
  padding: 8px 12px;
  color: #fff;
  font-size: 13px;
}

.search-bar input:focus {
  outline: none;
  border-color: #7c3aed;
}

.search-bar input::placeholder {
  color: #666;
}

.loading,
.empty {
  text-align: center;
  padding: 40px;
  color: #888;
}
</style>
