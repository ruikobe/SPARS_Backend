<template>
  <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px" class="sign_from">
    <el-form-item label="Username" prop="username">
      <el-input v-model="ruleForm.username"></el-input>
    </el-form-item>
    <el-form-item label="Name" prop="nickname">
      <el-input v-model="ruleForm.nickname"></el-input>
    </el-form-item>
    <el-form-item label="Password" prop="password">
      <el-input type="password" v-model="ruleForm.password" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="Confirm" prop="checkPass">
      <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="Email" prop="email">
      <el-input v-model="ruleForm.email"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="onSubmit">Register</el-button>
      <el-button @click="back" >Return</el-button>
    </el-form-item>
  </el-form>
</template>
<script>
import {postRequest} from '../utils/api'
import {putRequest} from '../utils/api'
export default{
  data() {
    var validatePass = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('Please enter password'));
      } else {
        if (this.ruleForm.checkPass !== '') {
          this.$refs.ruleForm.validateField('checkPass');
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('Please enter password again'));
      } else if (value !== this.ruleForm.password) {
        callback(new Error('Those passwords did not match. Try again.'));
      } else {
        callback();
      }
    };
    return {
      ruleForm: {
        username: '',
        nickname: '',
        password: '',
        checkPass:'',
        email: ''
      },
      rules: {
        username: [
          { required: true, message: 'Please enter user name', trigger: 'blur' },
          { min: 3, max: 64, message: 'Use 3 to 64 characters for your user name', trigger: 'blur' }
        ],
        nickname: [
          { required: true, message: 'Please enter your real name', trigger: 'blur' },
          { min: 1, max: 64, message: 'Use 1 to 64 characters', trigger: 'blur' }
        ],
        password: [
          { required: true,validator: validatePass, trigger: 'blur' },
          { min: 6, max: 64, message: 'Use 6 to 64 characters for your password', trigger: 'blur' }
        ],
        checkPass: [
          { required: true,validator: validatePass2, trigger: 'blur' },
          { min: 6, max: 64, message: 'Use 6 to 64 characters for your password', trigger: 'blur' }
        ],
        email:[
          { required: true, message: 'Please enter your email', trigger: 'blur' },
          { type: 'email', message: 'Please enter correct email address', trigger: ['blur', 'change'] },
        ]
      }
    }
  },
  methods: {
    onSubmit:function() {
      var _this = this;
      this.loading = true;
      //前台数据验证
      //...
      postRequest('/reg', {
        username:  _this.ruleForm.username,
        password: _this.ruleForm.password,
        nickname: _this.ruleForm.nickname,
        email: _this.ruleForm.email
      }).then(resp=> {
        _this.loading = false;
        if (resp.status == 200) {
          //Success
          var json = resp.data;
          if (json.status == 'success') {
            _this.$alert('Register successfully!', 'Success!',{
              confirmButtonText: 'OK',
              type: 'warning'
            } );
            _this.$router.replace({path: '/',query:{username:_this.ruleForm.username,password:_this.ruleForm.password}});
          } else {
            _this.$alert(json.msg, 'Failed!',{
              confirmButtonText: 'OK',
              type: 'warning'
            } );
          }
        } else {
          //Failed
          _this.$alert('Register Failed!', 'Failed!',{
            confirmButtonText: 'OK',
            type: 'warning'
          } );
        }
      }, resp=> {
        _this.loading = false;
        _this.$alert('Can not find server⊙﹏⊙∥!', 'Failed!',{
          confirmButtonText: 'OK',
          type: 'warning'
        } );
      });
    },
    back:function(){
      var _this = this;
      _this.$router.replace({path: '/'});
    }
  }
}
</script>
<style>
@import url("//unpkg.com/element-ui@2.8.2/lib/theme-chalk/index.css");

.sign_from{
  padding-left: 33%;
  height: 400px;
  width: 30%;
}
</style>
