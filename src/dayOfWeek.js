import dayjs from "dayjs";

export default function dayOfWeek(day) {
  return dayjs().startOf('week').add(day - 1, 'day').format('ddd')
}