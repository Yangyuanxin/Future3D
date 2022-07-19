#ifndef _CUSTOMTYPE_H_
#define _CUSTOMTYPE_H_

#ifdef __cplusplus
extern "C" {
#endif

typedef void               Void;
typedef char               S8;
typedef short              S16;
typedef int                S32;
typedef long long          S64;
typedef unsigned char      U8;
typedef unsigned short     U16;
typedef unsigned int       U32;
typedef unsigned long long U64;
typedef float              Float;
typedef double             Double;
typedef unsigned char      Bool;

#ifdef  __cplusplus
#define Null    0
#else
#define Null    ((void *)0)
#endif

#ifdef __cplusplus
}
#endif
#endif  //ifndef _CUSTOMTYPE_H_