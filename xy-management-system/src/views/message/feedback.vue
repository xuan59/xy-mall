<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>消息中心</el-breadcrumb-item>
      <el-breadcrumb-item>用户反馈</el-breadcrumb-item>
    </el-breadcrumb>
    <div style="width:40%;margin:20px 0 10px 0;float:right;">
      <el-input
        prefix-icon="el-icon-search"
        v-model="search"
        @input="searchValue"
        placeholder="输入关键字搜索"
      />
    </div>
    <el-table
      border
      :data="feedbackData1.slice((currentPage-1)*pageSize,currentPage*pageSize)"
      style="width: 100%"
    >
      <el-table-column label="序号" align="center" width="100px">
        <template slot-scope="scope">{{scope.$index + 1}}</template>
      </el-table-column>
      <el-table-column label="用户名" prop="userName" sortable align="center"></el-table-column>
      <el-table-column label="反馈信息" prop="message" sortable align="center"></el-table-column>
      <el-table-column label="邮箱" prop="email" sortable align="center"></el-table-column>
      <el-table-column label="日期" prop="createTime" sortable align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.createTime | dateFmt('YYYY-MM-DD HH:mm:ss') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope" align="center">
          <el-button
            v-if="scope.row.isReply == 0"
            size="mini"
            @click="reply(scope.$index, scope.row)"
          >回复</el-button>
          <el-tag v-else type="success">已回复</el-tag>
        </template>
      </el-table-column>
    </el-table>
    <div class="block">
      <el-pagination
        background
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[5, 6, 7, 8, 9, 10]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      feedbackData: [],
      feedbackData1: [],
      search: '',
      dialogVisible: false,
      currentPage: 1,
      pageSize: 5,
      total: 0
    }
  },
  methods: {
    handleSizeChange(val) {
      this.pageSize = val
    },
    handleCurrentChange(val) {
      this.currentPage = val
    },
    reply(index, row) {
  
      this.$prompt('请输入回复内容', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputPattern: /^.{2,5000}$/,
        inputType: 'textarea',
        inputErrorMessage: '内容不能为空，长度为2~5000'
      })
        .then(({ value }) => {
          var params = new URLSearchParams()
          params.append('message', value)
          params.append('email', row.email)
          params.append('id', row.id)
          this.axios.post('/replyMessage', params).then(data => {
            console.log(data)
            this.$message({
              type: 'success',
              message: '回复成功'
            })
            row.isReply = 1
          })
        })
        .catch(() => {
          // this.$message({
          //   type: 'info',
          //   message: '取消输入'
          // });
        })
    },
    searchValue() {
      this.feedbackData1 = this.feedbackData.filter(
        data =>
          !this.search || data.userName.toLowerCase().includes(this.search.toLowerCase())||
          !this.search || data.email.toLowerCase().includes(this.search.toLowerCase())||
          !this.search || data.message.toLowerCase().includes(this.search.toLowerCase())||
          !this.search || data.createTime.toLowerCase().includes(this.search.toLowerCase())
      )
      this.total = this.feedbackData1.length
    }
  },
  created() {
    this.axios.post('/getAllFeedbackMessage').then(data => {
      console.log(data.data)
      this.feedbackData = data.data
      this.total = this.feedbackData.length
      var data = JSON.stringify(this.feedbackData)
      this.feedbackData1 = JSON.parse(data)
    })
  }
}
</script>

<style scoped>
.block {
  /* position: absolute; */
  margin-top: 50px;
  margin-bottom: 20px;
  text-align: left;
}
</style>