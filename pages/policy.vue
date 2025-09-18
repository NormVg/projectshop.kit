<template>
  <div>
    <!-- <Navbar/> -->
     <Navbar/>
    <div class="body">
      <div class="policy-container">
        <div class="policy-header">
          <h1 class="policy-title">USAGE <span>POLICY</span></h1>
          <div class="policy-subtitle">Terms and Guidelines for Project Kit Shop</div>
        </div>

        <div class="policy-content">
          <div class="policy-section">
            <div class="section-number">01</div>
            <h2 class="section-title">Intended Purpose</h2>
            <div class="section-content">
              <p>All projects and code provided are exclusively for learning, skill development, and freelance portfolio enhancement.</p>
              <p>These resources are carefully crafted to help students and developers understand project structure, industry best practices, and professional implementation standards.</p>
            </div>
          </div>

          <div class="policy-section">
            <div class="section-number">02</div>
            <h2 class="section-title">Academic Integrity</h2>
            <div class="section-content">
              <p>We strictly prohibit academic dishonesty and do not support submitting purchased projects as original work for university assignments, school projects, or examination purposes.</p>
              <p>Users bear full responsibility for ensuring their usage complies with their institution's academic integrity policies.</p>
            </div>
          </div>

          <div class="policy-section">
            <div class="section-number">03</div>
            <h2 class="section-title">Liability & Responsibility</h2>
            <div class="section-content">
              <p>Project Kit Shop disclaims all liability for consequences arising from misuse of our materials, including but not limited to academic penalties, disciplinary actions, or violations of institutional policies.</p>
              <p>Users acknowledge that they are solely responsible for understanding and adhering to their applicable regulations and guidelines.</p>
            </div>
          </div>

          <div class="policy-section">
            <div class="section-number">04</div>
            <h2 class="section-title">Ethical Usage Agreement</h2>
            <div class="section-content">
              <p>By accessing or purchasing our projects, you commit to using them ethically and responsibly as educational resources.</p>
              <p>Projects should serve exclusively as learning references, development guides, or legitimate portfolio assets that demonstrate your understanding and skills.</p>
              <p class="emphasis">Remember: These projects are tools for growth, not shortcuts to success.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import "~/assets/main.css"
// import Navbar from "~/components/Navbar.vue";
</script>

<style scoped>
.body {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  padding: 100px 30px 30px 30px;
}

.policy-container {
  border-radius: 25px;
  min-height: calc(100vh - 130px);
  width: calc(100vw - 60px);
  max-width: 1200px;
  background: linear-gradient(135deg, rgba(220, 220, 220, 0.08) 0%, rgba(168, 168, 168, 0.03) 100%);
  border: 1px solid rgba(220, 220, 220, 0.15);
  padding: 60px;
  box-sizing: border-box;
  backdrop-filter: blur(10px);
}

.policy-header {
  text-align: center;
  margin-bottom: 60px;
  border-bottom: 2px solid var(--c1);
  padding-bottom: 40px;
}

.policy-title {
  font-size: clamp(60px, 8vw, 120px);
  background: linear-gradient(to bottom, var(--c1), #262525 77%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  color: transparent;
  margin: 0;
  font-family: var(--font1);
  font-weight: 400;
}

.policy-title span {
  font-size: clamp(30px, 4vw, 60px);
}

.policy-subtitle {
  color: var(--c2);
  font-family: var(--font2);
  font-size: 18px;
  margin-top: 20px;
}

.policy-content {
  display: flex;
  flex-direction: column;
  gap: 50px;
}

.policy-section {
  position: relative;
  padding: 30px;
  background: rgba(220, 220, 220, 0.02);
  border-radius: 15px;
  border: 1px solid rgba(220, 220, 220, 0.08);
}

.section-number {
  position: absolute;
  top: -15px;
  left: 30px;
  background: #000000;
  color: var(--c1);
  font-family: var(--font1);
  font-size: 14px;
  font-weight: 600;
  padding: 8px 16px;
  border-radius: 20px;
  border: 1px solid rgba(220, 220, 220, 0.2);
}

.section-title {
  font-size: 28px;
  color: var(--c1);
  margin: 15px 0 25px 0;
  font-family: var(--font1);
  font-weight: 500;
  letter-spacing: -0.5px;
}

.section-content {
  color: var(--c2);
  font-family: var(--font2);
  line-height: 1.7;
  font-size: 16px;
}

.section-content p {
  margin: 0 0 18px 0;
}

.section-content p:last-child {
  margin-bottom: 0;
}

.section-content .emphasis {
  color: var(--c1);
  font-style: italic;
  font-weight: 500;
  border-left: 3px solid var(--c1);
  padding-left: 15px;
  margin-top: 20px;
}

@media (max-width: 768px) {
  .body {
    padding: 80px 15px 15px 15px;
  }

  .policy-container {
    width: calc(100vw - 30px);
    padding: 40px 25px;
    min-height: calc(100vh - 95px);
  }

  .policy-header {
    margin-bottom: 40px;
    padding-bottom: 30px;
  }

  .policy-subtitle {
    font-size: 16px;
  }

  .policy-content {
    gap: 35px;
  }

  .policy-section {
    padding: 25px 20px;
  }

  .section-number {
    left: 20px;
    font-size: 12px;
    padding: 6px 12px;
  }

  .section-title {
    font-size: 22px;
    margin: 10px 0 20px 0;
  }

  .section-content {
    font-size: 15px;
    line-height: 1.6;
  }
}

@media (max-width: 480px) {
  .policy-container {
    padding: 30px 20px;
  }

  .policy-section {
    padding: 20px 15px;
  }

  .section-number {
    left: 15px;
    top: -12px;
  }

  .section-title {
    font-size: 20px;
  }

  .section-content {
    font-size: 14px;
  }

  .section-content .emphasis {
    padding-left: 12px;
    margin-top: 15px;
  }
}


</style>
