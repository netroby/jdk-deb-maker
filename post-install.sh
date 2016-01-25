#!/bin/sh
set -ex
JAVA_HOME=<%= prefix %>
JRE_BIN=$JAVA_HOME/jre/bin
JDK_BIN=$JAVA_HOME/bin
MAN_DIR=/usr/share/man/man1
JAVA_MAN=$JAVA_HOME/man/man1

# openjdk uses version to determine priority, where 170065 is 1.7.0.65
# we want this to have a higher priority so we're starting with 200000
PRIORITY=100

mkdir -p /usr/lib/jvm /usr/lib/jvm-exports
for  n in java javac jmc jvisualvm jconsole jcontrol
do
    update-alternatives --install /usr/bin/$n $n $JDK_BIN/$n $PRIORITY
done


exit 0

