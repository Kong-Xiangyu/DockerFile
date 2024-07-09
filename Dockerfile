# 使用 Ubuntu 基础镜像
FROM ubuntu:20.04

# 安装 wget、unzip 和 gettext-base（用于envsubst）
RUN apt-get update && apt-get install -y wget unzip gettext-base

# 设置工作目录
WORKDIR /app

# 复制 .env 文件到容器中
# COPY .env /app/.env

# 设置环境变量
# ENV $(cat .env | xargs)

# 下载zip文件
# 请将 URL 替换为实际的下载链接
RUN wget -O server.zip https://github.com/Kong-Xiangyu/QtScrcpy_18_04/releases/download/v0.1/NothingServer.zip
# RUN wget -O server.zip $DOWNLOAD_URL

# 解压zip文件
RUN unzip server.zip

# 假设解压后的可执行文件名为 your_executable
# 设置可执行权限
RUN chmod +x palaude

# 清理：删除zip文件和.env文件（可选）
# RUN rm file.zip .env

# 设置容器启动时运行的命令
CMD ["./palaude"]
