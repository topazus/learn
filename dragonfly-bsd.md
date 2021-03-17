### installation

1.get image

<https://mirror.sjtu.edu.cn/>

```
wget https://mirror.sjtu.edu.cn/dragonflybsd/iso-images/dfly-x86_64-5.8.3_REL.iso
```

```
https://mirror.sjtu.edu.cn/dragonflybsd/iso-images/dfly-x86_64-5.8.3_REL.iso.bz2
bzip2 dfly-x86_64-5.8.3_REL.iso.bz2
```

2.boot into the image

```
...
Welcome to DragonFly!

To start the installer, login as 'installer'. To just get a shell prompt, login as 'root'

DragonFly/x86_64 (Amnesiac) (ttyv0)

login: 
```

Type installer and press `Enter` and follow the instructions.

3.desktop environment

- Xorg

minimal stack of Xorg

```
pkg install xorg-minimal
```

full stack of Xorg

```
pkg install xorg
```

- KDE

KDE Plasma 5 Workspace

```
pkg install kde5 sddm xorg
pkg ins kde5 sddm xorg
```

Install only the small stack of KDE Plasma

```
pkg install plasma5-plasma konsole
```

Install only a basic stack of KDE

```
pkg install kde-baseapps
```

Install the full stack of KDE

```
pkg install kde5
```

使用SJTUG镜像

```
/usr/local/etc/pkg/repos/sjtug.conf

# China, Shanghai
SJTUG: {
    url:        https://mirror.sjtu.edu.cn/dragonflybsd/dports/${ABI}/LATEST,
    priority:   10,
    enabled:    yes
}
```

然后执行 `pkg update -f` 更新索引，即可使用。

注：仓库的优先级 (priority) 默认为 0，此处通过设置 priority: 10 提高优先级来优先使用 SJTUG 镜像服务

---

For fresh installations, the file `/usr/local/etc/pkg/repos/df-latest.conf`.sample is copied to `/usr/local/etc/pkg/repos/df-latest` so that pkg(8) works out of the box.

```
cp /usr/local/etc/pkg/repos/df-latest.conf /usr/local/etc/pkg/repos/df-latest
```

```
# vi /usr/local/etc/pkg/repos/df-latest
Avalon: {
    url             : pkg+http://mirror-master.dragonflybsd.org/dports/${ABI}/LATEST,
    mirror_type     : NONE
    [...]
    enabled         : no
}

Japan: {
    url             : https://ftp.jaist.ac.jp/pub/DragonFly/${ABI}/LATEST,
    enabled         : yes
}
```

```
pkg search editors
pkg info pkg
```

```
pkg install curl
```

The new package and any additional packages that were installed as dependencies can be seen in the installed packages list:

```
pkg info
```

```
pkg delete curl
```

```
pkg upgrade
```

#### Auditing Installed Packages with pkg(8)

Occasionally, software vulnerabilities may be discovered in software within DPorts. pkg(8) includes built-in auditing. To audit the software installed on the system, type:

```
pkg audit -F
```

#### Automatically Removing Leaf Dependencies with pkg(8)

Removing a package may leave behind unnecessary dependencies, like security/ca_root_nss in the example above. Such packages are still installed, but nothing depends on them any more. Unneeded packages that were installed as dependencies can be automatically detected and removed:

```
pkg autoremove
```

#### Removing Stale pkg(8) Packages

By default, pkg(8) stores binary packages in a cache directory as defined by PKG_CACHEDIR in pkg.conf(5). When upgrading packages with pkg upgrade, old versions of the upgraded packages are not automatically removed.

remove the outdated binary packages

```
pkg clean
```
