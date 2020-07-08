<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>用户管理</el-breadcrumb-item>
      <el-breadcrumb-item>会员管理</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- <div style="width:400px;float:left;">
      <el-input prefix-icon="el-icon-search" v-model="search" size="mini" placeholder="输入关键字搜索" />
    </div>
    <el-button
      type="danger"
      @click="delMultipleUser"
      style="float:left;margin-left:50px;margin-bottom: 15px;"
    >删除选中</el-button>-->
    <el-table
      :data="tableData.filter(data => (!search || data.userName.toLowerCase().includes(search.toLowerCase()) || !search || data.nickName.toLowerCase().includes(search.toLowerCase())|| !search || data.phone.toLowerCase().includes(search.toLowerCase())))"
      style="width: 100%;margin-top:20px;"
      :border="true"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-form label-position="left" inline class="demo-table-expand">
            <el-form-item label="名称">
              <span>
                <el-input type="text" class="updateInput" v-model="props.row.name" />
              </span>
            </el-form-item>
            <el-form-item label="增长值">
              <span>
                <template>
                  <el-input-number
                    v-model="props.row.growthPoint"
                    size="small"
                    @change="handleChange"
                    :min="1"
                    :max="10000"
                    label="增长器"
                  ></el-input-number>
                </template>
              </span>
            </el-form-item>
            <el-form-item label="免运费标准">
              <span>
                <template>
                  <el-input-number
                    v-model="props.row.freeFreightNorm"
                    size="small"
                    @change="handleChange"
                    :min="1"
                    :max="10000"
                    label="增长器"
                  ></el-input-number>
                </template>
              </span>
            </el-form-item>
            <el-form-item label="每次评价获取的成长值">
              <span>
                <template>
                  <el-input-number
                    v-model="props.row.commentGainGrowthValue"
                    size="small"
                    @change="handleChange"
                    :min="1"
                    :max="10000"
                    label="增长器"
                  ></el-input-number>
                </template>
              </span>
            </el-form-item>
            <el-form-item label="是否有免邮特权">
              <span>
                <el-select class="updateInput" v-model="props.row.privilegeFreeFreight">
                  <el-option value="0">否</el-option>
                  <el-option value="1">是</el-option>
                </el-select>
              </span>
            </el-form-item>
            <el-form-item label="是否有签到特权">
              <span>
                <el-select class="updateInput" v-model="props.row.privilegeSignIn">
                  <el-option value="0">否</el-option>
                  <el-option value="1">是</el-option>
                </el-select>
              </span>
            </el-form-item>
            <el-form-item label="是否有评论获奖励特权">
              <span>
                <el-select class="updateInput" v-model="props.row.privilegeComment">
                  <el-option value="0">否</el-option>
                  <el-option value="1">是</el-option>
                </el-select>
              </span>
            </el-form-item>
            <el-form-item label="是否有专享活动特权">
              <span>
                <el-select class="updateInput" v-model="props.row.privilegePromotion">
                  <el-option value="0">否</el-option>
                  <el-option value="1">是</el-option>
                </el-select>
              </span>
            </el-form-item>
            <el-form-item label="是否有会员价格特权">
              <span>
                <el-select class="updateInput" v-model="props.row.privilegeMemberPrice">
                  <el-option value="0">否</el-option>
                  <el-option value="1">是</el-option>
                </el-select>
              </span>
            </el-form-item>
            <el-form-item label="是否有生日特权">
              <span>
                <el-select class="updateInput" v-model="props.row.privilegeBirthday">
                  <el-option value="0">否</el-option>
                  <el-option value="1">是</el-option>
                </el-select>
              </span>
            </el-form-item>
            <el-form-item label="备注">
              <span>{{ props.row.note }}</span>
            </el-form-item>
          </el-form>
        </template>
      </el-table-column>

      <!-- <el-table-column type="selection" width="40" align="center"></el-table-column> -->
      <el-table-column label="ID" prop="id" sortable width="105%" align="center"></el-table-column>
      <el-table-column label="名称" prop="name" sortable align="center"></el-table-column>
      <el-table-column label="增长值" prop="growthPoint" sortable align="center"></el-table-column>
      <el-table-column label="免运费标准" prop="freeFreightNorm" sortable width="120%" align="center"></el-table-column>
      <el-table-column label="操作" width="150%" align="center">
        <template slot-scope="scope">
          <el-button type="primary" size="mini" @click="handleEdit(scope.$index, scope.row)">保存</el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
export default {
  data() {
    return {
      tableData: [],
      search: ''
    }
  },
  methods: {
    handleEdit(index, row) {
      this.axios.post('/saveGrade', row).then(data => {
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
          this.axios.post('/delGrade', row).then(data => {
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
    },
     handleChange(value) {
        console.log(value);
      },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      }
  },
  created() {
    this.axios.post('/getGradeList').then(data => {
      this.tableData = data.data.gradeList
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
  width: 160px;
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
