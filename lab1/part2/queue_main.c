#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include "queue.h"

void usage() {
    printf("Usage: ./queue <file>\n");
}

void exitGracefully(queue_t * q)
{
    if(q==NULL)
    {
        exit(0);
    }else{

    node_t * currentNode = q->head;
    node_t *tempNext;

    while(currentNode!=NULL)
    {
        tempNext = currentNode->next;
        free(currentNode);
        currentNode = tempNext;
    }
        exit(0);
    }
}


/**
 * Exercise 5:
 * based on the content of "lineptr",
 * you should either call "enqueue" or "dequeue".
 * Read "lab1-shell-APIs.txt" for examples.
 *
 * Hint: check out what string functions are provided by C library.
 * Also, here are some possibly useful functions: strtok, strcmp
 **/
void process_line(queue_t *q, char *lineptr) {
    // TODO: your code here

    // you should remove this line
    //printf("cmd: %s", lineptr);

    //printf("new line: %s", lineptr);

    const char *delimiter = " \n";
    char * command = strtok(lineptr, delimiter);
    if(strcmp(command, "enqueue")==0)
    {
        char * arg = strtok(NULL, delimiter);
        if(arg==NULL || strcmp(arg, " ")==0)
        {
            printf("ERROR\n");
            exitGracefully(q);   
        }
        //printf("%s", arg);
        enqueue(q, arg);
    }
    else if(strcmp(command, "dequeue")==0)
    {
        dequeue(q);
    } 

}


void final_print(queue_t *q) {
    print_queue(q);
}

int main(int argc, const char *argv[]) {

    if (argc != 2) {
        usage();
        return -1;
    }

    // create a new queue
    queue_t *q = (queue_t *) malloc(sizeof(queue_t));
    q->head = NULL;
    q->tail = NULL;

    // read from file line by line
    const char *path = argv[1];
    FILE *fp;
    char *lineptr = NULL;
    size_t n = 0;

    fp = fopen(path, "r");
    assert(fp != NULL);

    while (getline(&lineptr, &n, fp) != -1) {
        process_line(q, lineptr);
    }
    final_print(q);

    fclose(fp);
    if (lineptr != NULL) {
        free(lineptr);
    }
    free_queue(q);
    free(q);

    return 0;
}
