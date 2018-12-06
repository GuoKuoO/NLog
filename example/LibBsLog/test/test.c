#include <string.h>
#include <stdio.h>

#define TEST_LG  (1)

#if TEST_LG

#include "bsLog.h"

int main(int argc, char** argv)
{

    int32_t     Flags   = LOG_STAD | LOG_FILE;
    const char* LogName = "NVR";

    BsLogInit(LogName, Flags);
    BsLogPrint(LOG_INFO, "hello world.");

    return 0;
}

#endif