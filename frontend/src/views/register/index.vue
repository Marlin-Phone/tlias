<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { registerApi } from '@/api/register'

const router = useRouter()

const registerFormRef = ref()
const registerForm = ref({
  username: '',
  name: '',
  gender: 1,
  phone: '',
  password: '',
  confirmPassword: ''
})

const validateConfirmPassword = (rule, value, callback) => {
  if (value === '') {
    callback(new Error('请再次输入密码'))
  } else if (value !== registerForm.value.password) {
    callback(new Error('两次输入的密码不一致'))
  } else {
    callback()
  }
}

const rules = {
  username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  name: [{ required: true, message: '请输入姓名', trigger: 'blur' }],
  gender: [{ required: true, message: '请选择性别', trigger: 'change' }],
  phone: [
    { required: true, message: '请输入手机号', trigger: 'blur' },
    { pattern: /^1\d{10}$/, message: '手机号格式错误', trigger: 'blur' }
  ],
  password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
  confirmPassword: [{ validator: validateConfirmPassword, trigger: 'blur' }]
}

const register = async () => {
  registerFormRef.value.validate(async (valid) => {
    if (!valid) return
    const payload = {
      username: registerForm.value.username,
      name: registerForm.value.name,
      gender: registerForm.value.gender,
      phone: registerForm.value.phone,
      password: registerForm.value.password
    }
    const result = await registerApi(payload)
    if (result.code) {
      ElMessage.success('注册成功，请登录')
      router.push('/login')
    } else {
      ElMessage.error(result.msg)
    }
  })
}

// const clear = () => {
//   registerForm.value = {
//     username: '',
//     name: '',
//     gender: 1,
//     phone: '',
//     password: '',
//     confirmPassword: ''
//   }
//   registerFormRef.value?.clearValidate()
// }

const toLogin = () => {
  router.push('/login')
}
</script>

<template>
  <div id="container">
    <div class="register-form">
      <el-form ref="registerFormRef" :model="registerForm" :rules="rules" label-width="90px">
        <p class="title">Tlias注册</p>
        <el-form-item label="用户名" prop="username">
          <el-input v-model="registerForm.username" placeholder="请输入用户名"></el-input>
        </el-form-item>

        <el-form-item label="姓名" prop="name">
          <el-input v-model="registerForm.name" placeholder="请输入姓名"></el-input>
        </el-form-item>

        <el-form-item label="性别" prop="gender">
          <el-radio-group v-model="registerForm.gender">
            <el-radio :label="1">男</el-radio>
            <el-radio :label="2">女</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="手机号" prop="phone">
          <el-input v-model="registerForm.phone" placeholder="请输入手机号"></el-input>
        </el-form-item>

        <el-form-item label="密码" prop="password">
          <el-input
            type="password"
            v-model="registerForm.password"
            placeholder="请输入密码"
          ></el-input>
        </el-form-item>

        <el-form-item label="确认密码" prop="confirmPassword">
          <el-input
            type="password"
            v-model="registerForm.confirmPassword"
            placeholder="请再次输入密码"
          ></el-input>
        </el-form-item>

        <el-form-item>
          <el-button class="button" type="primary" @click="register">注 册</el-button>
          <!-- <el-button class="button" type="info" @click="clear">重 置</el-button> -->
          <el-button class="button" type="success" @click="toLogin">去登录</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<style scoped>
#container {
  padding: 10%;
  height: 520px;
  background-image: url('../../assets/bg1.jpg');
  background-repeat: no-repeat;
  background-size: cover;
}

.register-form {
  max-width: 420px;
  padding: 30px;
  margin: 0 auto;
  border: 1px solid #e0e0e0;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  background-color: white;
}

.title {
  font-size: 30px;
  font-family: '楷体';
  text-align: center;
  margin-bottom: 30px;
  font-weight: bold;
}

.button {
  margin-top: 30px;
  width: 120px;
}
</style>
