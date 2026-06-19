extern int dup(int);
extern int close(int);
extern int errno;
static int local;
static void local_func(void) {}

struct holder {
  void *a_bind;
  void *a_rebase;
  char a_gap[256];
  void *b_bind;
  void *b_rebase;
  char b_gap[256];
  void *c_bind;
  void *c_rebase;
  char c_gap[256];
  void *d_bind;
};

struct holder h = {
  (void *)&errno,
  (void *)&local,
  {0},
  (void *)(&errno+2),
  (void *)(&local+2),
  {0},
  (void *)&dup,
  (void *)&local_func,
  {0},
  (void *)&close,
};

