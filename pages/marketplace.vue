<template>
  <div class="marketplace">
    <Navbar />
    <img :src="ballMesh" alt="" class="mesh-bg" />

    <!-- Glowing lines decoration -->
    <div class="line-box-left">
      <div class="lbl1"></div>
      <div class="lbl2"></div>
      <div class="lbl3"></div>
    </div>

    <div class="line-box-right">
      <div class="lbr1"></div>
      <div class="lbr2"></div>
      <div class="lbr3"></div>
    </div>

    <!-- Hero Section -->
    <motion.div :initial="{ opacity: 0, y: 40 }" :whileInView="{ opacity: 1, y: 0 }"
      :transition="{ duration: 0.8, ease: [0.23, 1, 0.32, 1] }" :inViewOptions="{ once: true }" class="hero-section">
      <div class="bat">
        <TagFoot text="MARKETPLACE" />
      </div>
      <div class="hero-sub">
        <RevealText
          text="Browse our collection of premium coding projects. Each project is crafted to boost your portfolio." />
      </div>
    </motion.div>

    <!-- Filter Section -->
    <motion.div :initial="{ opacity: 0, y: 30 }" :whileInView="{ opacity: 1, y: 0 }"
      :transition="{ duration: 0.6, ease: [0.23, 1, 0.32, 1], delay: 0.2 }" :inViewOptions="{ once: true }"
      class="filter-section">
      <div class="filter-btn" :class="{ active: activeFilter === 'all' }" @click="activeFilter = 'all'">All Projects
      </div>
      <div class="filter-btn" :class="{ active: activeFilter === 'popular' }" @click="activeFilter = 'popular'">Popular
      </div>
      <div class="filter-btn" :class="{ active: activeFilter === 'new' }" @click="activeFilter = 'new'">New Arrivals
      </div>
      <div class="filter-btn" :class="{ active: activeFilter === 'budget' }" @click="activeFilter = 'budget'">Budget
        Friendly</div>
    </motion.div>

    <!-- Projects Grid -->
    <div class="projects-grid">
      <div v-for="(project, index) in filteredProjects" :key="project.id" class="project-card"
        :style="{ animationDelay: `${(index % 6) * 0.1}s` }" @click="goToProject(project.id)">

        <div class="card-thumb" :class="{ 'has-image': project.thumbnail_url }">
          <img v-if="project.thumbnail_url" :src="project.thumbnail_url" class="thumb-img" alt="" />
          <div class="card-badge" v-if="project.badge">{{ project.badge }}</div>
        </div>

        <div class="card-content">
          <div class="card-category">{{ project.category }}</div>
          <div class="card-title">{{ project.name }}</div>
          <div class="card-sub">{{ project.sub }}</div>

          <div class="card-footer">
            <div class="card-price">{{ project.tag }}</div>
            <div class="card-action">
              <span class="arrow-icon">→</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Stats Section -->
    <motion.div :initial="{ opacity: 0, y: 40 }" :whileInView="{ opacity: 1, y: 0 }"
      :transition="{ duration: 0.8, ease: [0.23, 1, 0.32, 1] }" :inViewOptions="{ once: true, amount: 0.3 }"
      class="stats-section">
      <div class="stat-item">
        <div class="stat-number">50+</div>
        <div class="stat-label">Premium Projects</div>
      </div>
      <div class="stat-divider"></div>
      <div class="stat-item">
        <div class="stat-number">1000+</div>
        <div class="stat-label">Happy Students</div>
      </div>
      <div class="stat-divider"></div>
      <div class="stat-item">
        <div class="stat-number">24/7</div>
        <div class="stat-label">Support Available</div>
      </div>
    </motion.div>

    <Footer />
  </div>
</template>

<script setup>
import { motion } from "motion-v";
import ballMesh from "~/assets/ballMesh.svg";
import Footer from "~/components/blocks/footer.vue";
import Navbar from "~/components/Navbar.vue";
import TagFoot from "~/components/TagFoot.vue";
import RevealText from "~/components/RevealText.vue";

const activeFilter = ref('all');
const { getAllProjects, getFeaturedProjects, getBudgetProjects, getProjectsByBadge } = useProjects();

// Fetch all projects from Supabase
const { data: projects, pending, error } = await useAsyncData('projects', async () => {
  try {
    const data = await getAllProjects();
    // Transform data to match template expectations
    return data.map(p => ({
      ...p,
      sub: p.description,
      tag: `₹${Math.round(p.price / 100)}`, // Convert cents to rupees display
    }));
  } catch (e) {
    console.error('Failed to fetch projects:', e);
    // Return fallback static data if Supabase is not configured
    return [
      { id: "1", name: "Portfolio Boomer", slug: "portfolio-boomer", description: "One of the best selling prog type", sub: "One of the best selling prog type", tag: "$19", price: 1900, category: "Web", badge: "Bestseller" },
      { id: "2", name: "Growth Rocket", slug: "growth-rocket", description: "High growth potential", sub: "High growth potential", tag: "$25", price: 2500, category: "Mobile", badge: "Popular" },
      { id: "3", name: "Steady Stream", slug: "steady-stream", description: "Consistent returns", sub: "Consistent returns", tag: "$15", price: 1500, category: "API", badge: "" },
      { id: "4", name: "Tech Titan", slug: "tech-titan", description: "Tech-focused portfolio", sub: "Tech-focused portfolio", tag: "$22", price: 2200, category: "Full Stack", badge: "New" },
      { id: "5", name: "AI Advantage", slug: "ai-advantage", description: "AI-focused stocks", sub: "AI-focused stocks", tag: "$27", price: 2700, category: "AI/ML", badge: "Hot" },
      { id: "6", name: "Crypto Craze", slug: "crypto-craze", description: "Crypto assets", sub: "Crypto assets", tag: "$30", price: 3000, category: "Blockchain", badge: "New" },
    ];
  }
});

// Filter logic - works with both database and fallback data
const filteredProjects = computed(() => {
  if (!projects.value) return [];

  switch (activeFilter.value) {
    case 'popular':
      return projects.value.filter(p => p.badge === 'Bestseller' || p.badge === 'Popular' || p.badge === 'Hot');
    case 'new':
      return projects.value.filter(p => p.badge === 'New');
    case 'budget':
      return projects.value.filter(p => p.price <= 1800); // $18 or less
    default:
      return projects.value;
  }
});

const goToProject = (id) => {
  // Find the project to get its slug
  const project = projects.value?.find(p => p.id === id);
  if (project?.slug) {
    navigateTo(`/explore/${project.slug}`);
  } else {
    navigateTo(`/explore?project=${id}`);
  }
};
</script>

<style scoped>
.marketplace {
  min-height: 100vh;
  position: relative;
  overflow-x: hidden;
}

.mesh-bg {
  position: fixed;
  top: 0;
  right: -10%;
  width: 50%;
  height: auto;
  z-index: -1;
  opacity: 0.6;
}

/* Glowing Lines */
.line-box-left {
  position: fixed;
  top: 20%;
  left: 30px;
  height: 60vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 20px;
  z-index: -1;
}

.lbl1,
.lbl2,
.lbl3 {
  width: 2px;
  background: var(--c1);
  border-radius: 2px;
  box-shadow: 0 0 8px var(--c1), 0 0 4px #fff;
  animation: pulseGlow 3s infinite ease-in-out;
}

.lbl1 {
  height: 120px;
}

.lbl2 {
  height: 80px;
}

.lbl3 {
  height: 50px;
}

.line-box-right {
  position: fixed;
  bottom: 20%;
  right: 30px;
  height: 60vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 20px;
  z-index: -1;
}

.lbr1,
.lbr2,
.lbr3 {
  width: 2px;
  background: var(--c1);
  border-radius: 2px;
  box-shadow: 0 0 8px var(--c1), 0 0 4px #fff;
  animation: pulseGlow 2.5s infinite ease-in-out;
}

.lbr1 {
  height: 50px;
}

.lbr2 {
  height: 80px;
}

.lbr3 {
  height: 120px;
}

@keyframes pulseGlow {

  0%,
  100% {
    box-shadow: 0 0 8px var(--c1), 0 0 4px #fff;
    opacity: 0.7;
  }

  50% {
    box-shadow: 0 0 20px var(--c1), 0 0 12px #fff;
    opacity: 1;
  }
}

/* Hero Section */
.hero-section {
  padding-top: 120px;
  padding-bottom: 40px;
  text-align: center;
}

.bat {
  font-size: 120px;
  margin-bottom: 20px;
  display: flex;
  justify-content: center;
}

.hero-sub {
  max-width: 500px;
  margin: 0 auto;
  font-size: 18px;
  color: var(--c2);
  font-family: var(--font2);
  padding: 0 20px;
}

/* Filter Section */
.filter-section {
  display: flex;
  justify-content: center;
  gap: 15px;
  padding: 40px 20px;
  flex-wrap: wrap;
}

.filter-btn {
  padding: 12px 28px;
  border: 1px solid var(--c2);
  border-radius: 50px;
  font-family: var(--font1);
  font-size: 1rem;
  color: var(--c2);
  cursor: pointer;
  transition: all 0.3s ease;
  background: transparent;
}

.filter-btn:hover {
  border-color: var(--c1);
  color: var(--c1);
  box-shadow: 0 0 15px rgba(220, 220, 220, 0.2);
}

.filter-btn.active {
  background: var(--bg2);
  border-color: var(--c1);
  color: #fff;
  box-shadow: 0 0 20px rgba(220, 220, 220, 0.3);
}

/* Projects Grid */
.projects-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
  gap: 30px;
  padding: 40px 60px;
  max-width: 1400px;
  margin: 0 auto;
}

.project-card {
  background: var(--bg2);
  border-radius: 20px;
  overflow: hidden;
  cursor: pointer;
  transition: all 0.4s cubic-bezier(0.23, 1, 0.32, 1);
  border: 1px solid transparent;

  /* CSS animation instead of motion.div */
  opacity: 0;
  animation: fadeInUp 0.6s cubic-bezier(0.23, 1, 0.32, 1) forwards;
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(50px) scale(0.95);
  }

  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

.project-card:hover {
  transform: translateY(-8px);
  border-color: var(--c1);
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4), 0 0 30px rgba(220, 220, 220, 0.1);
}

.card-thumb {
  height: 180px;
  background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 50%, #1a1a1a 100%);
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.card-thumb.has-image::before {
  display: none;
}

.thumb-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s ease;
}

.project-card:hover .thumb-img {
  transform: scale(1.1);
}

.card-thumb::before {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 60px;
  height: 60px;
  border: 2px solid var(--c2);
  border-radius: 12px;
  opacity: 0.3;
}

.card-badge {
  position: absolute;
  top: 15px;
  right: 15px;
  background: linear-gradient(135deg, var(--c1) 0%, #fff 100%);
  color: #000;
  padding: 6px 14px;
  border-radius: 20px;
  font-size: 0.75rem;
  font-weight: 600;
  font-family: var(--font1);
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.card-content {
  padding: 25px;
}

.card-category {
  font-size: 0.8rem;
  color: var(--c2);
  text-transform: uppercase;
  letter-spacing: 1px;
  margin-bottom: 10px;
  font-family: var(--font1);
}

.card-title {
  font-size: 1.5rem;
  color: #fff;
  margin-bottom: 8px;
  font-family: var(--font1);
  font-weight: 500;
}

.card-sub {
  font-size: 0.95rem;
  color: var(--c2);
  font-family: var(--font2);
  margin-bottom: 20px;
  opacity: 0.8;
}

.card-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 15px;
  border-top: 1px solid rgba(220, 220, 220, 0.1);
}

.card-price {
  font-size: 1.8rem;
  font-weight: 600;
  color: var(--c1);
  font-family: var(--font1);
}

.card-action {
  width: 45px;
  height: 45px;
  border: 1px solid var(--c2);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
}

.project-card:hover .card-action {
  background: var(--c1);
  border-color: var(--c1);
}

.arrow-icon {
  font-size: 1.2rem;
  color: var(--c2);
  transition: all 0.3s ease;
}

.project-card:hover .arrow-icon {
  color: #000;
  transform: translateX(3px);
}

/* Stats Section */
.stats-section {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 60px;
  padding: 80px 40px;
  margin: 60px 0;
  flex-wrap: wrap;
}

.stat-item {
  text-align: center;
}

.stat-number {
  font-size: 3.5rem;
  font-weight: 600;
  color: #fff;
  font-family: var(--font1);
  margin-bottom: 10px;
  background: linear-gradient(135deg, var(--c1) 0%, #fff 50%, var(--c1) 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.stat-label {
  font-size: 1rem;
  color: var(--c2);
  font-family: var(--font2);
  text-transform: uppercase;
  letter-spacing: 1px;
}

.stat-divider {
  width: 1px;
  height: 60px;
  background: var(--c2);
  opacity: 0.3;
}

/* Responsive */
@media (max-width: 900px) {
  .bat {
    font-size: 80px;
  }

  .projects-grid {
    padding: 30px 20px;
    gap: 20px;
  }

  .stats-section {
    gap: 40px;
  }

  .stat-number {
    font-size: 2.5rem;
  }

  .line-box-left,
  .line-box-right {
    display: none;
  }
}

@media (max-width: 600px) {
  .bat {
    font-size: 50px;
  }

  .filter-section {
    gap: 10px;
  }

  .filter-btn {
    padding: 10px 20px;
    font-size: 0.9rem;
  }

  .projects-grid {
    grid-template-columns: 1fr;
  }

  .stat-divider {
    display: none;
  }

  .stats-section {
    flex-direction: column;
    gap: 30px;
  }
}
</style>
