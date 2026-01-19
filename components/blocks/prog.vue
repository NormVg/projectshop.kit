<template>
  <div id="prog" :class="{ 'initial-load': showInitialAnimation }">
    <div class="progbox">
      <div class="btn-left"><img :src="leftBtn" alt="left btn" @click="prevCard"></div>

      <div class="box-cen">
        <div class="list-box">
          <div class="list-item l1" :class="{ 'blur': cardBlur }">{{ activeCards[0].name }}</div>
          <div class="list-item l2" :class="{ 'blur': cardBlur }">{{ activeCards[1].name }}</div>
          <div class="list-item l3" :class="{ 'blur': cardBlur }">{{ activeCards[2].name }}</div>
        </div>

        <div class="box-console">
          <div class="console-head" :class="{ 'blur': cardBlur }">{{ activeCards[1].name }}</div>
          <div class="console-sub" :class="{ 'blur': cardBlur }">{{ activeCards[1].sub }}</div>
          <div class="console-btn" :class="{ 'blur': cardBlur }">
            <MyBtn :text="activeCards[1].tag" />
          </div>
        </div>
      </div>

      <div class="btn-right"><img :src="rightBtn" alt="right btn" @click="nextCard"></div>
    </div>
  </div>
</template>

<script setup>
import leftBtn from "~/assets/leftbtn.png"
import rightBtn from "~/assets/rightbtn.png"
import MyBtn from "../MyBtn.vue"

const cards = ref([
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
])


const cardBlur = ref(false)
const showInitialAnimation = ref(true)

// Remove initial animation class after animations complete
onMounted(() => {
  setTimeout(() => {
    showInitialAnimation.value = false;
  }, 1400); // 0.6s delay + 0.8s animation = 1.4s total
})



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

// console.log(activeCards.value);


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


/* Animate all main elements on page load */
.initial-load .progbox,
.initial-load .btn-left,
.initial-load .btn-right,
.initial-load .box-cen,
.initial-load .list-item,
.initial-load .box-console,
.initial-load .console-head,
.initial-load .console-sub,
.initial-load .console-btn {
  opacity: 0;
  transform: translateY(40px) scale(0.98);
  animation: fadeInUp 0.8s cubic-bezier(0.23, 1, 0.32, 1) forwards;
}

.initial-load .progbox {
  animation-delay: 0.1s;
}

.initial-load .btn-left {
  animation-delay: 0.2s;
}

.initial-load .btn-right {
  animation-delay: 0.2s;
}

.initial-load .box-cen {
  animation-delay: 0.25s;
}

.initial-load .list-item.l1 {
  animation-delay: 0.3s;
}

.initial-load .list-item.l2 {
  animation-delay: 0.35s;
}

.initial-load .list-item.l3 {
  animation-delay: 0.4s;
}

.initial-load .box-console {
  animation-delay: 0.45s;
}

.initial-load .console-head {
  animation-delay: 0.5s;
}

.initial-load .console-sub {
  animation-delay: 0.55s;
}

.initial-load .console-btn {
  animation-delay: 0.6s;
}

@keyframes fadeInUp {
  0% {
    opacity: 0;
    transform: translateY(40px) scale(0.98);
  }

  100% {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}
</style>
