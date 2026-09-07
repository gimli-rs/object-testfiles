int data_int = 1;
int bss_int;
_Thread_local int tls_int = 7;
_Thread_local int tbss_int;
const char rodata_bytes[3] = { 1, 2, 3 };
const char *rodata_str = "hello";
__attribute__((retain, used)) int retained_int = 3;

int get(void) {
    return data_int + bss_int + tls_int + tbss_int + (int)rodata_bytes + (int)rodata_str + retained_int;
}
