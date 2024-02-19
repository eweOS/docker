FROM ghcr.io/eweos/docker:master

RUN echo "[testing]" >> /etc/pacman.conf
RUN echo "SigLevel = Never" >> /etc/pacman.conf
RUN echo "Server = http://os-repo.ewe.moe/eweos/testing/os/$arch/" >> /etc/pacman.conf
RUN pacman -Sy
RUN pacman -S --noconfirm archversion wget
RUN pip install pyxdg

ADD updater.ini /packages.conf
ADD eweversion /usr/bin/eweversion

RUN chmod +x /usr/bin/eweversion

CMD ["/usr/bin/eweversion"]
