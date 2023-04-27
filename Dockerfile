FROM alpine:latest AS builder

RUN mkdir -p /rootfs
WORKDIR /
RUN wget https://os-repo.ewe.moe/eweos-images/x86_64/eweos-x86_64-tarball-Build58.1.xz && tar xf ./*.xz -C /rootfs

FROM scratch AS root
COPY --from=builder /rootfs/ /

CMD ["/usr/bin/bash"]
