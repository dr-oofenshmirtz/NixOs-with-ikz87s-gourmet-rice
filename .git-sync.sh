#auto backup git

git pull
git commit -am "auto-$EPOCHSECONDS"
git push
