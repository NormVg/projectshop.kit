<template>
  <div class="box">
    <Navbar />
    <img :src="ballMesh" alt="" />

    <div class="bat">
      <TagFoot text="PRICING" />
      <!-- PRICING -->
    </div>

    <div class="line-box-left">
      <div class="lbl1"></div>
      <div class="lbl2"></div>
      <div class="lbl3"></div>
    </div>


    <div class="line-box-right">
      <div class="lbr1"></div>
      <div class="lbr2"></div>
      <div class="lbr3"></div>
    </div>


    <main>
      <div class="ncard pcard" >

        <div class="pc-head">Starter Pack</div>
        <div class="pc-sub"><RevealText text="Best for small projects and getting started" /></div>
        <div class="pc-cash">12$ <span>/ project</span></div>
        <div class="pc-box">
          <div class="pcb"> <span>◆</span> <RevealText text="Ready-to-use coding projects" /></div>
          <div class="pcb"> <span>◆</span> <RevealText text="Includes documentation and source code" /></div>
          <div class="pcb"> <span>◆</span> <RevealText text="Perfect for resume and GitHub" /></div>
          <div class="pcb"> <span>◆</span> <RevealText text="Great for resume and GitHub showcase" /></div>
        </div>

        <div class="pc-btn">
        Get <i>STARTED</i>
        </div>

        <!-- <RevealText :text="c1" /> -->

      </div>

      <div class="ccard pcard">
      <div class="pc-head">Custom Plan</div>
      <div class="pc-sub"><RevealText text="Best for innovative and freelance projects" /></div>
      <div class="pc-cash">$$$ <span>/ project</span></div>
      <div class="pc-box">
        <div class="pcb"> <span>◆</span> <RevealText text="Tailored projects based on your needs" /></div>
        <div class="pcb"> <span>◆</span> <RevealText text="Extra features and deployment support" /></div>
        <div class="pcb"> <span>◆</span> <RevealText text="One-on-one guidance available" /></div>
        <div class="pcb"> <span>◆</span> <RevealText text="Priority delivery timeline" /></div>
      </div>
      <div class="pc-btn">
          <RevealText text="CONNECT" />
      </div>

      </div>
    </main>
  </div>
</template>

<script lang="ts" setup>


// const container = ref(null);
// const { tilt, roll, source } = useParallax(container);

// const SCALE_CONSTANT = 10;

import ballMesh from "~/assets/ballMesh.svg";



</script>

<style scoped>
.line-box-left {
  position: fixed;
  top: -17%;
  left: 50%;
  margin-left: -400px;
  height: 100vh;
  /* width: 50px; */
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  gap: 30px;
  z-index: -1;
}


.lbl1, .lbl2, .lbl3 {
  width: 2px;
  height: 100px;
  background: var(--c1);
  border-radius: 2px;
  box-shadow: 0 0 8px var(--c1), 0 0 4px #fff;
  animation: pulseGlow 3s infinite alternate;

}

.lbl1 {
  height: 350px;
}

.lbl2 {
  height: 300px;
}
.lbl3 {
  height: 250px;
}



.line-box-right {
  position: fixed;
  bottom: -17%;
  right: 50%;
  margin-right: -400px;
  height: 100vh;
  /* width: 50px; */
  display: flex;
  flex-direction: row-reverse;
  align-items: center;
  justify-content: center;
  gap: 30px;
  z-index: -1;
}

.lbr1, .lbr2, .lbr3 {
  width: 2px;
  height: 100px;
  background: var(--c1);
  border-radius: 2px;
  box-shadow: 0 0 8px var(--c1), 0 0 4px #fff;
  animation: pulseGlow 1.5s infinite alternate ease-in-out;
}

@keyframes pulseGlow {
  0% {
    box-shadow: 0 0 8px var(--c1), 0 0 4px #fff;
    opacity: 1;
  }
  100% {
    box-shadow: 0 0 24px var(--c1), 0 0 30px #fff;
    opacity: 0.7;
  }
}



.lbr1 {
  height: 350px;
}

.lbr2 {
  height: 300px;
}
.lbr3 {
  height: 250px;
}

.pc-head {
  font-size: 2.7rem;
  /* font-weight: bold; */
  margin-bottom: 10px;
  color: var(--c2);
  text-align: left;
  color: #fff;
  margin-left: 10%;
  font-family: var(--font1);
  margin-top: 10px;
}

.pc-sub {
  font-size: 1.1rem;
  color: var(--c1);
  font-weight: 200;
  margin-bottom: 20px;
  text-align: left;
  margin-left: 10%;
  font-family: var(--font2);
  opacity: 0.6;
}

.pc-cash {
  font-size: 3rem;
  font-weight: 600;
  color: var(--c1);
  margin-bottom: 20px;
  text-align: left;
  margin-left: 10%;
  font-family: var(--font1);


}

.pc-cash span {
  font-size: 1.2rem;
  font-weight: 400;
  color: var(--c1);
}

.pc-box {
  margin-bottom: 25px;
  padding: 10px 0;
  margin-left: 10%;
  font-family: var(--font1);

}

.pcb {
  display: flex;
  align-items: center;
  font-size: 1.1rem;
  color: var(--c1);
  margin-bottom: 8px;
  font-family: var(--font2);

  gap: 8px;
}

.pcb span {
  color: var(--c1);
  font-size: 1.2em;
  text-shadow: 0 0 8px var(--c1), 0 0 4px #fff;
}

.pc-btn {
  background-image: url("~/assets/btnBG.png");
  /* background-size: ; */
  background-position: center;
  background-size: 100%;
  border: 1px solid var(--c1);
  color: #fff;
  font-weight: bold;
  border-radius: 12px;
  padding: 12px 0;
  text-align: center;
  cursor: pointer;
  transition: all 0.4s;
  margin-top: 10px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.08);
  width: 80%;
  margin: 0 auto;
  font-family: var(--font1);
  font-size: 1.2rem;

}

.pc-btn:hover {
  /* background: #222; */
  box-shadow: 0 0 10px var(--c1);

}


main {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 50px;
  /* border: 1px solid red; */
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.pcard {
  aspect-ratio: 450/600;
  height: 460px;
  background-color: var(--bg2);
  border-radius: 25px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: center;

  transition: all ease-in-out 0.3s;
  /* opacity: 0; */


}


.pcard:hover {
  transform: translateY(-10px);
}

.ccard {
  border: 1px solid var(--c1);
  background-image: url(~/assets/cplan.png);
  background-size: contain;
  background-position: center;
  background-repeat: no-repeat;
  box-shadow: 0 0 25px var(--c1);

}




.ncard {
  border: 1px solid var(--c2);
  background-image: url(~/assets/nplan.png);
  background-size: contain;
  background-position: center;
  background-repeat: no-repeat;
}

.bat {
  font-size: 200px;
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  margin-bottom: -50px;
  z-index: -1;
}
.box {
  position: relative;
  min-height: 97vh;
}

img {
  position: fixed;
  top: 10px;
  right: 10px;

  width: 30%;
  z-index: -1;
}
</style>
