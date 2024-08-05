#!/bin/bash

# cd snowdreams1006.github.io
cd ../snowdreams1006.github.io

# pull latest 
git pull
# add commits
git add .
# commit 
git commit -m "auto deploy website"
# push to github and others
git push

# copy to blog
cp -rf assets/picgo/* ../blog/assets/picgo

# cd blog
cd ../blog

# pull latest 
git pull

# generate docs 
gitbook build

# push to blog.snowdreams1006.cn
scp -r _book/* ali:~/nginx/html/blog

# copy to snowdreams1006.github.io
cp -rf _book/* ../snowdreams1006.github.io

# add commits
git add .

# commit 
git commit -m "build website and update"

# push to github and others
git push

# cd snowdreams1006.github.io
cd ../snowdreams1006.github.io

# pull latest 
git pull
# add commits
git add .
# commit 
git commit -m "auto deploy website"
# push to github and others
git push

# cd blog
cd ../blog

