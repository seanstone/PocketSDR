.PHONY: app-install app lib-install lib clean

app-install: app
	cd app && $(MAKE) install

app: app-install
	cd app && $(MAKE) -j

lib-install: lib
	cd lib/build && $(MAKE) -j

lib:
	cd lib/build && $(MAKE) install

clean:
	cd app && $(MAKE) clean
	cd lib/build && $(MAKE) clean
