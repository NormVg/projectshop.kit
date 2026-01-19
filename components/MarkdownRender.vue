<script setup>
import { renderMarkdown } from '~/utils/renderMarkdown'
import "~/assets/markdown.css"

const props = defineProps({
  md: {
    type: String,
    default: `


### Project Title: **Task Manager Web App**

**Description:**
A responsive web application to manage daily tasks efficiently. Built with clean, modular code—perfect for students learning full-stack development or freelancers building their portfolio.

[My Website](https://vishnu.taohq.org)

**Features:**

-   Add, edit, and delete tasks

-   Mark tasks as completed or pending

-   Search and filter functionality

-   LocalStorage/database integration

-   Responsive UI for desktop and mobile

-   Simple, modern design


**Tech Stack:**
HTML, CSS, JavaScript, Node.js, Express, and MongoDB

**What You Get:**

-   Complete source code

-   Setup guide and documentation

-   Screenshots and demo video

-   Bonus: Deployment guide (optional)


**Use Case:**
Ideal for learning CRUD operations, UI/UX structure, and backend integration. Suitable for portfolio use or as a foundation for custom freelance projects.


    `
  }
})


// const rawMarkdown = ref(`# Hello World\nThis is **Markdown** with \`code\` block.`)
const html = computed(() => renderMarkdown(props.md))
</script>

<template>
  <span class="markdown-content">

    <div class="prose max-w-none" v-html="html" />
  </span>
</template>



<style>
.markdown-content {
  font-weight: 400;
  font-style: normal;
  background: none !important;
  /* color: black; */
  user-select: text;
}

.markdown-content h1 {
  font-family: var(--font-head);
}


.markdown-content h2 {
  font-family: var(--font-head);
}


.markdown-content h3 {
  font-family: var(--font-head);
  color: var(--red)
}

.markdown-content p {
  white-space: pre-line;
}
</style>
