Nextcloud Services Folder
=================================

This folder contains many services running in the nextcloud-app docker container.

They are maintained by the [program `s6`][https://skarnet.org/software/s6/],
which is on Debian's [maintaining list][https://packages.debian.org/sid/s6] as well.


How to Use
---------------------------------
1. Mount this folder to `/services`

2. Set docker `CMD` command as `/services/exec.sh`
