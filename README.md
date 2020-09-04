# FASTEN DEMO VM

This repository contains necessary scripts and configuration files to set up a virtual machine that has all the requirements and dependencies to run the whole FASTEN pipeline.

To find out more about the scripts, Kafka, and the VM's config, check out the README file in their folders.

## Requirements 
To set up a VM and run the FASTEN demo, the following requirements (i.e dependencies and tools) are needed:

- [VirtualBox](https://www.virtualbox.org/) 
- [Ubuntu Server 18.04 LTS image](https://releases.ubuntu.com/18.04/)

## Required packages on the VM
The following packages should be installed on the VM:
- [Java JDK 11](https://www.oracle.com/technetwork/java/javase/downloads/jdk11-downloads-5066655.html)
- [Apache Kafka](https://kafka.apache.org/downloads.html)
- [Apache Maven](http://maven.apache.org/install.html)
- [PostgreSQL 12](https://www.postgresql.org/download)
- [kafkacat](https://github.com/edenhill/kafkacat)
- [jq](https://stedolan.github.io/jq/download/) 
- OpenSSH server

## VM Backups
You also download the VM backup (`OVF` file) from [here](https://surfdrive.surf.nl/files/index.php/s/5V8ElLjg5zQmzDY). Use password `fasten` to download the `UbuntuServer-18.04.5-FASTEN-v0.2.ova` file.

## Running the FASTEN demo on the VM
Follow the below step to run the FASTEN demo:

1- First install the VirtualBox software for your system. 

2- Download the pre-made VM as explained [here](#VM-Backups).

3- Open up the VirtualBox and go to File->Import Appliance. Then select the OVF file that you have downloaded in the previous step in order to import the VM's backup.

4- Start the imported VM, i.e. UbuntuServer-18.04.5-FASTEN

**Note:** The VM needs at least 4~6 CPU cores and 8 GB of RAM.

5- To login into Ubuntu server, use the following credentials:

username: `fasten`

password: `1234`

**Note:** You can also SSH into the VM by running the command `ssh fasten@127.0.0.1 -p 2223`. Use the above password to log in.

6- Before running the FASTEN demo, run the following commands to clean up the results of the previous runs and initialize the DBs and Kafka:

```
fasten@fasten_vm:~$ clean_up
fasten@fasten_vm:~$ init_all
fasten@fasten_vm:~$ load_java_coords
```

**Note:** For the first time, the `init_all` may produce warnings or erros, which can be ignored.

7- Finally, to run the demo, you can either execute `start_all` in the terminal or use `tmux` session which is explained as follows:
   
   - First, start `tmux` in terminal (it's recommended to SSH into the VM before starting `tmux`):
```
fasten@fasten_vm:~$ tmux
```
   - Press `Ctrl+A` (`Ctrl+B` also works) and then `:`. Type `source scripts/tmux-java.conf`.
   - Now, you should be able to see a terminal window with 7 panes and `htop` at the bottom. 
   Press `Ctrl+A` and any of the arrow keys to switch between panes. 
   In each pane, you can run a plug-in separately by simply hitting `Enter`.
   - To kill the whole session, press `Ctrl+A` and `:`. Type `kill-session`.

**Note:** To stop a running instance of the FASTEN server, press `Ctrl+C`.

## Additional notes
- The produced CGs, graphs, and repositories are stored at `~/data` folder.
- You can run `psql_db` command to run the PostgreSQL CLI tool for running queries and etc.
- Each plug-in can also be launched separately by using the following commands in the terminal:
    - `start_graphdb`
    - `start_metadatadb`
    - `start_opal`
    - `start_pom_analyzer`
    - `start_repo_cloner`
    - `start_rapid`
    - `start_pycg`

## OS configuration
In the `.profile` file, a set of aliases, environment variables, and functions are defined to ease and facilitate running the FASTEN demo. Some of the frequently-used aliases are explained as follows:

- `init_kafka`: Initializes Kafka by creating topics.
- `init_db`: Initializes the PostgreSQL DB (i.e. metadata DB) by creating DBs, tables, users, and indexes.
- `init_all`: Initializes both Kafka and the metadata DB.
- `clean_fasten_kafka`: Deletes the Kafka topics and consumer groups.
- `clean_fasten_db`: Erases the whole metadata DB, including the DB schema, tables, and users.
- `clean_fasten_data`: Erases all the local data that were produced by running the FASTEN demo. That is, call graphs, repositories, indexed graphs.
- `clean_up`: Erases Kafka's data, DBs, and all local data like graphs etc.
- `java_start_all`: Launches the FASTEN server with all the plug-ins that are developed by TU Delft.
- `start_all`: Starts the whole FASTEN pipeline with all the plug-ins by all partners.
- `psql_db`: Starts PostgreSQL CLI tool for running SQL queries, etc.
- `load_java_coords`: Loads Java's Maven coordintes. Note that you should run this once.
- `load_py_coords`: Loads Python's PyPi coordinates.
