/* Based on gcc/gcc/testsuite/gcc.dg/tree-prof/cold_partition_label.c */
/* foo is split into foo and foo.cold. bar is inlined in both cases.  */

#define MAXITER 10000
#define SIZE 10000

const char *sarr[SIZE];
const char *buf_hot;
const char *buf_cold;

struct Foo
{
  int a;
  void foo(int path);
  void bar(const char *s);
};

void Foo::bar(const char *s) {
  int i;
  for (i = 0; i < SIZE; i++)
    sarr[i] = s;
}

__attribute__((noinline))
void Foo::foo(int path) {
  if (path)
    bar(buf_hot);
  else
    bar(buf_cold);
}

int main(int argc, char *argv[]) {
  Foo foo = {};
  int i;
  buf_hot =  "hello";
  buf_cold = "world";
  for (i = 0; i < MAXITER; i++)
    foo.foo(argc);
  return 0;
}
