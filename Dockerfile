FROM python:3.9.13-slim

# 配置国内镜像源
RUN sed -i 's|http://deb.debian.org|http://mirrors.aliyun.com|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org|http://mirrors.aliyun.com|g' /etc/apt/sources.list

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/

# 安装 Playwright 及其依赖
RUN python -m playwright install --with-deps

# 设置环境变量
ENV HOST=0.0.0.0
ENV PORT=8888

# 启动应用
CMD ["python", "main.py"]
