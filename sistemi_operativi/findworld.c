/*
 * Crea un programma che legge un file e conta le occorrenze di una parola nel
 * seguente modo:
 * - il primo processo legge dall'inizio alla metà e conta le occorenze della
 * parola.
 * - il secondo processo legge dalla metà fino alla fine e conta le occorenze
 * della parola.
 * - Inviano poi il numero di occorenze al processo padre, il quale le somma e
 * le stampa a video.
 */

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>

int caratteri(int fl) {
  int cont = 0;
  char s;
  while (read(fl, &s, sizeof(s)) == 1) {
    cont++;
  }
  return cont;
}

int main(int arg, char **argv) {
  pid_t pid1;
  int fd[2];
  int fl = open("lorem.txt", O_RDONLY);

  if (pipe(fd) < 0) {
    return -1;
  }

  pid1 = fork();
  if (pid1 < -1) {
    return -1;
  } else if (pid1 == 0) {
    // processo figlio 1
    close(fd[0]);
    lseek(fl, 44, SEEK_SET);
    int cont = caratteri(fl);
    write(fd[1], &cont, sizeof(cont));

    exit(0);
  } else if (pid1 > 0) {
    // processo padre
    close(fd[1]);
    waitpid(pid1, NULL, 0);
    int cont;
    read(fd[0], &cont, sizeof(cont));
    printf("A partire dal byte 44 compaiono %d caratteri\n", cont);

    exit(0);
  }

  return 0;
}
