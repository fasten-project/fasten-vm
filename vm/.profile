# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$PATH:/home/fasten/kafka/bin"
export PGPASSWORD="fasten1234"


# Aliases
alias psql_fasten="psql -w -d fasten_java -U fasten -h 127.0.0.1"
alias clean_fasten_db="psql -w -U postgres -h 127.0.0.1 -f /home/fasten/scripts/cleanup_db.sql"
alias clean_fasten_data="rm -rf /home/fasten/data/mvn && rm -rf /home/fasten/data/repos && rm -rf /home/fasten/data/graphdb"
alias psql_db="psql -w -U postgres -h 127.0.0.1"
alias init_db="sh /home/fasten/scripts/fasten_initialize_db.sh"
alias init_kafka="bash /home/fasten/scripts/fasten_init_kafka.sh"
alias list_kafka_consumer_groups="kafka-consumer-groups.sh --list --bootstrap-server localhost:9092"
alias list_kafka_topics="kafka-topics.sh --list --zookeeper localhost:2181"
alias start_opal='java -cp /home/fasten/projects/fasten/docker/server/server-0.0.1-SNAPSHOT-with-dependencies.jar eu.fasten.server.FastenServer -p /home/fasten/projects/fasten/docker/plugins/ -k localhost:9092 -pl "OPAL" -kt "OPAL=fasten.POMAnalyzer.out" -po "OPAL=/home/fasten/data/"'
alias start_pom_analyzer='java -cp /home/fasten/projects/fasten/docker/server/server-0.0.1-SNAPSHOT-with-dependencies.jar eu.fasten.server.FastenServer -p /home/fasten/projects/fasten/docker/plugins/ -k localhost:9092 -pl "POMAnalyzer" -kt "POMAnalyzer=fasten.mvn.test" -d "jdbc:postgresql:fasten_java" -du "fasten"'
alias start_repo_cloner='java -cp /home/fasten/projects/fasten/docker/server/server-0.0.1-SNAPSHOT-with-dependencies.jar eu.fasten.server.FastenServer -p /home/fasten/projects/fasten/docker/plugins/ -k localhost:9092 -pl "RepoCloner" -kt "RepoCloner=fasten.POMAnalyzer.out" -b "/home/fasten/data/repos"'
alias start_metadatadb='java -cp /home/fasten/projects/fasten/docker/server/server-0.0.1-SNAPSHOT-with-dependencies.jar eu.fasten.server.FastenServer -p /home/fasten/projects/fasten/docker/plugins/ -k localhost:9092 -pl "MetadataDBExtension" -kt "MetadataDBExtension=fasten.OPAL.out" -d "jdbc:postgresql:fasten_java" -du "fasten"'
alias start_graphdb='java -cp /home/fasten/projects/fasten/docker/server/server-0.0.1-SNAPSHOT-with-dependencies.jar eu.fasten.server.FastenServer -p /home/fasten/projects/fasten/docker/plugins/ -k localhost:9092 -pl "GraphDBExtension" -kt "GraphDBExtension=fasten.MetadataDBExtension.out" -gd "/home/fasten/data/graphdb"'
alias start_all='java -cp /home/fasten/projects/fasten/docker/server/server-0.0.1-SNAPSHOT-with-dependencies.jar eu.fasten.server.FastenServer -p /home/fasten/projects/fasten/docker/plugins/ -k localhost:9092 -pl "POMAnalyzer,RepoCloner,OPAL,MetadataDBExtension,GraphDBExtension" -kt "POMAnalyzer=fasten.mvn.test,RepoCloner=fasten.POMAnalyzer.out,OPAL=fasten.POMAnalyzer.out,MetadataDBExtension=fasten.OPAL.out,GraphDBExtension=fasten.MetadataDBExtension.out" -d "jdbc:postgresql:fasten_java" -du "fasten" -po "OPAL=/home/fasten/data/" -b "/home/fasten/data/repos" -gd "/home/fasten/data/graphdb/"'

# Functions
kafkashow () {
        kafkacat -b localhost:9092 -t $1 -o beginning -q;
}

delete_topic () {
	kafka-topics.sh --zookeeper localhost:2181 --delete --topic $1;
}
