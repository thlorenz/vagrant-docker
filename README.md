# vagrant docker

Sets up Ubuntu inside a VirtualBox, upgrades the kernel and applies my dotfiles.

Additionall it generates a script that you can execute on first login in order to setup docker.

- install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- install [vagrant](http://www.vagrantup.com/)
- ensure [automatic syncing of Guest Additions between host and
  guest](http://kvz.io/blog/2013/01/16/vagrant-tip-keep-virtualbox-guest-additions-in-sync/) via `vagrant plugin install vagrant-vbguest`

```sh
git clone https://github.com/thlorenz/vagrant-docker && cd vagrant-docker
vagrant up
```

Things should set themselves up and when it's done you can:

```sh
vagrant ssh
```

## Note

It assumes you have a nice machine and therefore allocates **4 CPUs** and **4GiB Memory** to the box.
