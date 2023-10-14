FROM --platform=${TARGETPLATFORM:-linux/amd64} ghcr.io/eweos/docker:master
ARG TARGETPLATFORM

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm base-devel git wget makepkg

CMD ["/usr/bin/makepkg"]
