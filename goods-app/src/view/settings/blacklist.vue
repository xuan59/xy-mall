<template>
  <div>
    <van-nav-bar title="黑名单" left-text=" " left-arrow @click-left="onClickLeft" />
    <div>
      <van-search v-model="search" shape="round" placeholder="请输入搜索关键词" />
      <div>
        <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad">
          <van-cell v-for="item in list" :key="item.name" :title="item.name">
            <van-swipe-cell>
              <van-cell :border="false" title="" :value="item.note"  style="padding:0 10px 0 0"/>
              <template slot="right">
                <van-button square type="danger" size="small" text="移除黑名单" />
              </template>
            </van-swipe-cell>
          </van-cell>
        </van-list>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      search: '',
      list: [],
      loading: false,
      finished: false
    }
  },
  methods: {
    onClickLeft() {
      this.$router.push('/privacy')
    },
    onLoad() {
      this.list = [
        {
          name: '520',
          note: '娟宝'
        },
        {
          name: '5555',
          note: '宝贝'
        },
        {
          name: '6666',
          note: '爱妃'
        },
        {
          name: '999999',
          note: '娟儿'
        }
      ]
      this.loading = false
      this.finished = true
    }
  }
}
</script>
<style lang="postcss" scoped>
.van-cell__title {
  flex: none;
}

</style>