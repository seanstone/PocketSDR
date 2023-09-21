.PHONY: app-install app lib-install lib clean

app-install: app
	cd app && $(MAKE) install

app: lib-install
	cd app && $(MAKE) -j

lib-install: lib
	cd lib/build && $(MAKE) install

lib:
	cd lib/build && $(MAKE) -j

clean:
	cd app && $(MAKE) clean
	cd lib/build && $(MAKE) clean
	rm -f lib/linux/*.a lib/linux/*.so lib/linux/*.dylib
	rm -f bin/pocket_acq bin/pocket_conf bin/pocket_dump bin/pocket_scan bin/pocket_trk