#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#define N 10

sem_t mutex;
sem_t semaforo;
pthread_t thread[5];

int buffer[N] = {0};

void *produttore(void *args) {
  while (1) {
    sem_wait(&mutex);
    sem_wait(&semaforo);
    srand(time(NULL));
    int pos1 = rand() % N;
    int pos2 = rand() % N;

    int n = rand() % 101;

    buffer[pos1] = n;
    buffer[pos2] = 2 * n;
    sem_post(&semaforo);
    sem_post(&mutex);
  }
  exit(0);
}

void *lettore(void *args) {

  srand(time(NULL));
  while (1) {
    sem_wait(&mutex);
    sem_wait(&semaforo);

    int pos1 = rand() % N;
    int pos2 = rand() % N;

    printf("Ho sommato il valore in pos %d e quello in pos %d -->%d\n", pos1,
           pos2, (buffer[pos1] + buffer[pos2]));
    sleep(rand() % 4);
    sem_post(&semaforo);
    sem_post(&mutex);
  }
  exit(0);
}

int main() {

  sem_init(&semaforo, 0, 1);
  sem_init(&mutex, 0, 1);
  pthread_create(&thread[0], NULL, produttore, NULL);

  for (int i = 1; i < N; i++) {
    pthread_create(&thread[i], NULL, lettore, NULL);
  }

  for (int i = 0; i < N; i++) {
    pthread_join(thread[i], NULL);
  }

  sem_destroy(&semaforo);
  sem_destroy(&mutex);

  return 0;
}
