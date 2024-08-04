#!/bin/bash

# python3 /Users/snowdreams1006/Documents/workspace/git/myserver/platform/mac/markdown-convert-image.py /Users/snowdreams1006/Documents/workspace/git/blog/GoAccess/GoAccess-issue.md

# pull latest 
git pull

# generate docs 
gitbook build

# push to blog.snowdreams1006.cn
scp -r _book/* ali:~/nginx/html/blog

# copy to snowdreams1006.github.io
cp -rf _book/* ../snowdreams1006.github.io

# cd snowdreams1006.github.io
cd ../snowdreams1006.github.io

# pull latest 
git pull origin master
# add commits
git add .
# commit 
git commit -m "auto deploy website"
# push to github and others
git pull origin master --force

# cd blog
cd ../blog

# add commits
git add .

# commit 
git commit -m "automatic update"

# push to github and others
git push