#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


//Algoritmo FIFO

typedef struct node{
    int e;
    struct node *next;
}node;

typedef struct pila{   
    struct node *start;
    int len;

}pila;


node* init_node(int value){
    node *nd = malloc(sizeof(node));
    
    nd->e = value;
    nd->next = NULL;

    return nd;
}

pila* init_pila(){
    pila *P = malloc(sizeof(pila));

    P->start = NULL;
    P->len = 0;

    return P;
}

void printer(pila *P){
    printf("[");
    node *nd = P->start;
    while (nd != NULL) {
        printf("%d", nd->e);
        if (nd->next != NULL) {
            printf(", ");
        }
        nd = nd->next;
    }
    printf("]\n");
}

bool isEmpty(pila *P){
    return P->start == NULL;
}


void push(pila *P, int e){
    node *nd = init_node(e);
    
    nd->next = P->start;
    P->start = nd;
    P->len++;

}

int pop(pila * P){
    node *nd = P->start;

    if(nd == NULL){
        printf("Bru la pila è vuota: ");
        return -1;
    }else{
        int e = P->start->e;
        P->start = P->start->next;
        free(nd);
        P->len--;
        return e;
    }

}

int top(pila *P){
    return P->start->e;
}

int main(){
    pila *P = init_pila();

    push(P, 10);
    push(P, 20);
    push(P, 30);

    printf("Pila dopo gli accodamenti: ");
    printer(P);

    printf("%d\n",pop(P));
    printf("%d\n",pop(P));
    printf("%d\n",pop(P));
    printf("%d\n",pop(P));

    printf("Pila dopo le cancellazioni: ");
    printer(P);

    
    return 0;
}
