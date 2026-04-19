#!/usr/bin/env bash
# 把 skills/ 底下的所有 skill 複製到 ~/.claude/skills/
# 桌機第一次 clone 下來後跑這個；之後每次 git pull 後也可以再跑一次來覆蓋更新。

set -e

cd "$(dirname "$0")"

TARGET="$HOME/.claude/skills"

echo "=== 叮噹醫師 skills 安裝 ==="
echo "來源：$(pwd)/skills"
echo "目標：$TARGET"
echo ""

if [ ! -d skills ]; then
  echo "❌ 找不到 skills/ 資料夾，確認你在 repo 根目錄跑這個腳本。"
  exit 1
fi

mkdir -p "$TARGET"

# 如果目標已經有同名 skill，先備份
BACKUP_DIR="$HOME/.claude/skills-backup-$(date +%Y%m%d-%H%M%S)"
NEED_BACKUP=0
for src in skills/*/; do
  name=$(basename "$src")
  if [ -d "$TARGET/$name" ]; then
    NEED_BACKUP=1
    break
  fi
done

if [ $NEED_BACKUP -eq 1 ]; then
  echo "⚠️  偵測到目標已有同名 skill，先備份到：$BACKUP_DIR"
  mkdir -p "$BACKUP_DIR"
  for src in skills/*/; do
    name=$(basename "$src")
    if [ -d "$TARGET/$name" ]; then
      cp -R "$TARGET/$name" "$BACKUP_DIR/"
    fi
  done
  echo ""
fi

# 複製
for src in skills/*/; do
  name=$(basename "$src")
  echo "→ 安裝 $name"
  rm -rf "$TARGET/$name"
  cp -R "$src" "$TARGET/$name"
done

echo ""
echo "✅ 完成！請重啟 Claude Code 讓它重新載入 skills。"
if [ $NEED_BACKUP -eq 1 ]; then
  echo "（舊版本已備份在 $BACKUP_DIR，確認沒問題後可以自行刪除）"
fi
