#!/bin/bash

# By setting RELX_REPLACE_OS_VARS=true both vm.args and sys.config files
# may contain OS environment variables that will be replaced with the current value
# from the environment the node is started in.
export RELX_REPLACE_OS_VARS=true

# TO DO temporal solution
if [ -z "$NODE_COOKIE" ]; then
    export NODE_COOKIE=button-ws
    echo "export NODE_COOKIE="$NODE_COOKIE
else
    echo "found NODE_COOKIE " $NODE_COOKIE
fi

# create node name like b2b@ + local ip
if [ -z "$NODE_NAME" ]; then
    # Docker uses the default 172.17.0.0/16 subnet for container networking. 
    IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep -v '172.17.0.1')
    export NODE_NAME="dogger@""$IP"
    echo "export NODE_NAME="$NODE_NAME
else
    echo "found NODE_NAME " $NODE_NAME
fi

