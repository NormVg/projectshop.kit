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
          <div class="foot-head">About Us</div>
          <div class="foot-desc">Transform your university projects into portfolio masterpieces. We deliver polished,
            professional coding projects that strengthen your resume and GitHub profile.</div>
        </motion.div>

        <motion.div class="foot-box" :initial="{ opacity: 0, y: 20 }" :whileInView="{ opacity: 1, y: 0 }"
          :transition="{ duration: 0.6, ease: [0.23, 1, 0.32, 1], delay: 0.5 }" :inViewOptions="{ once: true }">
          <div class="foot-head">Quick Links</div>
          <NuxtLink to="/">
            <div class="foot-item">Home</div>
          </NuxtLink>
          <NuxtLink to="/#prog">
            <div class="foot-item">Projects</div>
          </NuxtLink>
          <NuxtLink to="/marketplace">
            <div class="foot-item">Marketplace</div>
          </NuxtLink>
          <NuxtLink to="/#contact">
            <div class="foot-item">Contact</div>
          </NuxtLink>
          <NuxtLink to="/pricing">
            <div class="foot-item">Pricing</div>
          </NuxtLink>
          <NuxtLink to="/policy">
            <div class="foot-item">Policy</div>
          </NuxtLink>
        </motion.div>

        <motion.div class="foot-box" :initial="{ opacity: 0, y: 20 }" :whileInView="{ opacity: 1, y: 0 }"
          :transition="{ duration: 0.6, ease: [0.23, 1, 0.32, 1], delay: 0.6 }" :inViewOptions="{ once: true }">
          <div class="foot-head">Contact</div>
          <div class="foot-item-static">support@projectkit.shop</div>
          <div class="foot-item-static">Available 24/7</div>
          <div class="social-links">
            <a href="#" class="social-icon">Twitter</a>
            <a href="#" class="social-icon">GitHub</a>
            <a href="#" class="social-icon">Discord</a>
          </div>
        </motion.div>
      </main>




      <p class="copyright">© 2025 PROJECT KIT SHOP. All rights reserved.</p>

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




/* Main footer container */
/* Main footer container */
#footer {
  background-image: url('~/assets/foot-bg.png');
  color: #fff;
  border-radius: 50px;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: top;
  margin: 0px auto;
  width: 95%;
  min-height: 500px;
  text-align: left;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  position: relative;
  border: 1px solid rgba(255, 255, 255, 0.1);
}

.footer-content {
  width: 90%;
  margin: 0 auto;
  padding: 60px 0 20px 0;
  display: flex;
  flex-direction: column;
  height: 100%;
  z-index: 2;
}

main {
  width: 100%;
  display: grid;
  grid-template-columns: 0.5fr 1.5fr 0.8fr 1.2fr;
  gap: 40px;
  margin-bottom: 60px;
}

.foot-box {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: flex-start;
  gap: 12px;
}

.foot-head {
  font-weight: bold;
  font-size: 20px;
  margin-bottom: 15px;
  color: #fff;
  font-family: var(--font1);
  letter-spacing: 1px;
}

.foot-desc {
  font-size: 16px;
  color: var(--c2);
  line-height: 1.5;
  font-family: var(--font2);
  opacity: 0.8;
  max-width: 300px;
}

.foot-item {
  font-size: 16px;
  cursor: pointer;
  position: relative;
  transition: all ease-in-out .3s;
  color: var(--c2);
  display: inline-block;
  padding-bottom: 2px;
}

.foot-item:hover {
  color: #fff;
  transform: translateX(5px);
}

.foot-item::after {
  content: '';
  position: absolute;
  width: 0;
  height: 1px;
  bottom: 0;
  left: 0;
  background-color: var(--c1);
  transition: width 0.3s ease;
}

.foot-item:hover::after {
  width: 100%;
}

.foot-item-static {
  font-size: 16px;
  color: var(--c2);
  opacity: 0.8;
  margin-bottom: 5px;
}

.social-links {
  display: flex;
  gap: 12px;
  margin-top: 15px;
  flex-wrap: wrap;
}

.social-icon {
  font-size: 14px;
  color: var(--c2);
  border: 1px solid rgba(168, 168, 168, 0.3);
  padding: 8px 16px;
  border-radius: 50px;
  transition: all 0.3s ease;
  cursor: pointer;
  text-decoration: none;
  background: rgba(0, 0, 0, 0.2);
}

.social-icon:hover {
  color: #fff;
  border-color: var(--c1);
  background: rgba(255, 255, 255, 0.1);
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

.logo {
  width: 100px;
  /* Slightly larger logo */
  object-fit: contain;
}

.copyright {
  width: 100%;
  text-align: center;
  padding: 25px 0;
  color: var(--c2);
  font-size: 14px;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  margin-top: auto;
  font-family: var(--font2);
  letter-spacing: 0.5px;
}

.footer-border {
  width: 100%;
  position: absolute;
  bottom: 0;
  left: 0;
  z-index: 1;
  pointer-events: none;
  opacity: 0.5;
  /* Reduced opacity for subtlety */
}

/* Response Design */
@media (max-width: 900px) {
  main {
    grid-template-columns: 1fr 1fr;
    gap: 40px;
  }

  .logo {
    margin-bottom: 20px;
  }
}

@media (max-width: 600px) {
  main {
    grid-template-columns: 1fr;
    gap: 40px;
    text-align: center;
  }

  .foot-box {
    align-items: center;
  }

  .foot-desc {
    text-align: center;
  }

  .social-links {
    justify-content: center;
  }

  #footer {
    height: auto;
    padding-bottom: 20px;
  }
}
</style>
