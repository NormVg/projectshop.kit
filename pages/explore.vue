<template>
  <section>

    <div id="explore">

      <img :src="BallMesh" alt="" class="ball-mesh" />
      <Navbar />

      <div class="explore-content">
        <div class="exp-thumb"></div>
        <div class="exp-box">

          <div class="exp-head">
            Portfolio Boomer
          </div>

          <div class="exp-sub">One of the best selling prog type</div>

          <div class="exp-btn">

            <MyBtn text="$19" />
          </div>


          <div class="exp-body">
            <MarkdownRender />
            <!-- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum error nostrum, assumenda aliquid laudantium nulla quis sequi cupiditate, ducimus distinctio accusamus architecto suscipit placeat aut et inventore, ut magnam animi! -->

            <!-- Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt consequuntur impedit, eos praesentium totam repudiandae omnis corporis ratione, quae ipsam atque nemo enim porro? Odit vitae corporis eveniet voluptatibus vero? -->
          </div>
        </div>
      </div>

    </div>

    <Footer />
  </section>
</template>

<script setup>
import BallMesh from "~/assets/exp-ball-mesh.svg"
import Footer from "~/components/blocks/footer.vue";
import MarkdownRender from "~/components/MarkdownRender.vue";
import MyBtn from "~/components/MyBtn.vue";
import Navbar from "~/components/Navbar.vue";
</script>

<style scoped>
#explore {

  min-height: 100vh;
}

.ball-mesh {
  position: fixed;
  left: 0;
  height: 100vh;
  z-index: -1;
  margin-top: 75px;
  margin-left: 35px;
}

.exp-head {
  font-size: 3.5rem;
  font-weight: 600;
  margin-bottom: 20px;
}

.exp-sub {
  font-size: 1.5rem;
  font-weight: 500;
  margin-bottom: 40px;
  color: var(--text2);
  opacity: .8;
}

.exp-btn {
  width: 300px;
  margin-left: -30px;
}

.exp-body {
  margin-top: 50px;
  opacity: .7;
}

.explore-content {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  min-height: calc(100vh - 120px);
  padding: 10px 60px;
  gap: 50px;
  padding-top: 100px;


}

/* *{
  border: 1px solid salmon;
} */

.exp-thumb {
  height: 56vh;

  background: var(--bg2);
  border-radius: 20px;
  aspect-ratio: 400/550;
  position: sticky;
  top: 110px;
  left: 80px;


}

.exp-box {
  width: 100%;
  /* height: 400vh; */
  /* border: 1px solid salmon; */

}


/* Animation keyframes */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(40px);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}

/* Animate main content */
.explore-content {
  animation: fadeInUp 0.8s cubic-bezier(0.23, 1, 0.32, 1) 0.1s both;
}

/* Animate thumbnail */
.exp-thumb {
  animation: fadeIn 1s cubic-bezier(0.23, 1, 0.32, 1) 0.3s both;
}

/* Animate box */
.exp-box {
  animation: fadeInUp 1s cubic-bezier(0.23, 1, 0.32, 1) 0.5s both;
}

/* Animate ball mesh */
.ball-mesh {
  animation: fadeIn 1.2s cubic-bezier(0.23, 1, 0.32, 1) 0.2s both;
}
</style>
