<template>
  <cloud :matrix="matrix" :colors="colors" />
</template>
<script setup>
import cloud from "./components/cloud.vue";
const generator = (d, h) => {
  const x = (d - 3.5) / 3.5;
  const y = (h - 12) / 12;
  return Math.floor(100 - (x * x + y * y) * 50);
};
const matrix = [];
for (let day = 0; day < 7; day++) {
  const row = [];
  for (let hour = 0; hour < 24; hour++) {
    const value = generator(day, hour);
    row.push(value);
  }
  matrix.push(row);
}
const colors = ["#C7E7FF", "#8ECFFF", "#0093FF", "#0066B0", "#002E50"];
</script>
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
