#
#  makefile for pocket_scan
#

CC ?= g++

SRC = ../../src
LIB = ../../lib
BIN = ../../bin

ifeq ($(OS),Windows_NT)
    INCLUDE = -I$(LIB)/cyusb
    OPTIONS = -DWIN32
    LDLIBS = -static $(LIB)/cyusb/CyAPI.a -lsetupapi
else
    INCLUDE = $(shell pkg-config --cflags libusb-1.0)
    OPTIONS =
    LDLIBS = $(shell pkg-config --libs libusb-1.0) -lusb-1.0
endif

WARNOPT = -Wall -Wextra

CFLAGS = -O3 $(INCLUDE) $(WARNOPT) $(OPTIONS) -g

TARGET = pocket_scan

all: $(TARGET)

pocket_scan: pocket_scan.o

clean:
	rm -f $(TARGET) *.exe *.o *.stackdump

install:
	cp $(TARGET) $(BIN)

