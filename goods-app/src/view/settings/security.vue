<template>
  <div style="background-color: #f7f7f7;">
    <div v-if="show == 0">
    <div>
      <van-nav-bar title="账号安全" left-text=" " left-arrow @click-left="onClickLeft" />
    </div>
    <van-index-bar :index-list="indexList">
      <van-cell title="实名认证" @click="jump('/auth')" >
        <div class="personal_right">
          <!-- <el-link :underline="false" style="color:#c7c7c7;">心于娟儿</el-link> -->
          <van-icon name="arrow" />
        </div>
      </van-cell>
      
      <van-cell title="修改手机号码" @click="jump('/tel')" >
        <div class="personal_right">
          <el-link :underline="false" style="color:#c7c7c7;" v-text="tel"></el-link>
          <van-icon name="arrow" />
        </div>
      </van-cell>
      <van-cell title="修改登录密码" @click="jump('/password')">
        <div class="personal_right">
          <van-icon name="arrow" />
        </div>
      </van-cell>
      <van-cell title="注销账号" @click="jump('/cancel')">
        <div class="personal_right">
          <van-icon name="arrow" />
        </div>
      </van-cell>
     
    </van-index-bar>
    </div>
    <div v-else>
      <van-nav-bar :title="title" left-text=" " right-text="确定" left-arrow @click-left="onClickLeft1" @click-right="onClickRight"/>
      <div v-show="this.show == 1">
        <van-index-bar :index-list="indexList">
      <van-cell title="姓名">
        <div class="personal_right">
          <van-field v-model="authForm.name" style="padding:0" />
        </div>
      </van-cell>
      <van-cell title="性别" @click="sex">
        <div class="personal_right">
          <el-link :underline="false" style="color:#c7c7c7;" v-text="authForm.sex"></el-link>
          <van-icon name="arrow" />
        </div>
      </van-cell>
      <van-cell title="国家/地区" @click="region">
        <div class="personal_right">
          <el-link :underline="false" style="color:#c7c7c7;" v-text="authForm.region"></el-link>
          <van-icon name="arrow" />
        </div>
      </van-cell>
      <van-cell title="证件类型" @click="ID">
        <div class="personal_right">
          <el-link :underline="false" style="color:#c7c7c7;" v-text="authForm.IDType"></el-link>
          <van-icon name="arrow" />
        </div>
      </van-cell>
      <van-cell title="证件号码">
        <div class="personal_right">
          <van-field v-model="authForm.ID" style="padding:0" />
        </div>
      </van-cell>
      <van-cell title="证件有效期">
        <div class="personal_right">
          <el-link :underline="false" style="color:#c7c7c7;">上传证件</el-link>
          <van-icon name="arrow" />
        </div>
      </van-cell>
    </van-index-bar>

<van-action-sheet v-model="sexShow" title="请选择性别">
  <div class="content"><van-picker :columns="sexList" @change="sexChange" /></div>
</van-action-sheet>
<van-action-sheet v-model="IDShow" title="请选择证件类型">
  <van-picker :columns="IDList" @change="IDChange" />
</van-action-sheet>
<van-action-sheet v-model="regionShow" title="请选择国家/地区">
  <van-picker :columns="regionList" @change="regionChange" />
</van-action-sheet>
       
      </div>
      <div v-show="show == 2">  
        <van-cell-group>
          <van-field v-model="nowTel"  clearable placeholder="请输入完整手机号码" />
        </van-cell-group>
         <van-cell-group>
          <van-field v-model="newTel"  clearable placeholder="请输入新手机号码" />
        </van-cell-group>
      </div>
      <div v-show="show == 3">  
        <van-cell-group>
          <van-field v-model="nowPassword"  clearable placeholder="请输入当前密码" />
        </van-cell-group>
         <van-cell-group>
          <van-field v-model="newPassword"  clearable placeholder="请输入新密码" />
        </van-cell-group>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      indexList: [],
      tel: '',
      show: 0,
      title: '',
      indexList: [],
      sexShow: false,
      IDShow: false,
      regionShow: false,
      sexList: ['男', '女', '保密'],
      IDList: ['身份证件', '工作证件', '结婚证件', '其他证件'],
      regionList: ['中国大陆', '中国台湾', '中国香港','中国澳门'],
      authForm:{
        name: '',
        sex: '',
        region: '',
        IDType: '',
        ID: '',
        IDDate: ''
      },
      nowPassword: '',
      newPassword: '',
      nowTel: '',
      newTel: ''
    }
  },
  methods: {
    onClickLeft() {
      this.$router.push('/setting')
    },
    onClickLeft1() {
      this.show = 0
    },
    onClickRight(){
      this.$toast('成功')
    },
    jump(path) {
      if(path == '/cancel'){
        this.$dialog.confirm({
          title: '提示',
          message: '注销之后将无法恢复，你确定注销吗？'
        }).then(() => {
          // on confirm
          this.$toast('注销成功')
        }).catch(() => {
          // on cancel
        })
      }else{
        // this.$router.push('/path')
        if(path == '/tel'){
          this.title = '修改手机号码'
          this.show = 2
        }else if(path == '/password'){
          this.title = '修改密码'
          this.show = 3
        }else{
          this.title = '实名认证'
          this.show = 1
        }
       
      }
    },
    sexChange(picker, value, index) {
      this.authForm.sex = value
    },
    IDChange(picker, value, index) {
      this.authForm.IDType = value
    },
    regionChange(picker, value, index) {
      this.authForm.region = value
    },
    sex(){
      this.sexShow = true
    },
    ID(){
      this.IDShow = true
    },
    region(){
      this.regionShow = true
    }
    
  },
  created(){
      var tel = "15215086717"
      this.tel = tel.substring(0,3) +'****' + tel.substring(7)
  }
}
</script>
<style scoped>
.van-cell {
  text-align: left;
  padding-left: 30px;
}
.van-cell__title {
  width: 100px;
  flex: none;
}
.personal_right > .van-icon {
  top: 5px;
}


</style>