# 基础镜像，根据你的Java版本选，如果是Java 17就改 openjdk:17-jdk-alpine
FROM openjdk:17-jdk-alpine

# 把同目录下的 jar 包复制进去，改名为 app.jar
COPY *.jar app.jar

# 启动命令
# 这里的 -Xms256m -Xmx256m 是为了保护你的 2G 内存服务器不崩
ENTRYPOINT ["java", "-Xms256m", "-Xmx256m", "-jar", "/app.jar"]
