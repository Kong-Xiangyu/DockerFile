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
RUN wget -O server.zip https://github.com/wozulong/fuclaude/releases/download/v0.0.2/fuclaude-linux-amd64-63154a9.zip
# RUN wget -O server.zip $DOWNLOAD_URL

# 解压zip文件
RUN unzip -P linux.do server.zip
# 清理：删除zip文件和.env文件（可选）
RUN rm server.zip

# 创建一个脚本来打印文件结构并运行可执行文件
RUN echo '#!/bin/bash' > run.sh && \
    echo 'echo "File structure:"' >> run.sh && \
    echo 'if command -v tree > /dev/null; then' >> run.sh && \
    echo '    tree .' >> run.sh && \
    echo 'else' >> run.sh && \
    echo '    find . | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"' >> run.sh && \
    echo 'fi' >> run.sh && \
    echo 'echo "Running executable..."' >> run.sh && \
    echo 'cd '"$FOLDER_NAME"' && ./'"$EXECUTABLE_NAME" >> run.sh && \
    chmod +x run.sh

# 运行脚本
CMD ["./run.sh"]

RUN cd ./fuclaude-linux-amd64-63154a9

# 设置可执行权限
RUN chmod +x fuclaude

# 设置容器启动时运行的命令
CMD ["./fuclaude"]
