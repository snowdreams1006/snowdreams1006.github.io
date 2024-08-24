```bash
# markdown文件图片处理器
python3 /Users/snowdreams1006/Documents/workspace/git/myserver/python/markdown-convert-image.py /Users/snowdreams1006/Documents/workspace/git/blog/
winpty python /g/git/myserver/python/markdown-convert-image.py /g/git/blog/
```

```bash
scp -r *.html ali:~/nginx/html/blog
# https://blog.snowdreams1006.cn/google6d7287d38f6f92b5.html
```

```bash
# 查看公钥
cat ~/.ssh/id_rsa.pub

# 添加 Gitee 推送地址
git remote set-url --add origin git@gitee.com:snowdreams1006/snowdreams1006.git
# 添加 Gitlab 推送地址
git remote set-url --add origin git@gitlab.com:snowdreams1006/snowdreams1006.gitlab.io.git

% git remote -v
origin  git@github.com:snowdreams1006/snowdreams1006.github.io.git (fetch)
origin  git@github.com:snowdreams1006/snowdreams1006.github.io.git (push)
origin  git@gitee.com:snowdreams1006/snowdreams1006.git (push)
origin  git@gitlab.com:snowdreams1006/snowdreams1006.gitlab.io.git (push)
```