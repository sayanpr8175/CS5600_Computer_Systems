#ifndef CS5600_LAB1_COMMAND_STACK_H
#define CS5600_LAB1_COMMAND_STACK_H

#include <stdio.h>
#include <stdlib.h>


//Change this file
typedef struct each_command {
    char * command;
    char * data;
    int key;
    struct each_command * pointerToPreviousCommand;
} each_command;


typedef struct command_stack {
    each_command *pointerToTheLastCommand;
    //each_command *nextCommand;
} command_stack;

command_stack * createStack();
void pushIntoStack(command_stack *stack, each_command *command);
void *popFromStack(command_stack *stack);
void destroy_stack(command_stack *stack);


#endif
