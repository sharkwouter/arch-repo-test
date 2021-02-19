FROM archlinux:base-devel

ENV USERNAME builder
ENV GLIBC glibc-linux4-2.33-4-x86_64.pkg.tar.zst

# Workaround for issues with pacman package
RUN curl -LO https://repo.archlinuxcn.org/x86_64/${GLIBC} &&  \
 	bsdtar -C / -xvf ${GLIBC}

# Don't update packages, or things will break
RUN pacman --noconfirm -Sy --needed git && \
	echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
	useradd ${USERNAME} -G wheel

ADD . /build
WORKDIR /build

RUN chown -R ${USERNAME}:${USERNAME} /build

USER ${USERNAME}

CMD ./build.sh
