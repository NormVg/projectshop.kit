<template>

  <motion.div class="line-box" :initial="{ opacity: 0, y: 30 }" :whileInView="{ opacity: 1, y: 0 }"
    :transition="{ duration: 0.8, ease: [0.23, 1, 0.32, 1] }" :inViewOptions="{ once: true, amount: 0.5 }">
    <motion.div class="l1 line" :initial="{ scaleY: 0 }" :whileInView="{ scaleY: 1 }"
      :transition="{ duration: 0.6, ease: [0.23, 1, 0.32, 1], delay: 0.1 }" :inViewOptions="{ once: true }" />
    <motion.div class="l2 line" :initial="{ scaleY: 0 }" :whileInView="{ scaleY: 1 }"
      :transition="{ duration: 0.6, ease: [0.23, 1, 0.32, 1], delay: 0.2 }" :inViewOptions="{ once: true }" />
    <motion.div class="l3 line" :initial="{ scaleY: 0 }" :whileInView="{ scaleY: 1 }"
      :transition="{ duration: 0.6, ease: [0.23, 1, 0.32, 1], delay: 0.3 }" :inViewOptions="{ once: true }" />
  </motion.div>


  <motion.div id="footer" :initial="{ opacity: 0, y: 40 }" :whileInView="{ opacity: 1, y: 0 }"
    :transition="{ duration: 0.8, ease: [0.23, 1, 0.32, 1], delay: 0.2 }" :inViewOptions="{ once: true, amount: 0.2 }">
    <div class="footer-content">

      <main>


        <motion.img :src="Logo" alt="" class="logo" :initial="{ opacity: 0, scale: 0.8 }"
          :whileInView="{ opacity: 1, scale: 1 }" :transition="{ duration: 0.5, ease: [0.23, 1, 0.32, 1], delay: 0.3 }"
          :inViewOptions="{ once: true }" />

        <motion.div class="foot-box" :initial="{ opacity: 0, y: 20 }" :whileInView="{ opacity: 1, y: 0 }"
          :transition="{ duration: 0.6, ease: [0.23, 1, 0.32, 1], delay: 0.4 }" :inViewOptions="{ once: true }">
          <div class="foot-head">Quick Links</div>
          <NuxtLink to="/">

            <div class="foot-item">Home</div>
          </NuxtLink>

          <NuxtLink to="/#prog">
            <div class="foot-item">Projects</div>
          </NuxtLink>
          <NuxtLink to="/#contact">
            <div class="foot-item">Contacts</div>
          </NuxtLink>
          <NuxtLink to="/pricing">
            <div class="foot-item">Pricing</div>
          </NuxtLink>

          <NuxtLink to="/policy">
            <div class="foot-item">Policy</div>
          </NuxtLink>


        </motion.div>
      </main>




      <p>© 2025 PROJECT KIT SHOP. All rights reserved.</p>

    </div>
    <img :src="FooterBorder" alt="" class="footer-border">
  </motion.div>
</template>

<script setup>
import Logo from "~/assets/logo.png";
import FooterBorder from "~/assets/foot-border.svg";
import { motion } from "motion-v";
</script>





<style scoped>
.line-box {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  gap: 40px;
  margin: 100px auto;
  /* margin-bottom: -10px; */
}

.line {
  width: 2px;
  height: 100px;
  background: var(--c1);
  border-radius: 2px;
  box-shadow: 0 0 8px var(--c1), 0 0 4px #fff;
  /* animation: pulseGlow 3s infinite ease-in-out; */
}

.l1 {
  height: 250px;
}

.l2 {
  height: 350px;
}

.l3 {
  height: 250px;
}




#footer {
  /* background-color: #222; */
  background-image: url('~/assets/foot-bg.png');
  color: #fff;
  /* border: 1px solid salmon; */
  /* padding: 20px 0; */
  border-radius: 50px;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: top;
  margin: 0px auto;
  width: 95%;
  aspect-ratio: 1550 / 600;
  text-align: center;

  overflow: hidden;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  /* gap: 20px; */
}

/* * {
  border: 1px solid salmon;
} */

.footer-content {
  /* border: 1px solid salmon; */
  width: 90%;
  height: 100%;
  margin: 0 auto;
  padding: 20px 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  /* gap: 20px; */
}

main {
  width: 100%;
  display: flex;
  flex-direction: row;
  align-items: flex-start;
  justify-content: flex-start;
  gap: 50px;
  margin-top: 25px;
  /* padding-top: 20px; */
}

/* *{
  border: 1px solid salmon;
} */

.footer-border {

  width: 95%;
  margin-bottom: 0;
}

.foot-box {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: flex-start;
  gap: 10px;
  /* border: 1px solid salmon; */
}

.foot-head {
  font-weight: bold;
  font-size: 25px;
  margin-bottom: 10px;
}


.foot-item {
  font-size: 18px;
  cursor: pointer;
  border-bottom: 1px solid transparent;
  transition: all ease-in-out .3s;
  color: var(--c2);
}

.foot-item:hover {
  border-bottom: 1px solid var(--c1);
}

.logo {
  width: 75px;
  /* margin-top: 30px;
  margin-bottom: 10px; */
}
</style>
