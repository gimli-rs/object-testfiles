// Simple C file to generate LIDATA records
// OpenWatcom C compiler generates LIDATA for large initialized arrays
// Build with: wcc -ms -bt=DOS -fo=test_lidata.obj test_lidata.c

// Arrays with >= 50 elements of the same value generate LIDATA
char zeros[100] = {0};           // 100 zero bytes -> LIDATA
int pattern[75] = {0x5555};      // 75 ints with same value -> LIDATA
unsigned short ffs[50] = {0xFFFF};        // 50 shorts -> LIDATA

// Smaller arrays use LEDATA
char small[10] = {0};            // Too small, uses LEDATA

// Mixed patterns don't generate LIDATA
char mixed[] = {1, 2, 3, 4, 5};  // Different values, uses LEDATA

// Function to reference the data
void use_arrays() {
    zeros[0] = 1;
    pattern[0] = 2;
    ffs[0] = 3;
}

int main() {
    use_arrays();
    return 0;
}
