<template>
  <div style="background-color: #f7f7f7;">
    <div>
      <van-nav-bar title="问题反馈" left-text=" " left-arrow @click-left="onClickLeft" />
    </div>
    <van-index-bar :index-list="indexList">
      <van-index-anchor index="1">请选择反馈问题的类型</van-index-anchor>
      
      <van-cell title="交易问题" @click="trading">
        <div class="personal_right">
            <el-link :underline="false" style="color:#c7c7c7;">联系客服</el-link>
          <van-icon name="arrow" />
        </div>
      </van-cell>
     
      <van-cell title="使用问题" @click="use">
        <div class="personal_right">
            <el-link :underline="false" style="color:#c7c7c7;">功能异常/反馈等</el-link>
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
      indexList: []
    }
  },
  methods: {
    onClickLeft() {
      this.$router.push('/setting')
    },
    trading(){
        this.$router.push('/customerService')
    },
    use(){
        this.$router.push('/use')
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