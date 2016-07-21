#!/bin/bash
set -ex
source "common.sh"

ARCH="i386"
PKG_BASENAME="jdk-$VERSION-linux-i586.tar.gz"
URL="http://download.oracle.com/otn-pub/java/jdk/$VERSION-$BUILD/$PKG_BASENAME"

PREFIX=/usr/lib/jvm/jdk-$VERSION
DEBNAME="${PACKAGE}-${VERSION}_i386.deb"

mkdir -p work/$ARCH

echo "downloading from $URL"
# bypass manual LICENSE confirmation: http://bit.ly/1hUJBDC
# see also PKGBUILD from AUR: http://bit.ly/1n7VhYr
wget -c -O work/$ARCH/$PKG_BASENAME \
    --no-cookies \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    $URL

cd work/$ARCH
rm -rf *.deb
echo "building $DEBNAME"
tar xzf $PKG_BASENAME
fpm -s dir -t deb -n $PACKAGE -v $VERSION -p $DEBNAME \
    --prefix $PREFIX \
    --conflicts openjdk-$VERSION_MAJOR-jdk \
    --conflicts openjdk-$VERSION_MAJOR-jre \
    --template-scripts \
    --after-install ../../post-install.sh \
    -C "jdk1.${VERSION_MAJOR}.0_${VERSION_MINOR}" \
    .
