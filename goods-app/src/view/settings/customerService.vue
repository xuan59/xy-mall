<template>
  <div>
    <van-sticky>
      <van-nav-bar title="小爱客服" left-text=" " left-arrow @click-left="onClickLeft" />
    </van-sticky>
    <div>
        <div style="margin-bottom: 50px;">
      <div v-for="(item,index) in list" :key="index">
        <div style="padding:0 10px" v-if="item.name == 1">
          <van-image
            style="float:left;"
            round
            width="2rem"
            height="2rem"
            src="https://img.yzcdn.cn/vant/cat.jpeg"
          />
          <div class="angle"></div>
          <div class="content">
          <el-link :underline="false" v-text="item.content"></el-link>
          </div>
        </div>
        <div style="padding:0 10px" v-else>
          <van-image
            style="float:right;"
            round
            width="2rem"
            height="2rem"
            src="https://img.yzcdn.cn/vant/cat.jpeg"
          />
          <div class="angle1"></div>
          <div class="content1">
          <el-link :underline="false" v-text="item.content"></el-link>
          </div>
        </div>
      </div>
        </div>
      <van-tabbar>
        <div style="height:40px;line-height:40px;margin-left:10px;">
          <i class="el-icon-microphone"></i>
        </div>
        <van-search
          v-model="value"
          shape="round"
          left-icon
          right-icon="smile-o"
          placeholder="请输入搜索关键词"
        />

        <van-icon name="add-o" v-if="value == ''" />
        <div v-else style="height:40px;line-height:40px;">
          <van-button type="primary" size="small" @click="send">发送</van-button>
        </div>
      </van-tabbar>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      value: '',
      list: [
        {
          name: 1,
          content: 'hello',
          date: '2020-02-08'
        }
      ]
    }
  },
  methods: {
    onClickLeft() {
      this.$router.push('/feedback')
    },
    trading() {
      this.$router.push('/customerService')
    },
    use() {
      this.$router.push('/use')
    },
    send() {
      this.list.push({
          name: 2,
          content: this.value,
          date: '2020-02-08'
        })
     
      this.list.push({
          name: 1,
          content: this.value,
          date: '2020-02-08'
        })
        this.value = ''
    }
  }
}
</script>
<style scoped>
.van-tabbar {
  height: 40px;
  line-height: 40px;
}
.van-icon {
  font-size: 25px;
  line-height: 40px;
}
.van-search {
  width: 80%;
}
.van-button {
  font-size: 15px;
  /* line-height: 40px; */
}
.content {
  /* background:#fff; */
  margin-top: 10px;
  max-width: 60%;
  text-align: left;
  margin-left: 52px;
  display:block;word-break: break-all;word-wrap: break-word;
}
.angle {
  width: 0;
  height: 0;
  font-size: 0;
  border: solid 10px;
  border-color: #f7f7f7 #ffffff #f7f7f7 #f7f7f7;
  float: left;
  margin-top:5px;
}
.content1 {
  /* background:#fff; */
  margin-top: 10px;
  max-width: 60%;
  text-align: right;
  margin-left: 40%;
  margin-right: 52px;
  display:block;word-break: break-all;word-wrap: break-word;
}
.angle1 {
  width: 0;
  height: 0;
  font-size: 0;
  border: solid 10px;
  border-color: #f7f7f7 #f7f7f7 #f7f7f7 #ffffff;
  float: right;
  margin-top:5px;
}
.el-link {
  background: #ffffff;
  padding: 10px;
  min-height: 14px;
  max-width: 180px;
  text-align: left;
}
</style>