#!/bin/sh

#feedURL
URL1="https://www.google.com.tw/trends/hottrends/atom/feed?pn=p12"
identify="google.com.tw/trends/"

STATUS1=`/usr/bin/wget --no-check-certificate -O /local/htdocs/gtrend_buf $URL1 2>&1|grep "not found\|error"`

if [ "$STATUS1" ];then
        echo 'Google trend download feed fail';
        echo $URL1;
else
        if [ "`/bin/cat /local/htdocs/gtrend_buf|grep \"$identify\"`" ];then
                /bin/cp -p /local/htdocs/gtrend_buf /local/htdocs/gtrend
                chown cmadmin.cmadmin /local/htdocs/gtrend
                /usr/bin/up2 /local/htdocs/gtrend
        fi
fi
