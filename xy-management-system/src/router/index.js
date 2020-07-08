import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/views/login'
import Index from '@/views/index'
import Home from '@/views/home'
import CommonUser from '@/views/common_user_info'
import DealerUser from '@/views/dealer_user_info'
import AdminUser from '@/views/admin_user_info'
import UserGrade from '@/views/user_grade_info'
import GoodsAttribute from '@/views/goods_attribute'
import GoodsSpu from '@/views/goods_spu'
import OrderList from '@/views/order/order_list'
import OrderRefund from '@/views/order/order_refund'
import OrderSuccess from '@/views/order/order_success'
import FinancialStatistics from '@/views/financial/financial_statistics'
import GoodsCatalog from '@/views/goodsManage/goods_catalog'
import Feedback from '@/views/message/Feedback'
import Inventory from '@/views/warehouse/inventory'
import WarehoutSetting from '@/views/warehouse/setting'
import Storage from '@/views/warehouse/storage'
import OutStorage from '@/views/warehouse/out_storage'
import Advertising from '@/views/systemSetting/advertising'
import ContactCustomer from '@/views/message/contact_customer'

const originalPush = Router.prototype.push
Router.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
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
      children: [
        {
          path: '/index',
          name: 'Index',
          component: Index
        },
        {
          path: '/common_user',
          name: 'CommonUser',
          component: CommonUser
        },
        {
          path: '/dealer_user',
          name: 'DealerUser',
          component: DealerUser
        },
        {
          path: '/admin_user',
          name: 'AdminUser',
          component: AdminUser
        },
        {
          path: '/user_grade',
          name: 'UserGrade',
          component: UserGrade
        },
        {
          path: '/goods_attribute',
          name: 'GoodsAttribute',
          component: GoodsAttribute
        },
        {
          path: '/spu',
          name: 'GoodsSpu',
          component: GoodsSpu
        },
        {
          path: '/order_list',
          name: 'OrderList',
          component: OrderList
        },
        {
          path: '/order_refund',
          name: 'OrderRefund',
          component: OrderRefund
        },
        {
          path: '/order_success',
          name: 'OrderSuccess',
          component: OrderSuccess
        },
        {
          path: '/financial_statistics',
          name: 'FinancialStatistics',
          component: FinancialStatistics
        },
        {
          path: '/goods_catalog',
          name: 'GoodsCatalog',
          component: GoodsCatalog
        },
        {
          path: '/feedback',
          name: 'Feedback',
          component: Feedback
        },
        {
          path: '/inventory',
          name: 'Inventory',
          component: Inventory
        },
        {
          path: '/warehouse_setting',
          name: 'WarehoutSetting',
          component: WarehoutSetting
        },
        {
          path: '/storage',
          name: 'Storage',
          component: Storage
        },
        {
          path: '/out_storage',
          name: 'OutStorage',
          component: OutStorage
        },
        {
          path: '/advertising',
          name: 'Advertising',
          component: Advertising
        },
        {
          path: '/contact_customer',
          name: 'ContactCustomer',
          component: ContactCustomer
        }
        
      ]
    }
  ]
})

