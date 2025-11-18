#include <stdio.h>

extern unsigned long long _start(void);

void app_main(void){
    unsigned long long result = _start();

    printf("Input value 0x%llx successfully stored at register x5.\n", result);

}