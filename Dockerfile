# 使用 Python 3.9.13 作为基础镜像
FROM python:3.9.13-slim

# 配置国内镜像源
RUN sed -i 's|http://deb.debian.org|http://mirrors.aliyun.com|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org|http://mirrors.aliyun.com|g' /etc/apt/sources.list

# 设置工作目录并复制项目文件
WORKDIR /app
COPY . /app

# 安装 Python 依赖
RUN pip install --no-cache-dir -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/

# 安装 Playwright 及其依赖
RUN python -m playwright install --with-deps

# 启动应用
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8888"]
