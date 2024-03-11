#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

pthread_t thread1, thread2, thread3;

int bufferA[10] = {0};
int bufferB[10] = {0};
pthread_mutex_t mutex;
pthread_cond_t cond, comps;

void *writerA() {
  while (1) {
    pthread_mutex_lock(&mutex);
    int n = rand() % 151;
    int pos = rand() % 10;
    bufferA[pos] = n;
    pthread_cond_signal(&cond);
    pthread_mutex_unlock(&mutex);
  }
}

void *writerB() {
  while (1) {
    pthread_cond_wait(&cond, &mutex);
    int n = rand() % 151;
    int pos = rand() % 10;
    bufferB[pos] = n;
    pthread_cond_signal(&comps);
  }
}

void *controllore() {
  for (int i = 0; i < 10; i++) {
    if (bufferB[i] == 0 && bufferA[i] == 0) {
      pthread_cond_wait(&comps, &mutex);
    }
  }

  int maxa = 0, maxb = 0;
  for (int i = 0; i < 10; i++) {
    if (bufferA[i] > maxa) {
      maxa = bufferA[i];
    }
    if (bufferB[i] > maxb) {
      maxb = bufferB[i];
    }
  }

  pthread_cancel(thread1);
  pthread_cancel(thread2);

  if (maxa > maxb) {
    printf("il vincitore è A con il valore --> %d\n", maxa);
  } else {
    printf("il vincitore è B con il valore --> %d\n", maxb);
  }
  exit(0);
}

int main() {
  srand(time(NULL));
  pthread_mutex_init(&mutex, NULL);
  pthread_cond_init(&cond, NULL);
  pthread_cond_init(&comps, NULL);

  pthread_create(&thread1, NULL, writerA, NULL);
  pthread_create(&thread2, NULL, writerB, NULL);
  pthread_create(&thread3, NULL, controllore, NULL);

  pthread_join(thread1, NULL);
  pthread_join(thread2, NULL);
  pthread_join(thread3, NULL);

  pthread_mutex_destroy(&mutex);
  pthread_cond_destroy(&cond);
  pthread_cond_destroy(&comps);

  return 0;
}
