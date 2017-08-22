# phantomjs
Unofficial [phantomjs](http://phantomjs.org/) docker image.

## Install

    sudo curl -L https://raw.githubusercontent.com/cosmicvelocity/docker-phantomjs/2.1.1/script/run.sh > /usr/local/bin/docker-phantomjs
    sudo chmod +x /usr/local/bin/docker-phantomjs

    $ docker-phantomjs --version
    2.1.1

## How to use this image

    $ docker-phantomjs rasterize.js http://www.yahoo.co.jp/ test.jpg

## License
View license information for the software contained in this image.

- [IPAexフォント](http://ipafont.ipa.go.jp/ipa_font_license_v1-html)
- [noto-cjk](https://github.com/googlei18n/noto-cjk/blob/master/LICENSE)
- [TrueType core fonts for the Web EUL](http://www.microsoft.com/typography/fontpack/eula.htm) - http://www.microsoft.com/typography/fontpack/eula.htm
