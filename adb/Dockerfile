FROM debian:latest

LABEL \
name="ADB on Linux Host" \
author="Rich Baird" \
maintainer="Rich Baird <rich@rbaird.me>" \
description="ADB in Docker container on a Linux host machine."

ENV SRC_DIR=/root/
WORKDIR $SRC_DIR

RUN apt-get update -y && apt-get install -y --no-install-recommends adb  && apt-get install -y xz-utils zenity curl
RUN curl -sL https://github.com/mrhaydendp/fire-tools/releases/latest/download/Fire-Tools.tar.xz | tar -xJ && \
    echo "cd $SRC_DIR/Fire-Tools/ && ./ui.sh" > /usr/bin/firetools && chmod +x /usr/bin/firetools
CMD firetools

