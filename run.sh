#!/bin/bash
/usr/local/openresty/nginx/sbin/nginx -p `pwd`/ -c conf/nginx.conf
tail -F ./xxx
