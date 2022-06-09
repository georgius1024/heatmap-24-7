<template>
  <table class="grid" cellspacing="2">
    <tr>
      <td></td>
      <td v-for="hour in 24" :key="hour" class="hour">{{ hourOfDay(hour) }}</td>
      <td></td>
    </tr>
    <tr v-for="day in 7" :key="day">
      <td class="day">{{ dayOfWeek(day) }}</td>
      <td
        v-for="hour in 24"
        :key="hour"
        class="cell"
        :title="props.matrix[day-1][hour-1].value"
        :class="props.matrix[day-1][hour-1].scale"
      ></td>
      <td class="day">{{ dayOfWeek(day) }}</td>
    </tr>
    <tr>
      <td></td>
      <td v-for="hour in 24" :key="hour" class="hour">{{ hourOfDay(hour) }}</td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td colspan="12" class="hour strike">
        <span class="white-bkg">AM</span>
      </td>
      <td colspan="12" class="hour strike">
        <span class="white-bkg">PM</span>
      </td>
      <td></td>
    </tr>
  </table>
  <div class="cell" v-for="cell in cells" :key="cell" :title="cell"></div>
  <!-- <template v-for="day in 7">
      <template v-for="hour in 24">
        <div class="cell" :key="`${day}-${hour}`">{{ day }}:{{ hour }}</div>
      </template>
    </template> -->
</template>
<script setup>
import dayOfWeek from "../dayOfWeek";
import hourOfDay from "../hourOfDay";

const props = defineProps({
  matrix: {
    type: Array,
    required: true
  }
})
console.log(props.matrix)
const generator = (d, h) => {
  const x = (d - 3.5) / 3.5;
  const y = (h - 12) / 12;
  return Math.floor(100 - (x * x + y * y) * 50);
};
const grade = (value) => {
  return `grade${Math.floor(value / 20)}`;
};
// const hourOfDay = (hour) => {
//   if (hour < 13) {
//     return `${hour} AM`;
//   }
//   return `${hour - 12} PM`;
// };
// const dayOfWeek = (day) => {
//   return ["Mon", "Tue", "Wed", "Thu", "Fry", "Sat", "Sun"][day - 1];
// };
let cells = [];
for (let day = 0; day < 7; day++) {
  for (let hour = 0; hour < 24; hour++) {
    cells.push(`${day}-${hour}`);
  }
}
</script>
<style lang="scss" scoped>
.grid {
  background-color: #fff;
  .hour,
  .day {
    font-size: 8px;
    text-align: center;
    color: #777;
  }
  .white-bkg {
    background-color: #fff;
    padding: 2px;
  }
  .cell {
    width: 20px;
    height: 30px;
    &.grade0 {
      background-color: #7777ff00;
    }
    &.grade1 {
      background-color: #7777ff33;
    }
    &.grade2 {
      background-color: #7777ff66;
    }
    &.grade3 {
      background-color: #7777ff99;
    }
    &.grade4 {
      background-color: #7777ffcc;
    }
  }
  .strike {
    background: rgb(255, 255, 255);
    background: linear-gradient(
      0deg,
      rgba(255, 255, 255, 1) 45%,
      rgba(1, 63, 88, 0.3) 45%,
      rgba(1, 63, 88, 0.3) 55%,
      rgba(255, 255, 255, 1) 55%
    );
  }
}
</style>
