# 叮噹醫師 Claude Skills

叮噹醫師一人公司的 Claude 客製化 skills 備份庫，用於筆電（Portable）與桌機之間同步。

## 內容

9 個客製 skills（不含 Anthropic 預設的 docx / pptx / pdf / xlsx / schedule 等）：

| Skill | 用途 |
|---|---|
| `drtingtang` | 品牌核心記憶庫 |
| `9s-course` | 9S 長壽佈局課程資料庫 |
| `seo-article` | SEO 長文寫作系統 |
| `emily` | 商務合作 Agent |
| `michelle-marketing-strategist` | 行銷戰略師 |
| `martin-ads-specialist` | 廣告投手 |
| `biliang-social-cn` | 華文社群經理 |
| `yixuan-content-cn` | 華文內容策略師 |
| `david-brand-guardian` | 品牌守護者 |

## 筆電第一次 push

```bash
cd drtingtang-skills-repo
bash push-to-github.sh   # 會引導你輸入 GitHub repo URL
```

## 桌機安裝

```bash
git clone <your-repo-url> drtingtang-skills-repo
cd drtingtang-skills-repo
bash install.sh
```

安裝腳本會把 `skills/` 下的所有子資料夾複製到 `~/.claude/skills/`，Claude Code 重啟後就能自動讀取。

## 之後的日常同步

```bash
# 在哪一邊改了就在哪一邊 push
git add skills/
git commit -m "update: <skill-name>"
git push

# 另一台同步
git pull
bash install.sh    # 重新覆蓋到 ~/.claude/skills/
```
