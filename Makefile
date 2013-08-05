VERSION=1.7
RELEASE=1
RPMNAME=virtual-java-$(VERSION)-$(RELEASE).noarch.rpm

.PHONY: all
all: dist/$(RPMNAME)

.PHONY: clean
clean:
	rm -rf work
	rm -rf dist

dist/$(RPMNAME): work/RPMS/noarch/$(RPMNAME) dist
	cp work/RPMS/noarch/$(RPMNAME) dist/$(RPMNAME)

work/RPMS/noarch/$(RPMNAME): work/BUILD work/RPMS/noarch work/SPECS/virtual-java.spec
	rpmbuild -bb --define="_topdir ${PWD}/work" work/SPECS/virtual-java.spec

work/SPECS/virtual-java.spec: work/SPECS virtual-java.spec
	cat virtual-java.spec | sed -e s/%VERSION%/$(VERSION)/g | sed -e s/%RELEASE%/$(RELEASE)/g > work/SPECS/virtual-java.spec

dist:
	if [ ! -d dist ]; then mkdir -p dist; fi
	touch dist
work/BUILD:
	if [ ! -d work/BUILD ]; then mkdir -p work/BUILD; fi
	touch work/BUILD
work/RPMS/noarch:
	if [ ! -d work/RPMS/noarch ]; then mkdir -p work/RPMS/noarch; fi
	touch work/RPMS/noarch
work/SPECS:
	if [ ! -d work/SPECS ]; then mkdir -p work/SPECS; fi
	touch work/SPECS

