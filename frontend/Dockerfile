FROM nginx:alpine

# 1. 复制文件
COPY dist/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 2. 【新增】强制把权限改为 755 (所有人可读可执行)
RUN chmod -R 755 /usr/share/nginx/html