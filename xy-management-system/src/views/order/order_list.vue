<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>订单管理</el-breadcrumb-item>
      <el-breadcrumb-item>订单列表</el-breadcrumb-item>
    </el-breadcrumb>
    <div style="width:400px;float:left;margin:20px 0px;">
      <el-input prefix-icon="el-icon-search" v-model="search" size="mini" placeholder="输入关键字搜索" />
    </div>
    <el-button
      type="primary"
      size="mini"
      @click="multipleOrder"
      style="float:left;margin-left:50px;margin-bottom: 15px;margin-top:20px;width:100px;"
    >发货</el-button>
    <el-table
      :data="tableData.filter(data => (!search || data.orderNo.toLowerCase().includes(search.toLowerCase()) || !search || data.receiverName.toLowerCase().includes(search.toLowerCase())|| !search || data.receiverPhone.toLowerCase().includes(search.toLowerCase())))"
      style="width: 100%"
      :border="true"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-form label-position="left" inline class="demo-table-expand">
      
            <el-form-item label="优惠券ID：">
              <span>{{ props.row.couponId }}</span>
            </el-form-item>
            <el-form-item label="优惠券金额：">
              <span>{{ props.row.couponAmount }}</span>
            </el-form-item>
            <el-form-item label="运费金额：">
              <span>{{ props.row.freightAmount }}</span>
            </el-form-item>
            <el-form-item label="促销活动金额：">
              <span>{{ props.row.promotionAmount }}</span>
            </el-form-item>
            <el-form-item label="优惠券金额：">
              <span>{{ props.row.integralDeductionAmount }}</span>
            </el-form-item>
            <el-form-item label="折扣金额：">
              <span>{{ props.row.discountAmount }}</span>
            </el-form-item>
            <el-form-item label="职业：">
              <span>{{ props.row.job }}</span>
            </el-form-item>
            <el-form-item label="支付方式：">
              <span>{{ props.row.payType }}</span>
            </el-form-item>
            <el-form-item label="快递公司：">
              <span>{{ props.row.deliveryCompany }}</span>
            </el-form-item>
            <el-form-item label="物流单号：">
              <span>{{ props.row.logisticsSingleInquiryNo }}</span>
            </el-form-item>
            <el-form-item label="自动收货天数：">
              <span>{{ props.row.auto_confirmDay }}</span>
            </el-form-item>
            <el-form-item label="获得的积分数量：">
              <span>{{ props.row.gainIntegralNumber }}</span>
            </el-form-item>
            <el-form-item label="获得成长值：">
              <span>{{ props.row.gainGrowthValue }}</span>
            </el-form-item>
            <el-form-item label="促销信息：">
              <span>{{ props.row.promotionInfo }}</span>
            </el-form-item>
            <el-form-item label="省：">
              <span>{{ props.row.province }}</span>
            </el-form-item>
            <el-form-item label="城市：">
              <span>{{ props.row.city }}</span>
            </el-form-item>
            <el-form-item label="区/县：">
              <span>{{ props.row.region }}</span>
            </el-form-item>
            <el-form-item label="详细地址：">
              <span>{{ props.row.detailAddress }}</span>
            </el-form-item>
            <el-form-item label="确认收货：">
              <span>{{ props.row.confirmStatus }}</span>
            </el-form-item>
            <el-form-item label="删除状态：">
              <span>{{ props.row.deleteStatus }}</span>
            </el-form-item>
            <el-form-item label="使用积分数量：">
              <span>{{ props.row.useIntegral }}</span>
            </el-form-item>
            <el-form-item label="付款时间：">
              <span>{{ props.row.paymentTime }}</span>
            </el-form-item>
            <el-form-item label="发货时间：">
              <span>{{ props.row.deliveryTime }}</span>
            </el-form-item>
            <el-form-item label="确认收货时间：">
              <span>{{ props.row.receiveTime }}</span>
            </el-form-item>
            <el-form-item label="评价时间：">
              <span>{{ props.row.commentTime }}</span>
            </el-form-item>
            <el-form-item label="品牌：">
              <span>{{ props.row.orderDetails.brand }}</span>
            </el-form-item>
            <el-form-item label="SKU：" style="width:100%">
              <span>{{ props.row.orderDetails.skuName }}</span>
            </el-form-item>
            <el-form-item label="SPU图片：">
              <span><img :src="props.row.orderDetails.skuImage" style="width:100px;" /></span>
            </el-form-item>



          </el-form>
        </template>
      </el-table-column>

      <el-table-column type="selection" :selectable="selectable" width="40" align="center"></el-table-column>
      <el-table-column label="订单号" prop="orderNo" sortable width="105%" align="center"></el-table-column>
      <el-table-column label="店铺名称" prop="shopName" sortable width="130%" align="center"></el-table-column>
      <!-- <el-table-column label="用户账号" prop="userName" sortable width="100%" align="center"></el-table-column> -->
      <el-table-column label="收货人" prop="receiverName" sortable width="120%" align="center"></el-table-column>
      <el-table-column label="收货人电话" prop="receiverPhone" sortable align="center"></el-table-column>
      <el-table-column label="订单金额" prop="totalAmount" sortable width="125%" align="center"></el-table-column>
      <el-table-column label="支付金额" prop="payAmount" sortable width="125%" align="center"></el-table-column>
      <el-table-column label="订单时间" prop="createTime" sortable align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.createTime | dateFmt('YYYY-MM-DD HH:mm:ss') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="订单状态" prop="status" sortable align="center">
        <template slot-scope="scope">
          <span>{{ orderTypeList[scope.row.status] }}</span>
        </template>
      </el-table-column>
     
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button type="primary" size="mini" v-if="scope.row.status == 0" disabled @click="handleEdit(scope.$index, scope.row)" style="width:70px;">未支付</el-button>
          <el-button type="primary" size="mini" v-else-if="scope.row.status == 1"  @click="handleEdit(scope.$index, scope.row)" style="width:70px;">发货</el-button>
          <el-button type="primary" size="mini" v-else-if="scope.row.status == 2" disabled @click="handleEdit(scope.$index, scope.row)" style="width:70px;">已发货</el-button>
          <el-button type="primary" size="mini" v-else-if="scope.row.status == 3" disabled @click="handleEdit(scope.$index, scope.row)" style="width:70px;">交易成功</el-button>
          <el-button type="primary" size="mini" v-else-if="scope.row.status == 4" disabled @click="handleEdit(scope.$index, scope.row)" style="width:70px;">已取消</el-button>
          <el-button type="primary" size="mini" v-else-if="scope.row.status == 5" disabled @click="handleEdit(scope.$index, scope.row)" style="width:70px;">申请退款</el-button>
          <el-button type="primary" size="mini" v-else-if="scope.row.status == 6" disabled @click="handleEdit(scope.$index, scope.row)" style="width:70px;">退款中</el-button>
          <el-button type="primary" size="mini" v-else-if="scope.row.status == 7" disabled @click="handleEdit(scope.$index, scope.row)" style="width:70px;">退款成功</el-button>
          
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>
<script>

export default {
  data() {
    return {
      multipleSelection: [],
      tableData: [],
      search: '',
      orderTypeList: ["待付款","待发货","已发货","交易成功","订单已取消","申请退款","退款中","退款成功"]
    }
  },
  methods: {
    handleEdit(index, row) {
      var param = new URLSearchParams()
      param.append("id", row.id)
      this.axios.post('http://192.168.43.179:8085//updateOrder', param).then(data => {
        if (data.data === 1) {
          this.tableData[index].status=2
       
          this.$message({
            message: '恭喜你，发货成功',
            type: 'success'
          })
        } else {
          this.$message.error('错了哦，发货失败，请重试')
        }
      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    selectable(row, index) {      
      if(row.status == 1){
        return true
      }else {
        return false
      }
    },
    multipleOrder() {
     
      this.axios
        .post('http://192.168.43.179:8085//updateOrderList', this.multipleSelection)
        .then(data => {
          if (data.data === 1) {
            this.$message({
              message: '恭喜你，发货成功',
              type: 'success'
            })
          } else {
            this.$message.error('错了哦，发货失败，请重试')
          }
        })

      this.multipleSelection.forEach(order => {
        order.status = 2
      });
    },
    date(time){
      var date = new Date(time)
      
    }
  },
  created() {
    this.axios.post('http://192.168.43.179:8085/getOrderList').then(data => {
      this.tableData = data.data
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
