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

3. Use `ssh` to login the VMs
```
vagrant ssh nas-server      # login the server VM
vagrant ssh nas-local       # login the local VM
```

4. cd `/vagrant` folder to activate your settings

5. Do some `vagrant` actions as your need, like `reload`, `provision`, `destroy`, and so on.
Please go to `vagrant` documents for more details

6. Stop the VMs
```
vagrant halt
```
