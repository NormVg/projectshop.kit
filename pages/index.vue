<template>
  <main>

    <Navbar />
    <Hero />
    <Prog />
    <Contact />
    <Footer />
  </main>
</template>

<script setup>
import "~/assets/main.css"
import Contact from "~/components/blocks/contact.vue";
import Footer from "~/components/blocks/footer.vue";
import Hero from "~/components/blocks/hero.vue";
import Prog from "~/components/blocks/prog.vue";
import Navbar from "~/components/Navbar.vue";
</script>

<style scoped>
.body {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 98vh;
}
</style>
