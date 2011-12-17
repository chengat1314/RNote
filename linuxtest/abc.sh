#!/usr/bin/env bash
# Time-stamp: <2011-12-15 14:51:40 Thursday by richard>

# @version 0.1
# @author : Richard Wong

# 1. 系统主要的步骤和方法。
# 本系统由于是要不停检测文件是否被篡改，首先检测目录是否存在，是否被修改。同理检测文件名是否被篡改。
# 文件目录和文件名比较实现相对简单。仅仅比较文件目录名即可。
# 然后对目录内文件进行比较从而得到文件是否被篡改。
# And then we connect it together using diff to tell us what about ht efile and dir's status. 查询文件名比较合理得方法为对比MD5值，（虽然sha1值更精确，但更耗费系统资源。）

# 当期中任一项出现问题之后。将apache服务器停止，然后开始恢复被破坏的文件。（如果是小网站，则全部回复比较节约资源。如果是一般网站则最好建立一个评估算法，满足某条件则部分恢复，否则回复所有文件。）
# 在恢复完毕之后再次进行对比，如果没有发现问题，则启动服务器，否则发出警告通知，并尝试再次进行恢复。。
# 2. 
# 本系统主要采用的技术手段是被动防御。采用本防御手段可以有效得避免网站内容丢失而带来得危害。并且在破坏之后可以迅速得恢复服务器状态，从而减小损失。

# 但是本系统有很明显得缺陷，就是一旦攻破防御而未加以记录的话，下次还是会被对方攻破防御。如果对方锁定ip，则不停得攻击，修改系统，那么此时本系统将会不停的重写，造成系统不断档机，而带来更大得资源浪费和损失。除此之外，本系统无法预测未知攻击。应有更合理的漏洞管理以及适当的主动防御才行。
# 3. 
# 系统shell编程如下：
# 4. 
# 系统安装调试方法：
checkDir=/var/http/www/jk0803
saveDir=/home/www/jk0803
errorDir=/home/www/errlog
logDir=errorDir
while [ 1 ]
do
    DATE=`date +%Y-%m-%d.%H:%M:%S`
    ERRORMSG=`ERROR`
    diff -r ${checkDir} ${saveDir}
    if [ "$?" -ne "0" ]; then # If execute wrong then:
# 1. stop the apache service
        service apache stop
# 2. copy back the website.
        cp -r ${saveDir} ${checkDir}
# 3. check again.
        diff -r ${checkDir} ${saveDir}
# 4. report error
        # report method....
        if [ "$?" -ne "0" ]; then # If execute wrong then:
            echo ${DATE} ${ERRORMSG} >> error.log
            exit(1) # Error Quit.
        else
            echo ${DATE} ${RESTARTLOG} >> report.log
            service apache start
        fi
    fi
done


# a function to start service
service apache2 start

# a function to close the service. 
service apache2 stop
/etc/rc.d/init.d/httpd   stop 

sleep 60 
done



