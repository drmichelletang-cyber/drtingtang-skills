#!/usr/bin/env bash
# 筆電第一次 push 到 GitHub 用的腳本
# 用法：bash push-to-github.sh

set -e

cd "$(dirname "$0")"

echo "=== 叮噹醫師 skills → GitHub ==="
echo ""

if [ -d .git ]; then
  echo "⚠️  偵測到已經有 .git 資料夾，這個腳本只給第一次 push 用。"
  echo "之後請直接用 git add / git commit / git push。"
  exit 1
fi

# 問 repo URL
read -rp "請貼上你在 GitHub 建立的空 repo URL（例如 git@github.com:你的帳號/drtingtang-skills.git）： " REPO_URL

if [ -z "$REPO_URL" ]; then
  echo "❌ 沒有輸入 URL，中止。"
  exit 1
fi

echo ""
echo "→ git init"
git init -b main

echo "→ git add ."
git add .

echo "→ git commit"
git commit -m "init: 叮噹醫師 Claude skills 第一次打包"

echo "→ git remote add origin $REPO_URL"
git remote add origin "$REPO_URL"

echo "→ git push"
git push -u origin main

echo ""
echo "✅ 完成！桌機現在可以 git clone 這個 repo 了。"
