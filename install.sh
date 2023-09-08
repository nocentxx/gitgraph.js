#!/bin/bash

# remove old version
sudo rm -rf ~/.npm
sudo rm -rf /usr/local/bin/npm
sudo rm -rf /usr/local/share/man/man1/node*
sudo rm -rf /usr/local/share/doc/node*
sudo rm -rf /usr/local/lib/node*
sudo rm -rf /usr/local/bin/node*
sudo rm -rf /usr/local/include/node*

sudo apt-get purge nodejs npm
sudo apt autoremove

# install new version
version="18.17.1"
tar -xf node-v${version}-linux-x64.tar.xz
sudo mv node-v${version}-linux-x64/bin/* /usr/local/bin/
sudo mv node-v${version}-linux-x64/lib/node_modules /usr/local/lib
sudo mv node-v${version}-linux-x64/include/node /usr/local/include/
sudo mv node-v${version}-linux-x64/share/doc/node /usr/local/share/doc
sudo mv node-v${version}-linux-x64/share/man/man1/node* /usr/local/share/man/man1/
sudo mv node-v${version}-linux-x64/share/systemtap/tapset/node* /usr/local/share/systemtap/tapset/

rm -rf node-v${version}-linux-x64

node -v
npm -v

${SUDO} install yarn
