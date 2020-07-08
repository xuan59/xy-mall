// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import 'element-ui/lib/index.js'
import axios from 'axios'
import Cookies from 'js-cookie'
import moment from 'moment'
import Echarts from 'echarts'

axios.defaults.baseURL = 'http://192.168.43.179:8081/' //192.168.43.179
Vue.use(ElementUI)
Vue.prototype.axios = axios
Vue.config.productionTip = false
Vue.prototype.$echarts = Echarts

//拦截器
// to 想要去哪里
// from 从哪里来
// next 跳转到哪里
router.beforeEach((to,from,next)=>{
  let token = Cookies.get('token')
  console.log(token)
  if(token!=null) {
    next()
  }else {
    if(to.path == '/login' || to.path == '/') {
      next()
    }else{
      next('/login')
    }
  }
})

Vue.filter('dateFmt', (input, formatString = "YYYY-MM-DD") => {
  //es5函数参数设置默认值
  //const lastFormatString = formatString || ''
   // moment(input) 把时间字符串转成时间对象
   // format(formatString) 把时间对象，按照指定格式，格式化成符合条件的字符串
  return moment(input).format(formatString)
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
