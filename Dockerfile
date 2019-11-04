FROM debian:10.1-slim

RUN sed -i -e 's/main$/main contrib non-free/g' /etc/apt/sources.list
RUN apt-get update

RUN echo 'Deps to build...'
RUN apt-get install -y build-essential cmake meson libwayland-dev wayland-protocols \
 libegl1-mesa-dev libgles2-mesa-dev libdrm-dev libgbm-dev libinput-dev \
 libxkbcommon-dev libudev-dev libpixman-1-dev libsystemd-dev libcap-dev \
 libxcb1-dev libxcb-composite0-dev libxcb-xfixes0-dev libxcb-xinput-dev \
 libxcb-image0-dev libxcb-render-util0-dev libx11-xcb-dev libxcb-icccm4-dev \
 freerdp2-dev libwinpr2-dev libpng-dev libavutil-dev libavcodec-dev \
 libavformat-dev universal-ctags git
RUN apt-get install -y autoconf libtool
RUN apt-get install -y libcairo2 libcairo2-dev
RUN apt-get install -y libpango1.0-dev

RUN mkdir ~/sway-src
RUN mkdir ~/sway-debs

RUN echo 'Deps to build wlroots...'
RUN cd ~/sway-src && git clone https://github.com/swaywm/wlroots.git

RUN echo 'Deps to build json-c...'
RUN cd ~/sway-src && git clone https://github.com/json-c/json-c.git

RUN echo 'Deps to build scdoc'
RUN cd ~/sway-src && git clone https://git.sr.ht/~sircmpwn/scdoc

RUN echo 'Deps to build swaybg...'
RUN cd ~/sway-src && git clone https://github.com/swaywm/swaybg.git

RUN echo 'Deps to build sway...'
RUN cd ~/sway-src && git clone https://github.com/swaywm/sway.git

ADD scripts /opt/scripts/

RUN chmod +x /opt/scripts/*.sh

ENTRYPOINT ["/opt/scripts/build.sh"]
# CMD ["--help"]