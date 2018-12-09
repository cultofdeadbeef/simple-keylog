CC=gcc
CFLAGS=-c -Wall
KEYLOG_TARGETS=main.o keylogger.o networking.o find_event_file.o
SERVER_TARGETS=server.o networking.o

all: keylog server

keylog: $(KEYLOG_TARGETS)
	$(CC) $^ -o $@

server: $(SERVER_TARGETS)
	$(CC) $^ -o $@

install:
	install -D keylog $(DESTDIR)/usr/bin/keylog
	install -D README.md $(DESTDIR)/usr/share/doc/deadbeef/README.keylog
uninstall:
	rm -f $(DESTDIR)/usr/bin/keylog
	rm -f $(DESTDIR)/usr/share/doc/deadbeef/README.keylog

.PHONY: clean
clean:
	rm -f keylog server *.o
