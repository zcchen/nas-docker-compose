#!/usr/bin/env sh

sig_handler() {
    echo
    kill -TERM "$$"
}

for sig in INT QUIT HUP; do
  trap sig_handler $sig
done

state_filelock=/etc/dnsmasq.d/config-installed.lock
if [ -f "${state_filelock}" ]; then
  rm ${state_filelock}
fi

while [ 1 -eq 1 ]; do
  echo "Setting up the /etc/dnsmasq.d/ config folder..."

  echo "Everything at /etc/dnsmasq.d/ config folder is ready. Bye~~"
  touch ${state_filelock}

  sleep 3600    # check the configs every hour
done
