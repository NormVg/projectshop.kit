<template>
  <div class="body">
    <div class="home">


      <GoRound/>


    <div class="txtb">
      <RevealText text="Get polished coding projects that strengthen your resume and GitHub. Turn routine university tasks into portfolio-worthy work you can showcase with confidence." />
      <!-- Get polished coding projects that strengthen your resume and GitHub. Turn routine university tasks into portfolio-worthy work you can showcase with confidence. -->
    </div>

    <div class="bat">

    <!-- PROJECT KIT -->
     <main>

       <TagFoot text="PROJECT KIT" />
     </main>


    <span><TagFoot text="SHOP" :start-delay="500"/></span>
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
  width: max-content;
  display: flex;
  align-items: flex-end;

  /* border: 1px solid salmon; */
  line-height: 100%;
  position: absolute;
  bottom: 0px;
  left: 10px;
  overflow: hidden;
}
.bat main{
margin-bottom: -30px;

}


.bat span{
  margin-bottom: -50px;
  font-size: 125px;
}

.txtb{
  width: 300px;
  padding-top: 20px;
  font-size: 17px;
  margin-left: 9%;
  color: var(--c2);
  border-top: 2px solid var(--c1);
  font-family: var(--font2);
  position: absolute;
  top: 30%;
  transform: translateY(-30%);
}

/* Responsive design for smaller vertical spaces */
@media (max-height: 600px) {
  .bat {
    font-size: 180px !important;
  }
  .bat span {
    font-size: 90px !important;
  }
  .txtb {
    font-size: 14px;
    width: 250px;
  }
}

@media (max-height: 500px) {
  .bat {
    font-size: 120px !important;
  }
  .bat span {
    font-size: 60px !important;
  }
  .txtb {
    font-size: 12px;
    width: 200px;
  }
}

@media (max-height: 400px) {
  .bat {
    font-size: 80px !important;
  }
  .bat span {
    font-size: 40px !important;
  }
  .txtb {
    font-size: 10px;
    width: 150px;
  }
}
</style>



