<template>
  <div ref="containerRef" class="ml16" :class="{ show: isShown }">
    <span v-for="(word, wi) in words" :key="wi" class="word" :data-text="word">
      <span v-for="(char, ci) in word.split('')" :key="ci" class="letter"
        :style="{ animationDelay: (startDelay + getLetterIndex(wi, ci) * charDelay) + 'ms' }">
        {{ char }}
      </span>
    </span>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue';

// define props with defaults
const props = defineProps({
  text: {
    type: String,
    default: ''
  },
  wordDelay: {
    type: Number,
    default: 300
  },
  charDelay: {
    type: Number,
    default: 40
  },
  startDelay: {
    type: Number,
    default: 0
  }
});

// reactive state
const isShown = ref(false);
const containerRef = ref(null);

// computed guard — ensure split only when text is present
const words = computed(() => {
  if (!props.text) return [];
  return props.text.split(' ');
});

// Calculate the running letter index across all words
const getLetterIndex = (wordIndex, charIndex) => {
  let totalChars = 0;
  for (let i = 0; i < wordIndex; i++) {
    totalChars += words.value[i].length + 1; // +1 for space
  }
  return totalChars + charIndex;
};

// Set up IntersectionObserver to trigger animation when element scrolls into view
let observer = null;

onMounted(() => {
  observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting && !isShown.value) {
          // Element is in view, trigger the animation
          setTimeout(() => {
            isShown.value = true;
          }, 50);
        }
      });
    },
    {
      threshold: 0.3, // Trigger when 30% of the element is visible
    }
  );

  if (containerRef.value) {
    observer.observe(containerRef.value);
  }
});

onUnmounted(() => {
  if (observer && containerRef.value) {
    observer.unobserve(containerRef.value);
  }
});
</script>

<style scoped>
.ml16 {
  white-space: nowrap;
  width: 100%;
  /* overflow: hidden; */
  height: max-content;
}

.ml16 .word {
  display: inline-block;
  overflow: hidden;
  /* height: 1em; adjust to your font size / line height */
  vertical-align: bottom;
}

.ml16 .letter {
  display: inline-block;
  position: relative;
  bottom: -1em;
  opacity: 0;
  animation-name: raise;
  animation-duration: 600ms;
  animation-fill-mode: forwards;
  animation-play-state: paused;
  /* Start paused */
  /* Apply background-clip to individual letters to avoid Chrome bug */
  background: linear-gradient(to bottom,
      var(--c1) 0%,
      rgba(38, 37, 37, 0) 77%,
      #262525 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  color: transparent;
  /* Isolate each letter to prevent stacking context issues */
  isolation: isolate;
}

/* Play animation when element is shown (in view) */
.ml16.show .letter {
  animation-play-state: running;
}

.word {
  /* Simple container - no background-clip here */
  position: relative;
  overflow: hidden;
  margin-left: 2%;
}

@keyframes raise {
  from {
    bottom: -1em;
    opacity: 0;
  }

  to {
    bottom: 0;
    opacity: 1;
  }
}
</style>
