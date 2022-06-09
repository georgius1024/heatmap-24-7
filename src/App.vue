<script setup>
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://vuejs.org/api/sfc-script-setup.html#script-setup
import cloud from "./components/cloud.vue";
const generator = (d, h) => {
  const x = (d - 3.5) / 3.5;
  const y = (h - 12) / 12;
  return Math.floor(100 - (x * x + y * y) * 50);
};
const grade = (value) => {
  return `grade${Math.floor(value / 20)}`;
};
const matrix = [];
for (let day = 0; day < 7; day++) {
  const row = [];
  for (let hour = 0; hour < 24; hour++) {
    const value = generator(day, hour);
    const scale = grade(value);
    row.push({
      value,
      scale,
    });
  }
  matrix.push(row);
}
</script>

<template>
  <cloud :matrix="matrix" />
</template>
<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
