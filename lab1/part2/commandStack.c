#include "commandStack.h"
#include "string.h"
#include "assert.h"

command_stack * createStack()
{
    command_stack * stack = (command_stack *) malloc(sizeof(command_stack));
    if(stack==NULL)
    {
        return NULL;
    }
    stack->pointerToTheLastCommand = NULL;
    //stack->nextCommand = NULL;
    return stack;
}


void pushIntoStack(command_stack *stack, each_command *command)
{
    if(stack==NULL)
    {
        return;
    }
    
    if(stack->pointerToTheLastCommand!=NULL)
    {
        each_command * tempCommandHolder = stack->pointerToTheLastCommand;
        stack->pointerToTheLastCommand = command;
        stack->pointerToTheLastCommand->pointerToPreviousCommand = tempCommandHolder;
    }
    else{
        stack->pointerToTheLastCommand = command;
        stack->pointerToTheLastCommand->pointerToPreviousCommand = NULL;
    }
}

void *popFromStack(command_stack *stack)
{
    if(stack==NULL)
    {
        return NULL;
    }

    if(stack->pointerToTheLastCommand==NULL)
    {
        return NULL;
    }

    else if(stack->pointerToTheLastCommand!=NULL)
    {
        each_command * tempCommand = stack->pointerToTheLastCommand->pointerToPreviousCommand;

        each_command * topCommand = stack->pointerToTheLastCommand;

        stack->pointerToTheLastCommand = tempCommand;

        return topCommand;
    }

    return NULL;

}

void destroy_stack(command_stack *stack)
{
    if(stack==NULL)
    {
        return;
    }

    each_command * current= stack->pointerToTheLastCommand;
    while (current!=NULL)
    {
        each_command * prev = current->pointerToPreviousCommand;
        free(current->command);
        free(current->data);
        free(current);
        current = prev;
    }
    free(stack);
}