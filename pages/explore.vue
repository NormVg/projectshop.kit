<template>
  <section>

    <div id="explore">

      <img :src="BallMesh" alt="" class="ball-mesh" />
      <Navbar />

      <div class="explore-content">
        <div class="exp-thumb"></div>
        <div class="exp-box">

          <div class="exp-head">
            {{ selectedProject.name }}
          </div>

          <div class="exp-sub">{{ selectedProject.sub }}</div>

          <div class="exp-btn">

            <MyBtn :text="selectedProject.tag" />
          </div>


          <div class="exp-body">
            <MarkdownRender />
            <!-- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum error nostrum, assumenda aliquid laudantium nulla quis sequi cupiditate, ducimus distinctio accusamus architecto suscipit placeat aut et inventore, ut magnam animi! -->

            <!-- Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt consequuntur impedit, eos praesentium totam repudiandae omnis corporis ratione, quae ipsam atque nemo enim porro? Odit vitae corporis eveniet voluptatibus vero? -->
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

// Project data (same as in prog.vue)
const projects = [
  { name: "Portfolio Boomer", id: "cardID-1", sub: "One of the best selling prog type", tag: "$19" },
  { name: "Growth Rocket", id: "cardID-2", sub: "High growth potential", tag: "$25" },
  { name: "Steady Stream", id: "cardID-3", sub: "Consistent returns", tag: "$15" },
  { name: "Tech Titan", id: "cardID-4", sub: "Tech-focused portfolio", tag: "$22" },
  { name: "Value Vault", id: "cardID-5", sub: "Value investing picks", tag: "$18" },
  { name: "Dividend Dynamo", id: "cardID-6", sub: "Dividend heavy", tag: "$20" },
  { name: "Global Explorer", id: "cardID-7", sub: "International exposure", tag: "$24" },
  { name: "Green Future", id: "cardID-8", sub: "Sustainable investments", tag: "$21" },
  { name: "Small Cap Surge", id: "cardID-9", sub: "Small cap focus", tag: "$17" },
  { name: "Blue Chip Bundle", id: "cardID-10", sub: "Blue chip stocks", tag: "$23" },
  { name: "Innovation Index", id: "cardID-11", sub: "Innovative companies", tag: "$26" },
  { name: "Balanced Basket", id: "cardID-12", sub: "Balanced allocation", tag: "$19" },
  { name: "Emerging Edge", id: "cardID-13", sub: "Emerging markets", tag: "$22" },
  { name: "Safe Harbor", id: "cardID-14", sub: "Low risk picks", tag: "$16" },
  { name: "Crypto Craze", id: "cardID-15", sub: "Crypto assets", tag: "$30" },
  { name: "Healthcare Hero", id: "cardID-16", sub: "Healthcare sector", tag: "$20" },
  { name: "REIT Riches", id: "cardID-17", sub: "Real estate investments", tag: "$18" },
  { name: "AI Advantage", id: "cardID-18", sub: "AI-focused stocks", tag: "$27" },
  { name: "Millennial Mix", id: "cardID-19", sub: "Millennial trends", tag: "$21" }
];

// Get project ID from query params
const route = useRoute();
const projectId = computed(() => route.query.project || 'cardID-1');

// Find the selected project based on the query param
const selectedProject = computed(() => {
  return projects.find(p => p.id === projectId.value) || projects[0];
});
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

/* *{
  border: 1px solid salmon;
} */

.exp-thumb {
  height: 56vh;

  background: var(--bg2);
  border-radius: 20px;
  aspect-ratio: 400/550;
  position: sticky;
  top: 110px;
  left: 80px;


}

.exp-box {
  width: 100%;
  /* height: 400vh; */
  /* border: 1px solid salmon; */

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
</style>
