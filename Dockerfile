FROM --platform=$BUILDPLATFORM alpine:latest AS builder
ARG TARGETPLATFORM

RUN mkdir -p /rootfs
WORKDIR /
RUN apk add wget
RUN case ${TARGETPLATFORM} in \
            "linux/amd64")  DOWNARCH=x86_64  ;; \
            "linux/arm64")  DOWNARCH=aarch64  ;; \
            *)  exit 1  ;; \
    esac && \
    wget -r -np -nd -R "index.html*" -A "eweos-$DOWNARCH-tarball.tar.xz" https://os-repo.ewe.moe/eweos-images/ && mv ./*.tar.xz image.tar.xz && tar xf ./image.tar.xz -C /rootfs

FROM scratch AS root
COPY --from=builder /rootfs/ /

RUN sed -i 's/CheckSpace/#CheckSpace/g' /etc/pacman.conf

RUN chown -R root:root /etc/sudo* /usr/lib/sudo/* /usr/bin/sudo
RUN chmod +s /usr/bin/sudo

CMD ["/usr/bin/bash"]
