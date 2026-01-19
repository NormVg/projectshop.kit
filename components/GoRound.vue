<template>
  <div class="container">
    <img :src="goRoundImg" alt="as" class="gori">
    <img :src="Logo" alt="logo" class="logoi">
    <img :src="arrowImg" alt="logo" class="arrow">

  </div>
</template>

<script setup>
import goRoundImg from "~/assets/goround.svg"
import arrowImg from "~/assets/arrow.svg"

import Logo from "~/assets/logo.png"
</script>

<style scoped>
.container {
  position: absolute;
  width: 150px;
  /* Set a fixed width for better stacking */
  height: 150px;
  /* Set a fixed height for better stacking */
  display: flex;
  align-items: center;
  justify-content: center;
  top: 20px;
  right: 20px;
  scale: .8;
}

.arrow {
  scale: 0;
  z-index: 2;
  width: 85px;
  height: 85px;
  transition: var(--tra200);
}

.container:hover .arrow {
  scale: 1;
}

.container:hover .logoi {
  scale: 0;
}

.gori {
  width: 100%;
  height: 100%;
  border-radius: 100%;
  animation: rotate 20s linear infinite;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
  transition: var(--tra200);
}

.logoi {
  width: 85px;
  height: 85px;
  object-fit: contain;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  border-radius: 50%;
  transition: var(--tra200);

  box-shadow: 0 8px 24px 0 rgba(0, 0, 0, 0.85), 0 1.5px 6px 0 rgba(0, 0, 0, 0.5);
}

@keyframes rotate {
  100% {
    transform: rotate(360deg);
  }
}
</style>
