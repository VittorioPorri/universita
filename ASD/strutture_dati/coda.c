#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


//Algoritmo FIFO

typedef struct node{
    int e;
    struct node *next;
}node;

typedef struct coda{   
    struct node *start;
    struct node *last;
    
    int len;
}coda;


node* init_node(int value){
    node *nd = malloc(sizeof(node));
    
    nd->e = value;
    nd->next = NULL;

    return nd;
}

coda* init_code(){
    coda *C = malloc(sizeof(coda));

    C->start = NULL;
    C->last = NULL;
    C->len = 0;

    return C;
}

void printer(coda *C){
    printf("[");
    node *nd = C->start;
    while (nd != NULL) {
        printf("%d", nd->e);
        if (nd->next != NULL) {
            printf(", ");
        }
        nd = nd->next;
    }
    printf("]\n");
}

bool isEmpty(coda *C){
    return C->start == NULL;
}


void enqueue(coda *C, int e){
    node *nd = init_node(e);
    if(isEmpty(C)){
        C->start = nd;
    }else{
        C->last->next = nd; 
    }
    C->last = nd;
    C->len++;

}

int dequeue(coda * C){
    node *nd = C->start;

    if(nd == NULL){
        printf("Bru la coda è vuota: ");
        return -1;
    }else{
        int e = C->start->e;
        C->start = C->start->next;
        if(C->start == NULL){
            C->last = NULL;
        }
        free(nd);
        C->len--;
        return e;
    }

}

int first(coda *C){
    return C->start->e;
}

int main(){
    coda *C = init_code();

    enqueue(C, 10);
    enqueue(C, 20);
    enqueue(C, 30);

    printf("Coda dopo gli accodamenti: ");
    printer(C);

    printf("%d\n",dequeue(C));
    printf("%d\n",dequeue(C));
    printf("%d\n",dequeue(C));
    printf("%d\n",dequeue(C));

    printf("Coda dopo le cancellazioni: ");
    printer(C);

    return 0;
}
