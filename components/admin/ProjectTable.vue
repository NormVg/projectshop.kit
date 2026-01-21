<template>
  <div class="table-wrap">
    <table>
      <thead>
        <tr>
          <th>Project</th>
          <th>Category</th>
          <th>Price</th>
          <th>Badge</th>
          <th>Status</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="project in projects" :key="project.id">
          <td>
            <div class="project-info">
              <div class="thumb"
                :style="project.thumbnail_url ? { backgroundImage: `url(${project.thumbnail_url})` } : {}"></div>
              <div>
                <span class="name">{{ project.name }}</span>
                <span class="slug">{{ project.slug }}</span>
              </div>
            </div>
          </td>
          <td>{{ project.category || '—' }}</td>
          <td class="price">₹{{ Math.round(project.price / 100) }}</td>
          <td>
            <span v-if="project.badge" class="badge">{{ project.badge }}</span>
            <span v-else class="muted">—</span>
          </td>
          <td>
            <span :class="['status', project.is_active ? 'active' : 'draft']">
              {{ project.is_active ? 'Active' : 'Draft' }}
            </span>
          </td>
          <td class="actions">
            <button @click="$emit('edit', project)" title="Edit">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" />
                <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z" />
              </svg>
            </button>
            <button @click="$emit('delete', project.id)" title="Delete" class="danger">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <polyline points="3 6 5 6 21 6" />
                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
              </svg>
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
defineProps({
  projects: { type: Array, required: true }
});

defineEmits(['edit', 'delete']);
</script>

<style scoped>
.table-wrap {
  background: #141414;
  border: 1px solid #262626;
  border-radius: 8px;
  overflow: hidden;
}

table {
  width: 100%;
  border-collapse: collapse;
}

th,
td {
  padding: 12px 16px;
  text-align: left;
  font-size: 13px;
}

th {
  background: #1a1a1a;
  color: #888;
  font-weight: 500;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

tbody tr {
  border-top: 1px solid #262626;
}

tbody tr:hover {
  background: #1a1a1a;
}

.project-info {
  display: flex;
  align-items: center;
  gap: 12px;
}

.thumb {
  width: 32px;
  height: 32px;
  background: linear-gradient(135deg, #7c3aed, #a78bfa);
  border-radius: 6px;
  flex-shrink: 0;
  background-size: cover;
  background-position: center;
}

.name {
  display: block;
  font-weight: 500;
  color: #fff;
}

.slug {
  display: block;
  font-size: 11px;
  color: #666;
}

.price {
  color: #4ade80;
  font-weight: 500;
}

.badge {
  display: inline-block;
  background: #fbbf24;
  color: #000;
  padding: 2px 8px;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 500;
}

.muted {
  color: #444;
}

.status {
  display: inline-block;
  padding: 2px 8px;
  border-radius: 4px;
  font-size: 11px;
  font-weight: 500;
}

.status.active {
  background: rgba(74, 222, 128, 0.15);
  color: #4ade80;
}

.status.draft {
  background: #262626;
  color: #888;
}

.actions {
  text-align: right;
}

.actions button {
  width: 28px;
  height: 28px;
  background: none;
  border: none;
  cursor: pointer;
  border-radius: 4px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  margin-left: 4px;
}

.actions button:hover {
  background: #262626;
}

.actions button svg {
  width: 14px;
  height: 14px;
  color: #888;
}

.actions button:hover svg {
  color: #fff;
}

.actions button.danger:hover svg {
  color: #f87171;
}
</style>
