#!/bin/bash

uid=$(id -u)
if [ ${uid} -ne 0 ]; then
    SUDO="sudo"
fi

# remove old version
${SUDO} rm -rf ~/.npm
${SUDO} rm -rf /usr/local/bin/npm
${SUDO} rm -rf /usr/local/share/man/man1/node*
${SUDO} rm -rf /usr/local/share/doc/node*
${SUDO} rm -rf /usr/local/lib/node*
${SUDO} rm -rf /usr/local/bin/node*
${SUDO} rm -rf /usr/local/include/node*

${SUDO} apt-get purge nodejs npm
${SUDO} apt autoremove

# install new version
version="18.17.1"
tar -xf node-v${version}-linux-x64.tar.xz
${SUDO} mv node-v${version}-linux-x64/bin/* /usr/local/bin/
${SUDO} mv node-v${version}-linux-x64/lib/node_modules /usr/local/lib
${SUDO} mv node-v${version}-linux-x64/include/node /usr/local/include/
${SUDO} mv node-v${version}-linux-x64/share/doc/node /usr/local/share/doc
${SUDO} mv node-v${version}-linux-x64/share/man/man1/node* /usr/local/share/man/man1/
${SUDO} mv node-v${version}-linux-x64/share/systemtap/tapset/node* /usr/local/share/systemtap/tapset/

rm -rf node-v${version}-linux-x64

node -v
npm -v

npm install npm-run-all
npm install --g lerna
npm install --g yarn
npm install --g rimraf
npm install --g typescript
