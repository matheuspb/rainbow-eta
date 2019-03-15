CC = gcc
CXX = g++
LD = gcc

PROJ = Ia
PROJ_DIR = ./$(PROJ)

CFLAGS = -O2 -std=c11 -Wall -Wextra
CFLAGS += -I/usr/local/include
CFLAGS += -I/opt/local/include
CFLAGS += -I/usr/include -I$(PROJ_DIR)
CFLAGS += -I./common
LDFLAGS = -L/usr/local/lib -L/opt/local/lib -L/usr/lib -lcrypto

SRCS = $(wildcard $(PROJ_DIR)/*.c)
SRCS_O = $(SRCS:.c=.o)
SRCS_O_ND = $(subst $(PROJ_DIR)/,,$(SRCS_O))
COMMON = $(wildcard common/*.c)
COMMON_O = $(COMMON:.c=.o)
COMMON_O_ND = $(subst common/,,$(COMMON_O))

OBJ = $(SRCS_O_ND) $(COMMON_O_ND) utils.o
EXE = PQCgenKAT_sign rainbow-genkey rainbow-sign rainbow-verify

.PHONY: all clean

all: $(OBJ) $(EXE)

rainbow-genkey: $(OBJ) rainbow-genkey.o

rainbow-sign: $(OBJ) rainbow-sign.o

rainbow-verify: $(OBJ) rainbow-verify.o

PQCgenKAT_sign: $(OBJ) PQCgenKAT_sign.o

%.o: $(PROJ_DIR)/%.c
	$(CC) $(CFLAGS) -c $<

%.o: common/%.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o  rainbow-genkey rainbow-sign rainbow-verify  PQCgenKAT_sign
