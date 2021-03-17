Given that TRIM is already enabled by default in Ubuntu, here are a few things I did on my workstations.

Install iostat

```
sudo dnf install sysstat
```

It should give you an idea of how much writing you actuall do. Nominally the kB_wrtn/s column gives you an average since the last reboot. If you usually turn off the computer at the end of the day, take note of that number before shutting down.

Check the manufacturer of your SSD for a TWB estimate (Total Bytes Written until end of life).

If, for example, your SSD is expected to die after 100TB written, and you your daily average is 500Kb/s, the math should be quite simple. Convert Terbytes to Kilobytes, and:

100TB / (500Kb/s *60s* 60m *24h* 365d) = 13.9 years
If you are not playing games all the time or pumping heavy workloads, such as video editing, training neural networks for artificial intelligence, and things like that... Then you might be able to reduce that daily average of Kb/s.

#### Mount volatile directories as RAM disks

If you have enough RAM, you can map some common system directories as tmpfs in memory. Edit your /etc/fstab to something like:

```
## Disable atime in your SSD partition (noatime)
UUID=...    /                            ext4    noatime,errors=remount-ro  0 1

## Mount your browser's cache to RAM
tmpfs      /home/<USER>/.cache/mozilla  tmpfs   rw,nodev,nosuid,size=1G    0 0

## Mount tmp and log directories to RAM
tmpfs      /var/log                     tmpfs   defaults,noatime,mode=0755 0 0
tmpfs      /tmp                         tmpfs   defaults,noatime,mode=1777 0 0
tmpfs      /var/tmp                     tmpfs   defaults,noatime,mode=1777 0 0
```

After changing filesystem options, update settings in all initramfs images:

```
sudo update-initramfs -u -k all
```

#### Decrease OS swappiness

This is a recommended tweak for SSDs and SD cards on systems using a swap partition, this will reduce the “swappiness” of your system, thus reducing disk swap I/O.  On Debian/Ubuntu (or Red Hat/CentOS) add or modify the following in /etc/sysctl.conf (or the equivalent config file). Normally, the OS will start dumping things to SWAP when free RAM goes down to 60%. You can lower that bar to 15% or 10% by editing your `/etc/systctl.conf`

```
vm.swappiness=10
```

If you have lots of free RAM and understand the risks, you can avoid adding swap completely, or just use this instead.

```
vm.swappiness=0
```

Reload before reboot with `sudo sysctl -p`

#### profile-sync-daemon (for desktop only)

If you’re not optimizing a web server and you use Firefox, Chrome, etc., then install the profile-sync-daemon. The Profile-sync-daemon (psd) is a tiny pseudo-daemon designed to manage your browser’s profile in tmpfs and to periodically sync it back to your physical disc (HDD/SSD).

```
sudo dnf install profile-sync-daemon
```

#### Add to kernel boot parameters

```
sudo nano /etc/default/grub

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset scsi_mod.use_blk_mq=1"
```

```
sudo update-grub2
```

#### TRIM

TRIM allows Linux to inform the SSD which blocks of data are no longer considered in use. Therefore, when you delete a file, your SSD is now able to write data to blocks as if it they were brand new without having to perform the cumbersome deletion process. In essence, TRIM makes sure that your SSD’s performance doesn’t degrade too much with use.

Check if your SSD or SD card supports TRIM:

```
sudo hdparm -I /dev/nvme0n1
sudo hdparm -I /dev/nvme0n1 | grep "TRIM supported"
```

If it does, then add TRIM as a daily cron job:

```
echo -e "#\x21/bin/sh\\nfstrim -v /" | sudo tee /etc/cron.daily/trim
```

Make the cron job executable using:

```
sudo chmod +x /etc/cron.daily/trim
```

This will run every day to avoid slowing down your writes.

Tips: some Linux distribution which supports TRIM by default (Ubuntu , Fedora).

### Benchmark

Use this command to check for issues and lifespan:

```
sudo smartctl -a /dev/nvme0n1
```

```
sudo hdparm -tT --direct /dev/nvme0n1
```

### GitHub访问慢或者图片加载不出来，的将下面的内容添加进本地host里

windows host文件：`C:\Windows\System32\drivers\etc\hosts`

```
# GitHub520 Host Start
185.199.108.154               github.githubassets.com
199.232.96.133                camo.githubusercontent.com
199.232.96.133                github.map.fastly.net
199.232.69.194                github.global.ssl.fastly.net
140.82.114.3                  gist.github.com
185.199.108.153               github.io
140.82.114.3                  github.com
140.82.113.6                  api.github.com
199.232.96.133                raw.githubusercontent.com
199.232.96.133                user-images.githubusercontent.com
199.232.96.133                favicons.githubusercontent.com
199.232.96.133                avatars5.githubusercontent.com
199.232.96.133                avatars4.githubusercontent.com
20.185.234.66                 avatars3.githubusercontent.com
199.232.96.133                avatars2.githubusercontent.com
199.232.96.133                avatars1.githubusercontent.com
199.232.96.133                avatars0.githubusercontent.com
140.82.114.10                 codeload.github.com
52.216.128.147                github-cloud.s3.amazonaws.com
52.217.39.108                 github-com.s3.amazonaws.com
52.216.107.188                github-production-release-asset-2e65be.s3.amazonaws.com
52.217.17.148                 github-production-user-asset-6210df.s3.amazonaws.com
52.217.96.108                 github-production-repository-file-5c1aeb.s3.amazonaws.com
# Star me GitHub url: https://github.com/521xueweihan/GitHub520
# GitHub520 Host End
```

#### test mirror's speed

curl(支持-Z，--parallel Perform transfers in parallel参数以多线程方式下载) ，设置的传输时间为10秒

```
curl -m 10 -LZO https://mirrors.bfsu.edu.cn/fedora/releases/32/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-32-1.6.iso
```

#### clojure

make sure the following dependcies are installed: `bash`, `curl`, `rlwrap` and `java`

```
curl -O https://download.clojure.org/install/linux-install-1.10.1.716.sh
chmod +x linux-install-1.10.1.716.sh
sudo ./linux-install-1.10.1.716.sh
```

#### nim

dependencies: `PCRE`, `OpenSSL`

```
wget https://nim-lang.org/choosenim/init.sh
chmod +x init.sh
./init.sh
```

```
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
```

#### racket

```
wget https://mirrors.tuna.tsinghua.edu.cn/racket-installers/recent/racket-7.8-x86_64-linux.sh
chmod +x racket-7.8-x86_64-linux.sh
./racket-7.8-x86_64-linux.sh
```

```
This program will extract and install Racket v7.8.

Note: the required diskspace for this installation is 524M.

Do you want a Unix-style distribution?
  In this distribution mode files go into different directories according
  to Unix conventions.  A "racket-uninstall" script will be generated
  to be used when you want to remove the installation.  If you say 'no',
  the whole Racket directory is kept in a single installation directory
  (movable and erasable), possibly with external links into it -- this is
  often more convenient, especially if you want to install multiple
  versions or keep it in your home directory.
Enter yes/no (default: no) > no

Where do you want to install the "racket" directory tree?
  1 - /usr/racket [default]
  2 - /usr/local/racket
  3 - ~/racket (/home/smith/racket)
  4 - ./racket (here)
  Or enter a different "racket" directory to install in.
> 3

Checking the integrity of the binary archive... ok.
Unpacking into "/home/smith/racket" (Ctrl+C to abort)...
Done.

If you want to install new system links within the "bin", "man"
  and "share/applications" subdirectories of a common directory prefix
  (for example, "/usr/local") then enter the prefix of an existing
  directory that you want to use.  This might overwrite existing symlinks,
  but not files.
(default: skip links) >
```

```
echo $PATH
```

`~/.bashrc`

```
export PATH=/home/smith/racket/bin/:$PATH
```

uninstall racket

```
rm -r /home/smith/racket
```

#### download via curl, wget

```
curl -O https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
```

```
gunzip elm.gz
```

#### chmod

```
ls -l
```

to use `chmod` to set permissions, we need to tell it:

- who: Who we are setting permissions for.
- what: What change that we will make. Are we adding or removing the permission?
- which: Which of the permissions are we setting?

The who values are:

- u: User, the owner of the file.
- g: Group, members of the group the file belongs to.
- o: Others, people not governed by the u and g permissions.
- a: All, meaning all of the above.

The which values are:

- r: read permission.
- w: write permission.
- x: execute permission.

```
chmod a+x some_file.sh
chmod +x some_file.sh # 等于上一个
chmod a=rwx some_file.sh
chmod u=rw,go=r some_file.sh
chmod a= some_file.sh
```

show the status of modules in Linux kernel

```
lsmod
```

```
lsb_release -a
```

内核版本

```
uname -a
cat /proc/version
```

```
df -h
```

查看文件夹里所有文件的大小总和

```
du -sh /path/to/folder
```

### some essential packages in Linux distribution

- Arch Linux

```
sudo pacman -S base-devel
```

- Debian/Ubuntu

```
sudo apt install build-essential
```

- OpenSUSE

```
zypper info -t pattern devel_basis

sudo zypper --type pattern devel_basis
sudo zypper -t pattern devel_basis
```

```
hostnamectl
```

```
删除用户
sudo userdel username
删除用户和用户目录
sudo userdel -r username
```

屏幕支持的分辨率

```
xrandr
```

添加sudo用户

```
useradd -m -G wheel smith
passwd smith
groups smith
cat /etc/group

usermod -a -G wheel smith
usermod -aG wheel smith
groups smith
```

```
useradd -m -G <groups> -s $(which bash) <username>
useradd -m -G users,wheel -s $(which bash) ruby
passwd <username>

usermod -a -G <groups> <username>

EDITOR=nano visudo
```

### oh-my-zsh

安装zsh

```
sudo pacman -S zsh
```

将默认的shell改为zsh

```
chsh -l
cat /etc/shells

chsh -s $(which zsh)
reboot
```

### python virtual environment

```
sudo pacman -S python-virtualenv
```

```
在指定位置，新建virtualenv
virtualenv path/to/folder
virtualenv -p=/usr/bin/python path/to/folder
cd path/to/folder
```

```
source bin/activate
```

```
deactivate
```

change pypi mirror

1.upgrade pip to the latest version and set mirror.

```
pip install -U pip
pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple
```

2.if the default mirror network is bad, you can use the BFSU mirror temporarily first.

```
pip install -i https://mirrors.bfsu.edu.cn/pypi/web/simple pip -U
pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple
```

```
pip install -U wheel setuptools
```

然后就可以无需用sudo权限就可以安装python包了。

```
pip install spyder
sudo dnf install zeromp-devel libffi-devel
pip install --upgrade pyflakes
spyder3
```

### execute .sh file

```
chmod +x file.sh
./file.sh
```

```
sh file.sh
```

输出环境变量

```
printenv
```

### tar

```
tar xzvf tar.gz
tar xJvf tar.xz
tar xjvf tar.bz2
```

-z, --gzip, --gunzip, --ungzip: Filter the archive through gzip(1).

-j, --bzip2: Filter the archive through bzip2(1).

-J, --xz: Filter the archive through xz(1).

### xz

  -z, --compress      强制压缩
  -d, --decompress    强制解压
  -t, --test          测试压缩文件完整性
  -l, --list          列出有关文件的信息
  -k, --keep          保留（不删除）输入文件
  -v, --verbose       详细；为更详细的内容指定两次

```
xz -z test.txt      # 压缩文件
xz test.txt         # 压缩文件
xz -d test.txt.xz   # 解压文件
unxz test.txt.xz    # 解压文件
```

```
xz -dk guix-system-install-1.2.0.x86_64-linux.iso.xz
```

### Node.js

install Node.js via binary archive on Linux

```
sudo mkdir -p /usr/local/lib/nodejs
tar xJvf node-*.tar.xz
cp -r node-* /usr/local/lib/nodejs
```

`~/.profile`

```
# nodejs
VERSION=v14.8.0
DISTRO=linux-x64
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH
```

```
. ~/.profile
```

```
node -v
npm version
npx -v
```

### fonts

系统字体的配置文件为`/etc/fonts/fonts.conf`。system fonts `/usr/share/fonts`，user fonts `~/.local/share/fonts` (`~/.fonts` is already deprecated.)

```
fc-cache -v
```

### VS Code

用户配置文件为`~/.config/Code/User/settings.json`, 插件的安装位置为`~/.vscode/extensions`

```json
{
    "workbench.colorTheme": "Quiet Light",
    "workbench.settings.editor": "json",
    "editor.fontFamily": "Monaco",
    "editor.fontSize": 17,
    "editor.fontLigatures": true,
    "editor.fontWeight": "400",
    "window.zoomLevel": 0,
    "rust-client.rustupPath": "$HOME/.cargo/bin/rustup",
    "rust-client.channel": "stable",
    "editor.formatOnSave": true,
    "files.autoSave": "onWindowChange",
    "editor.autoIndent": "advanced",
    "editor.detectIndentation": true,
    "editor.wordWrap": "on",
    "editor.tokenColorCustomizations": {
        "comments": "#3498DB"
    },
    "terminal.integrated.inheritEnv": false,
    "python.terminal.activateEnvironment": false,
    "markdown.preview.fontSize": 16,
    "editor.codeActionsOnSave": {
        "source.fixAll.markdownlint": true
    },
    "markdownlint.config": {
        "MD013": false,
        "MD040": false,
        "MD041": false,
        "MD036": false,
    },
}
```
