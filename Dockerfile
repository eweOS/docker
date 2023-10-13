FROM ghcr.io/eweos/docker:master

RUN pacman -Sy
RUN pacman -S --noconfirm archversion wget
RUN pip install pyxdg

CMD ["/usr/bin/archversion"]
