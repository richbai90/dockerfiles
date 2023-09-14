FROM debian:latest

# Install build tools
RUN apt-get update && \
    apt-get install -y cmake \ 
    build-essential \
    pkg-config \
    git

# Install libs
RUN apt-get install -y \
    libssl-dev \
    libplist-dev \
    libavahi-compat-libdnssd-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libx11-dev

# Build
RUN git clone https://github.com/antimof/UxPlay.git /root/uxplay && \
    mkdir /root/uxplay/build && \
    cd /root/uxplay/build && \
    cmake -DZOOMFIX=ON .. && \
    make && \
    make install

# Install gstreamer plugins
RUN apt-get install -y gstreamer1.0-plugins-base \
                       gstreamer1.0-libav \
                       gstreamer1.0-plugins-good \
                       gstreamer1.0-plugins-bad

# Enable the Avahi Daemon    
RUN apt-get install -y iproute2
