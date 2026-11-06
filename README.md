# Railway Xray (VLESS+WS+TLS) - 合规部署

已校验（2026-10-20）：entrypoint 替换 UUID/PORT/WS_PATH 后 config.json 为合法 JSON。
更正（2026-11-06）：Railway 网页后台没有直接上传 zip 的按钮，别在后台找 Upload。

## 两条路，二选一

### A. 电脑命令行（推荐，你熟 CLI）
在 Mac/电脑终端里，解压 xray-railway.zip 后：
```
cd xray-railway
npm i -g @railway/cli
railway login
railway init
railway up
```
`railway up` 会把当前文件夹打包上传部署。

### B. 走 GitHub（手机也能做，但多一步）
1. GitHub 新建仓库，把解压后的 5 个文件上传上去
2. Railway 点 New Project > Deploy from GitHub repo > 选这个仓库 > Deploy Now

## 部署后
Variables 设置：
- `UUID` = `9921e012-4da9-424c-8249-17504994a13f`
- `WS_PATH` = `/ws`
- PORT 不用填，Railway 自动注入
Settings > Networking > Generate Domain，生成 `*.up.railway.app` 域名（TLS 在 Railway 边缘终止）

把生成的域名发我，我立刻拨测 `curl -I https://<域名>/ws`（400/404 即通），再用 gen_sub.py 出 vless:// 链接 + 小火箭二维码。
