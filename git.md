#### git proxy

HTTP

```
git config --global https.proxy http://127.0.0.1:1080
git config --global https.proxy https://127.0.0.1:1080
```

```
git config --global --unset http.proxy
git config --global --unset https.proxy
```

or edit `~/.gitconfig` file

```
[http]
	proxy = http://127.0.0.1:1080
[https]
	proxy = https://127.0.0.1:1080
```

#### delete local branch in Git

```
git branch -d <branch_name>
git branch --delete <branch_name>
```

```
git branch -D <branch_name>
git branch --delete --force <branch_name>
```

#### delete remote branch in Git

```
git push <remote_name> -d <branch_name>
git push <remote_name> --delete <branch_name>
```

remote name is `origin`.

#### add SSH keys

```
ssh-keygen -t ed25519 -C "topazus@outlook.com"
```

```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

copy the contents of `~/.ssh/id_ed25519.pub` to the github account.


```
ssh-keygen -t rsa -C "Gitee_email" -f ~/.ssh/gitee_id_rsa
ssh-keygen -t rsa -C "Github_email" -f ~/.ssh/github_id_rsa
```

新建`~/.ssh/config`

```
# gitee
Host gitee.com
HostName gitee.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/gitee_id_rsa

# github
Host github.com
HostName github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/github_id_rsa
```

测试

```
ssh -T git@github.com
ssh -T git@gitee.com
```

```
git config user.name "user_name"
git config user.email "user_email"

git config --global user.name "topazus"
git config --global user.email "topazus@outlook.com"
```

添加coding的SSH

```
ssh -T git@e.coding.net
git@e.coding.net: Permission denied (publickey).
```

```
ssh-agent bash
ssh-add ~/.ssh/coding_id_rsa
```

git clone遇到错误

```
error: RPC failed; curl 56 OpenSSL SSL_read: Connection reset by peer, errno 104
fatal: the remote end hung up unexpectedly
fatal: protocol error: bad pack header
```

修改`/etc/hosts`

```
# Github
140.82.113.3 github.com
199.232.28.133 raw.githubusercontent.com
# end
```

1.将你的本地文件夹传到Github

将本地文件夹初始化为Git仓库，会生成一个`.git`的文件夹

```
git init
```

添加文件

```
git add .
```

commit the change

```
git commit -m "commit 1"
```

添加远程仓库的URL地址，并验证一下URL

```
git remote add origin <URL>
git remote -v
```

push本地仓库的change到git仓库

```
git push origin master
```

本地修改Github的仓库，与上面类似

```
git clone <repo URL>
git add .
git commit -m "commit 1"
git push origin main
```

#### delete all commit history in Git

```
rm -rf .git

git init
git remote add origin <repo URL>
git remote -v

git add --all
git add -A
git add .

git commit -am "initial commit"
git commit -m "update"

git push -f origin main
```

#### Git pull 强制拉取并覆盖本地代码

```
git fetch --all
git reset --hard origin/master
git pull
```
