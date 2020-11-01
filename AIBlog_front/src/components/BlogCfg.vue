<template>
  <el-card style="width: 500px" v-loading="loading">
    <div>
      <div style="text-align: left">
        <el-form :model="emailValidateForm" label-position="top" ref="emailValidateForm"
                 style="color:#20a0ff;font-size: 14px;">
          <el-form-item
            prop="email"
            label="Enable the notifications of comments"
            :rules="[{type: 'email', message: 'Wrong email address formats!'}]">
            <el-input type="email" v-model.email="emailValidateForm.email" auto-complete="off" style="width: 300px"
                      placeholder="Please enter email address..." size="mini"></el-input>
            <el-button type="primary" @click="submitForm('emailValidateForm')" size="mini">OK</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </el-card>
</template>
<script>
  import {getRequest} from '../utils/api'
  import {putRequest} from '../utils/api'
  export default{
    data(){
      return {
        emailValidateForm: {
          email: ''
        },
        loading: false
      }
    },
    mounted: function () {
      var _this = this;
      getRequest("/currentUserEmail").then(resp=> {
        if (resp.status == 200) {
          _this.emailValidateForm.email = resp.data;
        }
      });
    },
    methods: {
      submitForm(formName) {
        var _this = this;
        this.$refs[formName].validate((valid) => {
          if (valid) {
            _this.loading = true;
            putRequest("/updateUserEmail", {email: _this.emailValidateForm.email}).then(resp=> {
              _this.loading = false;
              if (resp.status == 200) {
                _this.$message({type: resp.data.status, message: resp.data.msg});
              } else {
                _this.$message({type: 'error', message: 'Enable failed!'},{
                  confirmButtonText: 'OK',
                  type: 'warning'
                } );
              }
            }, resp=> {
              _this.loading = false;
              _this.$message({type: 'error', message: 'Enable failed!'},{
                confirmButtonText: 'OK',
                type: 'warning'
              } );
            });
          } else {
            _this.$message({type: 'error', message: 'Wrong email address format!'}),{
              confirmButtonText: 'OK',
              type: 'warning'
            }
            return false;
          }
        });
      }
    }
  }
</script>
