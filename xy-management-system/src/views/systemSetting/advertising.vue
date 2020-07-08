<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>系统设置</el-breadcrumb-item>
      <el-breadcrumb-item>首页广告</el-breadcrumb-item>
    </el-breadcrumb>
    <div style="margin:20px 0 10px 0;text-align:left;">
      <el-button type="primary" @click="add">添加</el-button>
      <el-input
        style="float:right;width:40%;"
        prefix-icon="el-icon-search"
        v-model="search"
        @input="searchValue"
        placeholder="输入关键字搜索"
      />
    </div>
    <el-table
      border
      v-loading="loading"
      element-loading-text="拼命加载中"
      :data="tableData1.slice((currentPage-1)*pageSize,currentPage*pageSize)"
      style="width: 100%"
    >
      <el-table-column label="序号" align="center" width="120px">
        <template slot-scope="scope">{{ (currentPage-1)*pageSize + scope.$index + 1}}</template>
      </el-table-column>
      <el-table-column label="广告类型" prop="advertType" align="center"></el-table-column>
      <el-table-column label="图片地址" prop="imgUrl" align="center"></el-table-column>
      <el-table-column label="操作" align="center" width="200px">
        <template slot-scope="scope" align="center">
          <el-button size="mini" @click="edit(scope.$index, scope.row)">编辑</el-button>
          <el-button size="mini" @click="del(scope.$index, scope.row)" type="danger">删除</el-button>
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
    <el-dialog style="text-align:left;" :title="title" :visible.sync="dialogVisible" width="40%">
      <el-form
        :model="advertForm"
        :rules="rules"
        ref="advertForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="广告类型" prop="advertType">
          <el-input v-model="advertForm.advertType" placeholder="请输入名称"></el-input>
        </el-form-item>
        <el-form-item label="上传图片" prop="imgUrl">
          <el-upload
            class="upload-demo"
            action="http://192.168.43.179:8081/fileUpload"
            :on-success="addFile"
            :on-remove="handleRemove"
            :file-list="fileList"
            list-type="picture"
          >
            <el-button
              size="small"
              v-if="(title == '编辑广告' && limit == 0)||title == '添加广告'"
              type="primary"
            >点击上传</el-button>
            <!-- <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div> -->
          </el-upload>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="save('advertForm')">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tableData: [],
      tableData1: [],
      search: '',
      dialogVisible: false,
      loading: true,
      currentPage: 1,
      pageSize: 5,
      total: 0,
      title: '',
      advertForm: {
        advertType: '',
        imgUrl: ''
      },
      rules: {
        advertType: [
          { required: true, message: '请输入广告类型', trigger: 'blur' }
          // { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' }
        ],
        imgUrl: [
          { required: true, message: '请上传图片', trigger: 'focus' }
          // { min: 3, max: 5, message: '长度在 1 到 5 个字符', trigger: 'blur' }
        ]
      },
      fileList: [],
      limit: 0,
      row: ''
    }
  },
  methods: {
    handleSizeChange(val) {
      this.pageSize = val
    },
    handleCurrentChange(val) {
      this.currentPage = val
    },
    add() {
      this.limit = 0
      this.fileList = []
      this.title = '添加广告'
      this.dialogVisible = true
      this.advertForm = {
        id: '',
        advertType: '',
        imgUrl:
          'http://192.168.43.96/group1/M00/00/00/wKgrYF6J2MKAZRFPAAFx1FfIII8889.jpg,'
      }
    },
    edit(index, row) {
      this.row = row
      this.fileList = []
      this.limit = 0
      this.title = '编辑广告'
      this.dialogVisible = true
      var str = JSON.stringify(row)
      this.advertForm = JSON.parse(str)
     
    },
    del(index, row) {
      this.$confirm('此操作将永久删除, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          var params = new URLSearchParams()
          params.append('id', row.id)
          this.axios.post('/deleteAdvertInfo', params).then(data => {
            console.log(data)
            if (data.data != null && data.data != '') {
              this.tableData.splice(index, 1)
              this.searchValue()
              this.$message({
                type: 'success',
                message: '删除成功!'
              })
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
    searchValue() {
      this.tableData1 = this.tableData.filter(
        data =>
          !this.search ||
          data.advertType.toLowerCase().includes(this.search.toLowerCase()) ||
          !this.search ||
          data.imgUrl.toLowerCase().includes(this.search.toLowerCase())
      )
      this.total = this.tableData1.length
    },

    save(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          console.log(this.advertForm)
          var params = new URLSearchParams()
          params.append('advert', JSON.stringify(this.advertForm))
          console.log(params)
          this.axios.post('/saveAdvertInfo', params).then(data => {
            console.log(data)
            if (data.data != null && data.data != '') {
              if(this.advertForm.id != ""){
                // this.row.imgUrl = this.advertForm.imgUrl
                // this.tableData.push(this.advertForm)
                 this.tableData.forEach(data => {
                    if(data.id ==this.advertForm.id){
                        data.imgUrl = this.advertForm.imgUrl
                    }
                 })
              }else{
                this.fileList.forEach(file => {
                  this.tableData.push({
                    id: '',
                    advertType: this.advertForm.advertType,
                    imgUrl: file.response
                  })
                })
              }
              this.$message({
                type: 'success',
                message: '保存成功!'
              })
              
              this.dialogVisible = false
              
              this.searchValue()
            }
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    handleRemove(file, fileList) {
      this.fileList = fileList
      console.log(fileList)
      this.limit = 0
      this.advertForm.imgUrl = ''
      this.fileList.forEach(fil => {
        this.advertForm.imgUrl += fil.response + ','
      })
    },
    addFile(res, file, fileList) {
      console.log(file)
      // this.advertForm.fileList.push(file)
      console.log(this.advertForm)
      if (this.title == '编辑广告') {
        this.advertForm.imgUrl = file.response
      } else {
        this.advertForm.imgUrl += file.response + ','
      }

      this.fileList = fileList
      this.limit = 1
    }
  },
  created() {
    this.axios.post('/getAllAdvertInfo').then(data => {
      console.log(data)
      if (data.data.length != 0) {
        this.tableData = data.data
        this.total = this.tableData.length
        var data = JSON.stringify(this.tableData)
        this.tableData1 = JSON.parse(data)
        this.loading = false
      }
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
.el-form {
  max-height: 300px;
  overflow: scroll;
}
::-webkit-scrollbar {
  width: 0 !important;
}
::-webkit-scrollbar {
  width: 0 !important;
  height: 0;
}
</style>