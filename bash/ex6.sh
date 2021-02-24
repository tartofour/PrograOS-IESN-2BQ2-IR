#!/bin/bash

while IFS=':' read -r user passwd uid gid comment home shell;  do
    if [ "$uid" -gt 500 ] ; then
        echo "$user:$uid:$shell"
    fi
done < /etc/passwd
