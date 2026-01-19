<template>
  <div class="pc-btn">
    <RevealText :text="props.text" />
    <!-- Get <i>STARTED</i> -->
  </div>
</template>

<script setup>

const props = defineProps({
  text: {
    type: String,
    required: true
  }
});
</script>

<style scoped>
.pc-btn {
  background-image: url("~/assets/btnBG.png");
  /* background-size: ; */
  background-color: var(--bg2);
  background-position: cover;
  background-size: cover;
  border: 1px solid var(--c1);
  color: #fff;
  font-weight: bold;
  border-radius: 12px;
  padding: 12px 0;
  text-align: center;
  cursor: pointer;
  transition: all 0.4s;
  margin-top: 10px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  width: 80%;
  margin: 0 auto;
  font-family: var(--font1);
  font-size: 1.2rem;

}

.pc-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.16);
  border-color: var(--c1);
  filter: brightness(1.1);
}

.pc-btn:active {
  transform: translateY(0);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.12);
  transition: all 0.1s;
}

.pc-btn:focus {
  outline: 2px solid var(--c1);
  outline-offset: 2px;
}

.pc-btn:disabled {
  opacity: 0.6;
  cursor: not-allowed;
  transform: none;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.pc-btn:disabled:hover {
  transform: none;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  filter: none;
}

@media (prefers-reduced-motion: reduce) {
  .pc-btn {
    transition: none;
  }
}
</style>
