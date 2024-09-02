// Source: https://reviews.llvm.org/D84825#2183197
__attribute__((noinline)) void f1() { }
void f2() {
  int i = 3;
  f1();
  i = 7;
  f1();
}
int main() {
  int i = 3;
  f1();
  i = 7;
  f1();
}
