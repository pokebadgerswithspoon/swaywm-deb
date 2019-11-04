#!/bin/sh
ACTION=${1:-usage}

reconfig_meson() {
	if [ -d build ]; then
		rm -r build/meson-logs
		meson build --wipe
	else
		meson build
	fi
}

BASEDIR=$(dirname $0)

if [ ! -f ${BASEDIR}/$ACTION ]; then
    echo "Action handler not found! (${BASEDIR}/$ACTION)"
    echo "Dead now"
    exit 1
fi

. ${BASEDIR}/$ACTION