
What is a inode?
An inode is a data structure which describes and stores file attributes, including location. Every file is associated with its own inode. The inode also stores:
- permissions
- user and group owner
- size
- timestamp

What is a directory file?
A directory file is a file which stores file names which then points to an inode.
A directory file is a particular type of file which associates file names and inodes. There are two ways of doing this:
- **hard** links point to an inode
- **soft** (or symbolic) links point to a file name which has an associated inode.

What are extended attributes?

These associate metadata no interpreted directly by the filesystem with files. Four namespaces exist:
- user
- trusted
- security
- system

System namespace is used for access control lists (ACLs). Flag values are stored in the file inode and may be modified and set only by the root user. They are viewed with **lattr** and set with **chattr**.

You can set flags within the user namespace: 
- i: immutable (cannot be changed even by root)
- a: append only (can only add to this file)
- d: no-dump (will not be included when the dump program is run to swap)
- A: no atime update (does not change access time)