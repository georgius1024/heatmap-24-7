import dayjs from "dayjs";

export default function hourOfDay(hour) {
  return dayjs().startOf('day').add(hour - 1, 'hour').format('h')
}