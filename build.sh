#!/bin/bash

cd "$(dirname "${0}")"
WORKDIR="${PWD}"

FAILED=""

build_package() {
	# Make sure ${1} is set
	if [ -z "${1}" ]; then
		echo "No argument specified for build_package function"
		return
	fi

	cd "$(dirname ${1})"
	if ! makepkg -si --noconfirm; then
		FAILED="${FAILED} ${1}"
	fi
	cd "${WORKDIR}"
}

git submodule update --init

for pkgbuild in $(find -type f -name PKGBUILD); do
	build_package "${pkgbuild}"
done

if [ ! -z "${FAILED}" ]; then
	echo "The following packages failed to build or install:${FAILED}"
fi

