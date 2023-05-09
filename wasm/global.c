#include <stdint.h>

void console_log(uint32_t value);

uint32_t global1 = 1;
uint32_t global2 = 2;

void print() {
    console_log(global1);
    console_log(global2);
}
