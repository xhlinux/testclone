.SUFFIXES : .x .o .c .s

USE_ARM      = TRUE

ifeq "$(USE_ARM)" "TRUE"
CROSS_COMPILE	=/usr/local/arm_linux_4.8/bin/arm-linux-
ROOT = /usr/local/arm_linux_4.8
LIB = $(ROOT)/lib/gcc/arm-nuvoton-linux-uclibceabi/4.8.4
LIB1 =$(ROOT)/lib 
INCSYS:=$(ROOT)/arm-nuvoton-linux-uclibceabi/sys-include
INC :=$(ROOT)/arm-nuvoton-linux-uclibceabi/include
else
CROSS_COMPILE	= 
endif
CC=$(CROSS_COMPILE)gcc   -I$(INC) -I$(INCSYS) -static
LDFLAGS=-L$(LIB) -L$(LIB1)

STRIP= $(CROSS_COMPILE)strip   

TARGET = test
SRCS := main.c 

all: 
	$(CC) $(LDFLAGS) $(SRCS) -lc -lpthread  -o $(TARGET)  -Wl,-Map,$(TARGET).map
	$(STRIP) $(TARGET)

clean:
	rm -f *.o 
	rm -f *.x 
	rm -f *.flat
	rm -f *.map
	rm -f temp
	rm -f *.img
	rm -f $(TARGET)	
	rm -f *.gdb
	rm -f *.bak
