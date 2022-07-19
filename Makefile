CROSS_COMPILE = 
AS		= $(CROSS_COMPILE)as
LD		= $(CROSS_COMPILE)ld
CC		= $(CROSS_COMPILE)gcc
CPP		= $(CC) -E
AR		= $(CROSS_COMPILE)ar
NM		= $(CROSS_COMPILE)nm

STRIP		= $(CROSS_COMPILE)strip
OBJCOPY		= $(CROSS_COMPILE)objcopy
OBJDUMP		= $(CROSS_COMPILE)objdump

export AS LD CC CPP AR NM
export STRIP OBJCOPY OBJDUMP

CFLAGS := -std=gnu99 -Wall -O3 -g -Wno-discarded-qualifiers

CFLAGS += -I $(shell pwd)/App/
CFLAGS += -I $(shell pwd)/Bsp/gpio/
CFLAGS += -I $(shell pwd)/Bsp/i2c/
CFLAGS += -I $(shell pwd)/Bsp/spi/
CFLAGS += -I $(shell pwd)/Bsp/time/
CFLAGS += -I $(shell pwd)/Bsp/uart/
CFLAGS += -I $(shell pwd)/Bsp/msq/
CFLAGS += -I $(shell pwd)/Bsp/mutex/
CFLAGS += -I $(shell pwd)/Bsp/pipe/
CFLAGS += -I $(shell pwd)/Bsp/pthread/
CFLAGS += -I $(shell pwd)/Bsp/socket/

CFLAGS += -I $(shell pwd)/Business/file_manage/
CFLAGS += -I $(shell pwd)/Business/gcode_parser/
CFLAGS += -I $(shell pwd)/Business/gui_handler/
CFLAGS += -I $(shell pwd)/Business/mqtt_manage/

CFLAGS += -I $(shell pwd)/Hardward/Led/
CFLAGS += -I $(shell pwd)/Hardward/Lcd/
CFLAGS += -I $(shell pwd)/Hardward/Key/
CFLAGS += -I $(shell pwd)/Hardward/Wifi/
CFLAGS += -I $(shell pwd)/Hardward/Udisk/
CFLAGS += -I $(shell pwd)/Hardward/Camera/

CFLAGS += -I $(shell pwd)/Thirdparty/cJSON/

CFLAGS += -I $(shell pwd)/Tool/Json/
CFLAGS += -I $(shell pwd)/Tool/Log/
CFLAGS += -I $(shell pwd)/Tool/Mqtt/
CFLAGS += -I $(shell pwd)/Tool/Ringbuffer/

LDFLAGS := -lpthread -lm -g

export CFLAGS LDFLAGS

TOPDIR := $(shell pwd)
export TOPDIR

TARGET := Future3D_app

obj-y += $(shell pwd)/App/
obj-y += $(shell pwd)/Common/Log/
obj-y += $(shell pwd)/Common/DataStruct/
obj-y += $(shell pwd)/Middle/Linux/Device/Bsp/
obj-y += $(shell pwd)/Middle/Linux/Device/Driver/
obj-y += $(shell pwd)/ThirdPart/Json/
obj-y += $(shell pwd)/Middle/MiddleWare/

obj-y += $(shell pwd)/App/
obj-y += $(shell pwd)/Bsp/gpio/
obj-y += $(shell pwd)/Bsp/i2c/
obj-y += $(shell pwd)/Bsp/spi/
obj-y += $(shell pwd)/Bsp/time/
obj-y += $(shell pwd)/Bsp/uart/
obj-y += $(shell pwd)/Bsp/msq/
obj-y += $(shell pwd)/Bsp/mutex/
obj-y += $(shell pwd)/Bsp/pipe/
obj-y += $(shell pwd)/Bsp/pthread/
obj-y += $(shell pwd)/Bsp/socket/

obj-y += $(shell pwd)/Business/file_manage/
obj-y += $(shell pwd)/Business/gcode_parser/
obj-y += $(shell pwd)/Business/gui_handler/
obj-y += $(shell pwd)/Business/mqtt_manage/

obj-y += $(shell pwd)/Hardward/Led/
obj-y += $(shell pwd)/Hardward/Lcd/
obj-y += $(shell pwd)/Hardward/Key/
obj-y += $(shell pwd)/Hardward/Wifi/
obj-y += $(shell pwd)/Hardward/Udisk/
obj-y += $(shell pwd)/Hardward/Camera/

obj-y += $(shell pwd)/Thirdparty/cJSON/

obj-y += $(shell pwd)/Tool/Json/
obj-y += $(shell pwd)/Tool/Log/
obj-y += $(shell pwd)/Tool/Mqtt/
obj-y += $(shell pwd)/Tool/Ringbuffer/


all : start_recursive_build $(TARGET)
	@echo $(TARGET) Future3D_app built success!
	@echo
	@echo $(shell find -name "*.o")
	@echo
	@echo $(shell find -name "*.d")
	rm -f $(shell find -name "built-in.o") $(shell find -name "*.d")
	find . -name "*.o" -exec mv -t Object/ {} +

start_recursive_build:
	make -C ./ -f $(TOPDIR)/Makefile.build

$(TARGET) : built-in.o
	$(CC) -o $(TARGET) built-in.o $(LDFLAGS)

clean:
	rm -f $(shell find -name "*.o")
	rm -f $(shell find -name "*.d")
	rm -f $(TARGET)