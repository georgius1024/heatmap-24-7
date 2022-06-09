<template>
  <table class="grid" cellspacing="2">
    <tr>
      <td></td>
      <td v-for="hour in 24" :key="hour" class="label">{{ hourOfDay(hour) }}</td>
      <td></td>
    </tr>
    <tr v-for="day in 7" :key="day">
      <td class="label">{{ dayOfWeek(day) }}</td>
      <td
        v-for="hour in 24"
        :key="hour"
        class="cell"
        :title="props.matrix[day - 1][hour - 1]"
        :style="cellStyle(grade(props.matrix[day - 1][hour - 1]))"
      ></td>
      <td class="label">{{ dayOfWeek(day) }}</td>
    </tr>
    <tr>
      <td></td>
      <td v-for="hour in 24" :key="hour" class="label">{{ hourOfDay(hour) }}</td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td colspan="12" class="hour strike">
        <span class="white-bkg label">AM</span>
      </td>
      <td colspan="12" class="hour strike">
        <span class="white-bkg label">PM</span>
      </td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td colspan="24">
        <table cellpadding="0" cellspacing="0" width="100%" class="white-bkg">
          <tr height="9">
            <td
              v-for="color in props.colors"
              :key="color"
              :bgcolor="color"
            ></td>
          </tr>
        </table>
      </td>
      <td></td>
    </tr>
    <tr>
      <td></td>
      <td colspan="12" align="left" class="label">
        <slot name="less">Less</slot>
      </td>
      <td colspan="12" align="right" class="label">
        <slot name="more">More</slot>        
      </td>
      <td></td>
    </tr>
  </table>
</template>
<script setup>
import { computed } from "@vue/runtime-core";
import dayOfWeek from "../dayOfWeek";
import hourOfDay from "../hourOfDay";
const props = defineProps({
  matrix: {
    type: Array,
    required: true,
  },
  colors: {
    type: Array,
    required: true,
  },
});

const border = computed(() => {
  const flatten = props.matrix.flat();
  const max = Math.max.apply(null, flatten);
  const min = Math.min.apply(null, flatten);
  return {
    min,
    max,
  };
});

const grade = (value) => {
  const steps = props.colors.length - 1;
  const norm =
    (value - border.value.min) / (border.value.max - border.value.min);
  return Math.ceil(norm * steps);
};

const cellStyle = (grade) => {
  return {
    backgroundColor: props.colors[grade],
  };
};
</script>
<style lang="scss" scoped>
.grid {
  background-color: #fff;
  .label {
    font-size: 14px;
    text-align: center;
    color: #697b7e;
  }
  .white-bkg {
    background-color: #fff;
    padding: 2px;
  }
  .cell {
    width: 20px;
    height: 35px;
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
      #fff 45%,
      #e3e7e8 45%,
      #e3e7e8 55%,
      #fff 55%
    );
  }
}
</style>
