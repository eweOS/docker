FROM ghcr.io/eweos/docker:master

RUN pacman -Syu
RUN pacman -S --noconfirm base-devel

CMD ["/usr/bin/makepkg"]
