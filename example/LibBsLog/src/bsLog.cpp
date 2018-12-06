#include <glog/logging.h>
#include <iostream>
#include <sstream>
#include <stdarg.h>
#include <string>

#include "bsLog.h"

/* Glog 日志打印相关接口声明 */
static void LogProcSignal(const char* data, int size);
static void LogInit(const char* LogName, int32_t LogCfg);
static void LogPrintf(int Level, const char* Fmt, va_list Vl);

typedef struct BsLogCtx
{
    int32_t InitFlag; // Log 初始化标记

    void*            pCtx;  // 存储临时指针
    LogInitCallback  Init;  // 初始化函数
    LogPrintCallback Print; //打印函数
} BsLogCtx_t;

static BsLogCtx_t BsLog = 
{ 
	.InitFlag = 0, 
	.pCtx = NULL, 
	.Init = LogInit, 
	.Print = LogPrintf 
};


static void LogProcSignal(const char* data, int size)
{

    LOG(ERROR) << __func__ << ":Error..." << std::string(data, size);
	return;
}

static void LogInit(const char* LogName, int32_t LogCfg)
{
    int32_t Flag = 0;

    FLAGS_alsologtostderr = 1;

    Flag = LogCfg & LOG_FILE;
    if (Flag)
    {
        FLAGS_max_log_size = 2;
        google::InitGoogleLogging("");
        google::SetLogDestination(google::GLOG_INFO, LogName);
        google::SetLogFilenameExtension(".log");
    }
	
    google::InstallFailureSignalHandler();
    google::InstallFailureWriter(&LogProcSignal);

	return;
}

static void LogPrintf(int Level, const char* Fmt, va_list Vl)
{
    char LogBuf[8192] = { 0 };

    vsnprintf(LogBuf, 8192, Fmt, Vl);

    switch (Level)
    {
        case LOG_INFO:
            LOG(INFO) << LogBuf;
            break;
        case LOG_WARN:
            LOG(WARNING) << LogBuf;
            break;
        case LOG_ERROR:
            LOG(ERROR) << LogBuf;
            break;
        case LOG_FATAL:
            LOG(FATAL) << LogBuf;
            break;
        default:
            LOG(INFO) << LogBuf;
            break;
    }

	return;	
}

void BsSetLogCbFuc(LogInitCallback Init, LogPrintCallback Print)
{

    BsLog.Init  = Init;
    BsLog.Print = Print;

	return;
}

void BsLogInit(const char* FileName, int32_t BsLogCfg)
{

    BsLog.Init(FileName, BsLogCfg);

    if (0 == BsLog.InitFlag)
    {
        BsLog.InitFlag = 1;
    }

	return;	
}

void BsLogPrint(LogLevel_t Level, const char* Fmt, ...)
{

    if (0 == BsLog.InitFlag)
    {
        int32_t     Flags    = LOG_STAD;
        const char* FileName = "NVR";

        BsLogInit(FileName, Flags);
    }

    va_list Vl;
    va_start(Vl, Fmt);
    BsLog.Print(Level, Fmt, Vl);
    va_end(Vl);

	return;
}

#if 0
int main(int argc, char** argv)
{

    int32_t     Flags   = LOG_STAD;
    const char* LogName = "NVR";

    BsLogInit(LogName, Flags);
    BsLogPrint(LOG_INFO, "hello world.");

    return 0;
}
#endif
