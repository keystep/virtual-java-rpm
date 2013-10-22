virtual-java-rpm
================

Virtual package 'overlay' for Oracle JDK

The official JDK package does not provide 'java' ( _Provides: java_ ).
This package does just that + requires 'jdk' in order to work around this bug - nothing else.

The official package does install _/usr/bin/java_ (as a symlink), but does not add an _alternative_ which means it cannot properly coexist with other installations. This is not remedied here.

Requirements
------------
In order to build this package you need _make_ and _rpmdevtools_ (rpmbuild):

    yum install -y make rpmdevtools

Building
--------
    git clone https://github.com/keystep/virtual-java-rpm.git && \
    cd virtual-java-rpm && \
    ./build

This should produce an RPM that can be found in _dist/_

Example:

    virtual-java-1.7-1.noarch.rpm

Add this package to your local repo. Your applications (in my case _[tomcat](https://github.com/keystep/apache-tomcat-rpm)_) can now depend on 'java' and be satisfied with the (already) installed jdk without forcing an install of the default openjdk.

Todo
----

* Should this package be called _virtual-jdk_ rather than _virtual-java_?
* ~~Add a fix for _update-alternatives_ ?~~
