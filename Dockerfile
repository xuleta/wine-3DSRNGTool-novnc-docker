FROM ubuntu:jammy

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get -y install python3 python-is-python3 xvfb x11vnc wget supervisor unzip xdotool fluxbox xz-utils net-tools gnupg2 && \ 
    wget -nc -O /usr/share/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
    wget -nc -P /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources && \
    apt-get update && apt-get -y install winehq-devel && \
    mkdir /opt/wine-devel/share/wine/mono && wget -q -O - https://dl.winehq.org/wine/wine-mono/7.3.0/wine-mono-7.3.0-x86.tar.xz | tar -xJv -C /opt/wine-devel/share/wine/mono && \
    wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
    chmod +x winetricks && mv winetricks /usr/bin && \
    apt-get -y full-upgrade && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV WINEPREFIX /root/prefix32
ENV WINEARCH win32
ENV DISPLAY :0

WORKDIR /root/

RUN wget -O - https://github.com/novnc/noVNC/archive/refs/tags/v1.3.0.tar.gz | tar -xzv -C /root/ && mv /root/noVNC-1.3.0 /root/novnc && ln -s /root/novnc/vnc_lite.html /root/novnc/index.html && \
    wget -O - https://github.com/novnc/websockify/archive/refs/tags/v0.10.0.tar.gz | tar -xzv -C /root/ && mv /root/websockify-0.10.0 /root/novnc/utils/websockify && \
    wget https://github.com/wwwwwwzx/3DSRNGTool/releases/download/1.0.5/3DSRNGTool.exe && mkdir /root/3DSRNGTool && \
    winetricks cjkfonts

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080

CMD ["/usr/bin/supervisord"]