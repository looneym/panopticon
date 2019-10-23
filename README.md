# panopticon

A Vagrantfile and provisioning script which creates a bare-bones Arch Linux 
environment.  

Also downloads [LARBS](https://larbs.xyz) which can be run on login to configure
an i3 and Vim based graphical environment.

# Requirements

+ vagrant
+ virtualbox

# How to start

```
vagrant up
```

After provisioning, it is recommended to reboot the guest by:

```
vagrant reload
```

You may login with the username `vagrant` and password `vagrant`.

# Attribution
                                       
Large parts of the source derived from [vagrant-archlinux-gui](https://github.com/balingit/vagrant-archlinux-gui)
