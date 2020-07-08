<template>
  <div style="background-color: #f7f7f7;">
      <div v-if="editShow == false">
    <div>
      <van-nav-bar title="收获地址" left-text=" " left-arrow @click-left="onClickLeft" />
    </div>
    <div>
      <van-address-list
        v-model="defaultAddressId"
        :list="list"
        :disabled-list="disabledList"
        disabled-text="以下地址超出配送范围"
        default-tag-text="默认"
        @add="addressAdd"
        @edit="addressEdit"
      />
    </div>
      </div>
      <div v-else>
          <div>
      <van-nav-bar :title="title" left-text=" " left-arrow @click-left="onClickLeft1" />
    </div>
    <div>
        <van-address-edit
        v-model="addressInfo"
  :area-list="areaList"
  :address-info="addressInfo"
  show-postal
  show-delete
  show-set-default
  show-search-result
  :search-result="searchResult"
  :area-columns-placeholder="['请选择', '请选择', '请选择']"
  @save="onSave"
  @delete="onDelete"
  @change-detail="onChangeDetail"
/>
    </div>
      </div>
  </div>
</template>
<script>
import areaList from '../assets/js/area'
export default {
  data() {
    return {
        defaultAddressId: '1',
        list: [
        {
          id: '1',
          name: '张三',
          tel: '13000000000',
          address: '浙江省杭州市西湖区文三路 138 号东方通信大厦 7 楼 501 室',
          isDefault: true
        },
        {
          id: '2',
          name: '李四',
          tel: '1310000000',
          address: '浙江省杭州市拱墅区莫干山路 50 号',
          isDefault: false
        }
      ],
      disabledList: [
        {
          id: '3',
          name: '王五',
          tel: '1320000000',
          address: '浙江省杭州市滨江区江南大道 15 号',
          isDefault: false
        }
      ],
      addressInfo:{},
      editShow: false,
      areaList: areaList,
      searchResult: [
          {
              name: '张三',
              address: '学府大道9号'
          }
      ],
      title: ''
      
    }
    
  },
  methods: {
    onClickLeft() {
      this.$router.push('/setting')
    },
    onClickLeft1() {
      this.editShow = false
      this.addressInfo = []
    },
    addressAdd(){
        this.title = '新增地址'
        this.editShow = true
    },
    addressEdit(){
        this.title = '编辑地址'
        this.editShow = true
        this.addressInfo = {
        id: '1',
        name: '娟宝',
        tel: '15215086717',
        province: '重庆市',
        city: '重庆市',
        county: '合川区',
        addressDetail: '学府大道9号',
        areaCode: '500117',
        postalCode: '521520',
        isDefault: true
      }
        
    },
    onSave(content) {
      this.$toast('save');
      console.log(content)
 
    },
    onDelete() {
      this.$toast('delete');
    },
    onChangeDetail(val) {
      if (val) {
        this.searchResult = [
            {
          name: '黄龙万科中心',
          address: '杭州市西湖区'
        },
        {
            name:'宝龙广场',
            address: '重庆市合川区'
        },
        {
            name:'涉外商贸学院',
            address: '重庆市合川区'
        },
        {
            name:'重庆固高科技长江研究院',
            address: '重庆市永川区'
        }
        ];
      } else {
        this.searchResult = [];
      }
    }
  }
}
</script>
<style scoped>
.van-address-edit{
    text-align: left;
}
</style>