<template>
  <span v-html="`${item} `" class="text-block-animation" v-for="item, iter in splitTextAndHTML(prop.text)" :key="item" :style="`animation-duration: calc(1s + ${iter*100}ms);`"> </span>
</template>

<script setup>
const prop = defineProps({
    text:String
})

function splitTextAndHTML(input) {
  // Regular expression to match text and HTML tags
  const regex = /(<a[^>]*>[^<]*<\/a>|<i[^>]*>[^<]*<\/i>|<br\s*\/?>|<[^>]+>|[^<]+)/g;

  const parts = input.match(regex);

  // Return an array of objects with type ('text' or 'html') and content
  let result = [];
  let currentContent = ''; // To store the combined text or HTML content
  let currentType = ''; // To track the type (text or html)

  parts.forEach(part => {
    if (part.startsWith('<') && part.endsWith('</a>')) {
      // Handle the <a> tag as a single HTML block
      if (currentType === 'html') {
        currentContent += part; // Append to current HTML content
      } else {
        if (currentContent) {
          result.push({ type: currentType, content: currentContent });
        }
        currentContent = part; // Start new HTML content for <a> tag
        currentType = 'html'; // Mark as html type
      }
    } else if (part.startsWith('<br')) {
      // Handle <br> tag (or any other self-closing tags) as a single HTML block
      if (currentContent) {
        result.push({ type: currentType, content: currentContent });
      }
      currentContent = part; // Add <br> tag content
      currentType = 'html'; // Mark as html type
    } else if (part.startsWith('<') && part.endsWith('>')) {
      // Handle other HTML tags
      if (currentContent) {
        result.push({ type: currentType, content: currentContent });
      }
      currentContent = part; // Start new HTML content
      currentType = 'html'; // Mark as html type
    } else {
      // Handle plain text
      if (currentType === 'text') {
        currentContent += part; // Append text content
      } else {
        if (currentContent) {
          result.push({ type: currentType, content: currentContent });
        }
        currentContent = part; // Start new text content
        currentType = 'text'; // Mark as text type
      }
    }
  });

  // Push any remaining content after the loop
  if (currentContent) {
    result.push({ type: currentType, content: currentContent });
  }

  // return result;


  var newRes = []
  result.forEach(element => {
    if (element.type === "text"){
       var items = element.content.split(" ")

       newRes.push(...items)
    }else{
      newRes.push(element.content)
    }
  });
  return newRes
}
// console.log(splitTextAndHTML(prop.text))

// formatText()
</script>

<style scoped>
.text-block-animation{
    animation-name: faderOut;


    animation-fill-mode: forwards;
    animation-iteration-count: 1;
    opacity: 0;
}
@keyframes faderOut {
    0% {
        opacity: 0;
        filter: blur(10px);
    }
    50%{
      filter: blur(0px);
    }
    100%{
        opacity: 1;
        filter: blur(0px);

    }
}

</style>
