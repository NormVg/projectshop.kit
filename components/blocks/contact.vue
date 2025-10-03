<template>
  <div id="contact">


  <img :src="HBallMesh" alt="" class="hballmesh" />


<div class="contact-form">
  <div class="contact-form__title">

    <RevealText text="Leave a application, we will contact you soon" />
</div>

  <div class="contact-form__field cf1">
    <div class="contact-form__label"> Name</div>
    <input type="text" class="contact-form__input">
  </div>

  <div class="contact-form__field cf2">
    <div class="contact-form__label">Email</div>
    <input type="text" class="contact-form__input">
  </div>

  <div class="contact-form__field cf3">
    <div class="contact-form__label">Message</div>
    <input type="text" class="contact-form__input">
  </div>

  <MyBtn text="Submit" class="contact-form__submit" />
</div>


  <div class="bat">
      <TagFoot text="Work with us" />
      <!-- CONTACT -->
    </div>


</div>
</template>

<script lang="ts" setup>
import HBallMesh from "~/assets/hballMesh.png";
import MyBtn from "../MyBtn.vue";
import RevealText from "../RevealText.vue";
</script>

<style scoped>


.contact-form {
  position: absolute;
  top: 50px;
  left: 60px;
  background: transparent;
  padding: 0;
  z-index: 5;
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
  opacity: 0;
  transform: translateX(-40px);
  animation: fadeInLeft 0.7s cubic-bezier(0.23, 1, 0.32, 1) 0.1s forwards;
}

.contact-form__field.cf2 {
  width: 400px;
  opacity: 0;
  transform: translateX(-40px);
  animation: fadeInLeft 0.7s cubic-bezier(0.23, 1, 0.32, 1) 0.35s forwards;
}

.contact-form__field.cf3 {
  width: 500px;
  opacity: 0;
  transform: translateX(-40px);
  animation: fadeInLeft 0.7s cubic-bezier(0.23, 1, 0.32, 1) 0.6s forwards;
}

@keyframes fadeInLeft {
  to {
    opacity: 1;
    transform: translateX(0);
  }
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

#contact{
  display: flex;
  align-items: center;
  justify-content: center;
  height: 98vh;
  overflow: hidden;
  position: relative;
  /* border: 1px solid salmon; */
}

.hballmesh {
  position: absolute;
  bottom: 0;
  right: 0;
  opacity: 1;
  z-index: -1;
  width: 70%;
  margin: 20px
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
