ifeq ($(OS),Windows_NT)
    INSTALL = ../win32
else
    INSTALL = ../linux
endif

TARGET = ../kissfft/libkissfft-float.a

.PHONY: all
all:
	make KISSFFT_STATIC=1 KISSFFT_TOOLS=0 -C ../kissfft

.PHONY: clean
clean:
	make -C ../kissfft clean
	rm -f $(INSTALL)/libkissfft-float.a

.PHONY: install
install:
	cp $(TARGET) $(INSTALL)