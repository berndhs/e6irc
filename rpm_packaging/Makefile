
# Makefile for generating RPM for Carpo
#


NAME = $(shell cat pack-name)
VERSION = $(shell cat pack-version)
COUNT = $(shell ./docount.sh)

RPMBUILD = $(HOME)/rpmbuild
SOURCEDIR = $(RPMBUILD)/SOURCES

TAR_SRC = $(NAME)_$(VERSION).tar.gz
SPEC = $(NAME).spec
CHANGES = $(NAME).changes

SRC = $(SOURCEDIR)/$(TAR_SRC)

rpm: info $(SRC) $(SPEC)
	QA_RPATHS=$[0x0001] rpmbuild -ba $(SPEC) | tee build.log

spec: $(SPEC)

info:
	(  \
	  echo "name      " $(NAME) ; \
	  echo "spec file " $(SPEC) ; \
	  echo "source    " $(SRC) ; \
	  echo "version   " $(VERSION) ; \
	)

$(SPEC):  spec.in pack-version
	echo -n "%define sourceversion " > $(SPEC)
	echo $(VERSION) >> $(SPEC)
	echo -n "%define relcount " >> $(SPEC)
	echo $(COUNT) >> $(SPEC)
	if [ -e /etc/meego-release ]; \
	  then  \
	  echo "%define assume_meego 1" >> $(SPEC) ; \
	  echo "%define dist .meego" >> $(SPEC) ; \
	else \
	  echo "%define assume_meego 0" >> $(SPEC) ; \
	fi
	cat spec.in >> $(SPEC)
	cat $(CHANGES) >> $(SPEC)

$(SOURCEDIR)/$(TAR_SRC): $(TAR_SRC)
	cp $(TAR_SRC) $(SOURCEDIR)/$(TAR_SRC)

$(SOURCEDIR)/$(DT_SRC): $(DT_SRC)
	cp $(DT_SRC) $(SOURCEDIR)/$(DT_SRC)

