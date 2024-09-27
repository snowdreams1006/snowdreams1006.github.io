#!/bin/bash

# copy to blog
cp -rf ../snowdreams1006.github.io/assets/picgo/* assets/picgo

# status latest 
git status
# pull latest
git pull
# add commits
git add .
# commit 
git commit -m "upload changes"
# push to github and others
git push
# status latest 
git status

# generate docs 
gitbook build

# push to blog.snowdreams1006.cn
scp -r _book/* ali:~/nginx/html/blog

# copy to snowdreams1006.github.io
cp -rf _book/* ../snowdreams1006.github.io

# cd snowdreams1006.github.io
cd ../snowdreams1006.github.io

# status latest 
git status
# pull latest
git pull
# add commits
git add .
# commit 
git commit -m "deploy website"
# push to github and others
git push
# status latest 
git status

# cd blog
cd ../blog

