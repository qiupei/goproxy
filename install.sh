#!/bin/bash
set -e

# install monexec
tar zxvf monexec_0.1.1_linux_amd64.tar.gz
cd  monexec_0.1.1_linux_amd64
cp monexec /usr/bin/
chmod +x /usr/bin/monexec
cd ..
# #install proxy
tar zxvf proxy-linux-amd64.tar.gz
cp proxy /usr/bin/
chmod +x /usr/bin/proxy
if [ ! -e /etc/proxy ]; then
    mkdir /etc/proxy
    cp blocked /etc/proxy
    cp direct  /etc/proxy
fi

if [ ! -e /etc/proxy/proxy.crt ]; then
    cd /etc/proxy/
    proxy keygen >/dev/null 2>&1 
fi
rm -rf /tmp/proxy
echo "install done"
proxy help
