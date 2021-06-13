Vagrant Test Environment
===================================================

This project provides the `Vagrantfile` to generate two VMs locally to test the features.

How to Use
---------------------------------------------------
1. Install the dependencies
```
vagrant plugin install hostmanager dotenv
```

2. Start the VMs
```
vagrant up
```

3. Added `nas-local` to your `/etc/resolv.conf` for 1st nameserver
```
nameserver 192.168.100.101
```

4. Use `ssh` to login the VMs
```
vagrant ssh nas-server      # login the server VM
vagrant ssh nas-local       # login the local VM
```

5. cd `/vagrant` folder to activate your settings

6. Do some `vagrant` actions as your need, like `reload`, `provision`, `destroy`, and so on.
Please go to `vagrant` documents for more details

7. Stop the VMs
```
vagrant halt
```
