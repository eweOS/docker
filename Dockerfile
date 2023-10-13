FROM ghcr.io/eweos/docker:master

RUN pacman -Sy
RUN pacman -S --noconfirm archversion wget
RUN pip install pyxdg

RUN mkdir -p ~/.config/archversion

ADD updater.ini ~/.config/archversion/packages.conf

CMD ["/usr/bin/archversion"]
