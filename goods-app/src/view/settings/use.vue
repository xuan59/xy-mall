<template>
  <div style="background-color: #f7f7f7;">
    <div>
      <van-nav-bar title="使用问题" left-text=" " left-arrow @click-left="onClickLeft" />
    </div>
    <van-index-bar :index-list="indexList">
      <van-index-anchor index="1">请选择反馈问题的类型</van-index-anchor>
      
      <van-cell title="性能体验">
        <div class="personal_right">
            <el-link :underline="false" style="color:#c7c7c7;">白屏、卡顿、闪退、图片</el-link>
          <van-switch v-model="value1" active-color="#07c160" size="20px" @change="onChange('1')" />
        </div>
      </van-cell>
      <van-cell title="功能异常">
        <div class="personal_right">
            <el-link :underline="false" style="color:#c7c7c7;">现有功能无法正常使用</el-link>
          <van-switch v-model="value2" active-color="#07c160" size="20px" @change="onChange('2')" />
        </div>
      </van-cell>
      <van-cell title="产品建议">
        <div class="personal_right">
            <el-link :underline="false" style="color:#c7c7c7;">用得不爽都提交过来吧</el-link>
          <van-switch v-model="value3" active-color="#07c160" size="20px" @change="onChange('3')" />
        </div>
      </van-cell>
      <van-cell title="其他反馈">
        <div class="personal_right">
          <van-switch v-model="value4" active-color="#07c160" size="20px" @change="onChange('4')" />
        </div>
      </van-cell>
      <van-index-anchor index="1">问题和意见</van-index-anchor>
      
        <van-field
  v-model="feedbackMessage"
  autosize
  type="textarea"
  maxlength="500"
  placeholder="请输入留言"
  show-word-limit
/>
      
      <van-index-anchor index="1">添加图片（选填，提供问题截图）</van-index-anchor>
       <div class="uploadImg" style="text-align:left;">
       <van-uploader :after-read="afterRead" />
       </div>
    </van-index-bar>

  </div>
</template>

<script>
export default {
  data() {
    return {
      indexList: [],
      value1: false,
      value2: false,
      value3: false,
      value4: false,
      feedbackMessage: ''
    }
  },
  methods: {
    onClickLeft() {
      this.$router.push('/feedback')
    },
    trading(){
        this.$router.push('/customerService')
    },
    use(){
        this.$router.push('/use')
    },
     afterRead(file) {
      // 此时可以自行将文件上传至服务器
      console.log(file);
    },
    onChange(id){
        this.$toast('设置成功')
    }
  }
}
</script>
<style scoped>
.van-cell {
  text-align: left;
  padding-left: 30px;
  /* margin-top: 10px; */
}
.van-cell__title {
  /* width: 100px; */
  height: 30px;
  line-height: 30px;
  flex: none;
}
.personal_right{
    height: 30px;
    line-height: 30px;
}
.personal_right > .van-switch{
    top: 5PX;
}
.uploadImg{
    background: #ffffff;
    width: 100%;
    padding:10px;
}
</style>