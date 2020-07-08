<template>
    <div>
        <div class="cart-list" v-for="(cart,index) in this.cartList" :key="index">
          <p style="margin:0px;">
            <van-checkbox v-model="cart.checked" checked-color="#07c160" class="cart-checked"></van-checkbox>
            <el-link :underline="false" >逍遥自营</el-link>
          </p>
            <div>
            <van-image
              width="80"
              height="80"
              :src="cart.imgPath"
            />
            </div>
            <div style="padding:10px;">
            <el-link :underline="false" class="cart-context" v-text="cart.skuName"></el-link>
            <el-link style="color:red;font-size:15px;" :underline="false" >￥</el-link>
            <el-link style="color:red;font-size:15px;margin-left:-5px;" :underline="false" v-text="cart.price"></el-link>
            <van-stepper v-model="cart.number" button-size="20px" />
            </div>
        </div>
        <van-divider>为您推荐</van-divider>
      <div class="recommend">
        <van-card
          num="2"
          price="2.00"
          desc="描述信息"
          title="商品标题"
          thumb="https://img.yzcdn.cn/vant/ipad.jpeg"
        />
      </div>
      <div class="recommend">
        <van-card
          num="2"
          price="2.00"
          desc="描述信息"
          title="商品标题"
          thumb="https://img.yzcdn.cn/vant/ipad.jpeg"
        />
      </div>
        <div style="height:90px"></div>
        <van-submit-bar
          :price="3050"
          button-text="提交订单"
          @submit="onSubmit"
        >
          <van-checkbox v-model="checked">全选</van-checkbox>
          <span slot="tip">
            你的收货地址不支持同城送, <span>修改地址</span>
          </span>
        </van-submit-bar>
    </div>
</template>

<script>
export default {
    data(){
        return{
            cartList:[
              {
                checked: true,
                imgPath:'//img13.360buyimg.com/n1/jfs/t1/96601/4/8283/92621/5e045913Ecf9f9bb7/0d657363a1b26813.jpg',
                skuName:'迪奥（Dior）滋润正红999礼盒（烈艳蓝金999#3.5g +香氛小样1ml*3+礼盒）小样和礼盒款式随机',
                price: 371,
                number: 2,
              },
              {
                checked: true,
                imgPath:'//img13.360buyimg.com/n1/jfs/t19456/243/928215857/251338/557aaad/5ab47290N10e77a18.jpg',
                skuName:'迪奥（Dior）迪奥小姐花漾淡香氛(EDT)30ml（喷装 清新淡花香 初恋的气息 淡香水新老款随机）',
                price: 570,
                number: 1,
              },
              {
                checked: false,
                imgPath:'//img11.360buyimg.com/n5/s450x450_jfs/t1/101329/16/8670/74792/5e05593fE58521d63/925334afb8e53268.jpg',
                skuName:'雅诗兰黛（Estee Lauder）DW持久粉底液/沁水粉底液 保湿遮瑕控油不脱妆 62号2C0自然偏白',
                price: 268,
                number: 1,
              },
              {
                checked: true,
                imgPath:'//img10.360buyimg.com/n1/jfs/t1/104145/2/105/126732/5da6df7dEcbaaee76/960477d9e9c5d7c4.jpg',
                skuName:'迪奥口红999/520（Dior）烈艳蓝金唇膏 999# 滋润 正红色 3.5g',
                price: 298,
                number: 1,
              },
              {
                checked: true,
                imgPath:'//img12.360buyimg.com/n5/jfs/t1/92276/24/882/148454/5db66618Edd913670/3d537091679cc352.jpg',
                skuName:'迪奥（Dior）口红520#028#999#烈艳蓝金口红唇膏3.5g新年礼物 【星空系列】圣诞限量版金属皮包套装【五只装】',
                price: 1314,
                number: 1,
              }
            ]
            
        }
    }
}
</script>
<style scoped>
.cart-list{
    margin-top: 10px;
    border-radius: 20px;
    padding: 10px;
    background-color: #ffffff;
    text-align: left;
}
.cart-checked{
    display: inline-block;
    width: 20px;
}
.el-link{
  margin-left: 10px;
  margin-top: -10px;
}
.van-image{
  float:left;
}
.cart-context{
  width: 200px;
  margin: 10px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}
.van-stepper{
  /* width: 100px; */
  float: right;
}
.van-submit-bar{
  margin-bottom: 50px;
}

.recommend,
.van-card {
  background: #ffffff;
  border-radius: 10px;
  margin-top: 10px;
  text-align: left;
}

</style>