# FastAPI-Playwright

## 项目描述

本项目使用FastAPI和Playwright构建一个API服务，通过API请求实现网页自动化操作，包括内容抓取、搜索操作和截图功能。用户可以灵活配置抓取和操作选项，实现对网页的高效控制和数据提取，支持Windows、Linux使用。

## 主要功能

- **网页抓取**: 根据选择器抓取网页内容，包括标题、正文、日期等。
- **搜索操作**: 模拟网页中的搜索操作，自动填充搜索关键词并点击搜索按钮。
- **截图功能**: 对指定网页进行截图，并返回Base64编码的截图数据。

## 项目结构

```
FastAPI-Playwright/
├── Dockerfile           # Dockerfile文件
├── main.py              # 主程序入口
├── requirements.txt     # Python依赖文件
└── README.md            # 项目说明文件
```

## 安装

1. 克隆项目仓库:
    ```sh
    git clone https://github.com/xyuns-cn/FastAPI-Playwright.git
    cd FastAPI-Playwright
    ```

2. 安装依赖:
    ```sh
    pip install -r requirements.txt
    ```

3. 安装Playwright浏览器:
    ```sh
    playwright install
    ```

## 使用方法

启动服务:
```sh
python main.py
```

服务启动后，将在`http://0.0.0.0:8000`监听请求。

### 示例请求

发送POST请求到`/capture`，请求体示例如下：
```json
{
  "url": "https://example.com",
  "screenshot": true,
  "search_in": {
    "search": true,
    "search_input_selector": "#search",
    "search_button_selector": "#search-btn",
    "search_term": "example search"
  },
  "items_config": {
    "enabled": true,
    "item_selector": ".item",
    "title_selector": ".title",
    "date_selector": ".date"
  },
  "body_config": {
    "enabled": false,
    "body_selectors": ["#content"],
    "title_selectors": ["h1"],
    "date_selectors": [".date"]
  }
}
```
注：列表页和详情页不可同时采集。

### 环境变量

- `HOST`: 服务器主机地址，默认为`0.0.0.0`
- `PORT`: 服务器端口，默认为`8000`

