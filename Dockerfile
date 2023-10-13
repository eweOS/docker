FROM ghcr.io/eweos/docker:master

RUN sed -i 's/CheckSpace/#CheckSpace/g' /etc/pacman.conf
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm base-devel git wget

CMD ["/usr/bin/makepkg"]
