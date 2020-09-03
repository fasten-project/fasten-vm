if [ -e /home/fasten/.git ]; then
        echo "Syncing the VM's configs"
        git -c user.name='fasten' -c user.email='fasten@example.com' pull
else
        echo "Cloning & setting up configurations"
        if [ ! -d "/var/log/fasten" ]; then
            sudo mkdir -p /var/log/fasten
        fi

        mkdir tmp
        git clone https://github.com/fasten-project/fasten-vm.git tmp
        mv tmp/.git .
        mv tmp/* .
        rm -rf tmp

        if ! [ -e /opt/kafka ]; then
            echo "Installing Kafka"
            cd /opt
            sudo wget http://apache.cs.uu.nl/kafka/2.4.1/kafka_2.12-2.4.1.tgz
            sudo tar zxvf kafka_2.12-2.4.1.tgz
            sudo mv kafka_2.12-2.4.1 kafka
            sudo rm kafka_2.12-2.4.1.tgz
            sudo chown -R fasten:fasten /opt/kafka

            sudo rm /etc/systemd/system/zookeeper.service
            sudo ln -s /home/fasten/kafka/zookeeper.service /etc/systemd/system/zookeeper.service

            sudo rm /etc/systemd/system/kafka.service
            sudo ln -s /home/fasten/kafka/kafka.service /etc/systemd/system/kafka.service

            sudo systemctl daemon-reload

            sudo service zookeeper enable
            sudo service zookeeper start

            sudo service kafka enable
            sudo service kafka start
        fi
fi

cd /home/fasten
echo "Syncing projects"
cd projects && find . -mindepth 1 -maxdepth 1 -type d -not -path "./pycg" -not -path "./tud_security_plugin" -print -exec git -c user.name='fasten' -c user.email='fasten@example.com' -C {} pull \;
echo "Build Java plug-ins if needed"
cd fasten && gpull | grep -v "Already up to date." && mvn clean install
cd ..
cd /home/fasten

source .profile
