# standard common Makefile fragment
include $(OCTEON_ROOT)/common.mk

CFLAGS_LOCAL = -g -O2 -W -Wall -Wno-unused-parameter -I. -L. -I$(OCTEON_ROOT)/target/include

TARGET = hotpatch$(PREFIX)

all: lib$(TARGET).so lib$(TARGET).a 

lib$(TARGET).so: hotpatch.c
	$(CC) -o lib$(TARGET).so $(CFLAGS_LOCAL) $(CFLAGS_GLOBAL) -shared hotpatch.c

lib$(TARGET).a: hotpatch.c
	$(CC) -c -o $(TARGET).o $(CFLAGS_LOCAL) $(CFLAGS_GLOBAL) hotpatch.c
	$(AR) crv lib$(TARGET).a $(TARGET).o
	$(RANLIB) lib$(TARGET).a

clean:
	rm -rvf lib$(TARGET).so lib$(TARGET).a $(TARGET).o $(TARGET)
	rm -rvf hotpatch-* obj-*
