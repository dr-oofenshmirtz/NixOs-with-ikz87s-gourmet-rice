#auto backup git

git pull
git commit -am "auto-$EPOCHSECONDS"
git push

(echo "$EPOCHSECONDS") > ~/.git-sync-last-run.txt

