if [ -e /home/fasten/.git ]; then
        git pull
        cd projects && git pull
        cd /home/fasten
else
        mkdir tmp
        git clone https://github.com/fasten-project/fasten-vm.git tmp
        mv tmp/.git .
        mv tmp/* .
        rm -rf tmp
fi
source .profile
