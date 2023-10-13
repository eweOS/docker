FROM ghcr.io/eweos/docker:master

RUN pacman -Sy
RUN pacman -S --noconfirm archversion wget
RUN pip install pyxdg

ADD updater.ini /packages.conf
ADD eweversion /usr/bin/eweversion

CMD ["/usr/bin/eweversion"]
