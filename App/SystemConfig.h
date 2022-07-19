#ifndef _SYS_CONFIG_H_
#define _SYS_CONFIG_H_

#ifdef __cplusplus
extern "C" {
#endif

#ifndef __USE_CLIB
#define __USE_CLIB      1
#endif

#ifndef __USE_OS_LINUX
#define __USE_OS_LINUX  1
#endif

#ifndef __USE_CUSTOME
#define __USE_CUSTOME  1
#endif


#ifdef __USE_OS_LINUX
#include <poll.h>
#include <time.h>
#include <fcntl.h>
#include <dirent.h>
#include <termios.h>
#include <pthread.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <linux/i2c.h>
#include <linux/serial.h>
#include <linux/i2c-dev.h>
#endif


#ifdef __USE_CLIB
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#endif


#ifdef __USE_CUSTOME
#include "CustomType.h"
#endif


#ifdef __cplusplus
}
#endif
#endif  //ifndef _SYS_CONFIG_H_