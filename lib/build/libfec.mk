#
#  makefile of LIBFEC shared library (libfec.so)
#
#! You need to install LIBFEC source tree as follows.
#!
#! $ git clone https://github.com/quiet/libfec libfec

#! specify directory of LIBFEC source tree
SRC = ../libfec

OS := $(shell uname)

ifeq ($(OS),Windows_NT)
    INSTALL = ../win32
else
    INSTALL = ../linux
endif

ifeq ($(OS),Darwin)
	CONFIGURE_ARGS = --build=x86_64-apple-darwin
else
	CONFIGURE_ARGS =
endif

TARGET = libfec.a

all :
	DIR=`pwd`; \
	cd $(SRC); \
	./configure $(CONFIGURE_ARGS); \
	sed 's/-lc//' < makefile > makefile.p; \
	mv makefile.p makefile; \
	make; \
	cd $$DIR; \
	cp $(SRC)/libfec.a .

clean:
	DIR=`pwd`; \
	cd $(SRC); \
	make clean; \
	cd $$DIR; \
	rm -f $(TARGET)

install:
	cp $(TARGET) $(INSTALL)
