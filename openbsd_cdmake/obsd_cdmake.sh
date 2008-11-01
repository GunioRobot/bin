#!/bin/bash

MIRROR="ftp.openbsd.org"
VERSION="4.4"
CDVER="44"
ARCH="i386"

mkdir OpenBSD
cd OpenBSD

wget -r -np ftp://${MIRROR}/pub/OpenBSD/${VERSION}/${ARCH}
mv ${MIRROR}/pub/OpenBSD/${VERSION} .
cp ${VERSION}/${ARCH}/cd${CDVER}.iso OpenBSD-${VERSION}.iso
growisofs -M OpenBSD-${VERSION}.iso -R -iso-level 3 -graft-points ${VERSION}=${VERSION}
rm -rf ${MIRROR} 

echo
echo "Your OpenBSD ${VERSION} CD is finished! To burn the CD, run:"
echo
