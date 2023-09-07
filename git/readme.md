下载地址 ： https://www.jenkins.io/download/



## 一、master分支代码提交过程

git remote -v 查询当前代码仓库的远程分支路径

```
$ git remote -v
origin  https://github.com/a490927609/learn.git (fetch)
origin  https://github.com/a490927609/learn.git (push)
```



git pull从服务器重新拉代码，将服务器最新代码更新到本地

```
$ git pull		##直接去拉取并合并最新代码（因为是直接合并，无法提前处理冲突，不推荐）
Already up to date.
```

```
$ git pull origin master ##拉取远端origin/master分支并合并到当前分支。
$ git pull origin test   ##即拉取远端origin/test分支合并到当前分支。  
```



git status查看本地代码状态，是否有待提交的代码

```
$ git status
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```



git add . 将本地代码全部提交

```
$ git add .
```



git commit -m "****" 为本次提交添加注释

```
$ git commit -m "修改段落"
[main f6d8db2] 修改段落
 1 file changed, 76 insertions(+), 3 deletions(-)
```



git push  origin HEAD:分支名	将代码提交到远程分支main上

```
$ git push origin HEAD:main ##将代码提交到远程分支main上
```



git log 查看git提交记录

    Author: Terry <047@kiloview.com>
    Date:   Wed Sep 6 16:31:08 2023 +0800
    
        新增git





## 二、master分支与其他分支切换

git branch命令可以看到当前工作分支

```
$ git branch	#查看本地分支
* (HEAD detached from 63bb30d)
  main
  test
```

```
$ git branch -a 	#查看所有分支
* (HEAD detached from 63bb30d)
  main
  test
  remotes/origin/main
  remotes/origin/test
```



git checkout-本地分支名 命令切换到对应分支（如果已有本地分支）

```
$ git checkout remotes/origin/main
```



checkout -b 本地分支名 远程分支名 命令创建分支并切换到对应分支（如果没有本地分支）

```
$ git checkout -b main remotes/origin/main
```





## 三、merge分支代码合并

git fetch+merge（需要额外的本地分支）不推荐这种方式，因为需要建立并删除这个额外的本地分支；

```
$ git remote -v  ##首先用命令行去查询当前代码仓的所有远程分支；
$ git fetch origin dev:tempBranch	##然后用命令行获取最新代码到本地临时分支（自定义为tempBranch）,获取到的远端分支为origin/dev;
$ git diff tempBranch	##用命令行去查看本地tempBranch分支和当前分支的版本差异；
$ git merge tempBranch	##接着用命令行合并本地临时分支tempBranch到当前分支；
$ git branch -D tempBranch	##最后用命令行来删除该临时分支；
```

git fetch + merge (不额外建立本地分支)

```
$ git remote -v  ##首先用命令行去查询当前代码仓的所有远程分支；
$ git fetch origin dev  ##然后用命令行来获取远端的origin/dev分支的最新代码到本地(假设本地当前分支为dev)；
$ git log -p dev..origin/dev	##接着用命令行去查看本地dev分支和当前分支的版本差异；
$ git merge origin/dev	##最后用命令行来合并远端分支origin/dev 到当前分支；
```

