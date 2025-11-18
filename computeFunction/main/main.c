#include <stdio.h>

extern int _start();

void app_main(){
    int result = _start();
    printf("x^2 + y^2 = %d\n", result);
}