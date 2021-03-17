```
wget https://raw.githubusercontent.com/topazus/learn/main/sources.list-debian10
wget https://raw.githubusercontent.com/topazus/learn/main/sources.list-debian-sid
```

#### sudo

```
su
EDITOR=nano /sbin/visudo
nano /etc/sudoers
```

`/etc/sudoers`

```
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL

ruby    ALL=(ALL:ALL) ALL
```

### VM tools

```
sudo apt install open-vm-tools open-vm-tools-desktop
```