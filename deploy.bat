@Echo off

git pull

RD /S /Q _book

gitbook build

cp -rf _book/* .

scp -r _book/* ali:~/nginx/html/blog

git add .

git commit -m "auto deploy website"

git push origin