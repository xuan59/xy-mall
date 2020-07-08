<template>
  <div>
    
      <van-sticky>
        <div class="message-top">
        <van-search v-model="value" shape="round" background="#f7d385" placeholder="请输入搜索关键词" />
        <van-icon name="friends-o" size="20px" />
        <van-icon name="plus" size="20px" />
        </div>
      </van-sticky>
    
    <div class="message-list">
      <van-pull-refresh v-model="refreshing" @refresh="onRefresh">
  <van-list
    v-model="loading"
    :finished="finished"
    finished-text="没有更多了"
    @load="onLoad"
  >
    <van-cell v-for="item in list" :key="item" >
      <van-image
        round
        width="3rem"
        height="3rem"
        :src="item.headImg"
        class="head-img"
      />
      <div style="float:left;padding:0px 10px;">
      <el-link :underline="false" v-text="item.contactName" style="font-size:15px;"></el-link><br>
      <el-link :underline="false" v-text="item.lastMessage" style="color:#b9b9b9"></el-link>
      </div>
      <el-link :underline="false" v-text="item.contactTime" style="float:right;padding:10px 0;"></el-link>
    </van-cell>
  </van-list>
</van-pull-refresh>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      list: [],
      loading: false,
      finished: false,
      refreshing: false
    }
  },
   methods: {
    onLoad() {
      setTimeout(() => {
        if (this.refreshing) {
          this.list = [];
          this.refreshing = false;
        }

        for (let i = 0; i < 10; i++) {
          this.list.push({
            headImg:'//img30.360buyimg.com/popshop/jfs/t4096/198/1419256260/4621/a44efbd1/58773bc2Nb0e24a44.jpg',
            contactName: '迪奥旗舰店'+ this.list.length,
            lastMessage: '我要把全部都买了',
            contactTime: '昨天'
          });
        }
        this.loading = false;

        if (this.list.length >= 40) {
          this.finished = true;
        }
      }, 1000);
    },
    onRefresh() {
      // 清空列表数据
      this.finished = false;

      // 重新加载数据
      // 将 loading 设置为 true，表示处于加载状态
      this.loading = true;
      this.onLoad();
    }
  }
}
</script>

<style scoped>
.message-top {
  height: 60px;
  background-color: #f7d385;
  line-height: 60px;
  box-shadow: #666 0px 0px 5px;
}
.van-search {
  width: 80%;
  float: left;
}

.head-img{
  float: left;
}
</style>