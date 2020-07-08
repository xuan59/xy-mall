<template>
  <div class="login">
    <p class="title">欢迎来到逍遥商城管理系统</p>
    <el-form
      :model="ruleForm"
      :rules="rules"
      ref="ruleForm"
      class="demo-ruleForm"
      :status-icon=true
    >
      <el-form-item prop="username" style="margin-left:0px;">
        <el-input prefix-icon="el-icon-user" v-model="ruleForm.username" placeholder="账号"></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          prefix-icon="el-icon-lock"
          type="password"
          v-model="ruleForm.password"
          placeholder="密码"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="login('ruleForm')">
          <span>登</span>
          <span style="margin-left:20%;">录</span>
        </el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import Cookies from 'js-cookie'
export default {
  data() {
    return {
      ruleForm: {
        username: '',
        password: ''
      },
      rules: {
        username: [
          { required: true, message: '请输入账号', trigger: 'blur' },
          { min: 3, max: 10, message: '长度在 3 到 10 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 6, max: 18, message: '长度在 6 到 18 个字符', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    login(formName) {
      console.log('开始')
      var date1 = new Date()
      this.$refs[formName].validate(valid => {
        if (valid) {
          var params = new URLSearchParams()
          params.append('username', this.ruleForm.username)
          params.append('password', this.ruleForm.password)
          this.axios.post('/login', params).then(data => {
            console.log(data)
            if (data.data.status === '1') {
            //   localStorage.setItem('token', data.data.token)
              Cookies.set('token', data.data.token, { expires: 3 })
              Cookies.set('loginId', this.ruleForm.username, { expires: 3 })
              Cookies.set('loginType', data.data.type, { expires: 3 })
              this.$router.push('/index')
              this.$message({ message: '登录成功', type: 'success' })
              var date2 = new Date()
              console.log('结束')
              console.log((date2.getTime() - date1.getTime()) /1000)
            } else {
              this.$message.error('登录失败，用户名或密码错误')
            }
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    resetForm(formName) {
      this.$refs[formName].resetFields()
    }
  },mounted() {
    var p = this
    document.onkeypress = function(e) {
      var keycode = document.all ? event.keyCode : e.which;
      if (keycode == 13) {
        p.login('ruleForm')
      }
    }
  },
  created() {
    
  },
}
</script>
<style scoped>
body{
  background-image: url('../assets/image/login.jpg')
}
.login {
  width: 30%;
  margin-top: 15%;
  margin-left: 35%;
  border-radius: 5%;
  background-color: #ffffff;
  padding: 1% 5%;
}
.title {
  font-size: 1.5em;
  text-shadow: dimgray 5px 5px 3px;
}
.el-button {
  width: 100%;
}
</style>