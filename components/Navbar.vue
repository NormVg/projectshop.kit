<template>
  <div class="nav-bar">
    <div class="nav">Home</div>
    <div class="nav">Projects</div>
    <div class="nav">Contacts</div>
    <div class="nav">Pricing</div>
    <div class="nav">Policy</div>

  </div>
</template>

<script lang="ts" setup>

</script>

<style scoped>
.nav-bar{
  position: fixed;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  flex-direction: row;
  gap: 30px;
  margin: 30px;
}

.nav{
  font-size: 22px;
  border-bottom: 2px solid transparent;
  transition: var(--tra200);

}

.nav:hover{
  border-bottom: 2px solid var(--c1);

}
</style>
