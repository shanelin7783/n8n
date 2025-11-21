#!/bin/bash

# n8n 開發環境啟動腳本

echo "========================================="
echo "   n8n 開發環境啟動腳本"
echo "========================================="
echo ""

cd "$(dirname "$0")"

# 停止現有進程
echo "🧹 清理現有進程..."
pkill -f "nodemon.*n8n" || true
pkill -f "vite.*8080" || true
sleep 2

# 啟動後端
echo ""
echo "🚀 啟動後端 API 服務器..."
cd packages/cli
nohup pnpm dev > /tmp/n8n-backend.log 2>&1 &
BACKEND_PID=$!
echo "   PID: $BACKEND_PID"
echo "   日誌: tail -f /tmp/n8n-backend.log"

# 返回根目錄
cd ../..

# 等待後端啟動
echo ""
echo "⏳ 等待後端啟動（約 30 秒）..."
sleep 30

# 啟動前端
echo ""
echo "🎨 啟動前端開發服務器..."
cd packages/frontend/editor-ui
nohup pnpm dev > /tmp/n8n-frontend.log 2>&1 &
FRONTEND_PID=$!
echo "   PID: $FRONTEND_PID"
echo "   日誌: tail -f /tmp/n8n-frontend.log"

# 返回根目錄
cd ../../..

# 等待前端啟動
echo ""
echo "⏳ 等待前端啟動（約 15 秒）..."
sleep 15

# 檢查狀態
echo ""
echo "========================================="
echo "   服務狀態"
echo "========================================="
echo ""

if lsof -i :5678 > /dev/null 2>&1; then
    echo "✅ 後端 API:      http://localhost:5678"
else
    echo "❌ 後端 API: 未啟動"
fi

if lsof -i :8080 > /dev/null 2>&1; then
    echo "✅ 前端開發服務器: http://localhost:8080"
else
    echo "❌ 前端開發服務器: 未啟動"
fi

echo ""
echo "========================================="
echo "   開發提示"
echo "========================================="
echo ""
echo "• 訪問應用: http://localhost:8080"
echo "• 後端日誌: tail -f /tmp/n8n-backend.log"
echo "• 前端日誌: tail -f /tmp/n8n-frontend.log"
echo "• 前端修改會即時熱重載 🔥"
echo "• 後端修改會自動重啟服務器 🔄"
echo ""
echo "準備就緒！開始開發吧！🎉"
echo ""

