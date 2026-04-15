# CS 5600 – Computer Systems
 
A collection of mini projects and code from my **CS 5600: Computer Systems** class at Northeastern University.
 
This course covers the design and operation of computer systems, with a focus on operating system internals — including process scheduling, memory management, file systems, concurrency, and interprocess communication.
 
## Projects 

**Lab 1 – Setup & C Review**
Environment setup, debugging with GDB, and C programming exercises including a Caesar cipher, a linked queue, and a ciphered queue.
 
**Lab 2 – Unix Shell**
Built a simple shell from scratch supporting command execution, I/O redirection, pipes, conditional (`&&`, `||`) and sequential (`;`) chaining, background processes, and built-in commands like `cd` and `exit`.
 
**Lab 3 – Concurrent Key-Value Store**
A multi-threaded key-value store server using POSIX threads with a concurrent task queue, thread-safe statistics tracking, and synchronized read/write/delete operations.
 
**Lab 4 – WeensyOS (Virtual Memory)**
Kernel-level programming in a tiny OS — implemented process memory isolation, virtual memory with page tables, and the `fork()` system call, all running on an x86-64 emulator (QEMU).
 
**Lab 5 – File System (fs5600)** - Upcoming

Implemented a simplified Unix-like file system using FUSE (File system in User Space), including inodes, directories, block allocation via bitmaps, and read/write operations on a virtual disk image.