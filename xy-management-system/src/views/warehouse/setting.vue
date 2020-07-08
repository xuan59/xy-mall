<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>仓库管理</el-breadcrumb-item>
      <el-breadcrumb-item>仓库设置</el-breadcrumb-item>
    </el-breadcrumb>
    <div style="margin:20px 0 10px 0;text-align:left;">
      <el-button type="primary" @click="add">添加仓库</el-button>
      <el-input
        style="float:right;width:400px;"
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
      <el-table-column label="序号" align="center">
        <template slot-scope="scope">{{scope.$index + 1}}</template>
      </el-table-column>
      <el-table-column label="仓库名称" prop="warehouseName" sortable align="center"></el-table-column>
      <el-table-column label="仓库地址" prop="address" sortable align="center"></el-table-column>
      <el-table-column label="仓库编号" prop="warehouseCode" sortable align="center"></el-table-column>
      <el-table-column label="操作" align="center">
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
        :model="warehouseForm"
        :rules="rules"
        ref="warehouseForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="仓库名称" prop="warehouseName">
          <el-input v-model="warehouseForm.warehouseName" placeholder="请输入名称"></el-input>
        </el-form-item>
        <el-form-item label="仓库地址" prop="address">
          <el-input v-model="warehouseForm.address" @focus="address" placeholder="请选择地址"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveWarehouse('warehouseForm')">确 定</el-button>
      </span>
    </el-dialog>
    <el-dialog title="选择仓库地址" :visible.sync="addressDialog" width="50%" top="30px">
      <el-input v-model="addressKeyword" placeholder="请输入地址来直接查找相关位置"></el-input>
      <!-- 给地图加点击事件getLocationPoint，点击地图获取位置相关的信息，经纬度啥的 -->
      <!-- scroll-wheel-zoom：是否可以用鼠标滚轮控制地图缩放，zoom是视图比例 -->
      <baidu-map
        class="bmView"
        :scroll-wheel-zoom="true"
        :center="location"
        :zoom="zoom"
        @click="getLocationPoint"
        ak="51q5L9eZzEeQf03rB4RvGtGKhdNG4lpp"
      >
        <bm-view style="width: 100%; height:400px; flex: 1"></bm-view>
        <bm-local-search :keyword="addressKeyword" :auto-viewport="true" style="display: none"></bm-local-search>
      </baidu-map>
      <span slot="footer" class="dialog-footer">
        <el-button @click="addressDialog = false">取 消</el-button>
        <el-button type="primary" @click="saveAddress">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
//百度地图
import BaiduMap from 'vue-baidu-map/components/map/Map.vue'
import BmView from 'vue-baidu-map/components/map/MapView.vue'
import BmLocalSearch from 'vue-baidu-map/components/search/LocalSearch.vue'

export default {
  components: {
    BaiduMap,
    BmView,
    BmLocalSearch
  },
  data() {
    return {
      tableData: [],
      tableData1: [],
      search: '',
      dialogVisible: false,
      addressDialog: false,
      loading: true,
      currentPage: 1,
      pageSize: 5,
      total: 0,
      title: '',
      warehouseForm: {
        id: '',
        warehouseName: '',
        address: '',
        warehouseCode: ''
      },
      rules: {
        warehouseName: [
          { required: true, message: '请输入仓库名称', trigger: 'blur' }
          // { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' }
        ],
        address: [
          { required: true, message: '请选择仓库地址', trigger: 'focus' }
          // { min: 3, max: 5, message: '长度在 1 到 5 个字符', trigger: 'blur' }
        ]
      },
      location: {
        lng: 106.55,
        lat: 29.55
      },
      zoom: 12.8,
      addressKeyword: '',
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
      this.title = '添加仓库'
      this.dialogVisible = true
      this.warehouseForm = {
        id: '',
        warehouseName: '',
        address: '',
        warehouseCode: ''
      }
    },
    edit(index, row) {
      this.title = '编辑仓库'
      this.dialogVisible = true
      var str = JSON.stringify(row)
      this.warehouseForm = JSON.parse(str)
      this.row = row
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
          this.axios.post('/deleteWarehouseInfo', params).then(data => {
            console.log(data)
            if (data.data != null && data.data != '') {
              this.tableData.push(this.warehouseForm)
              this.$message({
                type: 'success',
                message: '删除成功!'
              })
              this.tableData.splice(index, 1)
              this.searchValue()
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
          !this.search ||data.warehouseName.toLowerCase().includes(this.search.toLowerCase())||
          !this.search ||data.address.toLowerCase().includes(this.search.toLowerCase())||
          !this.search ||data.warehouseCode.toLowerCase().includes(this.search.toLowerCase())
      )
      this.total = this.tableData1.length
    },
    address() {
      this.addressDialog = true
      
    },
    getLocationPoint(e) {
      this.lng = e.point.lng
      this.lat = e.point.lat
      /* 创建地址解析器的实例 */
      let geoCoder = new BMap.Geocoder()
      /* 获取位置对应的坐标 */
      geoCoder.getPoint(this.addressKeyword, point => {
        this.selectedLng = point.lng
        this.selectedLat = point.lat
      })
      /* 利用坐标获取地址的详细信息 */
      geoCoder.getLocation(e.point, res => {
        this.addressKeyword = res.address
      })
    },
    saveAddress() {
      this.addressDialog = false
      this.warehouseForm.address = this.addressKeyword
    },
    saveWarehouse(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          console.log(this.warehouseForm)
          this.axios
            .post('/saveWarehouseInfo', this.warehouseForm)
            .then(data => {
              console.log(data)
              if (data.data != null && data.data != '') {
                if(this.warehouseForm.id == ''){
                  this.tableData.push(this.warehouseForm)
                  this.searchValue()
                }else{
                  this.row = this.warehouseForm
                }
                
                this.$message({
                  type: 'success',
                  message: '保存成功!'
                })
                this.dialogVisible = false

              }
            })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    }
  },
  created() {
    this.axios.post('/getAllWarehouseInfo').then(data => {
      this.tableData = data.data
      this.total = this.tableData.length
      var data = JSON.stringify(this.tableData)
      this.tableData1 = JSON.parse(data)
      this.loading = false
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
::-webkit-scrollbar {
  width: 0 !important;
}
::-webkit-scrollbar {
  width: 0 !important;height: 0;
}
</style>