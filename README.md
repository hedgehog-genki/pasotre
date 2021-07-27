開発の流れ

https://qiita.com/siida36/items/880d92559af9bd245c34

まずは main に戻る

```
git checkout main
```

リモートリポジトリの最新状態を反映

```
git pull
```

開発するにあたり新しいブランチを切る

```
git checkout -b feature/xxxx
```

反映

```
git add .
git commit -m "[add] #1 xxxxxxxxxx"
```
コミット種別は fix, add, update, remove のどれか

レビューしてもらうためにリモートリポジトリへ push
```
git push origin feature/xxxx
```
これで PR を出したり、他の人がコードを確認できるようになる
※絶対に main ブランチへいきなり push しないように!


PR を出す

1.Reviewerを指定する
2.タイトルを「[ブランチ名] 要約」とする
3.最低限の概要とmergeを受け入れる条件を書く
4.[Create pull request]を押す

PR を受け入れる

merge してもよいと判断したら "+1" とコメントして Approve

最後にmasterブランチへmerge
PRの[Conversation]タブを開き、一番下の[Squash and merge]をクリックしてください。[Squash and merge]がない場合は、▼を押してプルダウンから選択してください。



-----------------------
docker-compose run app rails db:migrate
docker-compose run app rails db:seed
docker-compose run app yarn add jquery popper.js