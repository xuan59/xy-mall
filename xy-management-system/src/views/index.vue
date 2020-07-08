<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" style="padding-bottom:10px;">
      <el-breadcrumb-item>首页</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- <h3>逍遥商城管理系统欢迎您！</h3> -->
    <div>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>今日交易数量</span>
        </div>
        <div v-for="o in 1" :key="o" class="text item">{{ tradingNumber }}</div>
      </el-card>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>今日交易金额</span>
        </div>
        <div v-for="o in 1" :key="o" class="text item">{{ tradingTotal }}</div>
      </el-card>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>今日退款数量</span>
        </div>
        <div v-for="o in 1" :key="o" class="text item">{{ refundNumber }}</div>
      </el-card>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>今日退款金额</span>
        </div>
        <div v-for="o in 1" :key="o" class="text item">{{ refundTotal }}</div>
      </el-card>
    </div>
    <div>
      <div class="total" ref="chart1"></div>
      <div class="number" ref="chart2"></div>
    </div>
  </div>
</template>
<script>
import Cookies from 'js-cookie'
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
        trading: [120, 102, 141, 174, 190, 150, 120,235],
        refund: [10, 12, 10, 14, 19, 20, 15,13]
      },
      amountData: {
        trading: [520, 602, 841, 974, 590, 450, 620, 556],
        refund: [110, 112, 110, 214, 219, 120, 315, 264]
      },
      userName: '',
      websock: '',
      timer: ''
    }
  },
  methods: {
    setOptionData() {
      // var echarts = require('echarts');

      // 基于准备好的dom，初始化echarts实例
      var totalChart = this.$echarts.init(this.$refs.chart1)
      var numberChart = this.$echarts.init(this.$refs.chart2)
      // 绘制图表
      numberChart.setOption({
        title: {
          text: '收退款订单数量',
          left: 'center'
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            // 坐标轴指示器，坐标轴触发有效
            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
          }
        },
        // legend: {
        //     data: ['利润', '支出', '收入']

        // },
        grid: {
          left: '3%',
          right: '50px',
          bottom: '3%',
          containLabel: true
        },
        xAxis: [
          {
            name: '数量',
            type: 'value'
          }
        ],
        yAxis: [
          {
            name: '日期',
            type: 'category',
            axisTick: {
              show: false
            },
            data: this.xName
          }
        ],
        series: [
          {
            name: '收款订单数量',
            type: 'bar',
            stack: '总量',
            barWidth: '60%',
            label: {
              show: true
            },
            data: this.numberData.trading,
            itemStyle: {
              normal: {
                color: '#1a9317'
              }
            }
          },
          {
            name: '退款订单数量',
            type: 'bar',
            stack: '总量',
            barWidth: '60%',
            label: {
              show: true,
              position: 'left'
            },
            data: this.numberData.refund
          }
        ]
      })
      totalChart.setOption({
        title: {
          text: '收退款金额',
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
          left: '3%',
          right: '50px',
          bottom: '3%',
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
          name: '金额',
          type: 'value'
        },
        series: [
          {
            name: '退款',
            type: 'line',
            stack: '总量',
            data: this.amountData.refund
          },
          {
            name: '收款',
            type: 'line',
            stack: '总量',
            data: this.amountData.trading,
            itemStyle: {
              normal: {
                color: '#1a9317'
              }
            }
          }
        ]
      })
    },
    initWebSocket() {
      //初始化weosocket
      const userName = Cookies.get('loginId') //userName 是回复人的用户名
      const wsurl = 'ws://192.168.43.179:8085/orderWebsocket/' + userName
      this.websock = new WebSocket(wsurl)

      this.websock.onopen = this.websocketonopen

      this.websock.onmessage = this.websocketonmessage

      this.websock.onerror = this.websocketonerror
      this.websock.onclose = this.websocketclose
    },
    websocketonopen() {
    
      console.log('打开连接')
    },
    websocketonmessage(e) {
      //数据接收
      console.log('收到消息')
      var order = JSON.parse(e.data)
      if(order.status > 0 && order.status < 6){
        this.tradingNumber ++
        this.tradingTotal += order.payAmount
        this.numberData.trading[7] ++
        this.amountData.trading[7] += order.payAmount
      }else{
        this.refundNumber ++
        this.refundTotal += order.payAmount
        this.numberData.refund[7] ++
        this.amountData.refund[7] += order.payAmount
      }

      this.setOptionData()
     
    },
    websocketonerror() {
      //连接建立失败重连
      if (this.websock.readyState === 3) {
        console.log('建立连接失败，重新连接')
        this.initWebSocket()
      }
    },

    websocketsend(data) {
      //数据发送
      this.websock.send(data)
    },
    websocketclose(e) {
      //关闭
      console.log('断开连接', e)
      this.websock.close()
    }
  },
  mounted() {
    this.setOptionData()
    this.initWebSocket()
  },
  created() {
    // this.userName = Cookies.get('loginId')
    var date = new Date()
    date.setTime(date.getTime() - 3600 * 1000 * 24 * 7)
    var dateStr = ''
    for (var i = 0; i <= 7; i++) {
      // dateStr = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate()
      this.xName.push(date.getMonth() + 1 + '.' + date.getDate())
      date.setTime(date.getTime() + 3600 * 1000 * 24)
    }
    date.setTime(date.getTime() - 3600 * 1000 * 24)
    var end =
      date.getFullYear() +
      '-' +
      (date.getMonth() + 1) +
      '-' +
      date.getDate() +
      ' 23:59:59'
    date.setTime(date.getTime() - 3600 * 1000 * 24 * 7)
    var start =
      date.getFullYear() +
      '-' +
      (date.getMonth() + 1) +
      '-' +
      date.getDate() +
      ' 00:00:00'

    var params = new URLSearchParams()
    params.append('status', '')
    params.append('start', '2019-10-1 00:00:00')
    params.append('end', end)
    this.axios
      .post('http://192.168.43.179:8085/orderStatistics', params)
      .then(data => {
        console.log(data.data)
        data.data.forEach(item => {
          if (item.status > 0 && item.status < 4) {
            this.tradingNumber++
            this.tradingTotal += item.payAmount
          } else {
            this.refundNumber++
            this.refundTotal += item.payAmount
          }
        })
      })
      var p = this
      this.timer = setInterval(function(){
        p.websocketsend("发送数据")
      },5000)
  },
   destroyed() {
    this.websock.onclose = this.websocketclose()
    clearInterval(this.timer)
  },
}
</script>
<style scoped>
.box-card:hover {
  transform: scale(1.1);
}

.box-card {
  width: 22%;
  height: 150px;
  transform: all 0.5s;
  float: left;
  text-align: center;
  color: #ffffff;
  margin-left: 1%;
}
.box-card:nth-child(1) {
  background: rgb(3, 0, 189);
}
.box-card:nth-child(2) {
  background: rgb(55, 184, 15);
}
.box-card:nth-child(3) {
  background: rgb(189, 53, 0);
}
.box-card:nth-child(4) {
  background: rgb(190, 0, 159);
}

.clearfix {
  height: 20px;
  line-height: 20px;
}
.item {
  padding: 10px;
  font-size: 2rem;
}

.number,
.total {
  width: 50%;
  height: 350px;
  float: left;
  margin-top: 20px;
}

::-webkit-scrollbar {
  width: 0 !important;
}
::-webkit-scrollbar {
  width: 0 !important;
  height: 0;
}
</style>