/*
 * Si scriva un programma con tre thread che risolvono il seguente problema, Un
 * buffer di n elementi vinene riempito nel seguente modo:
 * - Il primo thread aggiunge nella posizione pari del buffer un numero da 0 a
 * 99
 * - Il secondo thread aggiunge nella posizione dispari del buffer un numero da
 * 100 a 200
 * - Il terzo somma gli elementi e modifica il buffer nel segnete modo
 *   buffer[0]  = buffer[0] , buffer[1] = buffer[1]+buffer[0] ,  buffer[2] =
 * buffer[2]+buffer[1] ...
 */

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

int buffer[9] = {0};
pthread_t thread1, thread2, threadsomma;

pthread_mutex_t mutex;
pthread_cond_t cond;

void printbuffer() {
  printf("[");
  for (int i = 0; i < 10; i++) {
    printf("%d ", buffer[i]);
  }
  printf("]\n");
}

void *pari() {
  int i = 0;
  while (1) {
    pthread_mutex_lock(&mutex);
    int n = rand() % 100;
    if (i < 10) {
      buffer[i] = n;
      printbuffer();
      i = i + 2;
    }
    pthread_cond_signal(&cond);
    pthread_mutex_unlock(&mutex);
  }
}

void *dispari() {
  int i = 1;
  while (1) {
    pthread_mutex_lock(&mutex);
    int n = rand() % 100 + 101;
    if (i < 10) {
      buffer[i] = n;
      printbuffer();
      i = i + 2;
    }
    pthread_cond_signal(&cond);
    pthread_mutex_unlock(&mutex);
  }
}

void *somma() {
  int i = 0;
  while (i < 10) {
    if (buffer[i] != 0) {
      i++;
    } else if (buffer[i] == 0) {
      pthread_cond_wait(&cond, &mutex);
    }
  }

  pthread_cancel(thread1);
  pthread_cancel(thread2);

  for (int i = 1; i < 10; i++) {
    buffer[i] = buffer[i] + buffer[i - 1];
  }

  printbuffer();
  exit(0);
}

int main() {
  pthread_mutex_init(&mutex, NULL);
  pthread_cond_init(&cond, NULL);

  pthread_create(&thread1, NULL, (void *)pari, NULL);
  pthread_create(&thread2, NULL, (void *)dispari, NULL);
  pthread_create(&threadsomma, NULL, (void *)somma, NULL);

  pthread_join(thread1, NULL);
  pthread_join(thread2, NULL);
  pthread_join(threadsomma, NULL);

  pthread_mutex_destroy(&mutex);
  pthread_cond_destroy(&cond);

  return 0;
}
