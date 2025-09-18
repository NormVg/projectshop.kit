<template>
  <Navbar/>
  <Hero/>
</template>

<script lang="ts" setup>
import "~/assets/main.css"
import Hero from "~/components/blocks/hero.vue";
import Navbar from "~/components/Navbar.vue";
</script>

<style scoped>

.body{
  display: flex;
  align-items: center;
  justify-content: center;
  height: 98vh;
}


</style>
