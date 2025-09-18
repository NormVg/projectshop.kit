<template>
  <NuxtPage />
</template>

<style >
.page-enter-active,
.page-leave-active {
  transition: background 0.4s, opacity 0.4s;
}

.page-enter-from,
.page-leave-to {
  opacity: 0;
  background: #000;
}

.page-enter-to,
.page-leave-from {
  opacity: 1;
  background: #000;
}
</style>
