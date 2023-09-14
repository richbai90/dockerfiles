FROM python:3.11-rc-bullseye

ENV WLAN wlo1
RUN apt update && \
    apt install -y git libpcap-dev \
    libev-dev \
    libnl-3-dev \
    libnl-genl-3-dev \
    libnl-route-3-dev \
    libarchive-dev \
    build-essential \
    cmake \
    wireless-tools \
    net-tools \
    iw \
    isc-dhcp-client \
    wpasupplicant && \
echo "export PATH=$PATH:/sbin" >> /etc/profile

RUN git clone https://github.com/seemoo-lab/owl.git && \
    cd owl && \
    git submodule update --init && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

RUN pip3 install opendrop
CMD "owl -i ${WLAN}"

