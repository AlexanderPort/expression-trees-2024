CC ?= cc
LD := $(CC)

CFLAGS := -std=c99 -O0 -g -Wall -Wextra -Werror
LDFLAGS := -fsanitize=address,leak,undefined

all: simplify

simplify: main.o
	$(LD) -o $@ $(LDFLAGS) $^

.c.o:
	$(CC) -o $@ $(CFLAGS) -c $^

clean:
	rm simplify
	rm *.o

.PHONY: all clean