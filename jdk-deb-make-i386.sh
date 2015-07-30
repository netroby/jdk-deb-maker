#!/bin/bash

PACKAGE=oracle-jdk-8
PACKAGE_VIRTUAL=oracle-jdk
VERSION_MAJOR=8
VERSION_MINOR=51
VERSION="${VERSION_MAJOR}u${VERSION_MINOR}"
BUILD=b16

PKG_BASENAME="jdk-$VERSION-linux-i586.tar.gz"
URL="http://download.oracle.com/otn-pub/java/jdk/$VERSION-$BUILD/$PKG_BASENAME"

PREFIX=/usr/lib/jvm/jdk-$VERSION
DEBNAME="${PACKAGE}-${VERSION}_i386.deb"

mkdir -p work

if [ ! -f "work/$PKG_BASENAME" ]
then
    echo "downloading from $URL"
    # bypass manual LICENSE confirmation: http://bit.ly/1hUJBDC
    # see also PKGBUILD from AUR: http://bit.ly/1n7VhYr
    wget -c -O work/$PKG_BASENAME \
         --no-cookies \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         $URL
fi

cd work

if [ ! -f "$DEBNAME" ]
then
    echo "building $DEBNAME"
    tar xzf $PKG_BASENAME
    fpm -s dir -t deb -n $PACKAGE -v $VERSION -p $DEBNAME \
        --prefix $PREFIX \
        --conflicts openjdk-$VERSION_MAJOR-jdk \
        --conflicts openjdk-$VERSION_MAJOR-jre \
        --template-scripts \
        --after-install ../post-install.sh \
        -C "jdk1.${VERSION_MAJOR}.0_${VERSION_MINOR}" \
        .
fi