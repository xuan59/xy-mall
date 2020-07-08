import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/view/login'
import Home from '@/view/home'
import Index from '@/view/index'
import My from '@/view/my'
import Cart from '@/view/cart'
import Message from '@/view/message'
import Setting from '@/view/settings/setting'
import Personal from '@/view/personal'
import UpdateNickname from '@/view/updateNickname'
import Address from '@/view/address'
import Security from '@/view/settings/security'
import Region from '@/view/settings/region'
import Privacy from '@/view/settings/privacy'
import Blacklist from '@/view/settings/blacklist'
import General from '@/view/settings/general'
import Feedback from '@/view/settings/feedback'
import CustomerService from '@/view/settings/customerService'
import Use from '@/view/settings/use'
import About from '@/view/settings/about'
import Advertising from '@/view/advertising'
import Coupon from '@/view/my/coupon'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      component: Index
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/home',
      name: 'Home',
      component: Home,
      children:[
        {
          path: '/index',
          name: 'Index',
          component: Index
        },
        {
          path: '/my',
          name: 'My',
          component: My
        },
        {
          path: '/cart',
          name: 'Cart',
          component: Cart
        },
        {
          path: '/message',
          name: 'Message',
          component: Message
        }
      ]
    },
    {
      path: '/setting',
      name: 'Setting',
      component: Setting
    },
    {
      path: '/personal',
      name: 'Personal',
      component: Personal
    },
    {
      path: '/updateNickname',
      name: 'UpdateNickname',
      component: UpdateNickname
    },
    {
      path: '/address',
      name: 'Address',
      component: Address
    },
    {
      path: '/security',
      name: 'Security',
      component: Security
    },
    {
      path: '/region',
      name: 'Region',
      component: Region
    },
    {
      path: '/privacy',
      name: 'Privacy',
      component: Privacy
    },
    {
      path: '/blacklist',
      name: 'Blacklist',
      component: Blacklist
    },
    {
      path: '/general',
      name: 'General',
      component: General
    },
    {
      path: '/feedback',
      name: 'Feedback',
      component: Feedback
    },
    {
      path: '/customerService',
      name: 'CustomerService',
      component: CustomerService
    },
    {
      path: '/use',
      name: 'Use',
      component: Use
    },
    {
      path: '/about',
      name: 'About',
      component: About
    },
    {
      path: '/advertising',
      name: 'Advertising',
      component: Advertising
    },
    {
      path: '/coupon',
      name: 'Coupon',
      component: Coupon
    }
  ],
  
  mode: 'history'
})
