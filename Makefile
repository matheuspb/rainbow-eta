PROJ = Ia
PROJ_DIR = ./$(PROJ)

CFLAGS = -O2 -std=c11 -Wall -Wextra -pedantic -I$(PROJ_DIR) -I./common
LDFLAGS = -lcrypto

SRC_FILES = $(wildcard $(PROJ_DIR)/*.c) $(wildcard common/*.c)
OBJ_FILES = $(SRC_FILES:.c=.o)

TARGET = $(basename $(wildcard *.c))

all: $(TARGET)

$(TARGET): %: $(OBJ_FILES)

test: all
	@./rainbow-genkey pk sk
	@./rainbow-sign sk Makefile > sig
	@./rainbow-verify pk sig Makefile
	@rm pk sk sig

clean:
	@rm -f $(TARGET) **/*.o
