#!/bin/bash

# 企业微信通知函数
send_wechat_notification() {
    local raw_message="$1"
    local message=$(printf "%b" "$raw_message")
    local webhook_url="https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=5d09f54c-84d2-4e22-9d8d-85c26746b2ed" 
    
    local payload=$(jq -n --arg msg "$message" '{"msgtype":"text","text":{"content":$msg}}')
    local response
    response=$(curl -s -w "\n%{http_code}" -X POST \
        -H "Content-Type: application/json" \
        -A "Mozilla/5.0 (Linux; Android 13; ANY-AN00 Build/HONORANY-AN00; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/122.0.6261.120 Mobile Safari/537.36 XWEB/1220053 MMWEBSDK/20240404 MMWEBID/2602 MicroMessenger/8.0.49.2600(0x2800313F) WeChat/arm64 Weixin NetType/5G Language/zh_CN ABI/arm64" \
        -d "$payload" \
        "$webhook_url"
    )
    
    response_body=$(sed '$ d' <<< "$response")
    http_code=$(sed -n '$ p' <<< "$response")
    
    if [ "$http_code" -ne 200 ]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: HTTP请求失败，状态码: $http_code" >&2
    else
        jq -r --arg timestamp "$(date '+%Y-%m-%d %H:%M:%S')" '
            if .errcode == 0 then
                "\($timestamp) INFO: 企业微信通知发送成功"
            else
                "\($timestamp) ERROR: 企业微信通知失败: \(.errmsg)"
            end
        ' <<< "$response_body" >&2
    fi
}

# --------------------------
# 1. 图片资源同步
# --------------------------
if [ -z "$1" ]; then
    # 优化：用rsync增量同步（优先），无rsync则用安全cp
    if command -v rsync >/dev/null 2>&1; then
        rsync -av --ignore-existing ../snowdreams1006.github.io/assets/picgo/ assets/picgo
    else
        mkdir -p assets/picgo
        cp -Rn ../snowdreams1006.github.io/assets/picgo/ assets/picgo
    fi
fi

# --------------------------
# 2. 提交本地修改到Git仓库
# --------------------------
git status
git pull
git add .

# 优化：仅当有文件变更时才提交
if ! git diff-index --quiet HEAD --; then
    git commit -m "upload changes"
    git push
else
    echo "没有文件变更，跳过提交"
fi
git status

# --------------------------
# 3. 完整发布流程（仅当无参数时执行）
# --------------------------
if [ -z "$1" ]; then
    # 生成GitBook文档
    gitbook build
    if [ $? -ne 0 ]; then
        echo "ERROR: GitBook构建失败"
        send_wechat_notification "$(uname -s)平台发布技术博客失败\n\n错误原因: GitBook构建失败"
        exit 1
    fi

    # 同步到服务器（优化：用rsync替代scp，支持增量同步）
    if command -v rsync >/dev/null 2>&1; then
        rsync -av _book/ al:/usr/share/nginx/html/blog
    else
        scp -r _book/* al:/usr/share/nginx/html/blog
    fi

    # 同步到GitHub Pages仓库
    if command -v rsync >/dev/null 2>&1; then
        rsync -av --delete --exclude '.git' --exclude 'CNAME' _book/ ../snowdreams1006.github.io
    else
        cp -rf _book/* ../snowdreams1006.github.io
    fi

    # 处理GitHub Pages仓库
    cd ../snowdreams1006.github.io || { echo "ERROR: 切换目录失败"; exit 1; }
    
    # 删除MD文件
    find . -type f -name "*.md" -not -path "./.git/*" -delete

    # 提交到GitHub
    git pull
    if ! git diff-index --quiet HEAD --; then
        git add .
        git commit -m "deploy website"
        git push
    else
        echo "GitHub Pages没有文件变更，跳过提交"
    fi
    git status

    # 返回原目录
    cd ../blog || exit 1

    # 发送成功通知
    send_wechat_notification "$(uname -s)平台发布技术博客成功\n\n国内访问: https://blog.snowdreams1006.cn/\n国际访问: https://snowdreams1006.github.io/"  
fi