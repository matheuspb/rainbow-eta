PROJ = Ia
PROJ_DIR = ./$(PROJ)

CFLAGS = -O2 -std=c11 -Wall -Wextra -I$(PROJ_DIR) -I./common
LDFLAGS = -lcrypto

SRC_FILES = $(wildcard $(PROJ_DIR)/*.c) $(wildcard common/*.c)
OBJ_FILES = $(SRC_FILES:.c=.o)

TARGET = $(basename $(wildcard *.c))

RAND_FILE := $(shell mktemp --suffix=-rainbow-message)
PK_FILE := $(shell mktemp --suffix=-rainbow-public-key)
SK_FILE := $(shell mktemp --suffix=-rainbow-secret-key)
SIG_FILE := $(shell mktemp --suffix=-rainbow-signature)

all: $(TARGET)

$(TARGET): %: $(OBJ_FILES)

test: all
	head -c 1024 /dev/urandom > $(RAND_FILE)
	./rainbow-genkey $(PK_FILE) $(SK_FILE)
	./rainbow-sign $(SK_FILE) $(RAND_FILE) > $(SIG_FILE)
	./rainbow-verify $(PK_FILE) $(SIG_FILE) $(RAND_FILE)

kat: all
	rm -f $(PROJ_DIR)/*.r*
	./rainbow-kat
	mv *.req *.rsp $(PROJ_DIR)

clean:
	rm -f $(OBJ_FILES) $(TARGET) /tmp/*-rainbow* $(PROJ_DIR)/*.r*
