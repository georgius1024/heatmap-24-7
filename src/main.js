import dayjs from "dayjs";
import 'dayjs/locale/en'
import { createApp } from 'vue'
import App from './App.vue'
dayjs.locale('en') 
createApp(App).mount('#app')
