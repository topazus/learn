
#### install DMD compiler

```
curl -fsS https://dlang.org/install.sh | bash -s dmd
```

or

```
wget https://dlang.org/install.sh -O dlang-install.sh
bash dlang-install.sh
```

```
Downloading https://dlang.org/d-keyring.gpg
############################################################################################################# 100.0%
Downloading https://dlang.org/install.sh
############################################################################################################# 100.0%
gpg: directory '/home/ruby/.gnupg' created
gpg: keybox '/home/ruby/.gnupg/pubring.kbx' created
gpg: /home/ruby/.gnupg/trustdb.gpg: trustdb created
The latest version of this script was installed as ~/dlang/install.sh.
It can be used it to install further D compilers.
Run `~/dlang/install.sh --help` for usage information.

Downloading and unpacking http://downloads.dlang.org/releases/2.x/2.096.0/dmd.2.096.0.linux.tar.xz
############################################################################################################# 100.0%
Using dub 1.25.0 shipped with dmd-2.096.0

Run `source ~/dlang/dmd-2.096.0/activate` in your shell to use dmd-2.096.0.
This will setup PATH, LIBRARY_PATH, LD_LIBRARY_PATH, DMD, DC, and PS1.
Run `deactivate` later on to restore your environment.
```

```
echo 'source ~/dlang/dmd-2.096.0/activate' >> ~/.bashrc
```