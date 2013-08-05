virtual-java-rpm
================

Virtual package 'overlay' for Oracle JDK

The official JDK package does not provide 'java' ( _Provides: java_ )
This package does that + requires 'jdk' in order to work around this bug - nothing else.

Requirements
------------
In order to build this package you need _make_ and _rpmdevtools_ (rpmbuild):

    yum install -y make rpmdevtools

Building
--------
    git clone https://github.com/keystep/virtual-java-rpm.git && \
    cd virtual-java-rpm && \
    ./build

