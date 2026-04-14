#include "kvstore.h"
#include <time.h>

// Exercise 4: finish implementing kvstore
// TODO: define your synchronization variables here
// (hint: don't forget to initialize them)

pthread_mutex_t kv_lock = PTHREAD_MUTEX_INITIALIZER;

pthread_once_t kv_once = PTHREAD_ONCE_INIT;

static kvstore_t *kv_ref;

static void kv_do_init(void)
{
    kvstore_t *kv = kv_ref;
    for(int i=0; i<TABLE_MAX-1; i++)
    {
        kv->keys[i].chain_next = i + 2;
    }

    kv->keys[TABLE_MAX-1].chain_next = 0;
    kv->free_head = 1;
}

static inline void ensure_init(kvstore_t *kv)
{
    kv_ref = kv;
    pthread_once(&kv_once, kv_do_init);
}

static inline unsigned int hash_key(const char *str)
{
    unsigned int h = 2027; // Upcoming year & prime number :)
    int c;
    while ((c = *str++))
        h = ((h << 5) + h) + c;
    return h;
}


static inline int bucket_for(const char *key)
{
    return hash_key(key) % TABLE_MAX;
}



/* read a key from the key-value store.
 *
 * if key doesn't exist, return NULL.
 *
 * NOTE: kv-store must be implemented as a monitor.
 */


// char* kv_read(kvstore_t *kv, char *key) {
//     /* TODO: your code here */

//     pthread_mutex_lock(&kv_lock);

//     for(int i=0; i< TABLE_MAX; i++)
//     {
//         if(kv->keys[i].stat == 1 && strcmp(kv->keys[i].key, key)==0)
//         {
//             char * val = kv->values[i];
//             pthread_mutex_unlock(&kv_lock);
//             return val;
//         }
//     }


//     pthread_mutex_unlock(&kv_lock);
//     //printf("[INFO] read key[%s]\n", key);
//     return NULL;
// }


char* kv_read(kvstore_t *kv, char *key)
{

    //clock_t start = clock();

    ensure_init(kv);
    pthread_mutex_lock(&kv_lock);

    int cur = kv->buckets[bucket_for(key)];

    while (cur > 0) {
        int i = cur - 1;

        if (strcmp(kv->keys[i].key, key) == 0) {

            char *val = kv->values[i];

            pthread_mutex_unlock(&kv_lock);

            return val;
        }
        cur = kv->keys[i].chain_next;
    }

    pthread_mutex_unlock(&kv_lock);

    //clock_t end = clock();

    //double elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    //printf(" Upgraded kv_read took : Elapsed: %f seconds\n", elapsed);

    return NULL;
}


/* write a key-value pair into the kv-store.
 *
 * - if the key exists, overwrite the old value.
 * - if key doesn't exit,
 *     -- insert one if the number of keys is smaller than TABLE_MAX
 *     -- return failure if the number of keys equals TABLE_MAX
 * - return 0 for success; return 1 for failures.
 *
 * notes:
 * - the "val" locates in stack, you must copy the string to
 *   kv-store's own memory. (hint: use malloc)
 * - the "val" is a null-terminated string. Pay attention to how many bytes you
 *   need to allocate. (hint: you need an extra to store '\0').
 * - Read "man strlen" and "man strcpy" to see how they handle string length.
 *
 * NOTE: kv-store must be implemented as a monitor.
 */

// int kv_write(kvstore_t *kv, char *key, char *val) {
//     /* TODO: your code here */
//     pthread_mutex_lock(&kv_lock);

//     //Checking for existing keys

//     for(int i=0; i< TABLE_MAX; i++)
//     {
//         if(kv->keys[i].stat == 1 && strcmp(kv->keys[i].key, key) == 0)
//         {
//             free(kv->values[i]);
//             kv->values[i] = malloc(strlen(val)+1);
//             strcpy(kv->values[i], val);
//             pthread_mutex_unlock(&kv_lock);
//             return 0;
//         }
//     }

//     // if key does not exists

//     for(int i=0; i<TABLE_MAX; i++)
//     {
//         if(kv->keys[i].stat == 0)
//         {
//             kv->keys[i].stat = 1;
//             strcpy(kv->keys[i].key, key);
//             kv->values[i] = malloc(strlen(val)+1);
//             strcpy(kv->values[i], val);
//             pthread_mutex_unlock(&kv_lock);
//             return 0;
//         }
//     }

//     //printf("[INFO] write key[%s]=val[%s]\n", key, val);

//     pthread_mutex_unlock(&kv_lock);

//     return 1;
// }


int kv_write(kvstore_t *kv, char *key, char *val)
{
    ensure_init(kv);
    pthread_mutex_lock(&kv_lock);

    int b = bucket_for(key);

    int cur = kv->buckets[b];
    while (cur > 0) {
        int i = cur - 1;
        if (strcmp(kv->keys[i].key, key) == 0) {
            free(kv->values[i]);
            kv->values[i] = malloc(strlen(val) + 1);
            strcpy(kv->values[i], val);
            pthread_mutex_unlock(&kv_lock);
            return 0;
        }
        cur = kv->keys[i].chain_next;
    }

    // Case for if hash table full.
    
    if (kv->free_head == 0) {
        pthread_mutex_unlock(&kv_lock);
        return 1;
    }
    int new_i = kv->free_head - 1;
    kv->free_head = kv->keys[new_i].chain_next;

    kv->keys[new_i].stat = 1;
    strcpy(kv->keys[new_i].key, key);
    kv->values[new_i] = malloc(strlen(val) + 1);
    strcpy(kv->values[new_i], val);
    kv->keys[new_i].chain_next = kv->buckets[b];
    kv->buckets[b] = new_i + 1;

    pthread_mutex_unlock(&kv_lock);
    return 0;
}





/* delete a key-value pair from the kv-store.
 *
 * - if the key exists, delete it.
 * - if the key doesn't exits, do nothing.
 *
 * NOTE: kv-store must be implemented as a monitor.
 */
// void kv_delete(kvstore_t *kv, char *key) {
//     /* TODO: your code here */

//     pthread_mutex_lock(&kv_lock);

//     for(int i=0; i< TABLE_MAX; i++)
//     {
//         if(kv->keys[i].stat == 1 && strcmp(kv->keys[i].key, key) == 0)
//         {
//             kv->keys[i].stat = 0;
//             free(kv->values[i]);
//             kv->values[i] = NULL;
//             break;
//         }
//     }

//     pthread_mutex_unlock(&kv_lock);

//     //printf("[INFO] delete key[%s]\n", key);
// }

void kv_delete(kvstore_t *kv, char *key)
{
    ensure_init(kv);
    pthread_mutex_lock(&kv_lock);

    int b = bucket_for(key);
    int *prev = &kv->buckets[b];
    int cur = *prev;

    while (cur > 0) {
        int i = cur - 1;
        if (strcmp(kv->keys[i].key, key) == 0) {
            
            *prev = kv->keys[i].chain_next;

            kv->keys[i].stat = 0;
            free(kv->values[i]);
            kv->values[i] = NULL;

            
            kv->keys[i].chain_next = kv->free_head;
            kv->free_head = i + 1;

            pthread_mutex_unlock(&kv_lock);
            return;
        }
        prev = &kv->keys[i].chain_next;
        cur = kv->keys[i].chain_next;
    }

    pthread_mutex_unlock(&kv_lock);
}


// print kv-store's contents to stdout
// note: use any format that you like; this is mostly for debugging purpose
// void kv_dump(kvstore_t *kv) {
//     /* TODO: your code here */
//     pthread_mutex_lock(&kv_lock);

//     for(int i=0; i< TABLE_MAX; i++)
//     {
//         if(kv->keys[i].stat == 1)
//         {
//             printf("  keys[%d] = \"%s\", values[%d] = \"%s\"\n",
//                    i, kv->keys[i].key, i, kv->values[i]);
//         }
//     }

//     pthread_mutex_unlock(&kv_lock);

//     //printf("[INFO] dump key-value store\n");
// }

void kv_dump(kvstore_t *kv)
{
    ensure_init(kv);
    pthread_mutex_lock(&kv_lock);

    for (int i = 0; i < TABLE_MAX; i++) {
        if (kv->keys[i].stat == 1) {
            printf("  keys[%d] = \"%s\", values[%d] = \"%s\"\n",
                   i, kv->keys[i].key, i, kv->values[i]);
        }
    }

    pthread_mutex_unlock(&kv_lock);
}