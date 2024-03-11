#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

int buffer[20] = {0};
pthread_t cons, prod;
sem_t semaforo;

void printbuffer() {
  printf("[");
  for (int i = 0; i < 20; i++) {
    printf("%d ", buffer[i]);
  }
  printf("]\n");
}

void *produttore() {
  for (int i = 0; i < 20; i++) {
    sem_wait(&semaforo);
    if (i % 2 == 0) {
      buffer[i] = rand() % 101;
    } else {
      buffer[i] = rand() % 101 + 100;
    }
    printbuffer();
    sem_post(&semaforo);
    sleep(2);
  }
}

void *consumatore() {
  for (int i = 0; i < 20; i++) {
    sem_wait(&semaforo);
    int n = rand() % 19;
    printf("%d\n", buffer[n] + buffer[n + 1]);
    sem_post(&semaforo);
    sleep(2);
  }
}

int main() {
  srand(time(NULL));
  sem_init(&semaforo, 0, 1);

  pthread_create(&prod, NULL, produttore, NULL);
  pthread_create(&cons, NULL, consumatore, NULL);

  pthread_join(cons, NULL);
  pthread_join(prod, NULL);

  sem_destroy(&semaforo);

  return 0;
}
