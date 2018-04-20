# docker-misskey
国産SNS「Misskey」をDockerコンテナを使って動作させるためのファイル一式になります。  

# 使い方

* 参考)https://github.com/syuilo/misskey/blob/master/docs/setup.ja.md

## 1. ファイル一式を取得
```
$ git clone https://github.com/gittrname/docker-misskey.git
```

## 2. config/default.ymlを作成し編集する
```
$ cp config/example.yml config/default.yml
```
default.ymlの編集についてはhttps://github.com/syuilo/misskeyのドキュメントを見てください。

## 3. ビルドする
```
$ docker-compose build
```

## 4. 起動
```
$ docker-compose up -d
```

