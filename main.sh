#!/bin/bash

read -p "請輸入起始 commit SHA（例如 abc1234）: " commit_sha

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "❌ 請在 Git repository 裡執行此 script"
  exit 1
fi

if ! git rev-parse --quiet --verify "${commit_sha}^{commit}" > /dev/null; then
  echo "❌ 找不到 commit：${commit_sha}"
  exit 1
fi

prompt="請協助我審查這次的程式碼變更（使用 git diff ${commit_sha}~1..HEAD），請先列出你看了哪些 commit，再指出：
- 潛在錯誤或邏輯問題
- 命名與可讀性問題
- 程式結構是否清晰、是否符合良好設計原則
- 若有可重構處請提出具體建議
請條列列出建議，若能指出檔名與行數更佳。但不要直接根據建議修改"

gemini --yolo -p "$prompt"
