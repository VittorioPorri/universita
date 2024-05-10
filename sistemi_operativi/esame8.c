#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

void gestore(int segnale) { printf("Disabilitato\n"); }
int main() {
  pid_t pid1, pid2;
  int fd1[2], fd2[2];

  if (pipe(fd1) < 0 || pipe(fd2) < 0) {
    printf("errore durante la creazione delle pipe");
    return -1;
  }
  pid1 = fork();
  if (pid1 < 0) {
    printf("errore durante la creazione della fork");
    return -1;
  } else if (pid1 == 0) {
    // processo figlio 1
    srand(time(NULL));
    close(fd1[0]);
    while (1) {
      signal(SIGINT, gestore);
      int n1 = rand() % 101;
      write(fd1[1], &n1, sizeof(n1));
      sleep(1);
    }

  } else if (pid1 > 0) {
    // processo padre
    pid2 = fork();
    if (pid2 < 0) {
      printf("errore durante la creazione della fork");
      return -1;
    } else if (pid2 == 0) {
      // processo figlio 2
      srand(time(NULL));
      close(fd2[0]);
      while (1) {
        signal(SIGINT, gestore);
        int n2 = rand() % 101;
        write(fd2[1], &n2, sizeof(n2));
        sleep(1);
      }
    } else if (pid2 > 0) {
      // processo padre
      int f = open("save.txt", O_TRUNC | O_CREAT, 0644);
      close(fd1[1]);
      close(fd2[1]);
      while (1) {
        int n1 = 0, n2 = 0;
        read(fd1[0], &n1, sizeof(n1));
        read(fd2[0], &n2, sizeof(n2));

        int sum = n1 + n2;
        write(f, &sum, sizeof(sum));
        lseek(f, sizeof(sum + 1), SEEK_SET);
        printf("%d\n", sum);

        if (sum == 100) {
          exit(0);
        } else {
          sleep(2);
        }
      }
    }
  }

  return 0;
}
