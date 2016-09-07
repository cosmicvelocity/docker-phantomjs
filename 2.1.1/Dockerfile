FROM ubuntu:14.04.5
MAINTAINER k01 <k01@white-wing.jp>

ENV DEBIAN_FRONTEND noninteractive
ENV PHANTOM_JS_VERSION 2.1.1
ENV IPAFONT_URL http://ipafont.ipa.go.jp/old/ipaexfont/IPAexfont00201.php
ENV IPAFONT_ARCHIVE_FOLDER_NAME IPAexfont00201

RUN echo 'deb http://archive.ubuntu.com/ubuntu/ trusty multiverse\n\
deb-src http://archive.ubuntu.com/ubuntu/ trusty multiverse\n\
deb http://archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse\n\
deb-src http://archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse\n\
deb http://archive.ubuntu.com/ubuntu/ trusty-updates multiverse\n\
deb-src http://archive.ubuntu.com/ubuntu/ trusty-updates multiverse' > /etc/apt/sources.list.d/multiverse.list

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    bison \
    build-essential \
    flex \
    fontconfig \
    g++ \
    git \
    gperf \
    libfontconfig1-dev \
    libfreetype6 \
    libicu-dev \
    libjpeg-dev \
    libpng-dev \
    libsqlite3-dev \
    libssl-dev \
    libx11-dev \
    libxext-dev \
    perl \
    python \
    ruby \
    unzip \
    wget && \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
    apt-get install -y ttf-mscorefonts-installer && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O /tmp/font.zip $IPAFONT_URL && \
    cd /tmp && \
    unzip font.zip && \
    cp $IPAFONT_ARCHIVE_FOLDER_NAME/*.ttf /usr/local/share/fonts/ && \
    fc-cache -fv && \
    rm -Rf /tmp/$IPAFONT_ARCHIVE_FOLDER_NAME && \
    rm -Rf /tmp/font.zip

RUN git clone git://github.com/ariya/phantomjs.git /tmp/phantomjs && \
    cd /tmp/phantomjs && \
    git checkout $PHANTOM_JS_VERSION && \
    git submodule init && \
    git submodule update && \
    python build.py --release --confirm && \
    mv bin/phantomjs /usr/local/bin && \
    rm -rf /tmp/phantomjs

ENTRYPOINT ["/usr/local/bin/phantomjs"]
