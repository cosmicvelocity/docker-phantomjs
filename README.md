# docker-phantomjs

[phantomjs](http://phantomjs.org/) を実行する docker コンテナです。
日本語の描画も正常に行われます。

コンテナの構築時に ttf-mscorefonts-installer による Microsoft's TrueType Core Fonts の導入と、
IPAex フォントのダウンロードと組み込みが行われます。
そのため、構築済みのコンテナイメージは公開していません。

コンテナをビルドする際は各ライセンスをご確認ください。

- [IPAexフォント](http://ipafont.ipa.go.jp/) - http://ipafont.ipa.go.jp/
- [TrueType core fonts for the Web EUL](http://www.microsoft.com/typography/fontpack/eula.htm) - http://www.microsoft.com/typography/fontpack/eula.htm

## 例

    $ docker-phantomjs rasterize.js http://www.yahoo.co.jp/ test.jpg

## ドキュメント

### コンテナのビルド

    mkdir docker-phantomjs
    cd docker-phantomjs
    curl -L https://raw.githubusercontent.com/cosmicvelocity/docker-phantomjs/2.1.1/2.1.1/Dockerfile > Dockerfile
    docker build -t cosmicvelocity/phantomjs:2.1.1 .

### スクリプトのダウンロード

    sudo curl -L https://raw.githubusercontent.com/cosmicvelocity/docker-phantomjs/2.1.1/2.1.1/script/run.sh > /usr/local/bin/docker-phantomjs
    sudo chmod +x /usr/local/bin/docker-phantomjs

### 実行

    $ docker-phantomjs --version
    2.1.1
