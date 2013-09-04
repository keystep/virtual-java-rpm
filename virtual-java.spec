Name: virtual-java
Version: %VERSION%
Release: %RELEASE%
Group: Development/Languages
Summary: Virtual package which provides java but uses the Sun/Oracle JDK
License: None
BuildArch: noarch
Provides: java
Requires: jdk > %VERSION%

%description
Virtual package which provides java but uses the Sun/Oracle JDK

%prep

%build

%pre

%post
/usr/sbin/alternatives --install /usr/bin/java java /usr/java/default/bin/java 20000

%postun
/usr/sbin/alternatives --remove java /usr/java/default/bin/java

%install

%files

%changelog
