#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include "queue.h"
#include "caesar.h"
#include "commandStack.h"

void usage() {
    printf("Usage: ./ciphered-queue <file> \n");
}

void undo(queue_t * q, command_stack * stack);

void exitGracefully(queue_t * q, command_stack * stack)
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

        destroy_stack(stack);
        exit(0);
    }

    
}

each_command * build_commandObject(char * cmd, char * data, int key)
{
    each_command * newCommandObject = (each_command *) malloc(sizeof(each_command));

    if(newCommandObject == NULL)
    {
        return NULL;
    }

    newCommandObject->command = (cmd!=NULL) ? strdup(cmd):NULL;
    newCommandObject->data = (data != NULL) ? strdup(data):NULL;
    newCommandObject->key=key;
    newCommandObject->pointerToPreviousCommand = NULL;

    return newCommandObject;
}

/**
 * Exercise 6:
 * define and implement two functions: "encode_enqueue" and "dequeue_decode"
 *   -- "encode_enqueue": encode the string and then enqueue
 *   -- "dequeue_decode": dequeue an element and then decode
 * Read "lab1-shell-APIs.txt" for examples.
 **/

// TODO: implement "encode_enqueue" and "dequeue_decode"

void encode_enqueue(queue_t *q, char *data, int key)
{
    //char * dataCopy = malloc(strlen(data)+1);
    //strcpy(dataCopy, data);

    char * encodedData = encode(data, key);
    if(strcmp(encodedData, "ILLCHAR")==0)
    {
        printf("ILLCHAR");
    }else{
        enqueue(q, encodedData);
    }
    
}


void reverseDequeueDecode(queue_t * q, char * data, int key)
{
    char * encodedData = encode(data, key);

    node_t * frontNode = malloc(sizeof(node_t));
    frontNode->data = encodedData;

    if(q->head==NULL)
    {
        q->head = frontNode;
        if(q->tail == NULL)
        {
            q->tail = frontNode;
        }
        return;
    }

    node_t * tempNode = q->head;
    q->head = frontNode;
    frontNode->next = tempNode;
    return;
}


void * dequeue_decode(queue_t * q, int key)
{

    if(q==NULL || q->head == NULL)
    {
        return NULL;
    }
       char * encodedData = dequeue_Helper_For_ciphered_queue(q);
       encodedData = decode(encodedData, key);
       printf("%s", encodedData);
       //free(encodedData);
       //return NULL;
       return encodedData;
}


/**
 * Exercise 6:
 * based on the content of "lineptr", you should call one of the four functions:
 *  "enqueue", "dequeue", "encode_enqueue", and "dequeue_decode"
 * Read "lab1-shell-APIs.txt" for examples.
 *
 * Hint: (possibly) useful functions: strtok, strcmp, atoi
 **/

void triggerError(queue_t * q, command_stack * stack)
{
    printf("ERROR\n");
    exitGracefully(q, stack);
}

void process_line2(queue_t *q, char *lineptr, command_stack * stack) {
    // TODO: your code here

    const char *delimiter = " \n";
    char * command = strtok(lineptr, delimiter);
    if(strcmp(command, "enqueue")==0)
    {
        char * arg = strtok(NULL, delimiter);
        if(arg==NULL || strcmp(arg, " ")==0)
        {
            triggerError(q, stack);
        }
        //printf("%s", arg);
        enqueue(q, arg);

        each_command * cmd = build_commandObject("enqueue", arg, 0);
        pushIntoStack(stack, cmd);

    }
    else if(strcmp(command, "dequeue")==0)
    {
        char * valueBeforeDequeue = getData_before_dequeue_helper(q);
        dequeue(q);

        each_command * cmd = build_commandObject("dequeue", valueBeforeDequeue, 0);
        pushIntoStack(stack, cmd);
        free(valueBeforeDequeue);
    }
    else if(strcmp(command, "encode_enqueue")==0)
    {
        char *keyArg = strtok(NULL, delimiter);
        char *valueArg = strtok(NULL, delimiter);

        if(keyArg==NULL || valueArg==NULL)
        {
            triggerError(q, stack);
        }
        int key = atoi(keyArg);
        encode_enqueue(q, valueArg, key);
        each_command * cmd = build_commandObject("encode_enqueue", valueArg, key);
        pushIntoStack(stack, cmd);

    }
    else if(strcmp(command, "dequeue_decode")==0)
    {
        char * keyArg = strtok(NULL, delimiter);
        if(keyArg==NULL)
        {
            triggerError(q, stack);
        }
        int key = atoi(keyArg);
        char * data = dequeue_decode(q, key);
        each_command * cmd = build_commandObject("dequeue_decode", data, key);
        pushIntoStack(stack, cmd);
        free(data);
    }
    else if(strcmp(command, "undo")==0)
    {
        undo(q, stack);
    }
    else{
        triggerError(q, stack);
    }

    // you should remove this line
    //printf("cmd: %s", lineptr);
}

void undo(queue_t * q, command_stack * stack)
{
    if(q==NULL || q->head==NULL)
    {
        return;
    }

    each_command * lastCommand = popFromStack(stack);

    if(lastCommand==NULL)
    {
        return;
    }

    if(strcmp(lastCommand->command, "enqueue")==0)
    {
        reverseEnqueue(q);
        free(lastCommand->command);
        free(lastCommand->data);
        free(lastCommand);
        return;
    }
    else if(strcmp(lastCommand->command, "encode_enqueue")==0){
        reverseEnqueue(q);
        free(lastCommand->command);
        free(lastCommand->data);
        free(lastCommand);
        return;

    }
    else if(strcmp(lastCommand->command, "dequeue")==0)
    {
        reverseDequeue(q, strdup(lastCommand->data));
        free(lastCommand->command);
        free(lastCommand->data);
        free(lastCommand);
        return;
    }
    else if(strcmp(lastCommand->command, "dequeue_decode")==0)
    {
        reverseDequeueDecode(q, strdup(lastCommand->data), lastCommand->key);
        free(lastCommand->command);
        free(lastCommand->data);
        free(lastCommand);
        return;

    }else{
        return;
    }


}

// Notice that the following two functions are borrowed from "queue_main.c".
// (which is bad!) You should not copy-paste code. But in order to isolate you
// possible modifications to "queue_main.c", we clone a copy here.

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

    command_stack * commandForUndo = createStack();

    while (getline(&lineptr, &n, fp) != -1) {
        process_line2(q, lineptr, commandForUndo);
    }
    final_print(q);

    fclose(fp);
    if (lineptr != NULL) {
        free(lineptr);
    }
    free_queue(q);
    free(q);
    destroy_stack(commandForUndo);

    return 0;
}
