#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

pthread_mutex_t mutex;
pthread_cond_t cond, comps;

int buffer[10] = {0};
pthread_t thread1, thread2, thread3;

void print_buffer() {
  printf("[");
  for (int i = 0; i < 10; i++) {
    printf("%d ", buffer[i]);
  }
  printf("]\n");
}

void *pari() {
  srand(time(NULL));
  while (1) {
    pthread_mutex_lock(&mutex);
    int pos = rand() % 10;
    int n = rand() % 21;
    int q = n * n;
    if (q % 2 == 0) {
      buffer[pos] = q;
    } else {
      printf("fanculo\n");
    }

    pthread_cond_signal(&cond);
    pthread_mutex_unlock(&mutex);
    sleep(1);
  }
}

void *dispari() {
  while (1) {
    pthread_mutex_lock(&mutex);
    pthread_cond_wait(&cond, &mutex);
    int pos1 = rand() % 10;
    int n = rand() % 21;
    int q1 = n * n;
    if (q1 % 2 == 1) {
      buffer[pos1] = q1;
    } else {
      printf("fanculo parte due\n");
    }

    pthread_cond_signal(&comps);
    pthread_mutex_unlock(&mutex);
  }
}

void *checker() {
  pthread_mutex_lock(&mutex);

  for (int i = 0; i < 10; i++) {
    if (buffer[i] == 0) {
      print_buffer();
      pthread_cond_wait(&comps, &mutex);
      i--;
    }
  }

  pthread_cancel(thread1);
  pthread_cancel(thread2);
  int p = 0, d = 0;
  for (int i = 0; i < 10; i++) {
    if (buffer[i] % 2 == 0) {
      p++;
    } else {
      d++;
    }
  }
  if (p >= d) {
    printf("Vince il thread 1\n");
  } else {
    printf("Vince il thread 2\n");
  }

  pthread_mutex_unlock(&mutex);
  exit(0);
}

int main() {
  pthread_mutex_init(&mutex, NULL);
  pthread_cond_init(&cond, NULL);
  pthread_cond_init(&comps, NULL);

  pthread_create(&thread1, NULL, pari, NULL);
  pthread_create(&thread1, NULL, dispari, NULL);
  pthread_create(&thread3, NULL, checker, NULL);

  pthread_join(thread1, NULL);
  pthread_join(thread2, NULL);
  pthread_join(thread3, NULL);

  pthread_mutex_destroy(&mutex);
  pthread_cond_destroy(&cond);
  pthread_cond_destroy(&comps);

  return 0;
}
