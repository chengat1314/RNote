#!/usr/bin/env bash
# Last modified: <2012-09-04 17:54:03 Tuesday by richard>

# @version 0.1
# @author : Richard Wong


# DESTINATION="weibomaster@117.79.230.92"

# ssh $DESTINATION 'whoami'

# example 2
# ----------------------------------------------[example 2]

# get system runtime

# IP_LIST='117.79.230.92 117.79.230.93'
# USER='weibomaster'

# for IP in $IP_LIST;
# do
#     utime=$(ssh $USER@$IP 'uptime' | awk '{print $3}')
#     echo $IP uptime: $uptime
# done

#  example 3
#  ----------------------------------------------[example 3]
#  redirectional stream

# echo "text" | ssh user@remote_host 'cat >> list'

# or

# ssh user@remote_host 'cat >> list' < file

#  import ssh file
#  ----------------------------------------[import ssh file]

#  step 1:
# ssh-keygen -t rsa

# #  step 2:
# ssh USER@REMOTE_HOST "cat >> ~/.ssh/authorized_keys" < ~/.ssh/id_rsa.pub
