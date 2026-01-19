

Docs

Examples

Tutorials

Sponsor

Motion+
JS
React

Vue

Studio
Get started
Examples
Animation

    Overview

    Gesture

    Layout

    Scroll

    Transition options

Components

    motion

    AnimatePresence

    LayoutGroup

    LazyMotion

    MotionConfig

    Reorder

Premium APIs

    AnimateNumber

    Cursor

    Ticker

    Typewriter

Motion values

    Overview

    useMotionTemplate

    useMotionValueEvent

    useScroll

    useSpring

    useTime

    useTransform

    useVelocity

Hooks

    useAnimate

    useAnimationFrame

    useDragControls

    useInView

    useReducedMotion

Integrations

    Radix

Vue
Get started with Motion for Vue

Motion for Vue is a simple yet limitless animation library. It's the only animation library with a hybrid engine, capable of hardware accelerated animations.

In this guide, we'll learn how to install Motion Vue and take a whirlwind tour of its main features.
Why Motion for Vue?

Vue gives you the power to build dynamic user interfaces, but orchestrating complex, performant animations can be a challenge. Motion is a production-ready library designed to solve this, making it simple to create everything from beautiful micro-interactions to complex, gesture-driven animations.
<motion.button :animate="{ opacity: 1 }" />
Key advantages

Here's when it's the right choice for your project.

    Build for Vue.  While other animation libraries are messy to integrate, Motion's declarative API feels like a natural extension of Vue. Animations can be linked directly to state and props.

    Hardware-acceleration. Motion leverages the same high-performance browser animations as pure CSS, ensuring your UIs stay smooth and snappy. You get the power of 120fps animations with a much simpler and more expressive API.

    Animate anything. CSS has hard limits. There's values you can't animate, keyframes you can't interrupt, staggers that must be hardcoded. Motion provides a single, consistent API that handles everything from simple transitions to advanced scroll, layout, and gesture-driven effects.

    App-like gestures. Standard CSS :hover events are unreliable on touch devices. Motion provides robust, cross-device gesture recognisers for press, drag, and hover, making it easy to build interactions that feel native and intuitive on any device.

When is CSS a better choice?

For simple, self-contained effects (like a color change on hover) a standard CSS transition is a lightweight solution. The strength of Motion is that it can do these simple kinds of animations but also scale to anything you can imagine. All with the same easy to write and maintain API.
Install

Motion for Vue is available via npm:
npm install motion-v
Nuxt modules

Motion Vue offers Nuxt modules support.

In nuxt.config.ts, simply add motion-v/nuxt into the modules, and it will auto-imports all the components for you.
export default defineNuxtConfig({
  modules: ['motion-v/nuxt'],
})
unplugin-vue-components

Motion for Vue also supports unplugin-vue-components to auto-import all components from motion-v:
import Components from 'unplugin-vue-components/vite'
import MotionResolver from 'motion-v/resolver'

export default defineConfig({
  plugins: [
    vue(),
    Components({
      dts: true,
      resolvers: [
        MotionResolver()
      ],
    }),
  ],
})

    Note: Auto-import currently doesn't support the <motion /> component so you'll need to import it manually.

Note: Motion for Vue contains APIs specifically tailored for Vue, but every feature from vanilla Motion is also compatible and available for advanced use-cases.
Usage

The core of Motion for Vue is the <motion /> component. It's a normal DOM element, supercharged with animation capabilities.
<template>
  <motion.div />
</template>

Animating a motion component is as straightforward as setting values via the animate prop:
<motion.ul :animate="{ rotate: 360 }" />

When values in animate change, the component will animate. Motion has great-feeling defaults, but animations can of course be configured via the transition prop.
<motion.div
  :animate="{
    scale: 2,
    transition: { duration: 2 }
  }"
/>
Enter animation

When a component enters the page, it will automatically animate from the rendered value, but you can provide different values via the initial prop.
<motion.button :initial="{ scale: 0 }" :animate="{ scale: 1 }" />

Or disable this initial animation entirely by setting initial to false.

<motion.button :initial="false" :animate="{ scale: 1 }" />

Gestures

<motion /> extends Vue's event system with powerful gesture recognises. It currently supports hover, press, focus, and drag gestures.

<motion.button
  :whileHover="{ scale: 1.1 }"
  :whilePress="{ scale: 0.95 }"
  @hoverStart="() => console.log('hover started!')"
/>

Motion's gestures are designed to feel better than using CSS alone. For instance, hover events are correctly not triggered by touch screen taps. Learn more about gestures.
Scroll animations

Motion supports both types of scroll animations, scroll-triggered and scroll-linked.

To trigger an animation on scroll, the whileInView prop defines a state to animate to/from when an element enters/leaves the viewport:

<motion.div
  :initial="{ backgroundColor: 'rgb(0, 255, 0)', opacity: 0 }"
  :whileInView="{ backgroundColor: 'rgb(255, 0, 0)', opacity: 1 }"
/>

Whereas to link a value directly to scroll position, it's possible to use MotionValues via useScroll.

<script setup >
  const { scrollYProgress } = useScroll()
</script>

<template>
  <motion.div :style="{ scaleX: scrollYProgress }" />
</template>

Learn more about Motion's scroll animations.
Layout animations

Motion has an industry-leading layout animation engine that supports animating between changes in layout, using only transforms, between the same or different elements, with full scale correction.

It's as easy as applying the layout prop.

<motion.div layout />

Or to animate between different elements, a layoutId:

<motion.div layoutId="underline" />

Learn more about layout animations.
Exit animations

By wrapping motion components with <AnimatePresence> we gain access to the exit prop.

<AnimatePresence>
  <motion.div v-if="show" key="box" :exit="{ opacity: 0 }" />
</AnimatePresence>

Learn more about AnimatePresence.
Development tools

Motion Studio provides visual editing and AI tools to enhance your animation development workflow, like inline bezier editing, CSS spring generation and more.


Install Motion Studio

One-click install for Cursor:

Add Extension

Add MCP

Motion Studio is also compatible with VS Code, Google Antigravity and more. See full installation guide.

Learn next

That's a very quick overview of Motion for Vue's basic features. But there's a lot more to learn!

Next, we recommend diving further into the the <motion /> component to learn more about its powerful features, like variants.

Or, you can dive straight in to our examples, where each example comes complete with full source code that you can copy/paste into your project.

Next

Vue animation
On this page

    Why Motion for Vue?
        Key advantages
        When is CSS a better choice?
    Install
        Nuxt modules
        unplugin-vue-components
    Usage
        Enter animation
        Gestures
        Scroll animations
        Layout animations
        Exit animations
    Learn next

Motion is supported by the best in the industry.

animations.dev
Stay in the loop

Subscribe for the latest news & updates.
Site

    Blog

    Docs

    Examples

    Magazine

    Motion+

    Studio

    Support

    Tutorials

Most Popular

    React animation

    Layout animation

    SVG animation

    Motion component

    GSAP vs Motion

Premium APIs

    Carousel

    Custom Cursor

    Number animations

    Ticker

    Typewriter

Docs

    JavaScript

    React

    Vue

    Studio

Social

    Discord

    GitHub

    X/Twitter

    Bluesky

Latest version:

12.26.0

Motion+

Login

Register

Upgrade
Get started with Vue animations | Motion




Docs

Examples

Tutorials

Sponsor

Motion+
JS
React

Vue

Studio
Get started
Examples
Animation

    Overview

    Gesture

    Layout

    Scroll

    Transition options

Components

    motion

    AnimatePresence

    LayoutGroup

    LazyMotion

    MotionConfig

    Reorder

Premium APIs

    AnimateNumber

    Cursor

    Ticker

    Typewriter

Motion values

    Overview

    useMotionTemplate

    useMotionValueEvent

    useScroll

    useSpring

    useTime

    useTransform

    useVelocity

Hooks

    useAnimate

    useAnimationFrame

    useDragControls

    useInView

    useReducedMotion

Integrations

    Radix

Vue
Scroll animation

There are two types of scroll animations:

    Scroll-triggered: A normal animation is triggered when an element enters the viewport.

    Scroll-linked: Values are linked directly to scroll progress.

Motion is capable of both types of animation.
Scroll-triggered animations

Scroll-triggered animations are just normal animations that fire when an element enters or leaves the viewport.

Motion offers the whileInView prop to set an animation target or variant when the element enters the view.
<motion.div
  :initial="{ opacity: 0 }"
  :whileInView="{ opacity: 1 }"
/>
One-time animations

With the inViewOptions , it's possible to set once: true so once an element has entered the viewport, it won't animate back out.

<motion.div
  initial="hidden"
  whileInView="visible"
  :inViewOptions="{ once: true }"
/>

Changing scroll container

By default, the element will be considered within the viewport when it enters/leaves the window. This can be changed by providing the ref of another scrollable element.

<script setup>
  import { ref } from "vue"
  const scrollRef = ref(null)
</script>

<template>
    <div ref="scrollRef" :style="{ overflow: 'scroll' }">
      <motion.div
        :initial="{ opacity: 0 }"
        :whileInView="{ opacity: 1 }"
        :inViewOptions="{ root: scrollRef }"
      />
    </div>
</template>

For more configuration options, checkout the motion component API reference.
Setting state

It's also possible to set state when any element (not just a motion component) enters and leaves the viewport with the useInView hook.
Scroll-linked animations

Scroll-linked animations are created using motion values and the useScroll hook.

useScroll returns four motion values, two that store scroll offset in pixels (scrollX and scrollY) and two that store scroll progress as a value between 0 and 1.

These motion values can be passed directly to specific styles. For instance, passing scrollYProgress to scaleX works great as a progress bar.

<script>
import { useScroll } from "motion-v"
const { scrollYProgress } = useScroll();
</script>

<template>
  <motion.div :style="{ scaleX: scrollYProgress }" />
</template>

Value smoothing

This value can be smoothed by passing it through useSpring.

<script setup>
const { scrollYProgress } = useScroll();
const scaleX = useSpring(scrollYProgress, {
  stiffness: 100,
  damping: 30,
  restDelta: 0.001
})
</script>

<template>
 <motion.div :style="{ scaleX }" />
</template>

Transform other values

With the useTransform hook, it's easy to use the progress motion values to mix between any value, like colors:

<script setup>
const backgroundColor = useTransform(
  scrollYProgress,
  [0, 0.5, 1],
  ["#f00", "#0f0", "#00f"]
)
</script>

<template>
  <motion.div :style="{ backgroundColor }" />
</template>

Examples
Track element scroll offset
Track element within viewport
Parallax
Scroll velocity and direction

Read the full useScroll docs to discover more about creating the above effects.

Previous

Layout animation

Next

Transition options

Motion+
Level up your animations with Motion+

Unlock the full vault of 330+ Motion examples, 100+ tutorials, premium APIs, private Discord and GitHub, and powerful Motion Studio animation editing tools for your IDE.

Get Motion+

One-time payment, lifetime updates.
On this page

    Scroll-triggered animations
        One-time animations
        Changing scroll container
        Setting state
    Scroll-linked animations
        Value smoothing
        Transform other values
        Examples

Motion is supported by the best in the industry.

animations.dev
Stay in the loop

Subscribe for the latest news & updates.
Site

    Blog

    Docs

    Examples

    Magazine

    Motion+

    Studio

    Support

    Tutorials

Most Popular

    React animation

    Layout animation

    SVG animation

    Motion component

    GSAP vs Motion

Premium APIs

    Carousel

    Custom Cursor

    Number animations

    Ticker

    Typewriter

Docs

    JavaScript

    React

    Vue

    Studio

Social

    Discord

    GitHub

    X/Twitter

    Bluesky

Latest version:

12.26.0

Motion+

Login

Register

Upgrade
Vue scroll animation — scroll-linked & parallax | Motion
