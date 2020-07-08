<template>
  <div>
    <div class="login-close">
      <van-icon name="cross" size="30" @click="close"/>
    </div>
    <div class="login-logo">
      <img src="../assets/logo.png" />
    </div>
    <div>
      <van-cell-group>
        <van-field
          v-model="username"
          label="用户名"
          placeholder="请输入用户名"
        />
        <van-field
          v-model="passwrod"
          label="密码"
          placeholder="请输入密码"
          type="password"
        />
      </van-cell-group>
      <van-button type="primary" round @click="submitFrom">登 录</van-button>
    </div>
    <el-link :underline="false">找回密码</el-link>
      <el-link :underline="false" style="margin-left:30%">注册</el-link>
      <van-divider content-position="left">其他登录方式</van-divider>
      <div class="other">
        <img src="../assets/qq.png"/><span>QQ</span>
        <img src="../assets/weixin.png"/><span>微信</span>
        <img src="../assets/weibo1.png"/><span>微博</span>
      </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      passwrod: ''
    }
  },
  methods: {
      submitFrom(){
        if(this.username.length == 0){
          this.$message({
          showClose: true,
          message: '请输入用户名',
          type: 'error'
        });
          
        }else if(this.passwrod.length == 0){
          this.$message({
          showClose: true,
          message: '请输入密码',
          type: 'error'
        });
        }else{
          this.$router.push('/index')
        }
      },
      close(){
        this.$router.push('/my')
      }
    },
}
</script>

<style scoped>

.van-field {
  height: 50px;
}
.van-button {
  width: 80%;
  height: 40px;
  margin-top: 10px;
}
.login-logo{
  margin-bottom: 20px;
}

.login-close {
  text-align: left;
  padding: 10px;
}
.other{

  /* border-top: 1px solid #dedede; */
  padding: 10px;
  /* width: 80%; */
  /* float: right; */
}
.other > span{
  font-size: 10px;
  margin-top: 5px;
  margin-right: 20px;
}
.other1{
  margin-top: 10%;
  text-align: left;
  font-size: 12px;
  padding: 0 0 0 10px;
}
</style>