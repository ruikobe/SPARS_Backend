<template>
  <el-row class="container">
    <el-col :span="12" class="header">
      <div class="title">SPARS - AI based stock prediction system</div>
    </el-col>
    <el-col :span="12" class="header">
      <div class="userinfoContainer">
        <el-dropdown @command="handleCommand">
  <span class="el-dropdown-link userinfo">
    {{currentUserName}}<i class="el-icon-arrow-down el-icon--right userinfo"></i>
  </span>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item command="sysMsg">System Message</el-dropdown-item>
            <el-dropdown-item command="MyArticle">History Results</el-dropdown-item>
            <el-dropdown-item command="MyHome">My Stocks</el-dropdown-item>
            <el-dropdown-item command="logout" divided>Logout</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </el-col>
    <el-col :span="24" style="height: 100%;">
      <el-container>
        <el-aside width="200px">
          <el-menu
            default-active="0"
            class="el-menu-vertical-demo" style="background-color: rgba(0, 0, 0, 0.08)">
            <el-submenu index="1">
              <template slot="title">
                <i class="el-icon-location"></i>
                <span>Nav</span>
              </template>
              <el-menu-item index="1-1" style="background-color: rgba(0, 0, 0, 0.04)">Option1</el-menu-item>
              <el-menu-item index="1-2" style="background-color: rgba(0, 0, 0, 0.04)">Option2</el-menu-item>
              <el-menu-item index="1-3" style="background-color: rgba(0, 0, 0, 0.04)">Option3</el-menu-item>
            </el-submenu>
            <el-menu-item index="2">
              <i class="el-icon-menu"></i>
              <span slot="title">Nav2</span>
            </el-menu-item>
            <el-menu-item index="3">
              <i class="el-icon-setting"></i>
              <span slot="title">Nav3</span>
            </el-menu-item>
          </el-menu>
        </el-aside>
        <el-main>
          <router-view></router-view>
        </el-main>
      </el-container>
    </el-col>
  </el-row>
</template>
<script>
  export default{
    methods: {
      handleCommand(command){
        var _this = this;
        if (command == 'logout') {
          this.$confirm('Logout?', 'Warning', {
            confirmButtonText: 'Confirm',
            cancelButtonText: 'Cancel',
            type: 'warning'
          }).then(function () {
            _this.$http.get("/logout");
            _this.currentUserName = 'Guest';
            _this.$router.replace({path: '/'});
          }, function () {
            //取消
          })
        }
      }
    },
    mounted: function () {
      this.$http.get("/currentUserName").then(function (msg) {
        this.currentUserName = msg.bodyText;
      }, function (msg) {
        this.currentUserName = 'Guest';
      });
    },
    data(){
      return {
        currentUserName: ''
      }
    }
  }
</script>
<style>
  .container {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    background-color: rgba(235, 235, 235, 0.08);
  }

  .header {
    background-color: #20a0ff;
    height: 60px;
  }

  .title {
    color: #fff;
    font-size: 22px;
    display: flex;
    align-items: center;
    margin-left: 20px;
    height: 60px;
  }

  .userinfo {
    color: #fff;
    cursor: pointer;
  }

  .userinfoContainer {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    height: 60px;
    margin-right: 20px;
  }
</style>
