#include <fcntl.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h> // serve per sapere la dimensione del file
#include <sys/wait.h>
#include <unistd.h>

#define PIPE_WR 1
#define PIPE_RD 0

sem_t mutex;

int main() {
  pid_t pid1, pid2;
  sem_init(&mutex, 1, 1);
  int fd1[2], fd2[2];
  int f = open("lorem.txt", O_RDONLY);
  struct stat file_info; // con questo implemento file_info.st_size per sapere
                         // la dimensione del file
  stat("lorem.txt", &file_info);

  if (pipe(fd1) < 0 || pipe(fd2) < 0) {
    return -1;
  }

  pid1 = fork();
  if (pid1 < 0) {
    return -1;
  } else if (pid1 == 0) {
    // Figlio
    close(fd1[PIPE_RD]);
    sem_wait(&mutex);

    char primameta[(file_info.st_size) / 2];
    read(f, primameta, sizeof(primameta));
    write(fd1[PIPE_WR], primameta, sizeof(primameta));

    sem_post(&mutex);
    exit(0);
  } else if (pid1 > 0) {
    // Padre
    pid2 = fork();
    if (pid2 < 0) {
      return -1;
    } else if (pid2 == 0) {
      // Figlio
      close(fd2[PIPE_RD]);
      sem_wait(&mutex);
      lseek(f, (file_info.st_size) / 2, SEEK_SET);
      char secondameta[(file_info.st_size) / 2];
      read(f, secondameta, sizeof(secondameta));
      write(fd2[PIPE_WR], secondameta, sizeof(secondameta));

      sem_post(&mutex);
      exit(0);

    } else if (pid2 > 0) {
      // Padre
      close(fd1[PIPE_WR]);
      close(fd2[PIPE_WR]);
      waitpid(pid1, NULL, 0);
      waitpid(pid2, NULL, 0);

      char meta[file_info.st_size];

      read(fd1[PIPE_RD], meta, sizeof(meta));
      printf("Il primo figlio ha letto --> %s\n", meta);

      read(fd2[PIPE_RD], meta, sizeof(meta));
      printf("Il secondo figlio ha letto --> %s\n", meta);
    }
  }

  return 0;
}
