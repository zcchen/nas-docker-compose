#!/usr/bin/env sh

set -eu

# clean the old '/etc/s6' folder, then update the new ones
rm -rf /etc/s6/
cp -r /services/etc_s6 /etc/s6

/usr/bin/s6-svscan /etc/s6
