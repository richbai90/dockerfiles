FROM debian:jessie-backports

ARG UID=1000
ARG GID=1000

ENV Q_INST_DIR=/opt/intelFPGA_lite/20.1

ENV QUARTUS_ROOTDIR=${Q_INST_DIR}/quartus
ENV SOPC_KIT_NIOS2=${Q_INST_DIR}/nios2eds

ENV PATH=${Q_INST_DIR}/quartus/sopc_builder/bin/:$PATH
ENV PATH=${Q_INST_DIR}/quartus/bin/:$PATH
ENV PATH=${Q_INST_DIR}/nios2eds/:$PATH
ENV PATH=${Q_INST_DIR}/nios2eds/bin/:$PATH
ENV PATH=${Q_INST_DIR}/nios2eds/sdk2/bin/:$PATH
ENV PATH=${Q_INST_DIR}/nios2eds/bin/gnu/H-x86_64-pc-linux-gnu/bin/:$PATH
ENV PATH=${Q_INST_DIR}/quartus/linux64/gnu/:$PATH


# basic packages
RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list && \
    echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list && \
    sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/100disablechecks && \
    apt-get update && apt-get -y install expect locales curl libtcmalloc-minimal4 libglib2.0-0 default-jre git build-essential autotools-dev autoconf automake pkg-config zip unzip \
    lib32ncurses5 && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8
RUN curl -sOL http://ftp.debian.org/debian/pool/main/x/xft/libxft-dev_2.3.2-1_amd64.deb | \
    dpkg -i libxft-dev_2.3.2-1_amd64.deb || apt-get -fy install
# adding scripts
ADD files/ /

# install quartus prime
# 19.1.0 http://download.altera.com/akdlm/software/acdsinst/19.1std/670/ib_tar/Quartus-lite-19.1.0.670-linux.tar
RUN mkdir -p /root/quartus && \
    cd /root/quartus && \
    curl -sOL http://download.altera.com/akdlm/software/acdsinst/20.1std/711/ib_tar/Quartus-lite-20.1.0.711-linux.tar && \
    tar xvf Quartus-lite-20.1.0.711-linux.tar && \
    /root/setup 20.1 && rm -rf /root/quartus && rm -rf /root/setup*

# Install ctags for use with vscode
RUN git clone https://github.com/universal-ctags/ctags.git && \
    cd ctags && \ 
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

# Install svls for use with vscode
RUN curl -sOL https://github.com/dalance/svls/releases/download/v0.2.5/svls-v0.2.5-x86_64-lnx.zip && \
    unzip svls-v0.2.5-x86_64-lnx.zip && \
    mv ./svls /usr/local/bin && \
    chmod +x /usr/local/bin/svls && \
    rm svls*

# Update permissions
# Create quartus user
# Install 32bit libs for modelsim
RUN chmod -R 755 /opt/intelFPGA_lite/ && \
    useradd -u ${UID} -m -s /bin/bash quartus && \
    dpkg --add-architecture i386 && apt-get update && \
    curl -O http://ftp.us.debian.org/debian/pool/main/libx/libxext/libxext6_1.3.3-1_i386.deb; \
    dpkg --install libxext6_1.3.3-1_i386.deb; \
    curl -O http://ftp.us.debian.org/debian/pool/main/libx/libxext/libxext-dev_1.3.3-1_i386.deb; \
    dpkg --install libxext-dev_1.3.3-1_i386.deb; \
    apt-get install -yf && \
    apt-get install -y libxft-dev:i386 libstdc++6:i386 && \
    rm *.deb

ENV PATH=/opt/intelFPGA_lite/20.1/modelsim_ase/bin/:$PATH
ENV LC_ALL="en_US.UTF-8"
RUN echo "env LD_LIBRARY_PATH=/opt/intelFPGA_lite/20.1/quartus/linux64/ LD_PRELOAD=/usr/lib/libtcmalloc_minimal.so.4 quartus" > /usr/bin/verilog && chmod +x /usr/bin/verilog
USER quartus
WORKDIR /home/quartus
VOLUME /home/quartus
CMD verilog
