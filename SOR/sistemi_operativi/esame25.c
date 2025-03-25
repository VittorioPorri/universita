g#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void print_buffer(int *buffer) {
  printf("[");
  for (int i = 0; i < 11; i++) {
    printf("%d ", buffer[i]);
  }
  printf("]\n");
}

int main() {
  int buffer[11] = {0};

  pid_t pid1, pid2;
  int fd1[2], fd2[2];

  if (pipe(fd1) < 0 || pipe(fd2) < 0) {
    return -1;
  }

  pid1 = fork();
  if (pid1 < 0) {
    return -1;
  } else if (pid1 == 0) {
    // figlio 1
    srand(getpid());
    close(fd1[0]);
    while (1) {
      int pos1 = rand() % 11;
      write(fd1[1], &pos1, sizeof(pos1));
      printf("sono il figlio 1 e ho comunicato la pos %d\n", pos1);
      sleep(rand() % 4);
    }
  } else if (pid1 > 0) {
    // padre
    pid2 = fork();
    if (pid2 < 0) {
      return -1;
    } else if (pid2 == 0) {
      // figlio 2
      close(fd2[0]);
      srand(getpid());
      while (1) {
        int pos2 = rand() % 11;
        write(fd2[1], &pos2, sizeof(pos2));
        printf("sono il figlio 2 e ho comunicato la pos %d\n", pos2);
        sleep(rand() % 4);
      }
    } else if (pid2 > 0) {
      // padre
      close(fd1[1]);
      close(fd2[1]);
      while (1) {
        int pos1;
        int pos2;

        read(fd1[0], &pos1, sizeof(pos1));
        read(fd2[0], &pos2, sizeof(pos2));

        buffer[pos1] = 1;
        buffer[pos2] = -1;

        print_buffer(buffer);
        int p = 0, n = 0;
        for (int i = 0; i < 11; i++) {
          if (buffer[i] == 0) {
            n = 0;
            p = 0;
            break;
          } else if (buffer[i] == 1) {
            p++;
          } else {
            n++;
          }
        }
        if (p > n) {
          kill(pid1, SIGTERM);
          kill(pid2, SIGTERM);
          printf("il vincitore è il figlio 1");
          exit(0);
        } else if (n > p) {
          kill(pid1, SIGTERM);
          kill(pid2, SIGTERM);
          printf("il vincitore è il figlio 2");
          exit(0);
        }
      }
    }
  }

  return 0;
}
