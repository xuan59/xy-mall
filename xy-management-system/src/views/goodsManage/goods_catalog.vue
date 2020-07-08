<template>
  <div>
    <div style="margin-bottom:20px;">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>商品管理</el-breadcrumb-item>
        <el-breadcrumb-item>商品分类</el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <!-- 显示一分类属性 -->
		<div v-show="catalog == 1">
      <div style="margin-top:40px;text-align:left;">
        
        <el-input size="small" prefix-icon="el-icon-search" v-model="search" style="width:300px" placeholder="请输入搜索关键字"></el-input>
        <el-button
          style="width:120px;"
          size="small"
          @click="addName"
          type="primary"
          icon="el-icon-plus"
        >添加一级分类</el-button>
      </div>

      <template>
        <el-table
          v-loading="loading"
          element-loading-text="数据正在加载..."
          element-loading-background="rgba(f, f, f, 0.8)"
          :data="catalog1List.filter(data => !search || data.name.toLowerCase().includes(search.toLowerCase())).slice((currentPage-1)*pageSize,currentPage*pageSize)"
          style="width: 100%;top:20px;"
          :border="true"
        >
          <el-table-column align="center" label="序号" width="100px">
            <template slot-scope="scope">{{ (currentPage-1) * pageSize + scope.$index + 1 }}</template>
          </el-table-column>

          <el-table-column prop="id" align="center" label="ID"></el-table-column>
          <el-table-column prop="name" align="center" label="名称"></el-table-column>
          <el-table-column align="center" label="操作" width="350px">
            <template slot-scope="scope">
              <el-button
                @click="viewCatalog(scope.row)"
                style="width:80px;"
                icon="el-icon-search"
                size="small"
              >查看</el-button>
							<el-button
                @click="editCatalog(scope.row)"
                style="width:80px;"
                icon="el-icon-edit"
                type="primary"
                size="small"
              >修改</el-button>
							<el-button
                @click="deleteCatalog(scope.$index, scope.row)"
                style="width:80px;"
                icon="el-icon-delete"
                type="danger"
                size="small"
              >删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </template>
    </div>
    <!-- 显示二分类属性 -->
    <div v-show="catalog == 2">
      <div style="margin-top:40px;text-align:left;">
        
        <el-input size="small" prefix-icon="el-icon-search" v-model="search" style="width:300px" placeholder="请输入搜索关键字"></el-input>
        <el-button
          style="width:120px;"
          size="small"
          @click="addName"
          type="primary"
          icon="el-icon-plus"
        >添加二级分类</el-button>
				<el-button
          style="width:120px;float:right;"
          size="small"
          @click="back"
        >返回</el-button>
      </div>

      <template>
        <el-table
          v-loading="loading"
          element-loading-text="数据正在加载..."
          element-loading-background="rgba(f, f, f, 0.8)"
          :data="catalog2List.filter(data => !search || data.name.toLowerCase().includes(search.toLowerCase())).slice((currentPage-1)*pageSize,currentPage*pageSize)"
          style="width: 100%;top:20px;"
          :border="true"
        >
          <el-table-column align="center" label="序号" width="100px">
            <template slot-scope="scope">{{ (currentPage-1) * pageSize + scope.$index + 1 }}</template>
          </el-table-column>

          <el-table-column prop="id" align="center" label="ID" width="200px"></el-table-column>
          <el-table-column prop="name" align="center" label="名称"></el-table-column>
					<el-table-column prop="catalog1Id" align="center" label="一级分类ID"></el-table-column>
          <el-table-column align="center" label="操作" width="350px">
            <template slot-scope="scope">
              <el-button
                @click="viewCatalog(scope.row)"
                style="width:80px;"
                icon="el-icon-search"
                size="small"
              >查看</el-button>
							<el-button
                @click="editCatalog(scope.row)"
                style="width:80px;"
                icon="el-icon-edit"
                type="primary"
                size="small"
              >修改</el-button>
							<el-button
                @click="deleteCatalog(scope.$index, scope.row)"
                style="width:80px;"
                icon="el-icon-delete"
                type="danger"
                size="small"
              >删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </template>
     
    </div>
		<!-- 显示三级分类 -->
		<div v-show="catalog == 3">
      <div style="margin-top:40px;text-align:left;">
        
        <el-input size="small" prefix-icon="el-icon-search" v-model="search" style="width:300px" placeholder="请输入搜索关键字"></el-input>
        <el-button
          style="width:120px;"
          size="small"
          @click="addName"
          type="primary"
          icon="el-icon-plus"
        >添加三级分类</el-button>
				<el-button
          style="width:120px;float:right;"
          size="small"
          @click="back"
        >返回</el-button>
      </div>

      <template>
        <el-table
          v-loading="loading"
          element-loading-text="数据正在加载..."
          element-loading-background="rgba(f, f, f, 0.8)"
          :data="catalog3List.filter(data => !search || data.name.toLowerCase().includes(search.toLowerCase())).slice((currentPage-1)*pageSize,currentPage*pageSize)"
          style="width: 100%;top:20px;"
          :border="true"
        >
          <el-table-column align="center" label="序号" width="100px">
            <template slot-scope="scope">{{ (currentPage-1) * pageSize + scope.$index + 1 }}</template>
          </el-table-column>

          <el-table-column prop="id" align="center" label="ID" width="200px"></el-table-column>
          <el-table-column prop="name" align="center" label="名称"></el-table-column>
					<el-table-column prop="catalog2Id" align="center" label="二级分类ID"></el-table-column>
          <el-table-column align="center" label="操作" width="350px">
            <template slot-scope="scope">
							<el-button
                @click="editCatalog(scope.row)"
                style="width:80px;"
                icon="el-icon-edit"
                type="primary"
                size="small"
              >修改</el-button>
							<el-button
                @click="deleteCatalog(scope.$index, scope.row)"
                style="width:80px;"
                icon="el-icon-delete"
                type="danger"
                size="small"
              >删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </template>
    </div>

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
		<el-dialog :title="title" :visible.sync="dialogFormVisible" width="30%">
			<el-form :model="catalogForm">
				<el-form-item label="分类名称" :label-width="formLabelWidth">
					<el-input v-model="catalogForm.name" placeholder="请输入名称" ></el-input>
				</el-form-item>
			</el-form>
			<div slot="footer" class="dialog-footer">
				<el-button @click="dialogFormVisible = false">取 消</el-button>
				<el-button type="primary" @click="saveName">确 定</el-button>
			</div>
		</el-dialog>
    
  </div>
</template>

<script scoped>
export default {
  data() {
    return {
      catalog1List: [],
      catalog2List: [],
      catalog3List: [],
      catalog: 1,
      search: '',
      currentPage: 1,
      pageSize: 5,
			total: 0,
			dialogFormVisible: false,
			formLabelWidth: '80px',
			title: '添加分类',
			catalogForm: {
				id: '',
				name: ''
			},
			ccatalog1Id: '',
			ccatalog2Id: '',
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
		addName(){
			this.dialogFormVisible = true
			this.title = "添加分类名称"
			this.catalogForm = {
				id: '',
				name: ''
			}
		},
		saveName(){

			console.log(this.catalogForm)
			if(this.catalog == 2){
				if(this.catalogForm.id == ''){
					this.catalogForm.catalog1Id = this.catalog1Id;
				}
				
			}else if(this.catalog == 3){
				if(this.catalogForm.id == ''){
					this.catalogForm.catalog2Id = this.catalog2Id;
				}
				
			}
			this.dialogFormVisible = false
			this.axios.post('/saveCatalog' + this.catalog, this.catalogForm).then(data => {
				
				if(data.data != ""){
					if(this.catalog == 1){
						if(this.catalogForm.id == ''){
							this.catalogForm.id = data.data
							this.catalog1List.push(this.catalogForm)
							this.total++
						}else{
							// console.log(this.catalog1List[this.index])
							// this.catalog1List[this.index].name = this.catalogForm.name
						}
						
					}else if(this.catalog == 2){
						if(this.catalogForm.id == ''){
							this.catalogForm.id = data.data
							this.catalog2List.push(this.catalogForm)
							this.total++
						}else{
							// console.log(this.catalog2List[this.index])
							// this.catalog2List[this.index].name = this.catalogForm.name
						}
						
					}else{
						if(this.catalogForm.id == ''){
							this.catalogForm.id = data.data
							this.catalog3List.push(this.catalogForm)
							this.total++
						}else{
							//console.log(this.catalog3List[this.index])
							//this.catalog3List[this.index].name = this.catalogForm.name
						}
						
					}
					this.$message({
						type: 'success',
						message: this.title + '成功!'
					})
				}else{
					this.$message.error(this.title + '失败');
				}
			})
		},
    viewCatalog(data) {
			
			if(this.catalog == 1){
				this.catalog1Id = data.id
				this.catalog = 2
				  var params = new URLSearchParams()
					params.append('catalog1Id', data.id)
					this.axios.post('/getCatalog2', params).then(data => {
						this.catalog2List = data.data
						this.currentPage = 1
						this.total = data.data.length
					})
			}else{
				this.catalog2Id = data.id
				this.catalog = 3
				var params = new URLSearchParams()
				params.append('catalog2Id', data.id)
				this.axios.post('/getCatalog3', params).then(data => {
					this.catalog3List = data.data
					this.currentPage = 1
					this.total = data.data.length
				})
			}
     
    },
   
    editCatalog(data) {
			console.log(data)
			this.title = "修改分类名称"
			this.dialogFormVisible = true
			this.catalogForm = data
		
    },
    deleteCatalog(index,data) {
		
			index = (this.currentPage - 1) * this.pageSize + index
				console.log(index)
			this.$confirm('此操作将永久删除, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
      }).then(() => {
				var params = new URLSearchParams()
				params.append('id', data.id)

				this.axios.post('/deleteCatalog' + this.catalog, params).then(data => {
						if(data.data == 1){
							if(this.catalog == 1){
								this.catalog1List.splice(index, 1)
							}else if(this.catalog == 2){
								this.catalog2List.splice(index, 1)
							}else{
								this.catalog3List.splice(index, 1)
							}
							this.$message({
								type: 'success',
								message: '删除成功!'
							})
						}else{
							this.$message.error('删除失败');
						}
						
					})
			}).catch(() => {
				this.$message({
					type: 'info',
					message: '已取消删除'
				})      
			})
    },
    back() {
      if(this.catalog == 2){
				this.catalog = 1
				this.currentPage = 1
				this.total = this.catalog1List.length
			}else{
				this.catalog = 2
				this.currentPage = 1
				this.total = this.catalog2List.length
			}
    },
 
  },
  created() {
    //获取一级分类列表
    this.axios.post('/getCatalog1').then(data => {
      this.catalog1List = data.data
      this.loading = false
      this.total = data.data.length
    })
  }
}
</script>
<style scoped>


.catalog {
  float: left;
  margin-left: 1%;
}


.block{
	position: absolute;
	margin-top: 50px;
	margin-bottom: 20px;
}
</style>
