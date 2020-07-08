<template>
  <div style="background:#ea5454;">
    <div class="index-top">
      <van-search v-model="value" shape="round" background="#ea5454" placeholder="请输入搜索关键词" />
      <van-icon name="scan" size="25px" />
    </div>
    <van-tabs>
      <van-tab v-for="(tab,index) in this.tabList" :title="tab" :key="index">
        <div class="slideshow">
          <van-swipe class="my-swipe" :autoplay="3000" indicator-color="white">
            <van-swipe-item
              v-for="(item,index) in slideshowList"
              :key="index"
              style="height:150px;"
            >
              <van-image width="100%" height="150px" :src="item" />
            </van-swipe-item>
          </van-swipe>
        </div>
        <div class="index-menu">
          <van-grid :border="false" :column-num="4">
            <van-grid-item v-for="(item,index) in menuList" :key="index">
              <van-image :src="item.imgPath" style="height:20px;width:20px;" />
              <el-link :underline="false" v-text="item.name"></el-link>
            </van-grid-item>
          </van-grid>
        </div>

        <van-grid :border="false" :column-num="3">
          <van-grid-item>
            <van-image src="https://img.yzcdn.cn/vant/apple-1.jpg" />
          </van-grid-item>
          <van-grid-item>
            <van-image src="https://img.yzcdn.cn/vant/apple-2.jpg" />
          </van-grid-item>
          <van-grid-item>
            <van-image src="https://img.yzcdn.cn/vant/apple-3.jpg" />
          </van-grid-item>
        </van-grid>
      </van-tab>
    </van-tabs>
  </div>
</template>
<script>
export default {
  data() {
    return {
      value: '',
      tabList: [
        '首页',
        '美妆',
        '手机',
        '笔记本',
        '电脑',
        '食品',
        '家具厨具',
        '图书',
        '运动',
        '家电'
      ],
      slideshowList: [
        '//img14.360buyimg.com/babel/s590x470_jfs/t1/106505/29/10957/97805/5e25a0b3E0ea61e98/a5cd8912c3087a24.jpg.webp',
        '//img14.360buyimg.com/da/s590x470_jfs/t1/87392/8/3139/61911/5ddcabd0E29c4eada/5225809ffcc2298e.jpg.webp',
        '//img13.360buyimg.com/pop/s590x470_jfs/t1/94548/38/11016/81923/5e23b8feE8bb437da/961e45b3c4f15fc7.jpg.webp',
        '//img12.360buyimg.com/pop/s590x470_jfs/t1/95876/33/9627/85736/5e128d7bE989ec659/e5ceaf41bb42d1de.jpg.webp',
        '//img20.360buyimg.com/pop/s590x470_jfs/t1/96620/40/10858/145712/5e21e0e9Edb01fede/d8f9c3abf3e6fe6f.jpg.webp'
      ],
      menuList: [
        {
          imgPath:
            '//m.360buyimg.com/babel/jfs/t1/30057/19/14881/720/5cbf064aE187b8361/eed6f6cbf1de3aaa.png',
          name: '充值中心'
        },
        {
          imgPath:
            '//m.360buyimg.com/babel/jfs/t1/36478/38/5384/2901/5cbf065aEb0c60a12/afb4399323fe3b76.png',
          name: '机票'
        },
        {
          imgPath:
            '//m.360buyimg.com/babel/jfs/t1/31069/34/14642/979/5cbf0665Ec7dc8223/5fee386254dd2ebc.png',
          name: '酒店'
        },
        {
          imgPath:
            '//m.360buyimg.com/babel/jfs/t1/32403/22/14829/3699/5cbf0674E04723693/caa83ce9b881cd24.png',
          name: '游戏'
        },
        {
          imgPath:
            'https://m.360buyimg.com/babel/jfs/t1/93745/37/981/3048/5db798f8E04cb32a4/b5988df81d4a5121.png',
          name: '加油卡'
        },
        {
          imgPath:
            'https://m.360buyimg.com/babel/jfs/t1/98681/29/969/1581/5db798feE36be4a7f/d9ad3484af73c911.png',
          name: '火车票'
        },
        {
          imgPath:
            'https://m.360buyimg.com/babel/jfs/t1/93361/10/974/3447/5db79908Efd9fefc0/138af039713e4a94.png',
          name: '理财'
        },
        {
          imgPath:
            'https://m.360buyimg.com/babel/jfs/t1/80699/1/14084/3066/5db79926E66354e93/70159615eeee7355.png',
          name: '电影票'
        }
      ]
    }
  }
}
</script>

<style scoped>
.van-search {
  width: 90%;
  float: left;
}
.index-top {
  height: 60px;
  line-height: 60px;
}
.van-icon {
  color: #ffffff;
}
.van-tab,
.van-tabs {
  height: 30px;
  line-height: 30px;
}
.slideshow {
  height: 150px;
  background: #ffffff;
}
.my-swipe .van-swipe-item {
  color: #fff;
  font-size: 20px;
  line-height: 150px;
  text-align: center;
  background-color: #39a9ed;
}
.index-menu {
  border-radius: 20px;
  background: #ffffff;
}
</style>