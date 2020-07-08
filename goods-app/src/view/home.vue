<template>
  <div>
    <el-container>
      <!-- <el-header height="60px">Header</el-header> -->
      <el-main>
        <router-view/>

      </el-main>
      <el-footer height="50px">
        <van-tabbar v-model="active">
          <van-tabbar-item icon="home-o" @click="change('/index')">首页</van-tabbar-item>
          <van-tabbar-item icon="chat-o" dot @click="change('/message')">消息</van-tabbar-item>
          <van-tabbar-item icon="cart-o" info="5" @click="change('/cart')">购物车</van-tabbar-item>
          <van-tabbar-item icon="contact" info="20" @click="change('/my')">我的</van-tabbar-item>
        </van-tabbar>
      </el-footer>
    </el-container>
  </div>
</template>
<script>
export default {
    data(){
      return{
        active:0
      }
    },
    methods: {
      change(path){
        this.$router.push(path)
      }
    },
}
</script>

<style scoped>
#app>div,.el-container {
  width: 100%;
  height: 100%;
  margin: 0;
}
.el-main{
  padding: 0;
  background-color: #f7f7f7;
}
</style>