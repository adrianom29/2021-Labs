#include <stdio.h>

extern int add_numbers();

void app_main(void) {
    int result = add_numbers();
    printf("Result of addition = %d\n", result);
}