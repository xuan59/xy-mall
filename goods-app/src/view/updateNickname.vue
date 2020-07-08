<template>
    <div style="background-color: #f7f7f7;">
    <div>
      <van-nav-bar title="修改昵称" left-text=" " right-text="确定" left-arrow @click-left="onClickLeft" @click-right="onClickRight" />
    </div>
    <van-cell-group>
  <van-field v-model="value"
    clearable
    placeholder="请输入昵称"/>
</van-cell-group>
    </div>
</template>

<script>
export default {
    data() {
        return {
            value: '宣哥哥偕娟儿之伉俪情深'
        }
    },
    methods: {
        onClickLeft() {
      this.$router.push('/personal')
    },
    onClickRight(){

    }
    },
}
</script>
<style scoped>

</style>