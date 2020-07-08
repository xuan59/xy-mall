<template>
  <div>
    <div style="margin-bottom:20px;">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>商品管理</el-breadcrumb-item>
        <el-breadcrumb-item>筛选属性</el-breadcrumb-item>
      </el-breadcrumb>
    </div>

    <div style=" width:100%;height:40px;">
      <!-- 选择分类属性 -->
      <div class="catalog">
        <el-dropdown @command="getCatalog2" trigger="click">
          <el-button v-model="catalog1Value">
            {{ catalog1Value }}
            <i class="el-icon-arrow-down el-icon--right"></i>
          </el-button>
          <el-dropdown-menu slot="dropdown" v-if="this.catalog1List.length>0">
            <el-dropdown-item
              v-for="catalog1 in this.catalog1List"
              :key="catalog1.name"
              v-text="catalog1.name"
              :command="catalog1"
            ></el-dropdown-item>
          </el-dropdown-menu>
          <el-dropdown-menu slot="dropdown" v-if="this.catalog1List.length==0">
            <el-dropdown-item disabled>无数据</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
      <div class="catalog">
        <el-dropdown @command="getCatalog3" trigger="click">
          <el-button v-model="catalog2Value">
            {{ catalog2Value }}
            <i class="el-icon-arrow-down el-icon--right"></i>
          </el-button>
          <el-dropdown-menu slot="dropdown" v-if="this.catalog2List.length>0">
            <el-dropdown-item
              v-for="catalog2 in this.catalog2List"
              :key="catalog2.name"
              v-text="catalog2.name"
              :command="catalog2"
            ></el-dropdown-item>
          </el-dropdown-menu>
          <el-dropdown-menu slot="dropdown" v-if="this.catalog2List.length==0">
            <el-dropdown-item disabled>无数据</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
      <div class="catalog">
        <el-dropdown @command="getAttribute" trigger="click">
          <el-button v-model="catalog3Value">
            {{ catalog3Value }}
            <i class="el-icon-arrow-down el-icon--right"></i>
          </el-button>
          <el-dropdown-menu slot="dropdown" v-if="this.catalog3List.length>0">
            <el-dropdown-item
              v-for="catalog3 in this.catalog3List"
              :key="catalog3.name"
              v-text="catalog3.name"
              :command="catalog3"
            ></el-dropdown-item>
          </el-dropdown-menu>
          <el-dropdown-menu slot="dropdown" v-if="this.catalog3List.length==0">
            <el-dropdown-item disabled>无数据</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>

    <!-- 根据三级分类属性展示筛选平台属性 -->
    <div v-show="catalog3Value!='三级分类' && isAttribute">
      <div style="margin-top:40px;text-align:left;height:40px;line-height: 40px">
        <el-button
          @click="isAttributeUpdate"
          style="width:120px;"
          size="small"
          type="primary"
          icon="el-icon-plus"
        >添加属性</el-button>
      </div>
      <template>
        <el-table
          v-loading="loading"
          element-loading-text="数据正在拼命的赶..."
          element-loading-background="rgba(f, f, f, 0.8)"
          :data="attributeList"
          style="width: 100%;top:20px;"
          :border="true"
        >
          <el-table-column align="center" label="序号">
            <template slot-scope="scope">{{ scope.$index+1 }}</template>
          </el-table-column>

          <el-table-column align="center" prop="id" label="ID"></el-table-column>
          <el-table-column align="center" prop="attributeName" label="名称"></el-table-column>
          <el-table-column align="center" label="操作">
            <template slot-scope="scope">
              <el-button
                @click="getAttributeValue(scope.row)"
                style="width:100px;"
                icon="el-icon-edit"
                size="small"
              >修改</el-button>
            </template>
          </el-table-column>
        </el-table>
      </template>
    </div>

    <!-- 修改筛选平台属性值 -->
    <div v-show="!isAttribute">
      <div style="margin-top:40px;text-align:left;">
        <span>属性名称：</span>
        <el-input size="small" v-model="attributeName" style="width:200px" placeholder="请输入内容"></el-input>
        <el-button
          style="width:120px;"
          size="small"
          @click="addAttributeValue"
          type="primary"
          icon="el-icon-plus"
        >添加属性值</el-button>
      </div>

      <template>
        <el-table
          v-loading="loading"
          element-loading-text="数据正在拼命的赶..."
          element-loading-background="rgba(f, f, f, 0.8)"
          :data="attributeValueList"
          style="width: 100%;top:20px;"
          :border="true"
        >
          <el-table-column align="center" label="序号">
            <template slot-scope="scope">{{ scope.$index+1 }}</template>
          </el-table-column>

          <el-table-column prop="id" align="center" label="ID"></el-table-column>
          <el-table-column align="center" label="名称">
            <template slot-scope="scope">
              <div
                width="100%"
                style="padding:6px"
                @click="isEditUpdate(scope.row)"
                v-if="scope.row.isEdit==false"
              >{{ scope.row.valueName }}</div>
              <el-input
                @blur="isEditUpdate(scope.row)"
                v-if="scope.row.isEdit==true"
                v-model="scope.row.valueName"
                type="text"
                size="medium"
              ></el-input>
            </template>
          </el-table-column>
          <el-table-column align="center" label="操作">
            <template slot-scope="scope">
              <el-button
                @click="delAttributeValue(scope.$index)"
                style="width:100px;"
                icon="el-icon-delete"
                type="danger"
                size="small"
              >删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </template>
      <div style="margin-top:40px;">
        <el-button type="primary" size="medium" @click="saveAttributeValue">保存</el-button>
        <el-button size="medium" @click="isAttributeUpdate">返回</el-button>
      </div>
    </div>
  </div>
</template>

<script scoped>
export default {
  data() {
    return {
      catalog1List: [],
      catalog2List: [],
      catalog3List: [],
      catalog1Value: '一级分类',
      catalog2Value: '二级分类',
      catalog3Value: '三级分类',
      catalog3Id: '',
      attributeList: [],
      attributeValueList: [],
      loading: true,
      // isEdit: false,
      isAttribute: true,
      attributeName: '',
      id: ''
    }
  },
  methods: {
    getCatalog2(command) {
      this.catalog1Value = command.name
      this.catalog2Value = '二级分类'
      this.catalog3Value = '三级分类'
      this.catalog3List = []
      //根据一级分类id获取二级分类属性
      var params = new URLSearchParams()
      params.append('catalog1Id', command.id)
      this.axios.post('/getCatalog2', params).then(data => {
        this.catalog2List = data.data
      })
    },
    getCatalog3(command) {
      this.catalog2Value = command.name
      this.catalog3Value = '三级分类'
      //根据二级分类id获取三级分类属性
      var params = new URLSearchParams()
      params.append('catalog2Id', command.id)
      this.axios.post('/getCatalog3', params).then(data => {
        this.catalog3List = data.data
      })
    },
    getAttribute(command) {
      this.catalog3Value = command.name
      //根据三级级分类id获取分类属性
      var params = new URLSearchParams()
      params.append('catalog3Id', command.id)
      this.axios.post('/attrInfoList', params).then(data => {
        this.attributeList = data.data
        this.loading = false
        this.isAttribute = true
        this.catalog3Id = command.id
      })
    },
    getAttributeValue(attr) {
      //根据分类属性id获取分类属性值
      var params = new URLSearchParams()
      params.append('attrId', attr.id)
      this.axios.post('/getAttrValueList', params).then(data => {
        // this.attributeValueList = data.data
        for (var i = 0; i < data.data.length; i++) {
          data.data[i]['isEdit'] = false
          this.attributeValueList.push(data.data[i])
        }
        console.log(this.this.attributeValueList)
        this.loading = false
        this.isAttribute = false
        this.attributeName = attr.attributeName
        this.id = attr.id
      })
    },
    addAttributeValue() {
      this.attributeValueList.push({
        id: '',
        attributeId: this.id,
        isEdit: true
      })
    },
    delAttributeValue(index) {
      this.attributeValueList.splice(index, 1)
    },
    isAttributeUpdate() {
      this.id = ''
      this.attributeName = ''
      this.attributeValueList = []
      this.isAttribute = !this.isAttribute
    },
    isEditUpdate(row) {
      console.log(row)
      row.isEdit = !row.isEdit
    },
    saveAttributeValue() {
      this.attributeValueList.forEach(attributeValue => {
        delete attributeValue['isEdit']
      })

      var i = 0
      if (this.id === '') {
        for (i = 0; i < this.attributeList.length; i++) {
          if (this.attributeList[i].attributeName === this.attributeName) {
            this.$confirm(
              '该属性名称已存在, 是否添加至已存在的属性名称中?',
              '提示',
              {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning',
             
              }
            )
              .then(() => {
                // 保存数据
                this.id = this.attributeList[i].id
                var params = new URLSearchParams()
                params.append('id', this.id)
                params.append('catalog3Id', this.catalog3Id)
                params.append('attributeName', this.attributeName)
                params.append(
                  'attributeValueList',
                  JSON.stringify(this.attributeValueList)
                )
                this.axios.post('/saveAttribute', params).then(data => {
                  if (data.data.status === '1') {
                    this.isAttributeUpdate()
                    this.$message({
                      message: '恭喜你，保存成功',
                      type: 'success'
                    })
                  } else {
                    this.$message.error('错了哦，保存失败，请重试')
                  }
                })
              })
              .catch(() => {
                this.$message({
                  type: 'info',
                  message: '已取消保存'
                })
                return
              })
            return
          }
        }
      } else {
        for (var i = 0; i < this.attributeList.length; i++) {
          if (this.attributeList[i].id === this.id) {
            this.attributeList[i].attributeName = this.attributeName
            break
          }
        }
      }

      var params = new URLSearchParams()
      params.append('id', this.id)
      params.append('catalog3Id', this.catalog3Id)
      params.append('attributeName', this.attributeName)
      params.append(
        'attributeValueList',
        JSON.stringify(this.attributeValueList)
      )
      this.axios.post('/saveAttribute', params).then(data => {
        if (data.data.status === '1') {
          if (i >= this.attributeList.length) {
            this.attributeList.push({
              id: data.data.attributeId,
              attributeName: this.attributeName,
              catalog3Id: this.catalog3Id
            })
          }
          this.$message({
            message: '恭喜你，保存成功',
            type: 'success'
          })
          this.isAttributeUpdate()
        } else {
          this.$message.error('错了哦，保存失败，请重试')
        }
      })

    }
  },
  created() {
    //获取一级分类列表
    this.axios.post('/getCatalog1').then(data => {
      this.catalog1List = data.data
    })
  }
}
</script>
<style scoped>
.el-icon-arrow-down {
  font-size: 12px;
}
.el-button,
.el-dropdown-menu {
  width: 200px;
}
.catalog {
  float: left;
  margin-left: 1%;
}
.el-dropdown-menu,
.el-popper {
  max-height: 30%;
  overflow: scroll;
  overflow-x: hidden;
}
.el-message-box__btns > button {
  width: 80px;
}
</style>
