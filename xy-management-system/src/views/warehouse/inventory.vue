<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>仓库管理</el-breadcrumb-item>
      <el-breadcrumb-item>商品库存</el-breadcrumb-item>
    </el-breadcrumb>
    <div style="width:400px;margin:20px 0 10px 0;float:right;">
      <el-input prefix-icon="el-icon-search" v-model="search" @input="searchValue" placeholder="输入关键字搜索" />
    </div>
    <el-table
      border
      v-loading="loading"
      element-loading-text="拼命加载中"
      :data="tableData1.slice((currentPage-1)*pageSize,currentPage*pageSize)"
      style="width: 100%"
    >
      <el-table-column label="序号" align="center" width="100px">
          <template slot-scope="scope">
            {{scope.$index + 1}}
          </template>
      </el-table-column>
      <el-table-column label="仓库名称" prop="warehouseName" sortable align="center"></el-table-column>
      <el-table-column label="商品名称" prop="skuName" sortable align="center" :show-overflow-tooltip="true"></el-table-column>
      <el-table-column label="库存" prop="skuNumber" sortable align="center" width="100px"></el-table-column>

      <!-- <el-table-column label="操作" align="center">
        <template slot-scope="scope" align="center">
          <el-button size="mini" @click="reply(scope.$index, scope.row)">回复</el-button>
        </template>
      </el-table-column> -->
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
				:total="total">
			</el-pagination>
		</div>
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
      currentPage: 1,
      pageSize: 5,
      total: 0,
      loading: true
    }
  },
  methods: {
     handleSizeChange(val) {
        this.pageSize = val
        
    },
    handleCurrentChange(val) {
        this.currentPage = val
	},
    
    searchValue(){
      this.tableData1 = this.tableData.filter(data => !this.search || data.name.toLowerCase().includes(this.search.toLowerCase()))
      this.total = this.feedbackData1.length
    }
   
  },
  created() {
    this.axios.post('/getAllInventory').then(data => {
        this.tableData = data.data
        this.total = this.tableData.length
        var data = JSON.stringify(this.tableData)
        this.tableData1 = JSON.parse(data)
        this.loading = false
    })
    
  },
}
</script>

<style scoped>
.block{
	/* position: absolute; */
	margin-top: 50px;
	margin-bottom: 20px;
  text-align: left;
}
</style>