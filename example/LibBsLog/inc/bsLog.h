#ifndef _BSTAR_LOG_H
#define _BSTAR_LOG_H

//#define WITH_GRPC

#ifdef __cplusplus
extern "C" {
#endif

#include "common.h"

typedef enum LogLevel
{
    LOG_INFO  = 0,
    LOG_WARN  = 1,
    LOG_ERROR = 2,
    LOG_FATAL = 3
} LogLevel_t;

typedef enum LogOutCfg
{
    LOG_STAD = 0x01, // 标准日志输出，打印至终端
    LOG_FILE = 0x02, // 文件日志存储，支持大小等
} LogOutCfg_t;

typedef void (*LogPrintCallback)(int, const char*, va_list);

typedef void (*LogInitCallback)(const char*, int);

/**
 * @fn: BsSetLogCbFuc
 * @breif: 注册第三方日志打印函数接口
 * @param[in]  Init, 日志初始化函数
 *             Print,日志打印函数
 * @return
 */
EXPORT_API void BsSetLogCbFuc(LogInitCallback Init, LogPrintCallback Print);

/**
 * @fn: BsLogInit
 * @breif: 初始化BsLog日志模块，默认是init glog
 * @param[in]  FileName, 日志文件名称, 如 BstarNvr.log
 *             BsLogCfg, 日志配置：
 *             LOG_STAD, 仅打印到终端
 *             LOG_FILE|LOG_STAD, 打印到终端且写入文件
 *             LOG_GRPC|LOG_STAD, 打印到终端且远程发送
 *             Note：目前仅支持上述三种配置 ！！！
 *
 *             使用：
 *             场景[1]
 *             a. BsLogInit("BsNvr.log", LOG_STAD|LOG_FILE)
 *             b. BsLogPrint(LOG_INFO, "%s", "Hello Bstar")
 *             此场景下，支持标准输出+文件输出
 *
 *             场景[2]
 *             a. BsLogPrint(LOG_INFO, "%s", "Hello Bstar")
 *             此场景下，默认支持标准打印输出
 * @param[out]
 * @return
 */
EXPORT_API void BsLogInit(const char* FileName, int32_t BsLogCfg);

/**
 * @fn: BsLogPrint
 * @breif: 日志打印
 * @param[in]  Level, 日志打印级别
 *             Fmt,   日志打印格式
 *             ...,   可变长参数
 *             如输入, LOG_INFO, "Bstar test %s, value is %d.", "Nvr in Xian", 10
 *             输出为：2018-09-19 11:11:11 [I] Bstar test Nvr in Xian, value is 10
 * @param[out]
 * @return
 */
EXPORT_API void BsLogPrint(LogLevel_t Level, const char* Fmt, ...);

#ifdef __cplusplus
}
#endif

#endif
