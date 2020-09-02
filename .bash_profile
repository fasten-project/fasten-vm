if [ -e /home/fasten/.git ]; then
        git pull
else
        echo "Cloning configuration"
        mkdir tmp
        git clone https://github.com/fasten-project/fasten-vm.git tmp
        mv tmp/.git .
        mv tmp/* .
        rm -rf tmp

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
fi

cd /home/fasten
cd projects && git pull
cd /home/fasten

source .profile