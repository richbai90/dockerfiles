FROM python:3
WORKDIR /root
RUN apt-get update && \
    apt-get install -y python3-pyqt5 \
    qttools5-dev-tools

ENTRYPOINT [ "designer" ]

