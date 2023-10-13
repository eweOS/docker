FROM ghcr.io/eweos/docker:master

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm base-devel git wget

CMD ["/usr/bin/makepkg"]
