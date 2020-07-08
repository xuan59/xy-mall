<template>
  <div class="index">
    <el-container>
      <transition>
        <el-aside :style="{'width':widthSize}">
          <div class="logoImg">
            <a @click="menuUrl('/index')"><img src="../assets/image/logo.png" v-if="show" /></a>
          </div>
          <div class="menu">
            <el-menu
              default-active="1"
              class="el-menu-vertical-demo"
              :collapse="isCollapse"
              background-color="#545c64"
              text-color="#fff"
              active-text-color="#ffd04b"
            >
              <el-submenu index="1" v-if="loginType==2">
                <template slot="title">
                  <i class="el-icon-user-solid"></i>
                  <span slot="title">用户管理</span>
                </template>
                <el-menu-item-group>
                  <el-menu-item @click="menuUrl('/common_user')" index="1-1"><i class="el-icon-user"></i>普通用户</el-menu-item>
                  <el-menu-item @click="menuUrl('/dealer_user')" index="1-2"><i class="el-icon-user"></i>商家用户</el-menu-item>
                  <el-menu-item v-if="loginType==2&&userName=='admin'" @click="menuUrl('/admin_user')" index="1-3"><i class="el-icon-user"></i>管理用户</el-menu-item>
                </el-menu-item-group>
              </el-submenu>

              <el-submenu index="2" v-if="loginType==2">
                <template slot="title">
                  <i class="el-icon-menu"></i>
                  <span slot="title">权限管理</span>
                </template>
                <el-menu-item-group>
                  <el-menu-item  @click="menuUrl('/user_grade')" index="2-1"><i class="el-icon-setting"></i>权限设置</el-menu-item>
                </el-menu-item-group>
              </el-submenu>

              <el-submenu index="3" v-if="loginType==1">
                <template slot="title">
                  <i class="el-icon-s-finance"></i>
                  <span slot="title">财务管理</span>
                </template>
                <el-menu-item-group>
                  <el-menu-item index="3-1" @click="menuUrl('/financial_statistics')"><i class="el-icon-picture-outline-round"></i>财务统计</el-menu-item>
                  
                </el-menu-item-group>
              </el-submenu>

              <el-submenu index="4" v-if="loginType==2">
                <template slot="title">
                  <i class="el-icon-message-solid"></i>
                  <span slot="title">消息中心</span>
                </template>
                <el-menu-item-group>
                  <el-menu-item  @click="menuUrl('/feedback')" index="4-2"><i class="el-icon-chat-dot-round"></i>用户反馈</el-menu-item>
                </el-menu-item-group>
              </el-submenu>

              <el-submenu index="5" v-if="loginType==1">
                <template slot="title">
                  <i class="el-icon-s-shop"></i>
                  <span slot="title">商品管理</span>
                </template>
                <el-menu-item-group>
                  <el-menu-item @click="menuUrl('/goods_catalog')" index="5-1"><i class="el-icon-s-marketing"></i>商品分类</el-menu-item>
                  <!-- <el-menu-item index="5-2"><i class="el-icon-s-marketing"></i>品牌管理</el-menu-item> -->
                  <el-menu-item @click="menuUrl('/goods_attribute')" index="5-3"><i class="el-icon-s-marketing"></i>筛选属性</el-menu-item>
                  <el-menu-item @click="menuUrl('/spu')" index="5-4"><i class="el-icon-s-marketing"></i>SPU商品</el-menu-item>
                  <!-- <el-menu-item index="5-5"><i class="el-icon-s-marketing"></i>商品推荐</el-menu-item>
                  <el-menu-item index="5-6"><i class="el-icon-s-marketing"></i>图片管理</el-menu-item> -->
                </el-menu-item-group>
              </el-submenu>

              <el-submenu index="7" v-if="loginType==1">
                <template slot="title">
                  <i class="el-icon-s-order"></i>
                  <span slot="title">订单管理</span>
                </template>
                <el-menu-item-group>
                  <el-menu-item @click="menuUrl('/order_list')" index="7-1"><i class="el-icon-s-order"></i>订单列表</el-menu-item>
                  <el-menu-item @click="menuUrl('/order_refund')" index="7-2"><i class="el-icon-s-order"></i>退换订单</el-menu-item>
                  <el-menu-item @click="menuUrl('/order_success')" index="7-3"><i class="el-icon-s-order"></i>成功订单</el-menu-item>
                </el-menu-item-group>
              </el-submenu>

              <el-submenu index="8" v-if="loginType==1">
                <template slot="title">
                  <i class="el-icon-s-goods"></i>
                  <span slot="title">库存管理</span>
                </template>
                <el-menu-item-group>
                  <el-menu-item @click="menuUrl('/warehouse_setting')" index="8-1"><i class="el-icon-setting"></i>仓库设置</el-menu-item>
                  <el-menu-item @click="menuUrl('/inventory')" index="8-2"><i class="el-icon-s-home"></i>商品库存</el-menu-item>
                  <el-menu-item @click="menuUrl('/storage')" index="8-3"><i class="el-icon-s-home"></i>商品入库</el-menu-item>
                  <el-menu-item @click="menuUrl('/out_storage')" index="8-4"><i class="el-icon-s-home"></i>出库列表</el-menu-item>
                </el-menu-item-group>
              </el-submenu>

              <el-submenu index="9" v-if="loginType==2">
                <template slot="title">
                  <i class="el-icon-setting"></i>
                  <span slot="title">系统设置</span>
                </template>
                <el-menu-item-group>
                  <el-menu-item @click="menuUrl('/advertising')" index="9-1"><i class="el-icon-picture"></i>首页广告</el-menu-item>
                </el-menu-item-group>
              </el-submenu>

              <el-submenu index="10">
                <template slot="title">
                  <i class="el-icon-s-custom"></i>
                  <span slot="title">客服中心</span>
                </template>
                <el-menu-item-group>
                  <el-menu-item @click="menuUrl('/contact_customer')" index="10-1"><i class="el-icon-headset"></i>联系客服</el-menu-item>
                </el-menu-item-group>
              </el-submenu>




            </el-menu>
          </div>
        </el-aside>
      </transition>
      <el-container>
        <el-header>
          <span>
            <i @click="isClose()" id="isCloseIcon" class="el-icon-s-fold" v-if="show"></i>
            <i @click="isClose()" id="isCloseIcon" class="el-icon-s-unfold" v-if="isCollapse"></i>
          </span>
          <span style="font-size:1.5em;">逍遥商城管理系统</span>
          <span>
            <el-dropdown @command="handleCommand">
              <span class="el-dropdown-link">
                你好，{{userName}}
                <i class="el-icon-arrow-down el-icon--right"></i>
              </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item command="1">个人资料</el-dropdown-item>
                <el-dropdown-item command="2">我的消息</el-dropdown-item>
                <el-dropdown-item command="3">退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </span>
        </el-header>
        <el-main>
         <!-- 主界面  -->
        <router-view></router-view>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>
<script>
import Cookies from 'js-cookie'
export default {
  data() {
    return {
      isCollapse: false,
      show: true,
      widthSize: '230px',
      userName: '',
      loginType: 1
    }
  },
  methods: {

    isClose() {
      this.show = !this.show
      this.isCollapse = !this.isCollapse
      if (this.isCollapse) {
        this.widthSize = '100px'
      } else {
        this.widthSize = '200px'
      }
    },
    handleCommand(command) {
      if(command == 1){
        this.$message('个人信息')
      }else if(command == 2){
        this.$message('消息 ')
      }else{
        //this.$message('退出登录')
        Cookies.remove("loginId")
        Cookies.remove("token");
        this.$router.push("/login")
      }
      
    },
    menuUrl(url) {
      this.$router.push(url)
    },
     open() {
        this.$alert('18315261391', '热线电话', {
          confirmButtonText: '确定',
          callback: action => {
           
          }
        });
      }
  },
  created() {
    this.userName = Cookies.get("loginId");
    this.loginType = Cookies.get("loginType");

  },
}
</script>
<style>
html,
body,
#app,
.el-container {
  width: 100%;
  height: 100%;
  margin: 0;
}
/* body {
   background-image: none; 
} */
.logoImg {
  height: 150px;
  width: 230px;
}

.index {
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
}
.el-header {
  background-color: #ffffff;
  color: #333;
  text-align: center;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid #cccccc;
}
.el-icon-s-fold,
.el-icon-s-unfold {
  font-size: 2em;
  color: #333;
}

.el-aside {
  background-color: #545c64;
  color: #333;
  text-align: center;
  height: 100%;
  /* overflow: hidden; */
  overflow-x: scroll; 
  white-space: nowrap;
  
  
}
/* ::-webkit-scrollbar {
  width: 0 !important;
}
::-webkit-scrollbar {
  width: 0 !important;height: 0;
} */

.el-main {
  background-color: #ffffff;
  color: #333;
  text-align: center;
  overflow: initial;
  height: calc(100% - 60px);
  overflow-x: scroll; 
  /* white-space: nowrap; */
}

body > .el-container {
  margin-bottom: 40px;
}
img {
  width: 70%;
  height: 90%;
}
.el-menu {
  text-align: left;
  border: none;
  padding: 0 15px;
}

.v-enter {
  /* opacity: 0; */
  transform: translateX(-100%);
}
.v-leave-to {
  transform: translateX(100%);
}

.v-enter-active,
.v-leave-active {
  transition: all 0.3s;
}
.el-dropdown-link {
  cursor: pointer;
  color: #409eff;
}
.el-icon-arrow-down {
  font-size: 12px;
}

</style>

<style scoped>
::-webkit-scrollbar {
  width: 0 !important;
}
::-webkit-scrollbar {
  width: 0 !important;height: 0;
}
</style>