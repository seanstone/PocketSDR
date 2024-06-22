#
#  makefile of LIBFEC shared library (libfec.so)
#
#! You need to install LIBFEC source tree as follows.
#!
#! $ git clone https://github.com/quiet/libfec libfec

#! specify directory of LIBFEC source tree
SRC = ../libfec

ifeq ($(OS),Windows_NT)
    INSTALL = ../win32
else
    INSTALL = ../linux
endif

ARCH = $(shell $$CC -dumpmachine | cut -d- -f1)

ifeq ($(ARCH),aarch64)
    CONF_OPT = --build=arm --host=$(shell uname -m)
endif
ifeq ($(ARCH),arm)
    CONF_OPT = --build=arm --host=$(shell uname -m)
endif

TARGET = libfec.so libfec.a

all :
	DIR=`pwd`; \
	cd $(SRC); \
	./configure $(CONF_OPT); \
	sed 's/-lc//' < makefile > makefile.p; \
	mv makefile.p makefile; \
	make
ifeq ($(OS),Darwin)
	cp $(SRC)/libfec.dylib libfec.so
else
	cp $(SRC)/libfec.so .
endif
	cp $(SRC)/libfec.a .

clean:
	DIR=`pwd`; \
	cd $(SRC); \
	make clean; \
	cd $$DIR; \
	rm -f $(TARGET)

install:
	cp $(TARGET) $(INSTALL)
