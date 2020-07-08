<template>
    <div style="background-color: #f7f7f7;">
    <div>
      <van-nav-bar title="地区设置" left-text=" "  right-text="确定" left-arrow @click-left="onClickLeft" @click-right="onClickRight"/>
    </div>
    <div>
        <van-index-bar :index-list="indexList">
            <van-cell title="地区" @click="region">
        <div class="personal_right">
          <el-link :underline="false" style="color:#c7c7c7;" v-text="value"></el-link>
          <van-icon name="arrow" />
        </div>
      </van-cell>
        </van-index-bar>
        <van-action-sheet v-model="regionShow" title="请选择地区">
  <div class="content"><van-picker :columns="regionList" @change="regionChange" /></div>
</van-action-sheet>
    </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            indexList: [],
            value: '',
            regionShow: false,
            regionList: ['中国大陆', '中国香港', '中国澳门', '中国台湾', '新加坡', '马来西亚', '美国', '加拿大', '澳大利亚', '新西兰', '日本', '韩国', '全球']
        }
    },
    methods: {
         onClickLeft() {
      this.$router.push('/setting')
    },
    onClickRight(){
        this.$toast('设置成功')
    },
    regionChange(picker, value, index){
        this.value = value
    },
    region(){
        this.regionShow = true
    }
    },
}
</script>
<style scoped>
.van-cell {
  text-align: left;
  padding-left: 30px;
}
.van-cell__title {
  width: 100px;
  flex: none;
}
.personal_right > .van-icon {
  top: 5px;
}
</style>