FROM debian:9

RUN useradd -ms /bin/bash 7d2d && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
            apt-utils \
            build-essential \
            wget \
            curl \
            wget \
            file \
            bzip2 \
            gzip \
            unzip \
            bsdmainutils \
            python \
            util-linux \
            ca-certificates \
            binutils \
            bc \
            util-linux \
            lib32gcc1 \
            lib32z1 \
            libstdc++6 \
            libstdc++6:i386

USER 7d2d

RUN mkdir /home/7d2d/steamcmd && \
    mkdir /home/7d2d/pz-server && \
    cd /home/7d2d/steamcmd && \
    wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz && \
    tar xzvf steamcmd_linux.tar.gz && \
    ./steamcmd.sh +login anonymous \
                  +force_install_dir /home/7d2d/7d2d-server \
                  +app_update 294420 validate \
                  +quit


CMD ["/home/7d2d/7d2d-server/7DaysToDieServer.x86_64", "-configfile=/home/7d2d/7d2d-server/serverconfig.xml"]
