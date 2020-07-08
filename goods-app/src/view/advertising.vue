<template>
    <div class="advert">
        <img src="../assets/advertising.jpg">
    </div>
</template>
<script>
export default {
    data() {
        return {
            timer: ''
        }
    },
    methods: {
        jump(){
            this.$router.push('/index')
        }
    },
    mounted() {
      this.timer = setInterval(this.jump, 3000);
    },
     beforeDestroy() {
      clearInterval(this.timer);
    }
}
</script>

<style lang="postcss" scoped>
img{
    width:100%;
}
.advert{
    width: 100%;
    height: 100%;
}
</style>