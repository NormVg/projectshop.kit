<template>
  <div class="ml16" :class="{ show: isShown }">
    <span v-for="(word, wi) in words" :key="wi" class="word">
      <span
        v-for="(char, ci) in word.split('')"
        :key="ci"
        class="letter"
        :style="{ animationDelay: (startDelay + wi * wordDelay + ci * charDelay) + 'ms' }"
      >
        {{ char }}
      </span>
    </span>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';

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
  startDelay:{
    type:Number,
    default:0
  }
});

// reactive state
const isShown = ref(false);

// computed guard — ensure split only when text is present
const words = computed(() => {
  if (!props.text) return [];
  return props.text.split(' ');
});

// trigger show after mount (so animation runs)
onMounted(() => {

  // small delay for DOM to settle
  setTimeout(() => {
    isShown.value = true;
  }, 50);
});
</script>

<style scoped>
.ml16 {
  white-space: nowrap;
  width: max-content;
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
}
.ml16.show .letter {
  /* no extra rules needed */
}

.word{
    /* background: linear-gradient(to bottom, var(--c1), #262525 85%) */
    background: linear-gradient(
  to bottom,
  var(--c1) 0%,
  rgba(38, 37, 37, 0) 77%,
  #262525 100%
);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  color: transparent;
  position: relative;
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
