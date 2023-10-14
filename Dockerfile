FROM --platform=$TARGETPLATFORM ghcr.io/eweos/docker:master

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm base-devel git wget makepkg

CMD ["/usr/bin/makepkg"]
