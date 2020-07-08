<template>
  <div style="background-color: #f7f7f7;">
    <div>
      <van-nav-bar title="通用" left-text=" " left-arrow @click-left="onClickLeft" />
    </div>
    <van-index-bar :index-list="indexList">
      
      <van-cell title="简洁模式">
        <div class="personal_right">
          <van-switch v-model="value1" active-color="#07c160" size="20px" @change="onChange1" />
        </div>
      </van-cell>
      <van-cell title="删除说有聊天记录" @click="delChat">
        <div class="personal_right">
          <van-icon name="arrow" />
        </div>
      </van-cell>
     
      <van-cell title="清除缓存" @click="blacklist">
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
      value1: false
    }
  },
  methods: {
    onClickLeft() {
      this.$router.push('/setting')
    },
    onChange1(){
        this.$toast('设置成功')
    },
    delChat(){
        this.$toast('删除成功')
    },
    blacklist(){
      this.$toast('清除成功')
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