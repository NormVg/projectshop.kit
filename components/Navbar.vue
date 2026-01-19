<template>
  <div class="nav-bar">

    <NuxtLink to="/">
      <div class="nav">Home</div>
    </NuxtLink>


    <NuxtLink to="/#prog">
      <div class="nav">Projects</div>
    </NuxtLink>

    <NuxtLink to="/#contact">
      <div class="nav">Contacts</div>
    </NuxtLink>


    <NuxtLink to="/pricing">
      <div class="nav">Pricing</div>
    </NuxtLink>

    <NuxtLink to="/policy">

      <div class="nav">Policy</div>
    </NuxtLink>

  </div>
</template>

<script setup>

</script>

<style scoped>
.nav-bar {
  position: fixed;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  flex-direction: row;
  gap: 30px;
  margin: 30px;
  z-index: 100;
}

.nav {
  font-size: 22px;
  border-bottom: 2px solid transparent;
  transition: var(--tra200);

}

.nav:hover {
  border-bottom: 2px solid var(--c1);

}
</style>
