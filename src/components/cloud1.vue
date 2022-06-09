<template>
  <div class="grid">
        <div class="cell" v-for="cell in cells" :key="cell" :title="cell"></div>
    <!-- <template v-for="day in 7">
      <template v-for="hour in 24">
        <div class="cell" :key="`${day}-${hour}`">{{ day }}:{{ hour }}</div>
      </template>
    </template> -->
  </div>
</template>
<script setup>
  let cells = []
  for(let day=0; day < 7; day++) {
    for(let hour=0; hour < 24; hour++) {
      cells.push(`${day}-${hour}`)
    }
  }
</script>
<style lang="scss" scoped>
.grid {
  display: grid;
  grid-template-columns: 100px repeat(24, 20px) 100px;
  grid-template-rows: 60px repeat(7, 30px) 60px;
  grid-column-gap: 1px;
  grid-row-gap: 1px;
  .cell {
    background-color: #7777ff;
  }
}
</style>
