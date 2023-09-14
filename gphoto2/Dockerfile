FROM debian:buster

RUN apt-get update && apt-get install -y gphoto2 \
                                     python3 \
                                     python3-pip \
                                     libgphoto2-dev \
                                     build-essential \
                                     zlib1g-dev \
                                     libgl-dev \
                                     libxkbcommon0 \
                                     libxkbcommon-x11-0 \
                                     libxcb-randr0-dev \
                                     libxcb-xtest0-dev \
                                     libxcb-xinerama0-dev \
                                     libxcb-shape0-dev \
                                     libxcb-xkb-dev \
                                     libxcb-image0 \
                                     libxcb-keysyms1 \
                                     libxcb-render-util0 \
                                     libxcb-xkb1 \
                                     libxcb-icccm4-dev \
                                     curl

RUN curl -O http://ftp.de.debian.org/debian/pool/main/x/xcb-util/libxcb-util1_0.4.0-1+b1_amd64.deb && dpkg --install ./libxcb-util1_0.4.0-1+b1_amd64.deb
RUN pip3 install --upgrade pip 
RUN pip3 install --upgrade    gphoto2 \
                              tzlocal \
                              PyQt5 \
                              Pillow

COPY scripts /scripts/
ENV TZ "America/Denver"
