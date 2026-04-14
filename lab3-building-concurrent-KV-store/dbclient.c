/*
 * db client for CS5600 Lab3
 *
 * this is a really ugly piece of code, need to clean it up before the
 * next time I assign it.
 *
 * Peter Desnoyers, 2020
 *
 * 2021 fall: modified by CS5600 staff
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <zlib.h>
#include <pthread.h>
#include <argp.h>
#include <assert.h>

#include "lab3.h"

#include <time.h>

/* --------- argument parsing ---------- */

static struct argp_option options[] = {
    {"set",          'S', "KEY",  0, "set KEY to VALUE"},
    {"get",          'G', "KEY",  0, "get value for KEY"},
    {"delete",       'D', "KEY",  0, "delete KEY"},
    {"quit",         'q',  0,     0, "send QUIT command"},
    {"test",         'T', "#threads",  0, "run your concurrency test with given number of threads"},
    {0}
};

enum {OP_SET = 1, OP_GET = 2, OP_DELETE = 3, OP_QUIT = 4, OP_TEST = 5};

struct args {
    int nthreads;
    int count;
    int port;
    int max;
    int op;
    char *key;
    char *val;
    char *logfile;
    FILE *logfp;
    struct sockaddr_in addr;
};

static error_t parse_opt(int key, char *arg, struct argp_state *state)
{
    struct args *a = state->input;
    switch (key) {
    case ARGP_KEY_INIT:
        a->nthreads = 1;
        a->count = 1000;
        a->port = 5600;
        a->max = 200;
        a->logfp = NULL;
        break;

    case 'l':
        a->logfile = arg;
        if ((a->logfp = fopen(arg, "w")) == NULL)
            fprintf(stderr, "Error opening logfile : %s : %s\n", arg,
                    strerror(errno)), exit(1);
        break;

    case 'q':
        a->op = OP_QUIT;
        break;

    case 'G':
        a->op = OP_GET;
        if (strlen(arg) > 30)
            printf("key must be <= 30 chars\n"), argp_usage(state);
        a->key = arg;
        break;

    case 'S':
        a->op = OP_SET;
        if (strlen(arg) > 30)
            printf("key must be <= 30 chars\n"), argp_usage(state);
        a->key = arg;
        break;

    case 'T':
        a->op = OP_TEST;
        a->nthreads = atoi(arg);
        if (a->nthreads == 0) {
            printf("#threads must be a number\n"), argp_usage(state);
        }
        break;

    case 'D':
        a->op = OP_DELETE;
        if (strlen(arg) > 30)
            printf("key must be <= 30 chars\n"), argp_usage(state);
        a->key = arg;
        break;

    case 'n':
        a->count = atoi(arg); break;

    case 'p':
        a->port = atoi(arg);
        break;

    case ARGP_KEY_ARG:
        if (state->arg_num == 0 && a->op == OP_SET) {
            a->val = arg;
        printf("val set to %s\n", arg);
    }
        else
            argp_usage(state);
        break;
    }
    return 0;
}

static struct argp argp = { options, parse_opt, NULL, NULL};

/* --------- everything else ---------- */

int do_connect(struct sockaddr_in *addr)
{
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock < 0 || connect(sock, (struct sockaddr*)addr, sizeof(*addr)) < 0)
        fprintf(stderr, "can't connect: %s\n", strerror(errno)), exit(0);
    return sock;
}


void do_del(struct args *args, char *name, char *result, int quiet)
{
    int sock = do_connect(&args->addr);

    struct request rq;
    snprintf(rq.name, sizeof(rq.name), "%s", name);

    rq.op_status = 'D';
    int val = write(sock, &rq, sizeof(rq));
    if ((val = read(sock, &rq, sizeof(rq))) < 0)
        printf("DEL: REPLY: READ ERROR: %s\n", strerror(errno));
    else if (val < sizeof(rq))
        printf("DEL: REPLY: SHORT READ: %d\n", val);
    else if (rq.op_status != 'K' && !quiet)
        printf("DEL: FAILED (%c)\n", rq.op_status);
    else if (!quiet)
        printf("ok\n");

    if (result != NULL)
        *result = rq.op_status;

    close(sock);
}

void do_set(struct args *args, char *name, void *data, int len, char *result, int quiet)
{
    int sock = do_connect(&args->addr);

    struct request rq;
    snprintf(rq.name, sizeof(rq.name), "%s", name);
    int val;

    rq.op_status = 'W';
    sprintf(rq.len, "%d", len);
    write(sock, &rq, sizeof(rq));
    write(sock, data, len);
    if ((val = read(sock, &rq, sizeof(rq))) < 0)
        printf("WRITE: REPLY: READ ERROR: %s\n", strerror(errno));
    else if (val < sizeof(rq))
        printf("WRITE: REPLY: SHORT READ: %d\n", val);
    else if (rq.op_status != 'K' && !quiet)
        printf("WRITE: FAILED (%c)\n", rq.op_status);
    else if (!quiet)
        printf("ok\n");

    if (result != NULL)
        *result = rq.op_status;
    close(sock);
}

void do_quit(struct args *args)
{
    int sock = do_connect(&args->addr);
    struct request rq;
    rq.op_status = 'Q';
    write(sock, &rq, sizeof(rq));
    /* if both sides close-on-exit you won't get TIME_WAIT */
}

void do_get(struct args *args, char *name, void *data, int *len_p, char *result)
{
    int val, sock = do_connect(&args->addr);
    struct request rq;
    snprintf(rq.name, sizeof(rq.name), "%s", name);

    rq.op_status = 'R';
    sprintf(rq.len, "%d", 0);
    write(sock, &rq, sizeof(rq));
    if ((val = read(sock, &rq, sizeof(rq))) < 0)
        printf("READ: REPLY: READ ERROR: %s\n", strerror(errno));
    else if (val < sizeof(rq))
        printf("READ: REPLY: SHORT READ: %d\n", val);
    else if (rq.op_status != 'K')
        printf("READ: FAILED (%c)\n", rq.op_status);
    else {
        int len = atoi(rq.len);
        char buf[len];

        for (void *ptr = buf, *max = ptr+len; ptr < max; ) {
            int n = read(sock, ptr, max-ptr);
            if (n < 0) {
                printf("READ DATA: READ ERROR: %s\n", strerror(errno));
                break;
            }
            ptr += n;
        }
        if (data != NULL) {
            memcpy(data, buf, len);
            *len_p = len;
        }
        else
            printf("=\"%.*s\"\n", len, buf);
    }

    if (result != NULL)
        *result = rq.op_status;

    close(sock);
}


// === concurrency test ===
// helper functions
// (feel free to modify helper functions)

// helper function: generate random string
void randstr(char *buf, int len)
{
    for (int i = 0; i < len; i++)
        buf[i] = 'A' + (random() % 25);
}

// helper function: generate random keys
void gen_randkey(char *buf) {
    int len = random() % 30;
    randstr(buf, len);
}

// helper function: generate random values
void gen_randval(char *buf) {
    int len = random() % 4096;
    randstr(buf, len);
}

typedef struct {
    struct args *a;
    int thread_id;
    int iterations;
    int errors;
} test_arg_t;


// Test1 - each thread writes their own key and reads them back.

void *test1_worker(void *arg) {
    test_arg_t *ta = (test_arg_t *)arg;
    ta->errors = 0;
    char key[32], val[64];

    for (int i = 0; i < ta->iterations; i++) {
        snprintf(key, sizeof(key), "T1_%d_%d", ta->thread_id, i);
        snprintf(val, sizeof(val), "val_%d_%d", ta->thread_id, i);
        do_set(ta->a, key, val, strlen(val), NULL, 1);
    }

    for (int i = 0; i < ta->iterations; i++) {
        snprintf(key, sizeof(key), "T1_%d_%d", ta->thread_id, i);
        char expected[64];
        snprintf(expected, sizeof(expected), "val_%d_%d", ta->thread_id, i);

        char buf[4096];
        int blen = 4096;
        char res;
        do_get(ta->a, key, buf, &blen, &res);
        if (res != 'K') {
            printf("  [FAIL] T1: thread %d key %s: read failed\n",
                   ta->thread_id, key);
            ta->errors++;
        } else {
            buf[blen] = '\0';
            if (strcmp(buf, expected) != 0) {
                printf("  [FAIL] T1: thread %d key %s: expected \"%s\" got \"%s\"\n",
                       ta->thread_id, key, expected, buf);
                ta->errors++;
            }
        }
    }
    return NULL;
}


/** test 2 : every thread tryin to write for same key**/

void *test2_worker(void *arg) {
    test_arg_t *ta = (test_arg_t *)arg;
    char val[64];
    for (int i = 0; i < ta->iterations; i++) {
        snprintf(val, sizeof(val), "thread%d_iter%d", ta->thread_id, i);
        do_set(ta->a, "SHARED_KEY", val, strlen(val), NULL, 1);
    }
    return NULL;
}

/** INteraction between KV_WRITE and  KV_DELETE write vs delete **/

void *test3_writer(void *arg) {
    test_arg_t *ta = (test_arg_t *)arg;
    char key[32], val[64];
    for (int i = 0; i < ta->iterations; i++) {
        snprintf(key, sizeof(key), "T3_KEY%d", i % 5);
        snprintf(val, sizeof(val), "w%d_i%d", ta->thread_id, i);
        do_set(ta->a, key, val, strlen(val), NULL, 1);
    }
    return NULL;
}


void *test3_deleter(void *arg) {
    test_arg_t *ta = (test_arg_t *)arg;
    char key[32];
    for (int i = 0; i < ta->iterations; i++) {
        snprintf(key, sizeof(key), "T3_KEY%d", i % 5);
        do_del(ta->a, key, NULL, 1);
    }
    return NULL;
}

/** Per thread own write key and read back **/

void *test4_worker(void *arg) {
    test_arg_t *ta = (test_arg_t *)arg;
    ta->errors = 0;
    char key[32], val[64], buf[4096];
    int blen;
    char res;

    snprintf(key, sizeof(key), "T4_OWNER_%d", ta->thread_id);

    for (int i = 0; i < ta->iterations; i++) {
        snprintf(val, sizeof(val), "v_%d_%d", ta->thread_id, i);
        do_set(ta->a, key, val, strlen(val), NULL, 1);

        blen = 4096;
        res = 0;
        do_get(ta->a, key, buf, &blen, &res);
        if (res == 'K') {
            buf[blen] = '\0';
            if (strcmp(buf, val) != 0) {
                printf("  [FAIL] T4: thread %d iter %d: expected \"%s\" got \"%s\"\n",
                       ta->thread_id, i, val, buf);
                ta->errors++;
            }
        } else {
            printf("  [FAIL] T4: thread %d key %s: read failed\n",
                   ta->thread_id, key);
            ta->errors++;
        }
    }
    return NULL;
}

/** Random write, read, delete **/

void *test5_worker(void *arg) {
    test_arg_t *ta = (test_arg_t *)arg;
    ta->errors = 0;
    char key[32], val[128], buf[4096];
    int blen;
    char res;

    for (int i = 0; i < ta->iterations; i++) {
        int op = random() % 3;
        int kid = random() % 15;
        snprintf(key, sizeof(key), "T5_K%d", kid);

        if (op == 0) {
            snprintf(val, sizeof(val), "t%d_i%d", ta->thread_id, i);
            do_set(ta->a, key, val, strlen(val), &res, 1);
        } else if (op == 1) {
            blen = 4096;
            do_get(ta->a, key, buf, &blen, &res);
            if (res != 'K' && res != 'X') {
                printf("  [FAIL] T5: thread %d unexpected read status %c\n",
                       ta->thread_id, res);
                ta->errors++;
            }
        } else {
            do_del(ta->a, key, &res, 1);
            if (res != 'K') {
                printf("  [FAIL] T5: thread %d delete got status %c\n",
                       ta->thread_id, res);
                ta->errors++;
            }
        }
    }
    return NULL;
}

/*test to  Delete and then try to read*/

void *test6_worker(void *arg) {
    test_arg_t *ta = (test_arg_t *)arg;
    ta->errors = 0;
    char key[32], val[64], buf[4096];
    int blen;
    char res;

    for (int i = 0; i < ta->iterations; i++) {
        snprintf(key, sizeof(key), "T6_%d_%d", ta->thread_id, i);
        snprintf(val, sizeof(val), "data_%d", i);

        do_set(ta->a, key, val, strlen(val), NULL, 1);
        do_del(ta->a, key, NULL, 1);

        blen = 4096;
        res = 0;
        do_get(ta->a, key, buf, &blen, &res);
        if (res != 'X') {
            printf("  [FAIL] T6: thread %d key %s: expected X got %c\n",
                   ta->thread_id, key, res);
            ta->errors++;
        }
    }
    return NULL;
}


/*
 * Exercise 5:
 * Write your own concurrency tests.
 *
 * You should (these are *suggestions* not requirements):
 *
 *  - create multiple threads and send concurrent operations to dbserver
 *
 *  - try to produce unnatural schedules and interleaving too
 *
 *  - you don't have to follow the six rules or always use monitor here
 *    because this is for debugging purpose. For example,
 *
 *    -- you can use sleep,
 *
 *    -- and feel free to use synchronization primitives (e.g., mutexes)
 *    whatever way you like
 *
 *  - to check correctness, we suggest you to compare your writes and check
 *  the return values from reads. How? remember your write values and compare
 *  the values when you read from the same keys.
 *
 *  - hints:
 *    -- read "do_get/do_set/do_del" to see how to issue these operations
 *    -- you can use the above helper functions to generate keys/values
 *    -- if you want share data between multiple threads, protect the shared data with mutex!
 *       (note: you will not lose points due to coding style in Exercise 5.)
 */
void do_test(struct args *a)
{
    // below is a simple single-threaded test
    char data[4096];
    int len = 4096;
    char result;

    do_set(a, "key0", "val0", strlen("val0"), NULL, 1);
    do_get(a, "key0", &data, &len, NULL);
    data[len] = '\0';    // why we add this? for strcmp
    assert (strcmp(data,"val0") == 0);

    do_del(a, "key0", NULL, 1);
    printf("Expected to see: \"READ: FAILED (X)\" below\n");
    do_get(a, "key0", &data, &len, &result); // should have a READ ERROR
    data[len] = '\0';
    assert (result == 'X');


    /* TODO: your code here */
    // fix random seed; easier to reproduce your bugs
    srandom(5600);

    int num_threads = a->nthreads;

    //printf("TODO: your test here with %d threads\n", num_threads);

    printf("Running concurrency tests with %d threads\n", num_threads);

    clock_t start = clock();
    
    printf("\nTest 1: Concurrent writes to distinct keys\n");
    {
        int keys_per_thread = 20; // Updated as instructed on piazza to ops 20+
        pthread_t threads[num_threads];
        test_arg_t targs[num_threads];

        for (int i = 0; i < num_threads; i++) {
            targs[i].a = a;
            targs[i].thread_id = i;
            targs[i].iterations = keys_per_thread;
            targs[i].errors = 0;
            pthread_create(&threads[i], NULL, test1_worker, &targs[i]);
        }
        int total_errors = 0;
        for (int i = 0; i < num_threads; i++) {
            pthread_join(threads[i], NULL);
            total_errors += targs[i].errors;
        }
        for (int i = 0; i < num_threads; i++) {
            char key[32];
            for (int j = 0; j < keys_per_thread; j++) {
                snprintf(key, sizeof(key), "T1_%d_%d", i, j);
                do_del(a, key, NULL, 1);
            }
        }
        printf("Test 1: %s (%d errors)\n",
               total_errors == 0 ? "PASSED" : "FAILED", total_errors);
    }

    printf("\nTest 2: Concurrent writes to same key\n");
    {
        int iters = 20; // Updated as instructed on piazza to ops 20+
        pthread_t threads[num_threads];
        test_arg_t targs[num_threads];

        for (int i = 0; i < num_threads; i++) {
            targs[i].a = a;
            targs[i].thread_id = i;
            targs[i].iterations = iters;
            pthread_create(&threads[i], NULL, test2_worker, &targs[i]);
        }
        for (int i = 0; i < num_threads; i++)
            pthread_join(threads[i], NULL);

        char buf[4096];
        int blen = 4096;
        char res;
        do_get(a, "SHARED_KEY", buf, &blen, &res);
        buf[blen] = '\0';
        int pass = 0;
        if((res == 'K' && strncmp(buf, "thread", 6) == 0))
        {
            pass = 1;
        }
        
        printf("Test 2: %s (final value: \"%s\")\n",
               pass ? "PASSED" : "FAILED", buf);
        do_del(a, "SHARED_KEY", NULL, 1);
    }


    /** INteraction between KV_WRITE and  KV_DELETE write vs delete **/

    printf("\nTest 3: Concurrent write and delete\n");
    {
        int iters = 20; // Updated as instructed on piazza 

        pthread_t threads[num_threads * 2];
        test_arg_t targs[num_threads * 2];

        for (int i = 0; i < num_threads; i++) {
            targs[i].a = a;
            targs[i].thread_id = i;
            targs[i].iterations = iters;
            pthread_create(&threads[i], NULL, test3_writer, &targs[i]);

            targs[num_threads + i].a = a;
            targs[num_threads + i].thread_id = num_threads + i;
            targs[num_threads + i].iterations = iters;
            pthread_create(&threads[num_threads + i], NULL, test3_deleter,
                           &targs[num_threads + i]);
        }
        for (int i = 0; i < num_threads * 2; i++)
        {
            pthread_join(threads[i], NULL);
        }
            

        int pass = 1;
        for (int i = 0; i < 5; i++) {
            char key[32], buf[4096];
            int blen = 4096;
            char res = 0;
            snprintf(key, sizeof(key), "T3_KEY%d", i);
            do_get(a, key, buf, &blen, &res);
            
        if (res == 'K') {
        // key exists but value from other writer thread
        buf[blen] = '\0';
            if (strncmp(buf, "w", 1) != 0) {
                printf("  [FAIL] T3: key %s has corrupted value \"%s\"\n", key, buf);
                pass = 0;
            }
        } else if (res != 'X') {
            
            printf("  [FAIL] T3: key %s unexpected status %c\n", key, res);
            pass = 0;
        }

        
        do_del(a, key, NULL, 1);
        
        }
        printf("Test 3: %s\n", pass ? "PASSED" : "FAILED");
    }

    printf("\nTest 4: Write read consistency\n");
    {
        pthread_t threads[num_threads];
        test_arg_t targs[num_threads];

        for (int i = 0; i < num_threads; i++) {
            targs[i].a = a;
            targs[i].thread_id = i;
            targs[i].iterations = 20; // Updated as instructed on piazza
            targs[i].errors = 0;
            pthread_create(&threads[i], NULL, test4_worker, &targs[i]);
        }
        int total_errors = 0;
        for (int i = 0; i < num_threads; i++) {
            pthread_join(threads[i], NULL);
            total_errors += targs[i].errors;
        }
        for (int i = 0; i < num_threads; i++) {
            char key[32];
            snprintf(key, sizeof(key), "T4_OWNER_%d", i);
            do_del(a, key, NULL, 1);
        }
        printf("Test 4: %s (%d errors)\n",
               total_errors == 0 ? "PASSED" : "FAILED", total_errors);
    }

    printf("\nTest 5: Random mixed operations stress test\n");
    {
        int ops_per_thread = 50; // Updated as instructed on piazza.
        pthread_t threads[num_threads];
        test_arg_t targs[num_threads];

        for (int i = 0; i < num_threads; i++) {
            targs[i].a = a;
            targs[i].thread_id = i;
            targs[i].iterations = ops_per_thread;
            targs[i].errors = 0;
            pthread_create(&threads[i], NULL, test5_worker, &targs[i]);
        }
        int total_errors = 0;
        for (int i = 0; i < num_threads; i++) {
            pthread_join(threads[i], NULL);
            total_errors += targs[i].errors;
        }
        for (int i = 0; i < 15; i++) {
            char key[32];
            snprintf(key, sizeof(key), "T5_K%d", i);
            do_del(a, key, NULL, 1);
        }
        printf("Test 5: %s (%d errors)\n",
               total_errors == 0 ? "PASSED" : "FAILED", total_errors);
    }


    /*test to  Delete and then try to read*/
    // THese test case will trigger lot of manual failures, in stats in dbserver.

    printf("\nTest 6: Delete then read for correctness\n");
    {
        pthread_t threads[num_threads];
        test_arg_t targs[num_threads];

        for (int i = 0; i < num_threads; i++) {
            targs[i].a = a;
            targs[i].thread_id = i;
            targs[i].iterations = 20; // // Updated as instructed on piazza to ops 20+
            targs[i].errors = 0;
            pthread_create(&threads[i], NULL, test6_worker, &targs[i]);
        }
        int total_errors = 0;
        for (int i = 0; i < num_threads; i++) {
            pthread_join(threads[i], NULL);
            total_errors += targs[i].errors;
        }
        printf("Test 6: %s (%d errors)\n",
               total_errors == 0 ? "PASSED" : "FAILED", total_errors);

    }

    clock_t end = clock();

    double elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    printf("From upgraded Kv store with hashing Elapsed: %f seconds\n", elapsed);
}



int main(int argc, char **argv)
{
    struct args args;
    memset(&args, 0, sizeof(args));

    argp_parse(&argp, argc, argv, 0, 0, &args);

    args.addr = (struct sockaddr_in){
        .sin_family = AF_INET,
        .sin_port = htons(args.port),
        .sin_addr.s_addr = inet_addr("127.0.0.1")}; /* localhost */

    if (args.op == OP_SET)
        do_set(&args, args.key, args.val, strlen(args.val), NULL, 0);
    else if (args.op == OP_GET)
        do_get(&args, args.key, NULL, NULL, NULL);
    else if (args.op == OP_DELETE)
        do_del(&args, args.key, NULL, 0);
    else if (args.op == OP_QUIT)
        do_quit(&args);
    else if (args.op == OP_TEST)
        do_test(&args);
    else
        printf("See usage: \"dbclient --help\"\n");
}

