#include "queue.h"
#include "string.h"
#include "assert.h"

void printNodeHelper(node_t * node);
/**
 * Exercise 4:
 * this function adds "data" to the end of the queue "q".
 *
 * Hint: you may need "malloc".
 **/
void enqueue(queue_t *q, char *data) {
    /*TODO: add your code here */

    if(q==NULL||data==NULL)
    {
        return;
    }

    node_t *latest_node = malloc(sizeof(node_t));
    if(latest_node==NULL)
    {
        return;
    }

    size_t lenOfData = strlen(data)+1;
    latest_node->data = malloc(lenOfData);

    if(latest_node->data == NULL)
    {
        free(latest_node);
        return;
    }

    strcpy(latest_node->data, data);

    //strncpy(latest_node->data, data, 127);
    //latest_node->data[127] = '\0';
    latest_node->next = NULL;

    if(q->head==NULL)
    {
        q->head = latest_node;       
    }
    else{
        q->tail->next = latest_node;
    }
    q->tail = latest_node;

}


/**
 * Exercise 4:
 * this function removes and returns the element
 * at the front of the queue "q".
 *
 * Hint: think of when to free the memory.
 **/
void * dequeue(queue_t *q) {
    /*TODO: add your code here */

    if(q==NULL || q->head == NULL)
    {
        printf("NULL");
        return NULL;
    }
    
    node_t * frontNode = q->head;

    //int lengthOfData = strlen(q->head->data);
    //char * frontNodeData = malloc(lengthOfData+1);
    //memcpy(frontNodeData, frontNode->data, lengthOfData);

    if(q->head->next!=NULL)
    {
        q->head = q->head->next;
    }
    else{
        q->head=NULL;
        q->tail=NULL;
    }
    
    printf("%s", frontNode->data);   
    //printNodeHelper(frontNode);
    free(frontNode->data);
    free(frontNode);
    
    return NULL;

}


void * reverseEnqueue(queue_t *q) {
    /*TODO: add your code here */

    if(q==NULL || q->head == NULL)
    {
        printf("NULL");
        return NULL;
    }
    
    node_t * lastEnqueuedNode;
    char * data;

    if(q->head == q->tail)
    {
        lastEnqueuedNode = q->head;
        data = lastEnqueuedNode->data;
        q->head = NULL;
        q->tail = NULL;
        free(data);
        free(lastEnqueuedNode);
        return NULL;
    }

    node_t * current = q->head;
    while(current->next != q->tail)
    {
        current = current->next;
    }
    
    lastEnqueuedNode = q->tail;
    data = lastEnqueuedNode->data;

    free(data);
    free(lastEnqueuedNode);
    return NULL;
}

void reverseDequeue(queue_t * q, char * data)
{
    node_t * frontNode = malloc(sizeof(node_t));
    
    if(frontNode == NULL)
    {
        return;
    }

    frontNode->data = data;
    frontNode->next = NULL;

    if(q->head==NULL)
    {
        q->head = frontNode;
        if(q->tail == NULL)
        {
            q->tail = frontNode;
        }
        return;
    }
    frontNode->next = q->head;
    q->head = frontNode;
    return;
}


char * getData_before_dequeue_helper(queue_t * q)
{
    if(q->head == NULL)
    {
        return NULL;
    }
         
    return strdup(q->head->data);
}



char * dequeue_Helper_For_ciphered_queue(queue_t *q) {
    /*TODO: add your code here */

    if(q==NULL || q->head == NULL)
    {
        printf("NULL");
        return NULL;
    }
    
    node_t * frontNode = q->head;

    int lengthOfData = strlen(q->head->data);
    char * frontNodeData = malloc(lengthOfData+1);
    memcpy(frontNodeData, frontNode->data, lengthOfData+1);

    if(q->head->next!=NULL)
    {
        q->head = q->head->next;
    }
    else{
        q->head=NULL;
        q->tail=NULL;
    }
    
    //printf("%s", frontNode->data);
    free(frontNode->data);
    free(frontNode);
    return frontNodeData;

}



/**
 * Exercise 4:
 * this function will be called to destroy an existing queue,
 * for example, in the end of main() function.
 * Use free() to free the memory you allocated.
 **/
void free_queue(queue_t *q) {
    /*TODO: add your code here*/
    if(q==NULL)
    {
        return;
    }   

    node_t * currentNode = q->head;
    node_t *tempNext;

    while(currentNode!=NULL)
    {
        tempNext = currentNode->next;
        free(currentNode->data);
        free(currentNode);
        currentNode = tempNext;
    }

}

/**
 * Exercise 4:
 * this function prints a queue in the following format (quotation marks are
 * not part of the output):
 * """
 * finally: [1st element]->[2nd element]->[3rd element]
 * """
 *
 * Example #1:
 *
 * for a queue with one element with data = "ABC", the output should be:
 * finally: [ABC]
 *
 * Example #2:
 *
 * for a queue with two elements "ABC" and "DEF", the output should be:
 * finally: [ABC]->[DEF]
 *
 * Example #3:
 *
 * for an empty queue, the output should be nothing but "finally: ":
 * finally:
 *
 * Notice: you must strictly follow the format above because the grading tool
 * only recognizes this format. If you print something else, you will not get
 * the scores for this exercise.
 **/
void print_queue(queue_t *q) {
    // the output should start with "finally: "
    printf("finally: ");

    /*TODO: add your code here */
    if(q->head==NULL)
    {
        //printf("NULL");
        return;
    }else{
        
    node_t * currentNode = q->head;
    node_t *tempNext;

    while(currentNode!=NULL)
    {
        tempNext = currentNode->next;
        printNodeHelper(currentNode);
        if(tempNext!=NULL)
        {
            printf("->");
        }
        currentNode = tempNext;
    }
        
    }

    // the output requires a new line in the end
    printf("\n");
}

void printNodeHelper(node_t * node)
{
    printf("[");
    for(int i=0; node->data[i]!='\0'; i++)
    {
        if(node->data[i] != '\n')
        {
            printf("%c",node->data[i]);
        }
        
    }
    printf("]");

    return;
}

