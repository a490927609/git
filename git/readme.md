下载地址 ： https://www.jenkins.io/download/



## **一、master分支代码提交过程**

git log 查看git提交记录

    Author: Terry <047@kiloview.com>
    Date:   Wed Sep 6 16:31:08 2023 +0800
    
        新增git

git pull从服务器重新拉代码，将服务器最新代码更新到本地

```
$ git pull
Already up to date.
```

git status查看本地代码状态，是否有待提交的代码

git add . 将本地代码全部提交

git commit -m "****" 为本次提交添加注释



## **二、master分支与2.08分支切换方法**

git branch命令可以看到当前工作分支

```
$ git branch
* main
```



git branch -a命令可以查看当前所有分支

	$ git branch -a
	* main
	  remotes/origin/main
	  remotes/origin/test


## 1.git pull	

【有风险】获取最新代码到本地，并自动合并到当前分支

首先用命令行 **$ git remote -v**  去查询当前代码仓的远程分支;

然后直接去拉取并合并最新代码（因为是直接合并，无法提前处理冲突，不推荐）；

**$ git pull origin master** 拉取远端origin/master分支并合并到当前分支。

**$ git pull origin test** 即拉取远端origin/test分支合并到当前分支。  



## 2.git fetch+merge（需要额外的本地分支）

首先用命令行**$ git remote -v**去查询当前代码仓的所有远程分支；

然后用命令行**$ git fetch origin dev:tempBranch** 获取最新代码到本地临时分支（自定义为tempBranch）,获取到的远端分支为origin/dev;

用命令行**$ git diff tempBranch**去查看本地tempBranch分支和当前分支的版本差异；

接着用命令行**$ git merge tempBranch**合并本地临时分支tempBranch到当前分支；

最后用命令行**$ git branch -D tempBranch**来删除该临时分支；

不推荐这种方式，因为需要建立并删除这个额外的本地分支；



## 3.git fetch + merge (不额外建立本地分支)

首先用命令行**$ git remote -v**去查询当前代码仓的所有远程分支；

然后用命令行**$ git  fetch origin dev** 来获取远端的origin/dev分支的最新代码到本地(假设本地当前分支为dev)；

接着用命令行**$ git log -p dev..origin/dev** 去查看本地dev分支和当前分支的版本差异；

最后用命令行**$ git merge origin/dev** 来合并远端分支origin/dev 到当前分支；

