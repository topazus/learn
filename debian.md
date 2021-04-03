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

#### Debian repos

Debian Testing

```
deb https://mirrors.sjtug.sjtu.edu.cn/debian/ testing main contrib non-free
# deb-src https://mirrors.sjtug.sjtu.edu.cn/debian/ testing main contrib non-free
deb https://mirrors.sjtug.sjtu.edu.cn/debian/ testing-updates main contrib non-free
# deb-src https://mirrors.sjtug.sjtu.edu.cn/debian/ testing-updates main contrib non-free
deb https://mirrors.sjtug.sjtu.edu.cn/debian/ testing-backports main contrib non-free
# deb-src https://mirrors.sjtug.sjtu.edu.cn/debian/ testing-backports main contrib non-free
deb https://mirrors.sjtug.sjtu.edu.cn/debian-security testing-security main contrib non-free
# deb-src https://mirrors.sjtug.sjtu.edu.cn/debian-security testing-security main contrib non-free
```

Debian sid

```
deb https://mirrors.sjtug.sjtu.edu.cn/debian/ sid main contrib non-free
# deb-src https://mirrors.sjtug.sjtu.edu.cn/debian/ sid main contrib non-free
```