CC = gcc
CFLAGS = -Wall -Wextra -O3 -march=native -flto
LDFLAGS = -lwiringPi
SRC = webserver.c 
BIN = raspweb
INSTALL_DIR = /usr/local/bin
TARGET = $(INSTALL_DIR)/$(BIN)
DEBUGCFLAGS = $(CFLAGS) -Og -g

all: $(BIN)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(BIN) $(LDFLAGS)
	strip $(BIN)

install: $(BIN)
	install -m 755 $(BIN) $(TARGET)

clean:
	@rm -f $(BIN)
debug:
	$(CC) $(DEBUGCFLAGS) $(SRC) -o $(BIN) $(LDFLAGS)

clean-install: clean install

.PHONY: all install clean clean-install debug


