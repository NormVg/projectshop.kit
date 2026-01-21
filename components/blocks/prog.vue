<template>
  <div id="prog">
    <motion.div :initial="{ opacity: 0, y: 40, scale: 0.98 }" :whileInView="{ opacity: 1, y: 0, scale: 1 }"
      :transition="{ duration: 0.8, ease: [0.23, 1, 0.32, 1], delay: 0.1 }" :inViewOptions="{ once: true, amount: 0.2 }"
      class="progbox">
      <motion.div :initial="{ opacity: 0, x: -20 }" :whileInView="{ opacity: 1, x: 0 }"
        :transition="{ duration: 0.7, ease: [0.23, 1, 0.32, 1], delay: 0.2 }" :inViewOptions="{ once: true }"
        class="btn-left">
        <img :src="leftBtn" alt="left btn" @click="prevCard">
      </motion.div>

      <div class="box-cen">
        <div class="list-box">
          <motion.div :initial="{ opacity: 0, y: 40 }" :whileInView="{ opacity: 1, y: 0 }"
            :transition="{ duration: 0.7, ease: [0.23, 1, 0.32, 1], delay: 0.3 }"
            :inViewOptions="{ once: true, amount: 0.9 }" class="list-item l1" :class="{ 'blur': cardBlur }"
            :style="activeCards[0].thumbnail_url ? { backgroundImage: `linear-gradient(to bottom, transparent 40%, rgba(0,0,0,0.8)), url(${activeCards[0].thumbnail_url})`, backgroundSize: 'cover', backgroundPosition: 'center' } : {}">
            <!-- <span v-if="!activeCards[0].thumbnail_url || true" class="card-text">{{ activeCards[0].name }}</span> -->
          </motion.div>
          <motion.div :initial="{ opacity: 0, y: 40 }" :whileInView="{ opacity: 1, y: 0 }"
            :transition="{ duration: 0.7, ease: [0.23, 1, 0.32, 1], delay: 0.35 }"
            :inViewOptions="{ once: true, amount: 0.9 }" class="list-item l2" :class="{ 'blur': cardBlur }"
            :style="activeCards[1].thumbnail_url ? { backgroundImage: `linear-gradient(to bottom, transparent 40%, rgba(0,0,0,0.8)), url(${activeCards[1].thumbnail_url})`, backgroundSize: 'cover', backgroundPosition: 'center' } : {}">
            <!-- <span v-if="!activeCards[1].thumbnail_url || true" class="card-text">{{ activeCards[1].name }}</span> -->
          </motion.div>
          <motion.div :initial="{ opacity: 0, y: 40 }" :whileInView="{ opacity: 1, y: 0 }"
            :transition="{ duration: 0.7, ease: [0.23, 1, 0.32, 1], delay: 0.4 }"
            :inViewOptions="{ once: true, amount: 0.9 }" class="list-item l3" :class="{ 'blur': cardBlur }"
            :style="activeCards[2].thumbnail_url ? { backgroundImage: `linear-gradient(to bottom, transparent 40%, rgba(0,0,0,0.8)), url(${activeCards[2].thumbnail_url})`, backgroundSize: 'cover', backgroundPosition: 'center' } : {}">
            <!-- <span v-if="!activeCards[2].thumbnail_url || true" class="card-text">{{ activeCards[2].name }}</span> -->
          </motion.div>
        </div>

        <motion.div :initial="{ opacity: 0, y: 30 }" :whileInView="{ opacity: 1, y: 0 }"
          :transition="{ duration: 0.6, ease: [0.23, 1, 0.32, 1], delay: 0.45 }" :inViewOptions="{ once: true }"
          class="box-console">
          <motion.div :initial="{ opacity: 0 }" :whileInView="{ opacity: 1 }"
            :transition="{ duration: 0.5, delay: 0.5 }" :inViewOptions="{ once: true }" class="console-head"
            :class="{ 'blur': cardBlur }">
            {{ activeCards[1].name }}
          </motion.div>
          <motion.div :initial="{ opacity: 0 }" :whileInView="{ opacity: 1 }"
            :transition="{ duration: 0.5, delay: 0.55 }" :inViewOptions="{ once: true }" class="console-sub"
            :class="{ 'blur': cardBlur }">
            {{ activeCards[1].sub }}
          </motion.div>
          <motion.div :initial="{ opacity: 0, scale: 0.95 }" :whileInView="{ opacity: 1, scale: 1 }"
            :transition="{ duration: 0.5, delay: 0.6 }" :inViewOptions="{ once: true }" class="console-btn"
            :class="{ 'blur': cardBlur }" @click="goToProject">
            <MyBtn :text="activeCards[1].tag" />
          </motion.div>
        </motion.div>
      </div>

      <motion.div :initial="{ opacity: 0, x: 20 }" :whileInView="{ opacity: 1, x: 0 }"
        :transition="{ duration: 0.7, ease: [0.23, 1, 0.32, 1], delay: 0.2 }" :inViewOptions="{ once: true }"
        class="btn-right">
        <img :src="rightBtn" alt="right btn" @click="nextCard">
      </motion.div>
    </motion.div>
  </div>
</template>

<script setup>
import leftBtn from "~/assets/leftbtn.png"
import rightBtn from "~/assets/rightbtn.png"
import MyBtn from "../MyBtn.vue"
import { motion } from "motion-v"

const { getFeaturedProjects } = useProjects();

// Fallback static data
const fallbackCards = [
  { name: "Portfolio Boomer", id: "1", slug: "portfolio-boomer", sub: "One of the best selling prog type", tag: "$19" },
  { name: "Growth Rocket", id: "2", slug: "growth-rocket", sub: "High growth potential", tag: "$25" },
  { name: "Steady Stream", id: "3", slug: "steady-stream", sub: "Consistent returns", tag: "$15" },
  { name: "Tech Titan", id: "4", slug: "tech-titan", sub: "Tech-focused portfolio", tag: "$22" },
  { name: "Value Vault", id: "5", slug: "value-vault", sub: "Value investing picks", tag: "$18" },
  { name: "AI Advantage", id: "6", slug: "ai-advantage", sub: "AI-focused stocks", tag: "$27" },
];

// Fetch projects from Supabase
const { data: fetchedCards } = await useAsyncData('home-carousel-projects', async () => {
  try {
    const data = await getFeaturedProjects(10);
    if (data && data.length > 0) {
      return data.map(p => ({
        ...p,
        sub: p.description,
        tag: `₹${Math.round(p.price / 100)}`,
      }));
    }
    return fallbackCards;
  } catch (e) {
    console.error('Failed to fetch carousel projects:', e);
    return fallbackCards;
  }
});

// Use fetched data or fallback
const cards = computed(() => fetchedCards.value || fallbackCards);


const cardBlur = ref(false)



const activeIndex = ref(0)

const activeCards = computed(() => {
  const result = [];
  for (let i = -1; i <= 1; i++) {
    let index = (activeIndex.value + i + cards.value.length) % cards.value.length;
    result.push(cards.value[index]);
  }
  console.log(result);

  return result;
});



// Function to trigger blur effect for 1 second
const triggerBlur = () => {
  if (cardBlur.value) {
    return; // If already blurring, do nothing

  }
  cardBlur.value = true;
  setTimeout(() => {
    cardBlur.value = false;
  }, 1000);
}


let isTransitioning = false;

const nextCard = () => {
  if (isTransitioning) return;
  isTransitioning = true;
  triggerBlur();
  activeIndex.value = (activeIndex.value + 1) % cards.value.length;
  setTimeout(() => {
    isTransitioning = false;
  }, 1000);
}

const prevCard = () => {
  if (isTransitioning) return;
  isTransitioning = true;
  triggerBlur();
  activeIndex.value = (activeIndex.value - 1 + cards.value.length) % cards.value.length;
  setTimeout(() => {
    isTransitioning = false;
  }, 1000);
}

const goToProject = () => {
  const project = activeCards.value[1];
  if (project.slug) {
    navigateTo(`/explore/${project.slug}`);
  } else {
    navigateTo(`/explore?project=${project.id}`);
  }
}


</script>

<style scoped>
.box-console {
  width: 100%;
  height: 20%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 5px;
  margin-top: -15%;
  z-index: 10;

  /* border: 1px solid salmon; */
}

.console-head {
  font-size: 75px;
  font-weight: 600;
  color: whitesmoke;
  margin-bottom: 5px;

}

.console-sub {
  font-size: 20px;
  color: var(--c2);
  margin-bottom: 15px;
}

.console-btn {
  width: 300px;

  /* Isolate from parent filters to maintain true white */
  /* filter: brightness(2) contrast(0.8); */
  /* Alternative approach - create new stacking context */
  isolation: isolate;

}


.btn-left img,
.btn-right img {
  width: 60px;
  height: 60px;
  object-fit: contain;
  filter: brightness(2) contrast(1.2);

  /* filter: drop-shadow(0 0 2px rgba(0,0,0,0.5)); */
}

.btn-left img:hover,
.btn-right img:hover {
  filter: brightness(2.5) contrast(1.4) drop-shadow(0 0 8px #fff);
  cursor: pointer;
  transform: scale(1.08);
  transition: filter 0.2s, transform 0.2s;
}

.btn-left img:active,
.btn-right img:active {
  filter: brightness(1.5) contrast(1.1) drop-shadow(0 0 4px #aaa);
  transform: scale(0.95);
  transition: filter 0.1s, transform 0.1s;
}

.box-cen {
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;

  height: 80%;

}

.list-box {
  height: 100%;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-around;
  gap: 20px;
}

.list-item {
  background-color: var(--bg2);
  aspect-ratio: 400/550;
  height: 70%;
  border-radius: 15px;
  transition: filter 0.3s ease;

  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 40px;
  color: black;
}

.list-item.blur {
  animation: blurFadeBlur 1s ease-in-out;
}

/* Minimal and classy animations with fade blur for console elements */
.console-head.blur {
  animation: subtleFadeBlur 1s ease-out;
}

.console-sub.blur {
  animation: gentleSlideBlur 1s ease-out;
}

.console-btn.blur {
  animation: softScaleBlur 1s ease-out;
}

/* Head animation - subtle fade with blur */
@keyframes subtleFadeBlur {
  0% {
    opacity: 1;
    filter: blur(0px);
    transform: translateY(0);
  }

  50% {
    opacity: 0.2;
    filter: blur(3px);
    transform: translateY(-5px);
  }

  100% {
    opacity: 1;
    filter: blur(0px);
    transform: translateY(0);
  }
}

/* Sub animation - gentle horizontal slide with blur */
@keyframes gentleSlideBlur {
  0% {
    opacity: 1;
    filter: blur(0px);
    transform: translateX(0);
  }

  50% {
    opacity: 0.3;
    filter: blur(2px);
    transform: translateX(-15px);
  }

  100% {
    opacity: 1;
    filter: blur(0px);
    transform: translateX(0);
  }
}

/* Button animation - soft scale with blur */
@keyframes softScaleBlur {
  0% {
    opacity: 1;
    filter: blur(0px);
    transform: scale(1);
  }

  50% {
    opacity: 0.4;
    filter: blur(2.5px);
    transform: scale(0.95);
  }

  100% {
    opacity: 1;
    filter: blur(0px);
    transform: scale(1);
  }
}

@keyframes blurFadeBlur {
  0% {
    filter: blur(0px) brightness(1);
    opacity: 1;
  }

  25% {
    filter: blur(8px) brightness(0.3);
    opacity: 0.6;
  }

  50% {
    filter: blur(12px) brightness(0.1);
    opacity: 0.3;
    transform: scale(0.95);
  }

  75% {
    filter: blur(8px) brightness(0.3);
    opacity: 0.6;
  }

  100% {
    filter: blur(0px) brightness(1);
    opacity: 1;
  }
}


.list-item.l1 {
  scale: 0.85;

}

.list-item.l2 {
  height: 70%;
}

.list-item.l3 {
  scale: 0.85;
}



.progbox {
  opacity: 1;
  filter: brightness(1) contrast(1);
  width: calc(100% - 80px);
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;

  /* border: 1px solid salmon; */
}

#prog {
  margin-top: 100px;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
  background-image: url('~/assets/prog-bg.png');
  background-size: contain;
  background-position: center;
  background-repeat: no-repeat;

  box-shadow: inset 0 0 120px 90px rgba(0, 0, 0, 0.95);
  margin-bottom: 120px;
  /* filter: brightness(0.6) contrast(1.2); */
}

.card-text {
  text-shadow: 0 4px 12px rgba(0, 0, 0, 0.9);
  z-index: 2;
  position: relative;
  font-weight: 600;
  letter-spacing: -1px;
}
</style>
