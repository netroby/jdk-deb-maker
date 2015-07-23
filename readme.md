#JDK deb maker

This is a tool to make JDK deb package from official Oracle JDK binary package

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

After  build finish, the deb packages location at work/ subdirectory
cd work/ and install them 
