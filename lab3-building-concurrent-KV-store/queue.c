#include "queue.h"

// Exercise 2: implement a concurrent queue

// TODO: define your synchronization variables here

pthread_cond_t q_cond = PTHREAD_COND_INITIALIZER;
pthread_mutex_t q_lock = PTHREAD_MUTEX_INITIALIZER;

// (hint: don't forget to initialize them)


// add a new task to the end of the queue
// NOTE: queue must be implemented as a monitor
void enqueue(queue_t *q, task_t *t) {
    /* TODO: your code here */

    pthread_mutex_lock(&q_lock);

    t->next = NULL;
    if(q->tail != NULL)
    {
        q->tail->next = t;
    }
    else{
        q->head = t;
    }

    q->tail = t;
    q->count++;

    pthread_cond_signal(&q_cond);
    pthread_mutex_unlock(&q_lock);

}

// fetch a task from the head of the queue.
// if the queue is empty, the thread should wait.
// NOTE: queue must be implemented as a monitor
task_t* dequeue(queue_t *q) {
    /* TODO: your code here */

    pthread_mutex_lock(&q_lock);

    while (q->head == NULL)
    {
        pthread_cond_wait(&q_cond, &q_lock);
    }

    task_t *t = q->head;

    q->head = t->next;

    if(q->head==NULL)
    {
        q->tail = NULL;
    }

    q->count--;
    pthread_mutex_unlock(&q_lock);

    return t;
}

// return the number of tasks in the queue.
// NOTE: queue must be implemented as a monitor
int queue_count(queue_t *q) {
    /* TODO: your code here */

    pthread_mutex_lock(&q_lock);
    int count = q->count;
    pthread_mutex_unlock(&q_lock);

    return count;
}
