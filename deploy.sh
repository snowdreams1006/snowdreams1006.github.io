#!/bin/bash

# pull latest 
git pull

# remove cache dir
rm -rf _book/

# use gitbook nodejs,only for myself
nvm use v8.17.0 

# generate docs 
gitbook build

# copy to docs
cp -rf _book/* .

# add commits
git add .

# commit 
git commit -m "auto deploy website"

# push to github and others
git push origin master

# push to server,only for myself
scp -r _book/* sn:~/blog