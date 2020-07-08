<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>用户管理</el-breadcrumb-item>
      <el-breadcrumb-item>商家用户</el-breadcrumb-item>
    </el-breadcrumb>
    <div style="width:400px;float:left;margin-top:20px;">
      <el-input prefix-icon="el-icon-search" v-model="search" size="mini" placeholder="输入关键字搜索" />
    </div>
    <el-button
      type="danger"
      @click="delMultipleUser"
      style="float:left;margin-left:50px;margin-bottom: 15px;margin-top:20px;"
    >删除选中</el-button>
    <el-table
      :data="tableData.filter(data => (!search || data.userName.toLowerCase().includes(search.toLowerCase()) || !search || data.nickName.toLowerCase().includes(search.toLowerCase())|| !search || data.phone.toLowerCase().includes(search.toLowerCase())))"
      style="width: 100%"
      :border="true"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-form label-position="left" inline class="demo-table-expand">
            <el-form-item label="会员ID">
              <span>
                <el-select class="updateInput" v-model="props.row.userGradeId">
                  <el-option value="1">白银会员</el-option>
                  <el-option value="2">黄金会员</el-option>
                  <el-option value="3">铂金会员</el-option>
                  <el-option value="4">黄金会员</el-option>
                  <el-option value="5">砖石会员</el-option>
                </el-select>
              </span>
            </el-form-item>
            <el-form-item label="手机号码">
              <span>
                {{ props.row.phone }}
              </span>
            </el-form-item>
            <el-form-item label="账号状态">
              <span>
                <el-select class="updateInput" v-model="props.row.status">
                  <el-option value="1">启用</el-option>
                  <el-option value="0">禁用</el-option>
                </el-select>
              </span>
            </el-form-item>
            <el-form-item label="头像">
              <span>{{ props.row.icon }}</span>
            </el-form-item>
            <el-form-item label="性别">
              <span>{{ props.row.sex }}</span>
            </el-form-item>
            <el-form-item label="出生日期">
              <span>{{ props.row.birthdayStr }}</span>
            </el-form-item>
            <el-form-item label="所在城市">
              <span>{{ props.row.city }}</span>
            </el-form-item>
            <el-form-item label="职业">
              <span>{{ props.row.job }}</span>
            </el-form-item>
            <el-form-item label="个性签名">
              <span>{{ props.row.personalizedSignature }}</span>
            </el-form-item>
            <el-form-item label="积分">
              <span>{{ props.row.integral }}</span>
            </el-form-item>
            <el-form-item label="成长值">
              <span>{{ props.row.growth }}</span>
            </el-form-item>
            <el-form-item label="剩余抽奖次数">
              <span>{{ props.row.luckyCount }}</span>
            </el-form-item>
            <el-form-item label="历史积分数量">
              <span>{{ props.row.historyIntegral }}</span>
            </el-form-item>
            <el-form-item label="身份证号码">
              <span>{{ props.row.idCardNo }}</span>
            </el-form-item>
            <el-form-item width="150px" label="证件照片地址">
              <span>{{ props.row.idCardImg }}</span>
            </el-form-item>
            <el-form-item label="营业执照">
              <span>{{ props.row.businessLicense }}</span>
            </el-form-item>
          </el-form>
        </template>
      </el-table-column>

      <el-table-column type="selection" width="40" align="center"></el-table-column>
      <el-table-column label="ID" prop="id" sortable width="105%" align="center"></el-table-column>
      <el-table-column label="用户名" prop="userName" sortable width="130%" align="center"></el-table-column>
      <el-table-column label="会员ID" prop="userGradeId" sortable width="100%" align="center"></el-table-column>
      <el-table-column label="昵称" prop="nickName" sortable width="120%" align="center"></el-table-column>
      <el-table-column label="手机号码" prop="phone" sortable align="center"></el-table-column>
      <el-table-column label="账号状态" prop="status" sortable width="125%" align="center"></el-table-column>
      <el-table-column label="注册时间" prop="createTimeStr" sortable align="center"></el-table-column>
      <el-table-column width="150%" align="center">
        <template slot="header" slot-scope="scope">
          <!-- <el-input v-model="search" size="mini" placeholder="输入关键字搜索" /> -->
          操作
        </template>
        <template slot-scope="scope">
          <el-button type="primary" size="mini" @click="handleEdit(scope.$index, scope.row)">保存</el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>
<script scoped>
export default {
  data() {
    return {
      multipleSelection: [],
      tableData: [],
      search: ''
    }
  },
  methods: {
    handleEdit(index, row) {
      this.axios.post('/saveDealerUser', row).then(data => {
        if (data.data.status === '1') {
          this.$message({
            message: '恭喜你，保存成功',
            type: 'success'
          })
        } else {
          this.$message.error('错了哦，保存失败，请重试')
        }
      })
    },
    handleDelete(index, row) {
      this.$confirm('此操作将永久删除该数据, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          this.tableData.splice(index, 1)
          this.axios.post('/delDealerUser', row).then(data => {
            if (data.data.status === '1') {
              this.$message({
                message: '恭喜你，删除成功',
                type: 'success'
              })
            } else {
              this.$message.error('错了哦，删除失败，请重试')
            }
          })
        })
        .catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          })
        })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    delMultipleUser() {
      this.$confirm('此操作将永久删除该数据, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          this.axios
            .post('/delMultipleDealerUser', this.multipleSelection)
            .then(data => {
              if (data.data.status === '1') {
                var data = this.tableData
                var data1 = []
                for (var i = 0; i < data.length; i++) {
                  if (this.multipleSelection.indexOf(data[i]) === -1) {
                    data1.push(data[i])
                  }
                }
                this.tableData = data1
                this.$message({
                  message: '恭喜你，删除成功',
                  type: 'success'
                })
              } else {
                this.$message.error('错了哦，删除失败，请重试')
              }
            })
        })
        .catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          })
        })
    }
  },
  created() {
    this.axios.post('/getDealerUserList').then(data => {
      this.tableData = data.data.userList
      console.log(this.tableData)
    })
  }
}
</script>
<style scoped>
.demo-table-expand {
  font-size: 0;
}
.demo-table-expand label {
  width: 90px;
  color: #99a9bf;
}
.el-form-item {
  width: 30%;
}
.el-form-item > label {
  width: 100px;
}

.el-input--mini .el-input__inner {
  height: 40px;
  /* width: 40%; */
  float: left;
}
.updateInput {
  width: 100px;
  height: 20px;
}
.el-dropdown-link {
  cursor: pointer;
  color: #409eff;
}
.el-icon-arrow-down {
  font-size: 12px;
}
</style>
