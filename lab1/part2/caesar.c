#include <string.h>
#include <assert.h>
#include <stdlib.h>
#include "caesar.h"

int encryptedValue(int num, int key);
int decryptedValue(int num, int key);
int checkForIllegalCharacter(char c);

/**
 * Exercise 1
 * this function encodes the string "plaintext" using the Caesar cipher
 * by shifting characters by "key" positions.
 * Hint: you can reuse the memory from input as the output has
 * the same length as the input.
 **/
char *encode(char *plaintext, int key) {
    /*TODO: add your code here*/
    int plainTextLength = strlen(plaintext);
    //char *updatedText = malloc(plainTextLength+1);

    //memcpy(updatedText, plaintext, plainTextLength);

    for(int i=0; i<plainTextLength; i++)
    {
        if(checkForIllegalCharacter(plaintext[i])==-1)
        {
            return "ILLCHAR";
        }
        plaintext[i] = (char) encryptedValue((int)plaintext[i], key);
    }

    return plaintext;
}

int encryptedValue(int num, int key)
{
    // For capital letters

    if(num>=65 && num <=90)
    {
        int temp = num+key;
        if(temp>90)
        {
            temp = 64 + (temp%90);
        }
        return temp;
    }

    // For Small letters

    if(num>=97 && num <=122)
    {
        int temp = num+key;
        if(temp>122)
        {
            temp = 96 + (temp%122);
        }

        return temp;
    }

    // For numbers 0 to 9

    if(num>=48 && num <= 57)
    {
        int temp = (num-48 + key)%10;
        return temp+48;
    }

    return num;
}


/**
 * Exercise 2
 * This function decodes the "ciphertext" string using the Caesar cipher
 * by shifting the characters back by "key" positions.
 **/
char *decode(char *ciphertext, int key) {
    /*TODO: add your code here*/

    int plainTextLength = strlen(ciphertext);
    //char *updatedText = malloc(plainTextLength+1);

    //memcpy(updatedText, ciphertext, plainTextLength);
    
    for(int i=0; i<plainTextLength; i++)
    {
        if(checkForIllegalCharacter(ciphertext[i])==-1)
        {
            return "ILLCHAR";
        }
        ciphertext[i] = (char) decryptedValue((int)ciphertext[i], key);
    }

    return ciphertext;
}

int decryptedValue(int num, int key)
{
    // For capital letters

    if(num>=65 && num <=90)
    {
        int temp = num-key;
        if(temp<65)
        {
            temp = 90-(65-temp)+1;
        }
        return temp;
    }

    // For Small letters

    if(num>=97 && num <=122)
    {
        int temp = num-key;
        if(temp<97)
        {
            temp = 122-(97-temp)+1;
        }

        return temp;
    }

    // For numbers 0 - 9

    if(num>=48 && num <= 57)
    {
        int temp = (num-48-key)%10;
        if(temp<0)
        {
            temp += 10;
        }
        
        return temp+48;
    }


    return num;
}

int checkForIllegalCharacter(char c)
{
    
    int char_ascii_value = (int) c;
    if(
       (char_ascii_value>=48 && char_ascii_value <= 57)
    || (char_ascii_value>=65 && char_ascii_value <= 90)
    || (char_ascii_value>=97 && char_ascii_value <= 122))
    {
        return 0;
    }
    else{
        return -1;
    }
}



