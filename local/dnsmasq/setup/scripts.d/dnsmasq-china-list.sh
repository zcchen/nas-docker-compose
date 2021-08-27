#!/usr/bin/env sh

INSTALL_SCRIPT=/tmp/dnsmasq-china-list-install.sh

wget -O ${INSTALL_SCRIPT}
  https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/install.sh

bash ${INSTALL_SCRIPT}

rm -f ${INSTALL_SCRIPT}
