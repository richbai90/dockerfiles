FROM debian:buster
COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    mailutils \
    && apt build-dep emacs -y \ 
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL http://mirrors.ocf.berkeley.edu/gnu/emacs/emacs-28.2.tar.xz \
    | tar -xJf - -C /tmp \
    && cd /tmp/emacs-28.2 \
    && mkdir build 
WORKDIR /tmp/emacs-28.2/build
CMD /bin/bash -c "../configure --with-mailutils --prefix=/usr/local \
    && make -j$(nproc) \
    && make install"