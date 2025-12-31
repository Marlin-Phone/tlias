<script setup>
import { onMounted, ref } from 'vue'
import { queryPageApi } from '@/api/log'

//列表展示数据
let tableData = ref([])

//钩子函数 - 页面加载时触发
onMounted(() => {
  queryPage()
})

//分页组件
const pagination = ref({ currentPage: 1, pageSize: 15, total: 0 })
const isLoading = ref(false)
const lastQuery = ref({ page: null, pageSize: null })
//每页展示记录数发生变化时触发
const handleSizeChange = (pageSize) => {
  pagination.value.pageSize = pageSize
  pagination.value.currentPage = 1
  queryPage(1, pageSize)
}
//当前页码发生变化时触发
const handleCurrentChange = (page) => {
  pagination.value.currentPage = page
  queryPage(page, pagination.value.pageSize)
}

//分页条件查询
const queryPage = async (pageArg, pageSizeArg) => {
  const page = pageArg ?? pagination.value.currentPage
  const size = pageSizeArg ?? pagination.value.pageSize

  // 避免重复或并发请求：相同参数或请求中则直接返回
  if (isLoading.value) return
  if (lastQuery.value.page === page && lastQuery.value.pageSize === size) return

  isLoading.value = true
  try {
    const result = await queryPageApi(page, size)

    if (result.code) {
      tableData.value = result.data.rows
      // 直接使用后端返回的总条数
      pagination.value.total = result.data.total
      lastQuery.value = { page, pageSize: size }
    }
  } finally {
    isLoading.value = false
  }
}
</script>

<template>
  <!-- 顶部标题 -->
  <div>
    <div id="title">日志管理</div>
    <br />
  </div>

  <!-- 列表展示 -->
  <el-table :data="tableData" border style="width: 100%" fit size="small">
    <el-table-column prop="operateEmpName" label="操作人" align="center" width="80px" />
    <el-table-column prop="operateTime" label="操作时间" align="center" width="150px" />
    <el-table-column prop="className" label="类名" align="center" width="300px" />
    <el-table-column prop="methodName" label="方法名" align="center" width="100px" />
    <el-table-column prop="costTime" label="操作耗时(ms)" align="center" width="100px" />
    <el-table-column prop="methodParams" label="请求参数" align="center" width="280px">
      <template #default="scope">
        <el-popover
          effect="light"
          trigger="hover"
          placement="top"
          width="auto"
          popper-style="font-size:12px"
        >
          <template #default>
            <div>参数: {{ scope.row.methodParams }}</div>
          </template>
          <template #reference>
            <el-tag v-if="scope.row.methodParams.length <= 30">{{ scope.row.methodParams }}</el-tag>
            <el-tag v-else>{{ scope.row.methodParams.substring(0, 30) + '...' }}</el-tag>
          </template>
        </el-popover>
      </template>
    </el-table-column>
    <el-table-column prop="returnValue" label="返回值" align="center"></el-table-column>
  </el-table>
  <br />

  <!-- 分页组件Pagination -->
  <el-pagination
    v-model:current-page="pagination.currentPage"
    v-model:page-size="pagination.pageSize"
    :page-sizes="[10, 15, 20, 50, 100]"
    layout="total, sizes, prev, pager, next, jumper"
    :total="pagination.total"
    @size-change="handleSizeChange"
    @current-change="handleCurrentChange"
  />
</template>

<style scoped>
#title {
  font-size: 20px;
  font-weight: 600;
}
</style>
