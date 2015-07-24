#JDK deb maker

This is a tool to make JDK deb package from official Oracle JDK binary package.
The latest Oracle JDK 8 was JDK 8u51

## Requirement
 
You should make sure you have install fpm tools via
```
gem install fpm
```

## How to using

Clone this repo

```
chmod a+x *.sh
# if you want build amd64 deb
jdk-deb-make.sh
# if you want build i386 deb
jdk-deb-make-i386.sh
```

jdk-deb-make.sh is for amd64 system

jdk-deb-make-i386.sh is for x86 system


After  build finish, the deb packages location at work/ subdirectory

cd work/ and install them 

```
sudo dpkg -i oracle-jdk-8-8u51_i386.deb
```
Or
```
sudo dpkg -i oracle-jdk-8-8u51_amd64.deb
```
