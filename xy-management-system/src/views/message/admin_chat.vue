<template>
  <div style="text-align:center">
    <el-breadcrumb separator-class="el-icon-arrow-right" style="margin-bottom:20px">
      <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>客服中心</el-breadcrumb-item>
      <el-breadcrumb-item>联系我们</el-breadcrumb-item>
    </el-breadcrumb>
    <div class="chat">
      <div class="head">
        <el-image class="headImage" style="border:none" :src="headUrl"></el-image>
        <div class="headName">{{ headName }}</div>
      </div>
      <div class="infinite-list content" v-infinite-scroll="load" id="chat_content">
        <div v-for="(item,index) in messageList" class="infinite-list-item message" :key="index">
          <el-image
            class="headPortrait"
            :style="item.userName=='admin'?'float:left':'float:right'"
            style="border:none"
            :src="item.userName=='admin'?headUrl:headUrl2"
          ></el-image>
          <div :class="item.userName=='admin'?'messageIcon leftIcon':'messageIcon rightIcon' "></div>
          <div
            class="messageContent"
            :style="item.userName=='admin'?'float:left':'float:right'"
            v-text="item.message"
          ></div>
        </div>
      </div>
      <el-divider></el-divider>
      <div class="footer">
        <textarea class="inputMessage" type="textarea" :rows="4" v-model="message"></textarea>
        <div class="bottom">
          <el-button type="success" @click="send" class="el-icon-s-promotion">发送</el-button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Cookies from 'js-cookie'
// import face from './../assets/image/fece.png'
export default {
  data() {
    return {
      count: 0,
      headUrl:
        'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg',
      headUrl2:
        'https://fuss10.elemecdn.com/3/28/bbf893f792f03a54408b3b7a7ebf0jpeg.jpeg',
      message: '',
      messageList: [],
      websock: '',
      userName: '',
      headName: '',
      contactPeople: []
    }
  },
  methods: {
    load() {
      // if(this.count < 100){
      //     this.count += 2
      // }
    },
    send() {
      // console.log(this.message)
      var data = {
        id: '',
        userName: this.userName,
        message: this.message,
        replyUser: 'admin',
        createTime: ''
      }
      this.messageList.push(data)
      this.websocketsend(JSON.stringify(data))
      this.message = ''
    },
    initWebSocket() {
      //初始化weosocket
      const userName = Cookies.get('loginId') //userName 是回复人的用户名
      const wsurl = 'ws://192.168.43.179:8081/websocket/admin,' + userName
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
      var list = JSON.parse(e.data)
      if (list.length == undefined) {
        this.messageList.push(list)
      } else {
        this.messageList = list
      }
      console.log(list.length)
    },
    websocketonerror() {
      //连接建立失败重连
      if (this.websock.readyState === 3) {
        console.log('建立连接失败，重新连接')
        this.initWebSocket()
      }
    },

    websocketsend(Data) {
      //数据发送
      this.websock.send(Data)
    },
    websocketclose(e) {
      //关闭
      console.log('断开连接', e)
      this.websock.close()
    }
  },
  created() {
    const userName = Cookies.get('loginId')
    this.userName = userName

    this.axios.post('/getDealerUserList').then(data => {
        console.log(data)
        this.contactPeople = data.data
    })

    this.initWebSocket()
    var p = this
    document.onkeypress = function(e) {
      var keycode = document.all ? event.keyCode : e.which
      if (keycode == 13) {
        console.log(p.message)
        if (p.message != '') {
          p.send()
        }
        event.preventDefault() // 阻止浏览器默认换行操作
      }
    }
  },
  destroyed() {
    this.websock.onclose = this.websocketclose()
  },
  updated() {
    var div = document.getElementById('chat_content')
    div.scrollTop = div.scrollHeight
  }
}
</script>
<style scoped>
.chat {
  margin: 0 auto;
  height: 500px;
  width: 600px;
  overflow: hidden;
  border-radius: 2px;
  box-shadow: 1px 1px 50px rgba(0, 0, 0, 0.2);
}
.head {
  background: rgba(245, 245, 245, 0.7);
  height: 50px;
  text-align: left;
  padding: 15px;
  line-height: 50px;
}
.headImage {
  width: 50px;
  height: 50px;
  border-radius: 50px;
  float: left;
  margin-right: 20px;
}
.headPortrait {
  width: 40px;
  height: 40px;
  border-radius: 40px;
}
.content {
  height: 230px;
  padding: 20px;
  overflow-y: scroll;
}
.message {
  clear: both;
  padding: 20px 0;
}
.messageIcon {
  width: 0;
  margin-top: 5px;
  height: 0;
  border: 10px solid;
}
.leftIcon {
  border-color: #81baff #81baff #ffffff #ffffff;
  float: left;
}
.rightIcon {
  border-color: #81baff #ffffff #ffffff #81baff;
  float: right;
}
.messageContent {
  padding: 15px 10px;
  background: #81baff;
  border-radius: 5px;
  max-width: 180px;
  text-align: left;
}

.footer {
  height: 150px;
}
.bottom {
  text-align: right;
  padding: 0 20px;
}
.el-divider--horizontal {
  display: block;
  height: 1px;
  width: 100%;
  margin: 5px 0;
}
.inputMessage {
  border: none;
  border-style: none;
  width: calc(100% - 20px);
  resize: none;
  padding: 10px;
  font-size: 14px;
  outline: none;
}
</style>