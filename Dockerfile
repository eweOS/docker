FROM ghcr.io/eweos/docker:master

RUN sed -i 's/CheckSpace/#CheckSpace/g' /etc/pacman.conf

RUN chown -R root:root /etc/sudo* /usr/lib/sudo/* /usr/bin/sudo
RUN chmod +s /usr/bin/sudo

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm base-devel git wget makepkg

CMD ["/usr/bin/makepkg"]
