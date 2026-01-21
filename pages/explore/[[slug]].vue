<template>
  <section>
    <div id="explore">
      <img :src="BallMesh" alt="" class="ball-mesh" />
      <Navbar />

      <!-- Loading State -->
      <div v-if="pending" class="loading-state">
        <div class="loading-spinner"></div>
        <p>Loading project...</p>
      </div>

      <!-- Error State -->
      <div v-else-if="error || !project" class="error-state">
        <h2>Project Not Found</h2>
        <p>The project you're looking for doesn't exist or has been removed.</p>
        <NuxtLink to="/marketplace" class="back-btn">← Back to Marketplace</NuxtLink>
      </div>

      <!-- Project Content -->
      <div v-else class="explore-content">
        <div class="exp-thumb"
          :style="project.thumbnail_url ? { backgroundImage: `url(${project.thumbnail_url})` } : {}">
        </div>
        <div class="exp-box">

          <div class="exp-head">
            {{ project.name }}
          </div>

          <div class="exp-sub">{{ project.description }}</div>

          <div class="exp-btn">
            <MyBtn :text="`₹${Math.round(project.price / 100)}`" />
          </div>

          <div class="exp-body">
            <MarkdownRender :md="project.content || project.description" />
          </div>
        </div>
      </div>

    </div>

    <Footer />
  </section>
</template>

<script setup>
import BallMesh from "~/assets/exp-ball-mesh.svg"
import Footer from "~/components/blocks/footer.vue";
import MarkdownRender from "~/components/MarkdownRender.vue";
import MyBtn from "~/components/MyBtn.vue";
import Navbar from "~/components/Navbar.vue";

const route = useRoute();
const { getProjectBySlug, getProjectById } = useProjects();

// Get project slug from route params or query
const slug = computed(() => route.params.slug || route.query.project);

// Fetch project from Supabase
const { data: project, pending, error } = await useAsyncData(
  `project-${slug.value}`,
  async () => {
    if (!slug.value) return null;

    try {
      // Try to fetch by slug first
      let data = await getProjectBySlug(slug.value);

      // If not found by slug, try by ID (for legacy URLs)
      if (!data && slug.value.startsWith('cardID-')) {
        data = await getProjectById(slug.value);
      }

      // Fallback static data for when Supabase is not configured
      if (!data) {
        const fallbackProjects = {
          'portfolio-boomer': { id: "1", name: "Portfolio Boomer", slug: "portfolio-boomer", description: "One of the best selling prog type. Perfect for students looking to showcase their web development skills.", content: "# Portfolio Boomer\n\nA stunning portfolio template designed for developers and designers.\n\n## Features\n\n- Modern, responsive design\n- Dark/Light theme support\n- Easy customization\n- Projects showcase\n- Contact form integration\n\n## Tech Stack\n\n- Vue 3\n- Nuxt 3\n- TailwindCSS\n- Supabase", price: 1900, category: "Web", badge: "Bestseller" },
          'growth-rocket': { id: "2", name: "Growth Rocket", slug: "growth-rocket", description: "High growth potential mobile app starter kit.", content: "# Growth Rocket\n\nMobile app starter with all the essentials.", price: 2500, category: "Mobile", badge: "Popular" },
        };
        data = fallbackProjects[slug.value] || fallbackProjects['portfolio-boomer'];
      }

      return data;
    } catch (e) {
      console.error('Failed to fetch project:', e);
      return null;
    }
  },
  { watch: [slug] }
);
</script>

<style scoped>
#explore {
  min-height: 100vh;
}

.ball-mesh {
  position: fixed;
  left: 0;
  height: 100vh;
  z-index: -1;
  margin-top: 75px;
  margin-left: 35px;
}

/* Loading State */
.loading-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 60vh;
  gap: 20px;
}

.loading-spinner {
  width: 50px;
  height: 50px;
  border: 3px solid var(--bg2);
  border-top-color: var(--c1);
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}

.loading-state p {
  color: var(--c2);
  font-family: var(--font2);
}

/* Error State */
.error-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 60vh;
  text-align: center;
  gap: 15px;
  padding: 20px;
}

.error-state h2 {
  font-size: 2rem;
  color: var(--c1);
}

.error-state p {
  color: var(--c2);
  font-family: var(--font2);
}

.back-btn {
  margin-top: 20px;
  padding: 12px 30px;
  border: 1px solid var(--c1);
  border-radius: 50px;
  color: var(--c1);
  transition: all 0.3s ease;
}

.back-btn:hover {
  background: var(--c1);
  color: #000;
}

.exp-head {
  font-size: 3.5rem;
  font-weight: 600;
  margin-bottom: 20px;
}

.exp-sub {
  font-size: 1.5rem;
  font-weight: 500;
  margin-bottom: 40px;
  color: var(--text2);
  opacity: .8;
}

.exp-btn {
  width: 300px;
  margin-left: -30px;
}

.exp-body {
  margin-top: 50px;
  opacity: .7;
}

.explore-content {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  min-height: calc(100vh - 120px);
  padding: 10px 60px;
  gap: 50px;
  padding-top: 100px;
}

.exp-thumb {
  height: 56vh;
  background: var(--bg2);
  border-radius: 20px;
  aspect-ratio: 400/550;
  position: sticky;
  top: 110px;
  left: 80px;
  background-size: cover;
  background-position: center;
}

.exp-box {
  width: 100%;
}

/* Animation keyframes */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(40px);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}

/* Animate main content */
.explore-content {
  animation: fadeInUp 0.8s cubic-bezier(0.23, 1, 0.32, 1) 0.1s both;
}

/* Animate thumbnail */
.exp-thumb {
  animation: fadeIn 1s cubic-bezier(0.23, 1, 0.32, 1) 0.3s both;
}

/* Animate box */
.exp-box {
  animation: fadeInUp 1s cubic-bezier(0.23, 1, 0.32, 1) 0.5s both;
}

/* Animate ball mesh */
.ball-mesh {
  animation: fadeIn 1.2s cubic-bezier(0.23, 1, 0.32, 1) 0.2s both;
}

/* Responsive */
@media (max-width: 900px) {
  .explore-content {
    flex-direction: column;
    padding: 20px;
    padding-top: 100px;
  }

  .exp-thumb {
    position: relative;
    top: 0;
    left: 0;
    width: 100%;
    height: 300px;
  }

  .exp-head {
    font-size: 2rem;
  }

  .exp-sub {
    font-size: 1.2rem;
  }
}
</style>
