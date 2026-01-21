#ifndef CS5600_LAB1_QUEUE_H
#define CS5600_LAB1_QUEUE_H

#include <stdio.h>
#include <stdlib.h>

typedef struct node_t {
    struct node_t *next;
    //char data[128];
    char * data;
} node_t;


typedef struct queue_t {
    struct node_t *head;
    struct node_t *tail;
} queue_t;


void enqueue(queue_t *q, char *data);
void *dequeue(queue_t *q);
void print_queue(queue_t *q);
void free_queue(queue_t *q);
char * dequeue_Helper_For_ciphered_queue(queue_t *q);
char * getData_before_dequeue_helper(queue_t * q);
void * reverseEnqueue(queue_t *q);
void reverseDequeue(queue_t * q, char * data);

#endif
