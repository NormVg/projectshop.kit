<template>
  <motion.div id="contact" :initial="{ opacity: 0, y: 50 }" :whileInView="{ opacity: 1, y: 0 }"
    :transition="{ duration: 0.8, ease: [0.23, 1, 0.32, 1] }" :inViewOptions="{ once: true, amount: 0.2 }">


    <motion.img :src="HBallMesh" alt="" class="hballmesh" :initial="{ opacity: 0 }" :whileInView="{ opacity: 1 }"
      :transition="{ duration: 1, ease: [0.23, 1, 0.32, 1] }" :inViewOptions="{ once: true, amount: 0.2 }" />


    <div class="contact-form">
      <motion.div class="contact-form__title" :initial="{ opacity: 0, y: 20 }" :whileInView="{ opacity: 1, y: 0 }"
        :transition="{ duration: 0.6, ease: [0.23, 1, 0.32, 1] }" :inViewOptions="{ once: true }">

        <RevealText text="Leave a application, we will contact you soon" />
      </motion.div>

      <motion.div class="contact-form__field cf1" :initial="{ opacity: 0, x: -40 }" :whileInView="{ opacity: 1, x: 0 }"
        :transition="{ duration: 0.7, ease: [0.23, 1, 0.32, 1], delay: 0.1 }" :inViewOptions="{ once: true }">
        <div class="contact-form__label">Name</div>
        <input type="text" class="contact-form__input">
      </motion.div>

      <motion.div class="contact-form__field cf2" :initial="{ opacity: 0, x: -40 }" :whileInView="{ opacity: 1, x: 0 }"
        :transition="{ duration: 0.7, ease: [0.23, 1, 0.32, 1], delay: 0.25 }" :inViewOptions="{ once: true }">
        <div class="contact-form__label">Email</div>
        <input type="text" class="contact-form__input">
      </motion.div>

      <motion.div class="contact-form__field cf3" :initial="{ opacity: 0, x: -40 }" :whileInView="{ opacity: 1, x: 0 }"
        :transition="{ duration: 0.7, ease: [0.23, 1, 0.32, 1], delay: 0.4 }" :inViewOptions="{ once: true }">
        <div class="contact-form__label">Message</div>
        <input type="text" class="contact-form__input">
      </motion.div>

      <motion.div :initial="{ opacity: 0, y: 20 }" :whileInView="{ opacity: 1, y: 0 }"
        :transition="{ duration: 0.6, ease: [0.23, 1, 0.32, 1], delay: 0.55 }" :inViewOptions="{ once: true }">
        <MyBtn text="Submit" class="contact-form__submit" />
      </motion.div>
    </div>


    <motion.div class="bat" :initial="{ opacity: 0, y: 40 }" :whileInView="{ opacity: 1, y: 0 }"
      :transition="{ duration: 0.8, ease: [0.23, 1, 0.32, 1], delay: 0.3 }"
      :inViewOptions="{ once: true, amount: 0.3 }">
      <TagFoot text="Work with us" />
      <!-- CONTACT -->
    </motion.div>


  </motion.div>
</template>

<script setup>
import HBallMesh from "~/assets/hballMesh.png";
import MyBtn from "../MyBtn.vue";
import RevealText from "../RevealText.vue";
import { motion } from "motion-v";
</script>

<style scoped>
.contact-form {
  position: absolute;
  top: 80px;
  left: 60px;
  background: transparent;
  padding: 0;
  z-index: 10;
  /* width: 420px; */
  display: flex;
  align-items: flex-start;
  flex-direction: column;
  justify-content: flex-start;
  gap: 25px;

  /* border: 1px solid salmon; */
}

.contact-form__field.cf1 {
  width: 300px;
}

.contact-form__field.cf2 {
  width: 400px;
}

.contact-form__field.cf3 {
  width: 500px;
}



.contact-form__title {
  font-size: 25px;
  color: #bdbdbd;
  margin-bottom: 24px;
  letter-spacing: 0.5px;
}

.contact-form__field {
  display: flex;
  flex-direction: column;
  gap: 0px;
}

.contact-form__label {
  font-size: 19px;
  color: #fff;
  margin-bottom: 1px;
}

.contact-form__input {
  border: none;
  border-bottom: 2px solid #fff;
  background: transparent;
  color: #fff;
  font-size: 18px;
  padding: 12px 16px 8px 16px;
  outline: none;
  color: var(--c2);
  transition: border-bottom-color 0.2s;
}

.contact-form__input:focus {
  border-bottom-color: var(--c2);
  background: rgba(41, 148, 255, 0.05);
}

.contact-form__input:invalid {
  border-bottom-color: var(--c1);
  background: rgba(255, 41, 148, 0.05);
}


.contact-form__submit {
  margin-top: 18px;

  width: 200px;
  margin-left: 0px;
}

#contact {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
  overflow: hidden;
  position: relative;
  /* border: 1px solid salmon; */
}

.hballmesh {
  position: absolute;
  bottom: 0;
  right: 0;
  opacity: 0.8;
  z-index: 1;
  width: 70%;
  margin: 20px;
  pointer-events: none;
  /* max-width: 400px; */
}


.bat {
  /* border: 1px solid var(--c1); */
  position: absolute;
  bottom: 0px;
  left: 0px;
  z-index: 2;
  font-size: 250px;
  line-height: 100%;
}
</style>
