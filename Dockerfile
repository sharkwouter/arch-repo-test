FROM archlinux:base

ENV USERNAME builder

RUN pacman --noconfirm -Syyu --needed base-devel git sudo && \
	echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
	useradd ${USERNAME} -G wheel -m 

ADD . /build
WORKDIR /build

RUN chown -R ${USERNAME} /build

USER ${USERNAME}

CMD ./build.sh
