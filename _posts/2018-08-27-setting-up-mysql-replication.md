---
layout: post
title: "Setting Up MySQL Replication as a back-up solution"
categories:
- sysadmin
date:  2018-08-27T12:32:30Z
layout: post
---
MySQL replication is a good thing to have. It provides greater resilience and removes a single point of failure. By following these steps, you will create a replica of a master server, acting as a permanent backup in the case of a DR scenario.  

### Introduction

MySQL servers can be a single point of failure if you have not set up a good back-up infrastructure. It is difficult to get a good back-up infrastructure in place, without some time spent out of service. However, a MySQL replication server avoids this downtime.

One server will act as the master, and the other will act as slave. The slave will be paused and then backed up.


### Benefits of running a replicated MySQL server:

- Remove single point of failure adding high availability
- Improved performance if applications can use the read-only server (think data querying)


![Master/Slave Server diagram](https://s3.eu-west-2.amazonaws.com/kabads.monkeez.org/images/mysql_replication.png)


### Conifgure the Master MySQL server
The master is the live database that is serving your users. To back this up on it's own, you will have to stop transactions on the server and then carry out the backup. In a lot of high availability environments, this is not an option. However, you can prepare your master MySQL server to send those transactions to a different server.

In ```/etc/my.conf``` add the following lines:

```
log-bin       = master-bin
log-bin-index = master-bin.index
server-id      = 1
```

The ```log-bin``` directive tells mysql to store a binary log. This binary log is what makes replication easy and quick. We also have a ```log-index```. The binary log tells the other server the events that are happening on the master server. 

You can watch the binary log file with the mysql prompt with ```SHOW BINLOG EVENTS\G;```. However, to find out which binlog file is currently being written to you should enter ```SHOW MASTER STATUS;``` and then ```SHOW BINLOG EVENTS IN 'master-bin.000002'\G;``` (or whatever file was returned from the master status command.

If you added the replication config lines above after creating the server, as opposed to when you first set the server up, you will need to restart the mysql server:

    service mysql-server restart

Then you will need to login to the MySQL command prompt:

    mysql -u root

Next, it is good practise to create a user for replication that only has access rights for the IP range for the subnet where the slave server is.

    CREATE USER repl_user; 
    GRANT REPLICATION SLAVE ON *.*
    TO repl_user IDENTIFIED BY 'password';

This user will have access to retrieve the binary log from the master server.

### Configuring the MySQL slave Server

Again, we need a user that has certain privileges on the slave server.

```
GRANT REPLICATION, SLAVE, RELOAD, CREATE USER, SUPER ON *.* TO user@'1.2.3.%' WITH GRANT OPTION;
```

Next, you will have to log in to the slave mysql server and issue the following command:

```
CHANGE MASTER TO MASTER_HOST = '1.2.3.4', MASTER_PORT = 3306, MASTER_USER = 'repl_user', MASTER_PASSWORD = 'password';
START SLAVE;
```

Any changes for new databases on the master server will now be replicated on the slave server.

### Enabling replication on an existing database

If you already have a database on the master server, that you also want to replicate, you will need to copy it over to the slave database. 

If the database is relatively small (i.e. less than 50MB), then the ```mysqldump``` command will work. Shutdown the database first to ensure data integrity. 

```mysqldump -u root -p databasename > file.sql```

If the dataset is large, then it will be better to create an archive of the files and then transfer that over to the slave machine and restart the server there. Firstly, you should shutdown the mysql server. 

Then, on the slave server, copy the files in the database directory (usually ```/var/lib/mysql```). You can then tar that and then copy to the slave server and extract there. If there are large differences between the configuration files between the servers, then this might not work.

### Carry out the backup
Now that we have a slave, we can take point in time back-ups by stopping the slave and pausing transactions (although transactions are still ongoing on the master server).

1. Shut down the server ```sudo service mysql-server stop```

1. Copy the data files to a secure off-site location (in this case, Amazon S3) ```sudo aws s3 sync --delete /var/lib/mysql s3://bucket-name/```

1. Restart the server ```sudo service mysql-service start```

