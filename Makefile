#指定编译器
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

#导出各个编译参数的变量
export AS LD CC CPP AR NM
export STRIP OBJCOPY OBJDUMP

#编译参数
CFLAGS := -std=gnu99 -Wall -O3 -g -Wno-discarded-qualifiers

#指定头文件(.h文件)的路径
CFLAGS += -I $(shell pwd)/App/
CFLAGS += -I $(shell pwd)/Common/
CFLAGS += -I $(shell pwd)/Common/Log/
CFLAGS += -I $(shell pwd)/Common/DataStruct/
CFLAGS += -I $(shell pwd)/Middle/Linux/Device/Bsp/
CFLAGS += -I $(shell pwd)/Middle/Linux/Device/Driver/
CFLAGS += -I $(shell pwd)/ThirdPart/Json/
CFLAGS += -I $(shell pwd)/Middle/MiddleWare/

#指定库文件的位置
LDFLAGS := -lpthread -lm -g

export CFLAGS LDFLAGS

TOPDIR := $(shell pwd)
export TOPDIR

#编译生成的目标文件
TARGET := AcDazzle_app

#表示要进入相应的子目录下去寻找文件来编进程序里
#这是由子目录下的Makefile来决定的
obj-y += $(shell pwd)/App/
obj-y += $(shell pwd)/Common/Log/
obj-y += $(shell pwd)/Common/DataStruct/
obj-y += $(shell pwd)/Middle/Linux/Device/Bsp/
obj-y += $(shell pwd)/Middle/Linux/Device/Driver/
obj-y += $(shell pwd)/ThirdPart/Json/
obj-y += $(shell pwd)/Middle/MiddleWare/


all : start_recursive_build $(TARGET)
	@echo $(TARGET) has been built!
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