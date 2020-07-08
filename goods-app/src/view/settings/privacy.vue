<template>
  <div style="background-color: #f7f7f7;">
    <div>
      <van-nav-bar title="隐私" left-text=" " left-arrow @click-left="onClickLeft" />
    </div>
    <van-index-bar :index-list="indexList">
      
      <van-cell title="通过手机号码找打我">
        <div class="personal_right">
          <van-switch v-model="value1" active-color="#07c160" size="20px" @change="onChange1" />
        </div>
      </van-cell>
      <van-cell title="允许给我推荐通讯录好友">
        <div class="personal_right">
          <van-switch v-model="value2" active-color="#07c160" size="20px" @change="onChange2" />
        </div>
      </van-cell>
     
      <van-cell title="黑名单" @click="blacklist">
        <div class="personal_right">
          <van-icon name="arrow" />
        </div>
      </van-cell>
    </van-index-bar>

  </div>
</template>

<script>
export default {
  data() {
    return {
      indexList: [],
      value1: false,
      value2: false
    }
  },
  methods: {
    onClickLeft() {
      this.$router.push('/setting')
    },
    onChange1(){
        this.$toast('设置成功')
    },
    onChange2(){
        this.$toast('设置成功')
    },
    blacklist(){
        this.$router.push('/blacklist')
    }
  }
}
</script>
<style scoped>
.van-cell {
  text-align: left;
  padding-left: 30px;
  margin-top: 10px;
}
.van-cell__title {
  /* width: 100px; */
  flex: none;
}
.personal_right > .van-icon {
  top: 5px;
}

</style>