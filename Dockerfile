FROM --platform=$BUILDPLATFORM alpine:latest AS builder
ARG TARGETPLATFORM

RUN mkdir -p /rootfs
WORKDIR /
COPY . .
RUN case ${TARGETPLATFORM} in \
            "linux/amd64")  DOWNARCH=x86_64  ;; \
            "linux/arm64")  DOWNARCH=aarch64  ;; \
            "linux/riscv64") DOWNARCH=riscv64 ;; \
            "linux/loong64") DOWNARCH=loongarch64 ;; \
            *)  exit 1  ;; \
    esac && mv ./eweos-$DOWNARCH-*.tar.xz image.tar.xz
RUN tar xf ./image.tar.xz -C /rootfs

FROM scratch AS root
COPY --from=builder /rootfs/ /

RUN sed -i 's/CheckSpace/#CheckSpace/g' /etc/pacman.conf

CMD ["/usr/bin/bash"]
