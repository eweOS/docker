FROM --platform=${BUILDPLATFORM:-linux/amd64} ghcr.io/eweos/docker:master
ARG BUILDPLATFORM

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm base-devel git wget makepkg

CMD ["/usr/bin/makepkg"]
