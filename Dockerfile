FROM alpine:latest AS builder

RUN mkdir -p /rootfs
WORKDIR /
RUN wget -r -np -nd -R "index.html*" -A 'eweos-x86_64-tarball-*.xz' https://os-repo.ewe.moe/eweos-images/x86_64/ && mv ./*.xz image.tar.xz && tar xf ./image.tar.xz -C /rootfs

FROM scratch AS root
COPY --from=builder /rootfs/ /

CMD ["/usr/bin/bash"]
