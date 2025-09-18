<template>
  <div class="body">
    <div class="home">


      <GoRound/>


    <div class="txtb">
      Get polished coding projects that strengthen your resume and GitHub. Turn routine university tasks into portfolio-worthy work you can showcase with confidence.
    </div>

    <div class="bat">

    PROJECT KIT

    <span>SHOP</span>
  </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import "~/assets/main.css"
import GoRound from "~/components/GoRound.vue";
import Navbar from "~/components/Navbar.vue";
</script>

<style scoped>

.body{
  display: flex;
  align-items: center;
  justify-content: center;
  height: 98vh;
}

.home{
  border-radius: 25px;
  height: calc(100vh - 30px);
  width: calc(100vw - 30px);
  background-image: url(~/assets/homebg.png);
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  overflow: hidden;
}


.bat{
  font-size: 250px;
  background: linear-gradient(to bottom, var(--c1), #262525 77%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  color: transparent;
  position: relative;
  top: 32%;
  /* user-select: none; */
  /* position: absolute; */
  /* bottom: -50px */
}

.bat span{
  font-size: 125px;
}

.txtb{
  width: 300px;
  padding-top: 20px;
  margin-left: 150px;
  margin-top: 25px;
  color: var(--c2);
  border-top: 2px solid var(--c1);
  font-family: var(--font2);
}
</style>



