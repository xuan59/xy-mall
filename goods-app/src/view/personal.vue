<template>
  <div style="background-color: #f7f7f7;">
    <div>
      <van-nav-bar title="个人信息" left-text=" " left-arrow @click-left="onClickLeft" />
    </div>
    <van-index-bar :index-list="indexList">
      <van-index-anchor></van-index-anchor>
      <van-cell title="头像" @click="headImg">
        <van-image round width="2rem" height="2rem" src="https://img.yzcdn.cn/vant/cat.jpeg" />
        <van-icon name="arrow" style="top:-10px;" />
      </van-cell>
      <van-cell title="用户名" @click="username" >
        <div class="personal_right">
          <el-link :underline="false" style="color:#c7c7c7;">心于娟儿</el-link>
        </div>
      </van-cell>
      <van-cell title="昵称" @click="nickname">
        <div class="personal_right">
          <el-link :underline="false" style="color:#c7c7c7;">宣哥哥偕娟儿之伉俪情深</el-link>
          <van-icon name="arrow" />
        </div>
      </van-cell>
      <van-cell title="性别" @click="sex">
        <div class="personal_right">
          <el-link :underline="false" style="color:#c7c7c7;" v-text="sexValue"></el-link>
          <van-icon name="arrow" />
        </div>
      </van-cell>
      <van-cell title="出生日期" @click="birth">
        <div class="personal_right">
          <el-link :underline="false" style="color:#c7c7c7;" v-text="birthTime"></el-link>
          <van-icon name="arrow" />
        </div>
      </van-cell>
    </van-index-bar>
    <van-action-sheet
  v-model="imgShow"
  :actions="actions"
  cancel-text="取消"
  @cancel="onCancel"
  @select="onSelect"
/>
<van-action-sheet v-model="sexShow" title="请选择性别">
  <div class="content"><van-picker :columns="columns" @change="sexChange" /></div>
</van-action-sheet>
<van-action-sheet v-model="birthShow" title="请选择出生日期">
  <div class="content">
    <van-datetime-picker
  v-model="birthDate"
  type="date"
  :min-date="minDate"
  :max-date="maxDate"
  @change="birthChange"
  confirm-button-text=" "
  cancel-button-text=" "
/></div>
</van-action-sheet>

  </div>
</template>

<script>
export default {
  data() {
    return {
      indexList: [],
      imgShow: false,
      sexShow: false,
      birthShow: false,
      actions: [
        { name: '拍照上传' },
        { name: '本地上传' },
      ],
      columns: ['男', '女', '保密'],
      sexValue: '男',
      minDate: new Date(1920, 0, 1),
      maxDate: new Date(2020, 10, 1),
      birthDate: new Date("1996-10-15"),
      birthTime: '1996-10-15'
    }
  },
  methods: {
    onClickLeft() {
      this.$router.push('/setting')
    },
    headImg() {
      this.imgShow = true
    },
    onCancel() {
      this.imgShow = false
    },
     onSelect(item) {
      // 默认情况下点击选项时不会自动收起
      // 可以通过 close-on-click-action 属性开启自动收起
      this.imgShow = false;
    },
    username(){
      this.$toast('亲，用户名不可以修改哦');
    },
    nickname(){
      this.$router.push('/updateNickname')
    },
    sex(){
      this.sexShow = true
    },
    birth(){
      this.birthShow = true
    },
    sexChange(picker, value, index) {
      this.sexValue = value
    },
    birthChange(){
      this.birthTime = this.birthDate.getFullYear()+'-'+this.birthDate.getMonth() + 1 + '-' +this.birthDate.getDate()
    }
  }
}
</script>
<style scoped>
.van-cell {
  text-align: left;
  padding-left: 30px;
}
.van-cell__title {
  /* width: 100px; */
  flex: none;
}
.personal_right > .van-icon {
  top: 5px;
}

</style>