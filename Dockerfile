FROM --platform=$BUILDPLATFORM alpine:latest AS builder
ARG TARGETPLATFORM

RUN mkdir -p /rootfs
WORKDIR /
COPY image.tar.xz .
RUN tar xf ./image.tar.xz -C /rootfs

FROM scratch AS root
COPY --from=builder /rootfs/ /

RUN sed -i 's/CheckSpace/#CheckSpace/g' /etc/pacman.conf

CMD ["/usr/bin/bash"]
