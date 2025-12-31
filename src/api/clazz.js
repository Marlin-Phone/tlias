// request 是对 axios 对象的封装
import request from "@/utils/request";

//查询全部班级
export const queryAllClazzApi = () => request.get("/clazzs/list");

//班级列表查询
export const queryPageApi = (name, begin, end, page, pageSize) => {
    const url = `/clazzs?name=${encodeURIComponent(name)}&begin=${encodeURIComponent(begin)}&end=${encodeURIComponent(end)}&page=${page}&pageSize=${pageSize}`;
    return request.get(url);
};

//新增
export const addApi = (clazz) => request.post("/clazzs", clazz);

//根据id查询班级
export const queryByIdApi = (id) => request.get(`/clazzs/${id}`);

//修改
export const updateApi = (clazz) => request.put("/clazzs", clazz);

//删除
export const deleteApi = (ids) => request.delete(`/clazzs?ids=${ids}`);
