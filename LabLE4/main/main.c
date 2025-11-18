#include <stdio.h>
#include <stdbool.h>

extern unsigned struint(const char *text, bool *ok);

void app_main(void) {
    static const char *tests[] = {
        "2212",
        "59940",
        "123",
        "0234",
        "0",
        "905",
        "9_05",
        "907,",
        NULL
    };

    bool ok;
    unsigned v;

    for (unsigned ux = 0; tests[ux] != NULL; ++ux) {
        ok = 0;
        v = struint(tests[ux], &ok);

        printf("struint('%s') => %u, ok = %d\n", tests[ux], v, ok);
    }

    puts("Done");
    fflush(stdout);
}