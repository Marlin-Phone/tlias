import request from "@/utils/request";

//注册
export const registerApi = (data) => request.post("/register", data);
