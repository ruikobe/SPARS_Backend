<template>
  <el-form :rules="rules" class="login-container" label-position="left"
           label-width="0px" v-loading="loading">
    <h3 class="login_title">SPARS Login</h3>
    <el-form-item prop="account">
      <el-input type="text" v-model="loginForm.username" auto-complete="off" placeholder="User Name"></el-input>
    </el-form-item>
    <el-form-item prop="checkPass">
      <el-input type="password" v-model="loginForm.password" auto-complete="off" placeholder="Password"></el-input>
    </el-form-item>
    <el-checkbox class="login_remember" v-model="checked" label-position="left">Remember password</el-checkbox>
    <!-- <el-button class="signin" type="text">Register</el-button> -->
    <el-link class="signin" v-on:click="Sign_In" type="primary">Register</el-link>
    <el-form-item style="width: 100%">
      <el-button type="primary" @click.native.prevent="submitClick" style="width: 100%">Login</el-button>
    </el-form-item>
  </el-form>
</template>
<script>
  import {postRequest} from '../utils/api'
  import {putRequest} from '../utils/api'
  export default{
    data(){
      return {
        rules: {
          account: [{required: true, message: 'Please enter the user name', trigger: 'blur'}],
          checkPass: [{required: true, message: 'Please enter the password', trigger: 'blur'}]
        },
        checked: true,
        loginForm: {
          username: '',
          password: ''
        },
        loading: false
      }
    },
    mounted: function (){
      var _this = this;
      _this.loginForm.username = _this.$route.query.username===undefined?"Rui":_this.$route.query.username;
      _this.loginForm.password = _this.$route.query.password===undefined?"123":_this.$route.query.password;
    },
    methods: {
      submitClick: function () {
        var _this = this;
        this.loading = true;
        postRequest('/login', {
          username: this.loginForm.username,
          password: this.loginForm.password
        }).then(resp=> {
          _this.loading = false;
          if (resp.status == 200) {
            //Success
            var json = resp.data;
            if (json.status == 'success') {
              _this.$router.replace({path: '/home'});
            } else {
              _this.$alert('Invalid username or password', 'Login Failed!',{
                confirmButtonText: 'OK',
                type: 'warning'
              } );
            }
          } else {
            //Failed
            _this.$alert('Invalid username or password', 'Login Failed!',{
              confirmButtonText: 'OK',
              type: 'warning'
            } );
          }
        }, resp=> {
          _this.loading = false;
          _this.$alert('Can not find the server⊙﹏⊙∥!', 'Login Failed!',{
            confirmButtonText: 'OK',
            type: 'warning'
          } );
        });
      },
      Sign_In:function(){
        var _this = this;
        _this.$router.replace({path: '/signin'});
      }
    }
  }
</script>
<style>
@import url("//unpkg.com/element-ui@2.8.2/lib/theme-chalk/index.css");
  .login-container {
    border-radius: 15px;
    background-clip: padding-box;
    margin: 180px auto;
    width: 350px;
    padding: 35px 35px 15px 35px;
    background: #fff;
    border: 1px solid #eaeaea;
    box-shadow: 0 0 25px #cac6c6;
  }

  .login_title {
    margin: 0px auto 40px auto;
    text-align: center;
    color: #505458;
  }

  .login_remember {
    margin: 0px 0px 35px 0px;
    text-align: left;
  }

.signin{
  margin: 0px 0px 2px 30px;
}
</style>
