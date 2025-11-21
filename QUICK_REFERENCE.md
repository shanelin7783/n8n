# ⚡ n8n 開發環境快速參考

> 常用指令速查表

## 🚀 啟動服務

```bash
cd <your-n8n-project-path>  # 切換到你的 n8n 專案目錄
./dev-start.sh
```

## 🛑 停止服務

```bash
pkill -f "nodemon.*n8n" && pkill -f "vite.*8080"
```

## 🌐 訪問地址

- **開發界面**：http://localhost:8080 ⭐ (推薦)
- **後端 API**：http://localhost:5678

## 📋 查看日誌

```bash
# 後端
tail -f /tmp/n8n-backend.log

# 前端
tail -f /tmp/n8n-frontend.log

# 同時查看
tail -f /tmp/n8n-backend.log /tmp/n8n-frontend.log
```

## 🔍 檢查服務狀態

```bash
# 檢查端口
lsof -i :5678  # 後端
lsof -i :8080  # 前端

# 測試 API
curl http://localhost:5678/healthz
```

## 🔧 常用除錯

```bash
# 查看 Node.js 版本
node --version  # 需要 >= v22.16.0

# 查看 pnpm 版本
pnpm --version  # 需要 >= 10.22.0

# 重新安裝依賴
cd <your-n8n-project-path>  # 切換到你的 n8n 專案目錄
pnpm clean && pnpm install && pnpm build
```

## 🗂️ 文檔索引

| 文檔 | 用途 |
|------|------|
| **[RESTART_GUIDE.md](RESTART_GUIDE.md)** | 重啟完整指南（詳細版） |
| **[LOCAL_DEV.md](LOCAL_DEV.md)** | 初次設置完整流程 |
| **[DEV_COMPLETE.md](DEV_COMPLETE.md)** | 設置完成報告 |
| **[QUICK_REFERENCE.md](QUICK_REFERENCE.md)** | 本文檔（速查版） |

## 👤 測試賬號

- **Email**: `dev@example.com`
- **Password**: `DevPassword123`
- **First Name**: `Dev`
- **Last Name**: `User`

## 💡 Shell 別名（可選）

將以下內容加入 `~/.zshrc` 或 `~/.bashrc`（記得替換 `<your-n8n-project-path>` 為實際路徑）：

```bash
alias n8n-start='cd <your-n8n-project-path> && ./dev-start.sh'
alias n8n-stop='pkill -f "nodemon.*n8n" && pkill -f "vite.*8080"'
alias n8n-logs='tail -f /tmp/n8n-backend.log /tmp/n8n-frontend.log'
```

重新加載：`source ~/.zshrc`

## 🎯 最常用的 3 個指令

```bash
# 1. 啟動
./dev-start.sh

# 2. 查看日誌
tail -f /tmp/n8n-backend.log

# 3. 停止
pkill -f "nodemon.*n8n" && pkill -f "vite.*8080"
```

---

**需要詳細說明？查看 [RESTART_GUIDE.md](RESTART_GUIDE.md)** 📖

