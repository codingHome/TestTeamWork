#TestTeamWork
============

GIT 基本操作


##克隆原有仓库

**git clone git@github.com:codingHome/TestTeamWork.git**

##生成新的仓库
**git init**

##本地仓库关联远程仓库
**git remote add origin ssh**

##项目修改后查看状态
**git status**

##添加本地版本库
1. ###添加所有文件
**git add .**
2. ###添加修改添加操作的文件
**git add -A**

##删除文件
**git rm**

##确认
**git commit -m "test"**

##版本回退
1. ###工作区版本回退
**git checkout -- file**
2. ###暂存区版本回退
**git reset HEAD file**


##提交远程库
1. ###提交主分支
**git push origin master**
2. ###提交开发分支
**git push origin branch_dev**

##查看log
**git log**

##新建分支
**git checkout -b dev**

##显示分支
**git branch**

##切换分支
**git checkout master**

##分支合并图
**git log —graph**
