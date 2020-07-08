<template>
  <div>
    <div class="my-top">
      <div style="height:30px;">
        <van-icon name="setting-o" class="setting-o" size="25" @click="jump('/setting')" />
      </div>

      <div class="head-img">
        <van-image round width="4rem" height="4rem" src="https://img.yzcdn.cn/vant/cat.jpeg" />
        <el-link :underline="false" @click="login">登录/注册</el-link>
      </div>

      <div style="margin-top:10px;">
        <van-tabbar>
          <van-tabbar-item icon="star-o" style="color: #ffffff;">收藏</van-tabbar-item>
          <van-tabbar-item icon="like-o" dot style="color: #ffffff;">关注</van-tabbar-item>
          <van-tabbar-item icon="records" info="5" style="color: #ffffff;">足迹</van-tabbar-item>
          <van-tabbar-item icon="coupon-o" info="20" style="color: #ffffff;" @click="jump('/coupon')">优惠券</van-tabbar-item>
        </van-tabbar>
      </div>
    </div>
    <div class="my-context">
      <div class="my-menu">
        <div style="padding:10px;height:20px;">
          <div style="font-size:13px;float:left;">
            <b>我的订单</b>
          </div>
          <div style="font-size:13px;float:right;color:#a2a2a2">
            查看全部订单
            <van-icon name="arrow" />
          </div>
        </div>
        <!-- <van-divider /> -->
        <van-tabbar>
          <van-tabbar-item icon="pending-payment" info="5" style="color:#000000;">待付款</van-tabbar-item>
          <van-tabbar-item icon="paid" info="10">待发货</van-tabbar-item>
          <van-tabbar-item icon="logistics" info="5">待收货</van-tabbar-item>
          <van-tabbar-item icon="smile-comment-o" info="20">待评价</van-tabbar-item>
          <van-tabbar-item icon="refund-o" info="5">退换/售后</van-tabbar-item>
        </van-tabbar>
      </div>
      <van-divider>为您推荐</van-divider>
      <div class="recommend">
        <van-card
          num="2"
          price="2.00"
          desc="描述信息"
          title="商品标题"
          thumb="https://img.yzcdn.cn/vant/ipad.jpeg"
        />
      </div>
      <div class="recommend">
        <van-card
          num="2"
          price="2.00"
          desc="描述信息"
          title="商品标题"
          thumb="https://img.yzcdn.cn/vant/ipad.jpeg"
        />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {}
  },
  methods: {
    login(){
      this.$router.push('/login')
    },
    jump(path){
      this.$router.push(path)
    }
  },
}
</script>

<style scoped>
.my-top {
  height: 150px;
  background-color: #f7d385;
  padding: 20px;
}
.setting-o {
  float: right;
  color: #ffffff;
}
.head-img {
  text-align: left;
  margin-left: 20px;
}
.el-link {
  margin-top: -2rem;
  color: #ffffff;
}
.van-tabbar {
  position: relative;
  background: none;
  color: #ffffff;
}
.my-menu {
  background: #ffffff;
  border-radius: 10px;
  margin-top: 10px;
}
.recommend,
.van-card {
  background: #ffffff;
  border-radius: 10px;
  margin-top: 10px;
  text-align: left;
}
</style>