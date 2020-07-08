<template>
  <div style="height:100%"
    v-loading="loading"
    element-loading-text="拼命加载中">
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item>首页</el-breadcrumb-item>
      <el-breadcrumb-item>财务管理</el-breadcrumb-item>
      <el-breadcrumb-item>收款统计</el-breadcrumb-item>
    </el-breadcrumb>

    <div class="search">
      <el-date-picker
        v-model="dateValue"
        type="daterange"
        align="right"
        unlink-panels
        @change="search"
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期"
        :picker-options="pickerOptions"
      ></el-date-picker>
      <el-button icon="el-icon-search" type="primary" @click="search">搜索</el-button>
    </div>
    <div>
      <div class="sum">收款总额{{ tradingTotal }}元，订单数量{{ tradingNumber }}个</div>
      <div class="sum">退款总额{{ refundTotal }}元，订单数量{{ refundNumber }}个</div>
    </div>
    <div class="statistical">
      <div class="total" ref="chart1"></div>
      <div class="number" ref="chart2"></div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      timer: '',
      tradingNumber: 100,
      tradingTotal: 6666,
      refundNumber: 0,
      refundTotal: 0,
      xName: [],
      numberData: {
        trading: [],
        refund: []
      },
      amountData: {
        trading: [],
        refund: []
      },
      dateValue: [],
      loading: true,
      pickerOptions: {
        shortcuts: [
          {
            text: '最近一周',
            onClick(picker) {
              const end = new Date()
              const start = new Date()
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
              picker.$emit('pick', [start, end])
            }
          },
          {
            text: '最近一个月',
            onClick(picker) {
              const end = new Date()
              const start = new Date()
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 30)
              picker.$emit('pick', [start, end])
            }
          },
          {
            text: '最近三个月',
            onClick(picker) {
              const end = new Date()
              const start = new Date()
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 90)
              picker.$emit('pick', [start, end])
            }
          }
        ]
      }
    }
  },
  methods: {
    search() {
      this.loading = true
      if (this.dateValue == null) {
        this.dateValue = []
        const end = new Date()
        const start = new Date()
        start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
        this.dateValue.push(start)
        this.dateValue.push(end)
        console.log(this.dateValue)
      }

      var start = new Date(this.dateValue[0])
      var end = new Date(this.dateValue[1])
      var day = (end.getTime() - start.getTime()) / 3600000 / 24
      this.xName = []
      this.amountData.refund = []
      this.amountData.trading = []
      this.numberData.trading = []
      this.numberData.refund = []
    
      for (var i = 0; i <= day; i++) {
        this.xName.push(start.getMonth() + 1 + '.' + start.getDate())
        start.setTime(start.getTime() + 3600 * 1000 * 24)
        this.amountData.refund.push(Math.round(Math.random() * 300))
        this.amountData.trading.push(Math.round(Math.random() * 1000))
        this.numberData.trading.push(Math.round(Math.random() * 200))
        this.numberData.refund.push(Math.round(Math.random() * 20))
      }
      var start1 = new Date(this.dateValue[0])
      var endTime =
        end.getFullYear() +
        '-' +
        (end.getMonth() + 1) +
        '-' +
        end.getDate() +
        ' 23:59:59'
      var startTime =
        start1.getFullYear() +
        '-' +
        (start1.getMonth() + 1) +
        '-' +
        start1.getDate() +
        ' 00:00:00'
      var params = new URLSearchParams()
      params.append('status', '')
      params.append('start', startTime)
      params.append('end', endTime)
      this.axios
        .post('http://192.168.43.179:8085/orderStatistics', params)
        .then(data => {
          data.data.forEach(item => {
            var str =
              item.createTime.substring(5, 7) +
              '.' +
              item.createTime.substring(8, 10)
            var index = this.xName.indexOf(str)

            if (item.status > 0 && item.status < 4) {

              if (index != -1) {
                this.amountData.trading[index] += item.payAmount
                this.numberData.trading[index]++
                this.tradingNumber++
                this.tradingTotal += item.payAmount
              }
            } else {
              this.refundNumber++
              this.refundTotal += item.payAmount
              if (index != -1) {
                this.amountData.refund[index] += item.payAmount
                this.numberData.refund[index]++
                this.refundNumber++
                this.refundTotal += item.payAmount
              }
            }
          })
          for(var i = 0; i < this.amountData.trading.length; i++){
            this.tradingNumber += this.numberData.trading[i]
            this.tradingTotal += this.amountData.trading[i]
            this.refundNumber += this.numberData.refund[i]
            this.refundTotal += this.amountData.refund[i]
          }
          this.setOptionData()
          this.loading = false
        })

     
    },
    setOptionData() {
      // var echarts = require('echarts');

      // 基于准备好的dom，初始化echarts实例
      var totalChart = this.$echarts.init(this.$refs.chart1)
      var numberChart = this.$echarts.init(this.$refs.chart2)
      // 绘制图表
      totalChart.setOption({
        title: {
          text: '收/退款金额'
        },
        // color: ['#3398DB'],
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: ['退款', '收款']
        },
        grid: {
          left: '10px',
          right: '50px',
          bottom: '0px',
          containLabel: true
        },
        toolbox: {
          show: true,
          feature: {
            dataView: { show: true, readOnly: false },
            magicType: { show: true, type: ['line', 'bar'] },
            restore: { show: true },
            saveAsImage: { show: true }
          }
        },
        calculable: true,
        xAxis: [
          {
            name: '日期',
            type: 'category',
            data: this.xName
          }
        ],
        yAxis: [
          {
            name: '金额',
            type: 'value'
          }
        ],
        series: [
          {
            name: '退款',
            type: 'bar',
            data: this.amountData.refund,
            markPoint: {
              data: [
                { type: 'max', name: '最大值' },
                { type: 'min', name: '最小值' }
              ]
            },
            markLine: {
              data: [{ type: 'average', name: '平均值' }]
            }
          },
          {
            name: '收款',
            type: 'bar',
            data: this.amountData.trading,
            markPoint: {
              data: [
                { type: 'max', name: '最大值' },
                { type: 'min', name: '最小值' }
              ]
            },
            markLine: {
              data: [{ type: 'average', name: '平均值' }]
            },
            itemStyle: {
              normal: {
                color: '#1a9317'
              }
            }
          }
        ]
      })
      numberChart.setOption({
        title: {
          text: '收/退款订单数量',
          left: 'center'
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: ['退款', '收款'],
          x: '80%'
        },
        grid: {
          left: '10px',
          right: '50px',
          bottom: '0px',
          containLabel: true
        },
        toolbox: {
          feature: {
            saveAsImage: {}
          }
        },
        xAxis: {
          name: '日期',
          type: 'category',
          boundaryGap: false,
          data: this.xName
        },
        yAxis: {
          name: '数量',
          type: 'value'
        },
        series: [
          {
            name: '退款',
            type: 'line',
            stack: '数量',
            data: this.numberData.refund
          },
          {
            name: '收款',
            type: 'line',
            stack: '数量',
            data: this.numberData.trading,
            itemStyle: {
              normal: {
                color: '#1a9317'
              }
            }
          }
        ]
      })
    }
  },
  mounted() {
    
  },
  created() {
    const start = new Date()
    const end = new Date()
    start.setTime(start.getTime() - 3600 * 1000 * 24 * 7)
    this.dateValue.push(start)
    this.dateValue.push(end)

    var date = new Date()
    date.setTime(date.getTime() - 3600 * 1000 * 24 * 7)
    var dateStr = ''
    for (var i = 0; i <= 7; i++) {
      // dateStr = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate()
      this.xName.push(date.getMonth() + 1 + '.' + date.getDate())
      date.setTime(date.getTime() + 3600 * 1000 * 24)
      this.amountData.refund.push(Math.round(Math.random() * 300))
      this.amountData.trading.push(Math.round(Math.random() * 1000))
      this.numberData.trading.push(Math.round(Math.random() * 200))
      this.numberData.refund.push(Math.round(Math.random() * 20))
    }

    var endTime =
      end.getFullYear() +
      '-' +
      (end.getMonth() + 1) +
      '-' +
      end.getDate() +
      ' 23:59:59'
    var startTime =
      start.getFullYear() +
      '-' +
      (start.getMonth() + 1) +
      '-' +
      start.getDate() +
      ' 00:00:00'
    var params = new URLSearchParams()
    params.append('status', '')
    params.append('start', startTime)
    params.append('end', endTime)
    this.axios
      .post('http://192.168.43.179:8085/orderStatistics', params)
      .then(data => {
        data.data.forEach(item => {
          var str =
            item.createTime.substring(5, 7) +
            '.' +
            item.createTime.substring(8, 10)
          var index = this.xName.indexOf(str)
          if (item.status > 0 && item.status < 4) {

            if (index != -1) {
              this.amountData.trading[index] += item.payAmount
              this.numberData.trading[index]++
              this.tradingNumber++
              this.tradingTotal += item.payAmount
            }
          } else {
            this.refundNumber++
            this.refundTotal += item.payAmount
            if (index != -1) {
              this.amountData.refund[index] += item.payAmount
              this.numberData.refund[index]++
              this.refundNumber++
              this.refundTotal += item.payAmount
            }
          }
        })
        for(var i = 0; i < this.amountData.trading.length; i++){
            this.tradingNumber += this.numberData.trading[i]
            this.tradingTotal += this.amountData.trading[i]
            this.refundNumber += this.numberData.refund[i]
            this.refundTotal += this.amountData.refund[i]
        }
        this.setOptionData()
        this.loading = false
      })
  }
}
</script>
<style scoped>
.number,
.total {
  width: 50%;
  height: calc(100% - 100px);
  float: left;
  margin-top: 20px;
}

.search {
  height: 60px;
  text-align: left;
  padding-top: 20px;
}
.statistical {
  height: calc(100% - 100px);
  margin-top: 20px;
}
.sum {
  color: #ffffff;
  font-size: 20px;
  font-weight: bold;
  padding: 20px;
  border-radius: 5px;
  /* width: 300px; */
  display: inline-block;
}
.sum:nth-child(1){
  background: rgb(55, 184, 15);
  margin-right: 50px;
}
.sum:nth-child(2){
  background: rgb(189, 53, 0);
}
</style>