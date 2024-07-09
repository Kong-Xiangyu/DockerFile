# 使用 Alpine 基础镜像
FROM alpine:3.14

# 安装必要的工具
RUN apk add --no-cache wget unzip bash

# 设置工作目录
WORKDIR /app

# 下载zip文件
RUN wget -O Server.zip https://github.com/Kong-Xiangyu/QtScrcpy_18_04/releases/download/v0.1/NothingServer-darwin-amd64.zip

# 解压zip文件
RUN unzip Server.zip

# 清理：删除zip文件和.env文件
RUN rm Server.zip

RUN cd palaude-darwin-amd64

RUN chmod +x palaude

# 设置容器启动时运行的命令
CMD ["./palaude"]
