#!/bin/bash
# script to turn off rsyncd if repository isn't mounted
# run by cron: "* * * * * bash /root/chknfs.sh"

export PATH="$PATH:/sbin"

if [ -d /repos/current ]; then
  chkconfig --list rsync | grep off && chkconfig rsync on
else
  chkconfig --list rsync | grep on && chkconfig rsync off
fi
