#! /bin/bash

# remove cache dir
rm -rf _book/

# generate docs 
gitbook build 

# generate pdf/epub/mobi
# gitbook pdf ./ ./assets/output/snowdreams1006.pdf
# gitbook epub ./ ./assets/output/snowdreams1006.epub
# gitbook mobi ./ ./assets/output/snowdreams1006.mobi

# copy to docs
cp -rf _book/ .

# add commits
git add .

# commit 
git commit -m "auto deploy website"

# push to github and others
git push origin master