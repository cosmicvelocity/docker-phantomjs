# phantomjs
Unofficial [PhantomJS](http://phantomjs.org/) docker image.

## Install

    sudo curl -L https://raw.githubusercontent.com/cosmicvelocity/docker-phantomjs/2.1.1/script/run.sh > /usr/local/bin/docker-phantomjs
    sudo chmod +x /usr/local/bin/docker-phantomjs

    $ docker-phantomjs --version
    2.1.1

## How to use this image

    $ docker-phantomjs rasterize.js http://www.yahoo.co.jp/ test.jpg

## License
View license information for the software contained in this image.

- [PhantomJS](https://github.com/ariya/phantomjs/blob/master/LICENSE.BSD)
