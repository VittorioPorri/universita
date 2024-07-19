#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

int main(int argv, char **arg) {
  srand(time(NULL));
  pid_t pid1, pid2;
  int fd1[2];
  int fd2[2];

  if (pipe(fd1) < 0 || pipe(fd2) < 0) {
    return -1;
  }

  pid1 = fork();
  if (pid1 == 0) {
    close(fd1[0]);
    while (1) {
      int n = rand() % 51;
      write(fd1[1], &n, sizeof(n));
    }
  } else if (pid1 > 0) {
    // padre
    pid2 = fork();
    if (pid2 == 0) {
      close(fd2[0]);
      while (1) {
        int n = rand() % 50 + 51;
        write(fd2[1], &n, sizeof(n));
      }
    } else if (pid2 > 0) {
      // padre
      close(fd1[1]);
      close(fd2[1]);
      int sum = 0;
      while (sum < 120) {
        sum = 0;
        int a, b;
        read(fd1[0], &a, sizeof(a));
        read(fd2[0], &b, sizeof(b));
        printf("sum = %d\n", sum = a + b);
      }

      exit(0);
    }
  }
  return 0;
}
