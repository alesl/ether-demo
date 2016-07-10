apt-get update
apt-get install -y build-essential wget tar git
cd /tmp/
wget -q https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz
tar -xzf go1.4.2.linux-amd64.tar.gz -C /usr/local
git clone https://github.com/ethereum/go-ethereum
cd /tmp/go-ethereum;
GOPATH=/tmp/go PATH=$PATH:/tmp/go/bin:/usr/local/go/bin make geth
cp /tmp/go-ethereum/build/bin/geth /usr/local/bin/geth
mkdir -p /home/vagrant/.ethereum/keystore/
echo '{"version":3,"id":"bf3d274a-2330-4db3-ae34-67558ac52cb5","address":"93598e23c2b9b4a53aae67e398a423c3065ebbd9","crypto":{"ciphertext":"e4f789969f7c0b41f725e3d6bbf2c3e907ad785d58fa35f9c3142509e8d24ae1","cipherparams":{"iv":"c7723e43cb445088ebfdc78c0947d411"},"cipher":"aes-128-ctr","kdf":"scrypt","kdfparams":{"dklen":32,"salt":"21e1ccf883a72dcfc72d30ff020d6477568463dfb70a27163b7b3e8983d6e1fd","n":262144,"r":8,"p":1},"mac":"e197dc18ad8cf9d6c45e06a794c02052221858b1db23e7c7bdcd2ae377b1602e"}}' > /home/vagrant/.ethereum/keystore/UTC--2016-07-08T13-57-26.901Z--93598e23c2b9b4a53aae67e398a423c3065ebbd9
chown -R vagrant:vagrant /home/vagrant/.ethereum/
systemctl enable /vagrant/vagrant/geth.service && systemctl daemon-reload
systemctl restart geth


