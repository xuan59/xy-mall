<template>
  <div style="background-color: #f7f7f7;">
    <div>
      <van-nav-bar title="设置" left-text=" " left-arrow @click-left="onClickLeft" />
    </div>
    <div style="text-align:left;padding:10px;background-color: #ffffff;" @click="personal">
      <van-image round width="4rem" height="4rem" src="https://img.yzcdn.cn/vant/cat.jpeg" />
      <el-link :underline="false" style="padding:10px;">心于娟儿</el-link>
      <br />
      <span style="padding-left:10px;color:#c7c7c7;font-size:14px;">用户名:</span>
      <el-link :underline="false" style="color:#c7c7c7;">宣哥哥偕娟儿之伉俪情深</el-link>
      <!-- <van-button type="default" size="small" style="float:right;margin-top:20px;">编辑资料</van-button> -->
    </div>
    <van-divider />
    <div>
      <van-index-bar :index-list="indexList">
        <van-index-anchor style="height:20px;"></van-index-anchor>
        <van-cell title="我的收获地址" @click="jump('/address')">
          <van-icon name="arrow" />
        </van-cell>
        <van-cell title="账户安全" @click="jump('/security')">
          <van-icon name="arrow" />
        </van-cell>

        <van-index-anchor></van-index-anchor>
        <van-cell title="地区设置" @click="jump('/region')">
          <van-icon name="arrow" />
        </van-cell>
        <van-cell title="隐私" @click="jump('/privacy')">
          <van-icon name="arrow" />
        </van-cell>
        <van-cell title="通用" @click="jump('/general')">
          <van-icon name="arrow" />
        </van-cell>

        <van-index-anchor style="height:20px;"></van-index-anchor>
        <van-cell title="问题反馈" @click="jump('/feedback')">
          <van-icon name="arrow" />
        </van-cell>
        <van-cell title="关于手机逍遥" @click="jump('/about')">
          <van-icon name="arrow" />
        </van-cell>
      </van-index-bar>
      <van-button block style="margin-top:15px;" @click="jump('/switchAccount')">切换账号</van-button>
      <van-button block  type="danger" style="margin-top:15px;" @click="jump('/logOut')">退出登录</van-button>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      indexList: []
    }
  },
  methods: {
    onClickLeft() {
      this.$router.push('/my')
    },
    personal() {
      this.$router.push('/personal')
    },
    jump(path) {
      if(path == '/logOut'){
        this.$router.push('/login')
      }else{
        this.$router.push(path)
      }
      
    }
  }
}
</script>
<style scoped>
.van-image {
  float: left;
  margin-left: 10px;
}
.van-nav-bar {
  background: #ececec;
}
.van-cell {
  text-align: left;
  padding-left: 30px;
}
.van-divider {
  margin: 0px;
}
</style>