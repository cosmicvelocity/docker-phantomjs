FROM ubuntu:16.04
MAINTAINER k01 <k-machida@aideo.co.jp>

ENV LANG en_US.UTF-8

ENV PHANTOM_JS_VERSION 2.1.1

RUN sed -i -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list \
    && sed -i -e "s%http://security.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list \
    \
    && apt-get update \
    && apt-get upgrade -y \
    \
    && apt-get install -y \
        bison \
        build-essential \
        flex \
        fontconfig \
        fonts-takao-gothic \
        fonts-takao-mincho \
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
        wget \
    \
    && fc-cache -fv \
    \
    && git clone git://github.com/ariya/phantomjs.git /tmp/phantomjs \
    && cd /tmp/phantomjs \
    && git checkout ${PHANTOM_JS_VERSION} \
    && git submodule init \
    && git submodule update \
    && python build.py --release --confirm \
    && mv bin/phantomjs /usr/local/bin \
    \
    && cd /tmp \
    && apt-get purge -y \
        bison \
        build-essential \
        flex \
        gperf \
        perl \
        python \
        ruby \
        unzip \
        wget \
    && apt-get purge -y \
        cpp \
        fakeroot \
        gcc \
        insserv \
        iproute2 \
        javascript-common \
        libperl5.22 \
        libpython2.7-minimal \
        libx11-doc \
        makedev \
        manpages \
        manpages-dev \
        netbase \
        openssh-client \
        python2.7-minimal \
        rsync \
        shared-mime-info \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && apt-get clean -y \
    \
    && rm -rf /tmp/phantomjs \
    && rm -rf /var/cache/debconf/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/dpkg/info/* \
    && rm -rf /var/log/*

ENTRYPOINT ["/usr/local/bin/phantomjs"]
