<template>
  <div>
    <div style="margin-bottom:20px;">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>商品管理</el-breadcrumb-item>
        <el-breadcrumb-item>SPU商品</el-breadcrumb-item>
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
        <el-dropdown @command="getSpuList" trigger="click">
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

    <!-- 根据三级分类属性展示SPU平台属性 -->
    <div v-show="catalog3Value!='三级分类' && isSPU">
      <div style="margin-top:40px;text-align:left;height:40px;line-height: 40px">
        <el-button
          @click="addSaleAttribute"
          style="width:120px;"
          size="small"
          type="primary"
          icon="el-icon-plus"
        >添加SPU</el-button>
        <el-button
          @click="delSpu()"
          style="width:120px;"
          icon="el-icon-delete"
          type="danger"
          size="small"
        >删除</el-button>
      </div>
      <template>
        <el-table
          v-loading="loading"
          element-loading-text="数据正在路上中......"
          element-loading-background="rgba(f, f, f, 0.8)"
          :data="spuList"
          style="width: 100%;top:20px;"
          :border="true"
          @selection-change="handleSelectionChange"
        >
          <el-table-column type="selection" width="50" align="center"></el-table-column>
          <el-table-column align="center" label="序号">
            <template slot-scope="scope">{{ scope.$index+1 }}</template>
          </el-table-column>
          <el-table-column align="center" prop="id" label="商品ID"></el-table-column>
          <el-table-column align="center" prop="spuName" label="商品名称"></el-table-column>
          <el-table-column align="center" prop="description" label="商品描述"></el-table-column>
          <el-table-column align="center" label="操作">
            <template slot-scope="scope">
              <el-button
                @click="getSaleAttributeValue(scope.row)"
                style="width:80px;"
                icon="el-icon-edit"
                size="small"
              >编辑</el-button>
              <el-button
                @click="getSkuList(scope.row)"
                style="width:100px;"
                type="primary"
                size="small"
              >查看SKU</el-button>
            </template>
          </el-table-column>
        </el-table>
      </template>
    </div>

    <!-- 编辑SPU平台属性值 -->
    <div v-if="!isSPU && isSKU===false && isAddSku===false">
      <div style="margin-top:40px;text-align:left;">
        <span style="float:left;">商品名称：</span>
        <el-input size="medium" v-model="spuName" style="width:90%" placeholder="请输入内容"></el-input>
      </div>
      <div style="margin-top:40px;text-align:left;">
        <span style="float:left;">商品描述：</span>
        <el-input v-model="description" style="width:90%;" placeholder="请输入内容" type="textarea"></el-input>
      </div>
      <div style="margin-top:40px;text-align:left;">
        <span style="float:left;">上传图片：</span>
        <el-upload
          action="http://localhost:8081/fileUpload"
          list-type="picture-card"
          :multiple="true"
          :file-list="imgList"
          :before-upload="beforeUpload"
          :on-preview="handlePictureCardPreview"
          :on-success="addImgToList"
          :on-remove="handleRemove"
        >
          <i class="el-icon-plus"></i>
          <div slot="tip" class="el-upload__tip">只能上传jpg/png/gif文件，且不超过2MB</div>
        </el-upload>
        <el-dialog :visible.sync="dialogVisible">
          <img width="100%" :src="dialogImageUrl" alt />
        </el-dialog>
      </div>

      <div style="margin-top:40px;text-align:left;">
        <el-button
          style="width:150px;"
          size="small"
          @click="addSaleAttributeValue"
          type="primary"
          icon="el-icon-plus"
        >添加销售属性</el-button>
        <el-button style="width:200px;" size="small" @click="addSaleAttributeName">没有销售属性名称怎么办？</el-button>
      </div>

      <template>
        <el-table
          v-loading="loading"
          element-loading-text="数据正在路上中......"
          element-loading-background="rgba(f, f, f, 0.8)"
          :data="saleAttributeList"
          style="width: 100%;top:20px;"
          :border="true"
        >
          <el-table-column align="center" label="序号">
            <template slot-scope="scope">{{ scope.$index+1 }}</template>
          </el-table-column>

          <el-table-column prop="id" align="center" label="销售属性ID"></el-table-column>
          <el-table-column align="center" label="销售属性名称">
            <template slot-scope="scope">
              <el-select
                v-model="saleAttributeList[scope.$index].saleAttributeName"
                filterable
                placeholder="请选择属性"
                @change="removeSaleAttribute(scope.$index,saleAttributeList[scope.$index].saleAttributeName)"
              >
                <el-option
                  v-for="item in saleAttributeValueList"
                  :key="item.name"
                  :label="item.name"
                  :value="item.name"
                ></el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column align="center" label="销售属性值">
            <template slot-scope="scope">
              <!-- <el-button @click="log(scope.row.goodsSpuSaleAttributeValueList)">输出</el-button> -->
              <el-tag
                v-for="(tagValue, index) in scope.row.goodsSpuSaleAttributeValueList"
                closable
                :key="tagValue.saleAttributeValueName"
                :disable-transitions="false"
                @close="handleClose(index, scope.row.goodsSpuSaleAttributeValueList)"
              >{{tagValue.saleAttributeValueName}}</el-tag>
              <el-input
                ref="saveTagInput"
                class="input-new-tag"
                v-if="saleAttributeList[scope.$index].inputVisible"
                v-model="inputValue"
                size="small"
                @keyup.enter.native="handleInputConfirm(scope)"
                @blur="handleInputConfirm(scope)"
              ></el-input>
              <el-button
                v-else
                class="button-new-tag"
                style="width:80px;padding:0px;"
                size="small"
                @click="showInput(scope)"
              >+ 添加</el-button>
            </template>
          </el-table-column>
          <el-table-column align="center" label="操作">
            <template slot-scope="scope">
              <el-button
                @click="delSpuSaleAttribute(scope.$index)"
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
        <el-button type="primary" size="medium" @click="saveSaleAttributeValue">保存</el-button>
        <el-button size="medium" @click="isSpu()">返回</el-button>
      </div>
    </div>

    <!-- SKU列表 -->
    <div v-else-if="isSKU">
      <div
        style="float:left;margin-top:40px;text-align:left;height:40px;width:300px;line-height: 40px"
      >
        <el-button
          @click="addSku()"
          style="width:120px;"
          size="small"
          type="primary"
          icon="el-icon-plus"
        >添加SKU</el-button>
        <el-button
          @click="delSku()"
          style="width:120px;"
          size="small"
          type="danger"
          icon="el-icon-delete"
        >删除</el-button>
      </div>
      <div
        style="float:right;margin-top:40px;text-align:right;height:40px;line-height: 40px;width:120px;"
      >
        <el-button @click="isShowSku()" style="width:120px;" size="small">返回</el-button>
      </div>
      <template>
        <el-table
          v-loading="loading"
          element-loading-text="数据正在路上中......"
          element-loading-background="rgba(f, f, f, 0.8)"
          :data="skuList"
          style="width: 100%;top:20px;"
          :border="true"
          @selection-change="handleSelectionChange"
        >
          <el-table-column type="selection" width="50" align="center"></el-table-column>
          <el-table-column align="center" width="100" label="序号">
            <template slot-scope="scope">{{ scope.$index+1 }}</template>
          </el-table-column>
          <el-table-column align="center" prop="skuName" label="商品名称"></el-table-column>
          <el-table-column align="center" prop="price" width="100" label="价格"></el-table-column>
          <el-table-column align="center" prop="weight" width="80" label="重量"></el-table-column>
          <el-table-column align="center" prop="skuDescribe" label="商品描述"></el-table-column>
          <el-table-column align="center" width="200" label="操作">
            <template slot-scope="scope">
              <el-button
                @click="getSku(scope.row)"
                style="width:80px;"
                icon="el-icon-edit"
                size="small"
              >编辑</el-button>
            </template>
          </el-table-column>
        </el-table>
      </template>
    </div>

    <!-- 编辑SKU -->
    <div 
      v-loading="loading"
      element-loading-text="数据正在路上中......"
      element-loading-background="rgba(f, f, f, 0.8)"
      v-else-if="isAddSku">
      <div style="margin-top:40px;text-align:right;">
        <span style="float:left;">SPU名称：</span>
        <el-input size="medium" v-model="spuName" style="width:85%" :disabled="true"></el-input>
      </div>
      <div style="margin-top:40px;text-align:right;">
        <span style="float:left;">SKU名称：</span>
        <el-input size="medium" v-model="sku.skuName" style="width:85%" placeholder="请输入名称"></el-input>
      </div>
      <div style="margin-top:40px;text-align:right;">
        <span style="float:left;">商品价格：</span>
        <el-input size="medium" v-model="sku.price" style="width:85%" placeholder="请输入价格"></el-input>
      </div>
      <div style="margin-top:40px;text-align:right;">
        <span style="float:left;">商品重量（千克）：</span>
        <el-input size="medium" v-model="sku.weight" style="width:85%" placeholder="请输入重量"></el-input>
      </div>
      <div style="margin-top:40px;text-align:right;">
        <span style="float:left;">商品描述：</span>
        <el-input v-model="sku.skuDescribe" style="width:85%;" placeholder="请输入内容" type="textarea"></el-input>
      </div>
      <div style="float:left;margin-top:30px;text-align:left;">参数列表：</div>
      <div style="float:left;margin-top:10px;text-align:left;">
        <el-dropdown
          @command="saveAttribute"
          trigger="click"
          v-for="(attribute, index) in attributeList"
          :key="attribute.attributeName"
        >
          <el-button style="margin:10px;">
            {{ skuAttributeValue[index].attributeName }}
            <i
              class="el-icon-arrow-down el-icon--right"
            ></i>
          </el-button>
          <el-dropdown-menu slot="dropdown" style="margin: 0px;">
            <el-dropdown-item
              v-for="value in attribute.goodsAttributeValueList"
              :key="value.valueName"
              :command="{index:index,value:value}"
              v-text="value.valueName"
            ></el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>

      <div style="float:left;margin-top:30px;text-align:left;width:100%;">销售属性：</div>
      <div style="float:left;margin-top:10px;text-align:left;">
        <el-dropdown
          @command="saveSaleAttribute"
          trigger="click"
          v-for="(saleAttribute, index) in saleAttributeList"
          :key="saleAttribute.saleAttributeName"
        >
          <el-button style="margin:10px;width:300px;">
            {{ skuSaleAttributeValue[index].saleAttributeValueName }}
            <i
              class="el-icon-arrow-down el-icon--right"
            ></i>
          </el-button>
          <el-dropdown-menu slot="dropdown" style="margin: 0px;width:300px;">
            <el-dropdown-item
              v-for="value in saleAttribute.goodsSpuSaleAttributeValueList"
              :key="value.saleAttributeValueName"
              :command="{index:index,value:value}"
              v-text="value.saleAttributeValueName"
            ></el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
      <div>
        <el-table
          v-loading="loading"
          element-loading-text="数据正在路上中......"
          element-loading-background="rgba(f, f, f, 0.8)"
          :data="skuImgList"
          style="width: 100%;top:20px;"
          :border="true"
          @selection-change="handleSelectionChange"
        >
          <el-table-column type="selection" v-if="skuId==''" width="80" align="center"></el-table-column>
          <el-table-column align="center"  label="序号">
            <template slot-scope="scope">{{ scope.$index + 1 }}</template>
          </el-table-column>
          <el-table-column align="center" label="图片">
            <template slot-scope="scope">
              <img :src="scope.row.imgUrl" :alt="scope.row.imgName" style="width:100px;" />
            </template>
          </el-table-column>
          <el-table-column prop="imgName" align="center" label="图片名称"></el-table-column>
          <el-table-column align="center" label="操作">
            <template slot-scope="scope">
              <el-button
                v-if="scope.row.isDefault === 1"
                class="button-new-tag"
                style="width:80px;padding:0px;"
                size="small"
                type="success"
                @click="cancelImg()"
              >默认图片</el-button>
              <el-button
                v-else
                class="button-new-tag"
                style="width:80px;padding:0px;"
                size="small"
                @click="defauleImg(scope)"
              >设为默认</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <div style="margin-top:40px;">
        <el-button type="primary" size="medium" @click="saveSku">保存</el-button>
        <el-button size="medium" @click="isShowAddSku">返回</el-button>
      </div>
    </div>
  </div>
</template>

<script>
import Cookies from 'js-cookie'
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
      spuList: [],
      saleAttributeList: [],
      loading: true,
      isSPU: true,
      spuName: '',
      description: '',
      spuid: '',
      saleAttributeValueList: [],
      inputValue: '',
      saleAttributeId: '',
      multipleSelection: [],
      dialogImageUrl: '',
      dialogVisible: false,
      spuImgList: [],
      imgList: [],
      isSKU: false,
      isAddSku: false,
      skuList: [],
      sku: {},
      skuImgList: [],
      selectionIndex: -1,
      skuId: '',
      attributeList: [],
      skuAttributeValue: [], //参数列表
      skuSaleAttributeValue: [] //销售属性
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
    getSpuList(command) {
      this.catalog3Value = command.name
      //根据三级级分类id获取SPU列表
      var params = new URLSearchParams()
      params.append('catalog3Id', command.id)
      this.axios.post('/spuList', params).then(data => {
        this.catalog3Id = command.id
        this.spuList = data.data
        this.loading = false
        this.isSPU = true
        this.isSKU = false
        this.isAddSku = false
      })
    },
    getSaleAttributeValue(spu) {
      //根据分类属性id获取分类属性值
      var params = new URLSearchParams()
      params.append('spuId', spu.id)
      this.axios.post('/spuSaleAttrList', params).then(data => {
        this.saleAttributeList = []
        data.data.forEach(value => {
          value['inputVisible'] = false
          this.saleAttributeList.push(value)
        })
        this.loading = false
        this.isSPU = false
        this.spuName = spu.spuName
        this.description = spu.description
        this.spuid = spu.id
        this.getSaleAttribute()
        this.getImgList()
      })
    },
    getImgList() {
      var params = new URLSearchParams()
      params.append('spuId', this.spuid)
      this.axios.post('/spuImageList', params).then(data => {
        this.imgList = []
        this.skuImgList = []
        this.spuImgList = data.data
        data.data.forEach(img => {
          this.imgList.push({
            name: img.imgName,
            url: img.imgUrl
          })
          this.skuImgList.push({
            id: '',
            skuId: this.skuId,
            imgName: img.imgName,
            imgUrl: img.imgUrl,
            spuImgId: img.id,
            isDefault: 0
          })
        })
      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
      var status = 0
      if (this.selectionIndex != -1) {
        this.multipleSelection.forEach(img => {
          if (img.imgUrl === this.skuImgList[this.selectionIndex].imgUrl) {
            status = 1
          }
        })
        if (status === 0) {
          this.skuImgList[this.selectionIndex].isDefault = 0
          this.selectionIndex = -1
        }
      }
    },
    addSaleAttribute() {
      this.isSpu()
      this.getSaleAttribute()
    },
    removeSaleAttribute(index, saleName) {
      // this.saleAttributeList.forEach(spuSaleValue=>{
      for (var i = 0; i < this.saleAttributeList.length; i++) {
        if (this.saleAttributeList[i].saleAttributeName == saleName) {
          if (index != i) {
            this.$message({
              showClose: true,
              message: saleName + '已存在，请重新选择',
              type: 'error'
            })
            this.saleAttributeList[index].saleAttributeName = ''
          }
        }
      }
      // })
    },
    addSaleAttributeValue() {
      this.saleAttributeList.push({
        id: '',
        spuId: this.spuid,
        saleAttributeId: '',
        saleAttributeName: '',
        inputVisible: false,
        goodsSpuSaleAttributeValueList: []
      })
    },
    delSpuSaleAttribute(index) {
      this.saleAttributeList.splice(index, 1)
    },
    isSpu() {
      this.spuid = ''
      this.spuName = ''
      this.saleAttributeList = []
      this.description = ''
      this.isSPU = !this.isSPU
      this.spuImgList = []
      this.imgList = []
    },
    saleValue(value) {
      this.saleAttributeValue = value.name
    },
    getSaleAttribute() {
      this.axios.post('/baseSaleAttrList').then(data => {
        this.saleAttributeValueList = data.data
      })
    },
    handleClose(index, tagList) {
      tagList.splice(index, 1)
    },
    showInput(scope) {
      scope.row.inputVisible = true
      this.$nextTick(_ => {
        this.$refs.saveTagInput.focus()
      })
    },
    handleInputConfirm(scope) {
      let inputValue = this.inputValue
      if (inputValue) {
        scope.row.goodsSpuSaleAttributeValueList.push({
          id: '',
          spuId: this.spuid,
          saleAttributeId: this.saleAttributeId,
          saleAttributeValueName: inputValue
        })
      }
      scope.row.inputVisible = false
      this.inputValue = ''
    },
    delSpu() {
      this.$confirm('是否删除选中SPU商品信息?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        center: true
      })
        .then(() => {
          // 删除数据
          this.multipleSelection.forEach(spu => {
            this.spuList.splice(this.spuList.indexOf(spu), 1)
          })
          var params = new URLSearchParams()
          params.append('spuList', JSON.stringify(this.multipleSelection))
          this.axios.post('/delSpu', params).then(data => {
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

    saveSaleAttributeValue() {
      this.saleAttributeList.forEach(attributeValue => {
        delete attributeValue['inputVisible']
      })

      var status = 0
      if (this.spuid === '') {
        for (var i = 0; i < this.spuList.length; i++) {
          if (this.spuList[i].spuName === this.spuName) {
            this.spuid = this.spuList[i].id
            this.$confirm('属性名称已存在, 是否添加至存在的名称中?', '提示', {
              confirmButtonText: '确定',
              cancelButtonText: '取消',
              type: 'warning'
              // center: true
            })
              .then(() => {
                // 保存数据
                var params = new URLSearchParams()
                params.append('id', this.spuid)
                params.append('spuName', this.spuName)
                params.append('description', this.description)
                params.append('catalog3Id', this.catalog3Id)
                params.append(
                  'spuSaleAttributeValueList',
                  JSON.stringify(this.saleAttributeList)
                )
                params.append('imgList', JSON.stringify(this.spuImgList))
                this.axios.post('/saveSpu', params).then(data => {
                  if (data.data.status === '1') {
                    this.isSpu()
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
        status = 1
      } else {
        for (var i = 0; i < this.spuList.length; i++) {
          if (this.spuList[i].id === this.spuid) {
            this.spuList[i].spuName = this.spuName
            this.spuList[i].description = this.description
            break
          }
        }
      }

      var params = new URLSearchParams()
      params.append('id', this.spuid)
      params.append('spuName', this.spuName)
      params.append('description', this.description)
      params.append('catalog3Id', this.catalog3Id)
      params.append(
        'spuSaleAttributeValueList',
        JSON.stringify(this.saleAttributeList)
      )
      params.append('imgList', JSON.stringify(this.spuImgList))
      this.axios.post('/saveSpu', params).then(data => {
        if (data.data.status === '1') {
          if (status === 1) {
            this.spuList.push({
              id: data.data.spuId,
              spuName: this.spuName,
              description: this.description,
              catalog3Id: this.catalog3Id
            })
          }
          this.$message({
            message: '恭喜你，保存成功',
            type: 'success'
          })
          this.isSpu()
        } else {
          this.$message.error('错了哦，保存失败，请重试')
        }
      })
    },
    addSaleAttributeName() {
      this.$prompt('请输入名称', '添加销售属性名称', {
        confirmButtonText: '确定',
        cancelButtonText: '取消'
      })
        .then(({ value }) => {
          var params = new URLSearchParams()
          params.append('saleAttributeName', value)
          params.append('loginId', Cookies.get('loginId'))
          this.axios.post('/addSaleAttribute', params).then(data => {
            if (data.data.status === '1') {
              this.saleAttributeValueList.push({
                id: '',
                loginId: '',
                name: value
              })
              this.$message({
                message: '恭喜你，添加成功',
                type: 'success'
              })
            } else {
              this.$message.error(value + '已存在，添加失败，请重试')
            }
          })
        })
        .catch(() => {
          this.$message({
            type: 'info',
            message: '取消添加'
          })
        })
    },
    handleRemove(file, fileList) {
      this.spuImgList.splice(this.spuImgList.indexOf(file), 1)
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url
      this.dialogVisible = true
    },
    addImgToList(response, file, fileList) {
      this.spuImgList.push({
        id: '',
        spuId: this.spuid,
        imgName: file.name,
        imgUrl: file.response
      })
    },
    beforeUpload(file) {
      const isJPG = file.type === 'image/jpeg'
      const isPNG = file.type === 'image/png'
      const isGIF = file.type === 'image/gif'
      const isLt2M = file.size / 1024 / 1024 < 2

      if (!isJPG && !isPNG && !isGIF) {
        this.$message.error('上传头像图片只能是 JPG、PNG 或 GIF 格式!')
        return false
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!')
        return false
      }
      return true
    },
    isShowSku() {
      this.isSKU = !this.isSKU
      this.isSPU = !this.isSPU
      this.isAddSku = false
      this.multipleSelection = []
    },
    getSkuList(spu) {
      var params = new URLSearchParams()
      this.spuName = spu.spuName
      this.spuid = spu.id
      params.append('spuId', spu.id)
      this.axios.post('/skuList', params).then(data => {
        this.skuList = data.data
        this.isShowSku()
      })
    },
    addSku() {
      this.sku = {
        id: '',
        spuId: this.spuid,
        price: '',
        skuName: '',
        skuDescribe: '',
        weight: '',
        brandName: '',
        catalog3Id: this.catalog3Id,
        skuDefaultImg: ''
      }
      this.getImgList()
      this.getAttributeList()
      this.getSpuSaleAttrList()
      this.isSPU = false
      this.isSKU = false
      this.isAddSku = true
      this.skuId = ''
    },
    delSku() {
      this.$confirm('是否删除选中SKU商品信息?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning',
        center: true
      })
        .then(() => {
           // 删除数据
          this.multipleSelection.forEach(sku => {
            this.skuList.splice(this.skuList.indexOf(sku), 1)
          })
          var params = new URLSearchParams()
    
          params.append('skuList', JSON.stringify(this.multipleSelection))
          this.axios.post('/delSku', params).then(data => {
            if (data.data.status != 0) {
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
    isShowAddSku() {
      this.isAddSku = false
      this.isSKU = true
      this.skuId = ''
    },
    async getSku(sku) {
      this.loading = true
      this.skuId = sku.id
      this.multipleSelection = []
      await this.getImgList()
      await this.getAttributeList()
      await this.getSpuSaleAttrList()

      var params = new URLSearchParams()
      params.append("skuId",sku.id)
      await this.axios.post('/getSku', params).then(data=>{
        this.sku = data.data
      
      })
      await this.axios.post('/skuImgList', params).then(data=>{
        this.skuImgList = data.data
        this.multipleSelection = data.data
        for(var i = 0;i<this.skuImgList.length;i++){
          if(this.skuImgList[i].isDefault === 1){
            this.selectionIndex = i
            break
          }
        }
      })
      console.log(this.skuAttributeValue)
      await this.axios.post('/getAttribute', params).then(data=>{
        this.skuAttributeValue.forEach(attributeValue=>{
          for(var i=0;i<data.data.length;i++){
            if(attributeValue.attributeId === data.data[i].attributeId){
              attributeValue.attributeName = data.data[i].attributeName
              attributeValue.valueId = data.data[i].valueId
              attributeValue.id = data.data[i].id
              break
            }
          }
        })
      })
      console.log(this.skuAttributeValue)
      await this.axios.post('/getSaleAttribute', params).then(data=>{
        this.skuSaleAttributeValue.forEach(saleAttributeValue=>{
          for(var i=0;i<data.data.length;i++){
            if(saleAttributeValue.saleAttributeId === data.data[i].saleAttributeId){
              saleAttributeValue.saleAttributeValueName = data.data[i].saleAttributeValueName
              saleAttributeValue.saleAttributeValueId = data.data[i].saleAttributeValueId
              break
            }
          }
        })
      })
 
      this.isSPU = false
      this.isSKU = false
      this.isAddSku = true
      this.loading = false

    },
    getAttributeList() {
      var params = new URLSearchParams()
      params.append('catalog3Id', this.catalog3Id)
      this.axios.post('/attrInfoList', params).then(data => {
        this.skuAttributeValue = []
        data.data.forEach(attriInfo => {
          this.skuAttributeValue.push({
            id: '',
            attributeId: attriInfo.id,
            valueId: '',
            skuId: this.skuId,
            attributeName: attriInfo.attributeName
          })
        })
        this.attributeList = data.data
      })
    },
    getSpuSaleAttrList() {
      var params = new URLSearchParams()
      params.append('spuId', this.spuid)
      this.axios.post('/spuSaleAttrList', params).then(data => {
        this.skuSaleAttributeValue = []
        data.data.forEach(value => {
          this.skuSaleAttributeValue.push({
            id: '',
            skuId: this.skuId,
            saleAttributeId: value.saleAttributeId,
            saleAttributeName: value.saleAttributeName,
            saleAttributeValueId: '',
            saleAttributeValueName: value.saleAttributeName
          })
        })
        this.saleAttributeList = data.data
      })
    },
    saveAttribute(command) {
      this.skuAttributeValue[command.index].attributeName =
        command.value.valueName
      this.skuAttributeValue[command.index].attributeId =
        command.value.attributeId
      this.skuAttributeValue[command.index].valueId = command.value.id
      this.skuAttributeValue[command.index].skuId = this.skuId
    },
    saveSaleAttribute(command) {
      this.skuSaleAttributeValue[command.index].saleAttributeValueId =
        command.value.id
      this.skuSaleAttributeValue[command.index].saleAttributeValueName =
        command.value.saleAttributeValueName
    },
    saveSku() {
      if (this.sku.skuName === '') {
        this.$message.error('请输入SKU名称')
        return
      }
      if (this.sku.price === '') {
        this.$message.error('请输入商品价格')
        return
      }
      if (this.sku.weight === '') {
        this.$message.error('请输入商品重量')
        return
      }
      if (this.selectionIndex === -1) {
        this.$message.error('请选中默认图片')
        return
      }

      for(var i=0;i<this.skuList.length;i++){
        if ((this.skuList[i].skuName === this.sku.skuName) && (this.skuList[i].id != this.skuId)) {
          this.$message.error(this.sku.skuName + '已存在')
          return
        }
      }
      

      if(this.skuId != ''){
        for(var i = 0;i<this.skuList.length;i++){
          if(this.skuList[i].id === this.skuId){
            this.skuList[i].skuName = this.sku.skuName
            this.skuList[i].price = this.sku.price
            this.skuList[i].weight = this.sku.weight
            this.skuList[i].description = this.sku.description
          }
        }
      }
      
      this.sku.skuDefaultImg = this.skuImgList[this.selectionIndex].imgUrl
      var params = new URLSearchParams()
      params.append('skuInfo', JSON.stringify(this.sku))
      params.append('skuImgList', JSON.stringify(this.multipleSelection))
      params.append('skuAttributeValue', JSON.stringify(this.skuAttributeValue))
      params.append(
        'skuSaleAttributeValue',
        JSON.stringify(this.skuSaleAttributeValue)
      )
      this.axios.post('/saveSku', params).then(data => {
        if (this.skuId === '') {
          this.sku.id = data.data.skuId
          this.skuList.push(this.sku)
        }
        if (data.data.status === '1') {
          this.isSKU = true
          this.skuId = ''
          this.$message({
            message: '恭喜你，保存成功',
            type: 'success'
          })
        } else {
          this.$message.error('错了哦，保存失败，请重试')
        }
      })
    },
    defauleImg(img) {
      var index = 1
      this.multipleSelection.forEach(selectionImg => {
        if (selectionImg.imgUrl == this.skuImgList[img.$index].imgUrl) {
          if (this.selectionIndex != -1) {
            // console.log('取消默认')
            this.skuImgList[this.selectionIndex].isDefault = 0
          }
          this.skuImgList[img.$index].isDefault = 1
          this.selectionIndex = img.$index
          // console.log('默认')
          index = 0
        }
      })
      if (index === 1) {
        this.$message.error('请选中后再试')
      }
    },
    cancelImg() {
      this.skuImgList[this.selectionIndex].isDefault = 0
      this.selectionIndex = -1
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
.el-textarea__inner {
  min-height: 100px !important;
}
.el-tag + .el-tag {
  margin-left: 10px;
}
.button-new-tag {
  margin-left: 10px;
  height: 32px;
  line-height: 30px;
  padding-top: 0;
  padding-bottom: 0;
}
.input-new-tag {
  width: 90px;
  margin-left: 10px;
  vertical-align: bottom;
}
.el-message-box__btns > button {
  width: 100px;
}
</style>
