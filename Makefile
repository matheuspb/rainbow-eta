CC = gcc
CXX = g++
LD = gcc

PROJ = Ia
PROJ_DIR = ./$(PROJ)

CFLAGS = -O2 -std=c11 -Wall -Wextra 
INCPATH = -I/usr/local/include
INCPATH += -I/opt/local/include
INCPATH += -I/usr/include -I$(PROJ_DIR)
INCPATH += -I./common
LDFLAGS =
LIBPATH = -L/usr/local/lib -L/opt/local/lib -L/usr/lib
LIBS = -lcrypto

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
	$(LD) $(LDFLAGS) $(LIBPATH) -o $@ $^ $(LIBS)

rainbow-sign: $(OBJ) rainbow-sign.o
	$(LD) $(LDFLAGS) $(LIBPATH) -o $@ $^ $(LIBS)

rainbow-verify: $(OBJ) rainbow-verify.o
	$(LD) $(LDFLAGS) $(LIBPATH) -o $@ $^ $(LIBS)

PQCgenKAT_sign: $(OBJ) PQCgenKAT_sign.o
	$(LD) $(LDFLAGS) $(LIBPATH) -o $@ $^ $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) $(INCPATH) -c $<

%.o: $(PROJ_DIR)/%.c
	$(CC) $(CFLAGS) $(INCPATH) -c $<

%.o: common/%.c
	$(CC) $(CFLAGS) $(INCPATH) -c $<

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCPATH) -c $<

clean:
	rm -f *.o  rainbow-genkey rainbow-sign rainbow-verify  PQCgenKAT_sign
