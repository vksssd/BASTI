FROM ubuntu:latest

COPY basti.png /usr/share/icons/elementary/places/89/folder.png

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
       software-properties-common \
       wget \
    && add-apt-repository -y ppa:elementary-os/stable \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        elementary-desktop \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/Pantheon/BASTI/' /etc/xdg/autostart/gala.desktop \
    && sed -i 's/Pantheon/BASTI/' /usr/share/applications/io.elementary.gala.desktop 

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

WORKDIR /root

CMD ["startx"]