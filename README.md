# Gemini 2.0 代理

使用 Deno 免费代理 Google Gemini，兼容 OpenAI 格式，可对接 ChatBox、Cherry Studio、Cursor、Cline 等 AI 客户端。

## 重要说明：Deno Deploy 可能无法访问

由于国内运营商（如移动、联通）可能封锁 `*.deno.dev` 域名，以及 Deno Deploy 偶发分配到香港节点（香港无法访问 Gemini API），**Deno 在线部署在国内可能不稳定或完全失效**。

**推荐方案：在海外 VPS（如新加坡、日本）上使用 Docker 本地部署。**

## 本地部署（推荐）

> 在海外服务器上部署，国内通过该服务器访问 Gemini API。

```bash
# 1. 克隆项目
git clone https://github.com/trueai-org/gemini.git
cd gemini

# 2. 给部署脚本执行权限
chmod +x deploy.sh

# 3. 运行部署
./deploy.sh
```

部署完成后：
- 健康检查：`curl http://你的服务器IP:8001/health`
- API 地址：`http://你的服务器IP:8001/v1/chat/completions`
- 在 Cherry Studio 等服务中填写上述地址，Token 填写你的 Gemini API Key

### 手动启动（调试）

```bash
deno run --allow-net --allow-read --allow-env src/deno_index.ts
```

## Deno 部署（可能受网络限制）

> 若 Deno 域名在国内无法访问，请改用上方 Docker 部署方案。

1. 免费创建一个 Gemini API Key [https://aistudio.google.com](https://aistudio.google.com/app/apikey)
2. 点击 [Fork](https://github.com/trueai-org/gemini/fork) 本项目
3. 登录/注册 Deno https://dash.deno.com/
4. 点击创建项目 https://dash.deno.com/new_project
5. 选择此项目，填写项目名字（分配域名）
6. 部署 Entrypoint 填写 `src/deno_index.ts`，其他字段留空
7. 点击 **Deploy Project**
8. 部署成功后获得域名，健康检查：`https://你的域名.deno.dev/health`
9. 下载安装 **[Cherry Studio](https://cherry-ai.com/)** -> 设置 -> 添加模型服务 -> 输入域名和 Token -> 添加模型 -> 开启 AI 会话

## Deno 安装

Windows:
```powershell
irm https://deno.land/install.ps1 | iex
```

Mac/Linux:
```bash
curl -fsSL https://deno.land/install.sh | sh
```

## 故障排查

| 现象 | 可能原因 | 解决方案 |
|------|----------|----------|
| 连接超时 | 运营商封锁 `*.deno.dev` | 改用 Docker 在海外 VPS 部署 |
| Cherry Studio 连通性失败 | Deno 分配到香港节点 | 重新部署或改用 Docker |
| 429 错误 | API 调用频率超限 | 等待后重试，免费账号 flash 模型每分钟 15 次 |
| 400 API key 无效 | Token 填写错误 | 确认填写的是 Gemini API Key，非其他密钥 |

## 分享

- [Midjourney API](https://github.com/trueai-org/midjourney-proxy)：免费开源绘图平台
- [MDrive](https://github.com/trueai-org/mdrive)：阿里云盘自动同步和备份工具

## 鸣谢

- https://github.com/tech-shrimp/gemini-playground
- https://github.com/PublicAffairs/openai-gemini
