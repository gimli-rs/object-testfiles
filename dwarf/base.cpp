#define SIZE 10000

const char *sarr[SIZE];

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
    bar("hello");
  else
    bar("world");
}

int main(int argc, char *argv[]) {
  Foo foo = {};
  foo.foo(argc);
  return 0;
}
