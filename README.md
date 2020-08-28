# FASTEN DEMO's VM
This repository contains necessary scripts and configuration files to set up a virtual machine that has all the requirements and dependencies to run the whole FASTEN pipeline.

To find out more about the scripts, Kafka, and the VM's config, check out the README file in their folders.

# Requirements 
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

# VM Backups
You also download the VM backup (`OVF` file) from [here](https://surfdrive.surf.nl/files/index.php/s/5V8ElLjg5zQmzDY). Use password `fasten` to download the `UbuntuServer-18.04.5-FASTEN.ova` file.

# Running the FASTEN demo on the VM
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
fasten@fasten_vm:~$ clean_fasten_data
fasten@fasten_vm:~$ clean_fasten_db
fasten@fasten_vm:~$ init_db
fasten@fasten_vm:~$ init_kafka
```

7- Finally, run the following command to run the demo of the FASTEN:
```
fasten@fasten_vm:~$ start_all
```
This launches the FASTEN server with all the plug-ins. You can stop the demo by pressing CRTL+C.

## Additional notes
- The produced CGs, graphs, and repositories are stored at "~/data" folder.
- You can run `psql_db` command to run the PostgreSQL CLI tool for running queries and etc.
- Each plug-in can also be launched separately by using the following commands in the terminal:
    - `start_graphdb`
    - `start_metadatadb`
    - `start_opal`
    - `start_pom_analyzer`
    - `start_repo_cloner`
