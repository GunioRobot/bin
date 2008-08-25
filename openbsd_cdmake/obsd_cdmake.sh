#!/bin/bash

MIRROR="ftp.openbsd.org"
VERSION="4.3"
CDVER="43"
ARCH="i386"

mkdir OpenBSD
mkdir OpenBSD/$VERSION
cd OpenBSD/$VERSION

wget -N ftp://${MIRROR}/pub/OpenBSD/${VERSION}/ports.tar.gz
wget -N ftp://${MIRROR}/pub/OpenBSD/${VERSION}/src.tar.gz
wget -N ftp://${MIRROR}/pub/OpenBSD/${VERSION}/sys.tar.gz
wget -N ftp://${MIRROR}/pub/OpenBSD/${VERSION}/XF4.tar.gz

wget -N ftp://${MIRROR}/pub/OpenBSD/${VERSION}/HARDWARE
wget -N ftp://${MIRROR}/pub/OpenBSD/${VERSION}/PACKAGES
wget -N ftp://${MIRROR}/pub/OpenBSD/${VERSION}/PORTS
wget -N ftp://${MIRROR}/pub/OpenBSD/${VERSION}/README
wget -N ftp://${MIRROR}/pub/OpenBSD/${VERSION}/ftplist
wget -N ftp://${MIRROR}/pub/OpenBSD/${VERSION}/root.mail

wget -r -nH -N -nd ftp://${MIRROR}/pub/OpenBSD/${VERSION}/Changelogs/ -P Changelogs
wget -r -nH -N -nd ftp://${MIRROR}/pub/OpenBSD/${VERSION}/${ARCH}/ -P ${ARCH}

cd ..
mkisofs -v -r -T -l -L -J -V "OpenBSD ${VERSION}" -b ${VERSION}/${ARCH}/cdrom${CDVER}.fs -c boot.catalog -o ~/openbsd${CDVER}.iso -A "OpenBSD ${VERSION} Install" .

echo
echo "Your OpenBSD ${VERSION} CD is finished! To burn the CD, run:"
echo "cdrecord -v speed=48 dev=0,0,0 -data OpenBSD.iso"
echo
