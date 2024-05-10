/*
 *Scrivere un programma C che segue le seguenti specifiche. Il processo
 *eseguito, inizialmente crea un buffer come array di 11 numeri interi,
 *inizializzati a zero. In seguito genera tre thread utilizzando le librerie
 *POSIX secondo le seguenti specifiche: -Il primo thread sceglie casualmente una
 *cella del buffer e vi scrive il numero +1, qualsiasi sia il valore presente
 *nella cella. -Il secondo thread sceglie casualmente una cella del buffer e vi
 *scrive il numero -1, qualsiasi sia il valore presente nella cella. -Il terzo
 *thread controlla se tutte le celle del buffer sono state inizializzate. In
 *caso positivo, determina se il numero di celle contententi un valore pari a +1
 *è maggiore di quelle con -1 e termina tutti e tre i thread. Mentre un thread
 *ha accesso al buffer, nessun altro thread deve accedervi. Una volta che un
 *thread ha acceduto in lettura o scrittura al buffer, deve attendere un numero
 *di secondi random tra 0 e 3
 */
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

int buffer[9] = {0};
pthread_mutex_t mutex;
pthread_cond_t cond;
pthread_t thread1, thread2, tester;

void printbuffer() {
  printf("[");
  for (int i = 0; i < 10; i++) {
    printf("%d ", buffer[i]);
  }
  printf("]\n");
}

void *writer(void *value) {
  int v;
  if (value == (int *)-1) {
    v = -1;
  } else {
    v = 1;
  }
  while (1) {
    pthread_mutex_lock(&mutex);
    int n = rand() % 10;
    buffer[n] = v;
    printbuffer();
    pthread_cond_signal(&cond);
    pthread_mutex_unlock(&mutex);
    sleep(3);
  }
}

void *test() {
  pthread_mutex_lock(&mutex);
  for (int i = 0; i < 10; i++) {
    if (buffer[i] == 0) {
      pthread_cond_wait(&cond, &mutex);
      i--;
    }
  }
  int n1 = 0, n2 = 0;
  for (int i = 0; i < 10; i++) {
    if (buffer[i] == 1) {
      n2++;
    } else {
      n1++;
    }
  }
  pthread_cancel(thread1);
  pthread_cancel(thread2);

  if (n1 > n2) {
    printf("il vincitore è il thread che segna valori -1\n");
  } else {
    printf("il vincitore è il thread che segna valori -1\n");
  }

  pthread_mutex_unlock(&mutex);
}

int main(int arg, char **argv) {
  srand(time(NULL));
  pthread_mutex_init(&mutex, NULL);
  pthread_cond_init(&cond, NULL);

  pthread_create(&thread1, NULL, (void *)writer, (void *)(-1));
  pthread_create(&thread2, NULL, (void *)writer, (void *)(1));
  pthread_create(&tester, NULL, test, NULL);

  pthread_join(thread1, NULL);
  pthread_join(thread2, NULL);
  pthread_join(tester, NULL);

  pthread_mutex_destroy(&mutex);
  pthread_cond_destroy(&cond);

  return 0;
}
