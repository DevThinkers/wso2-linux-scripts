#! /bin/sh
export JAVA_HOME="/usr/java/jdk1.8.0_144/"

export WSO2_PRODUCT_VERSION="5.3.0"
export WSO2_PRODUCT_NAME="WSO2 Identity Server $WSO2_PRODUCT_VERSION"
export CARBON_HOME="/usr/wso2/wso2is-$WSO2_PRODUCT_VERSION" 
export WSO2_USER="ec2-user"

startcmd="$CARBON_HOME/bin/wso2server.sh start > /dev/null &"
restartcmd="$CARBON_HOME/bin/wso2server.sh restart > /dev/null &"
stopcmd="$CARBON_HOME/bin/wso2server.sh stop > /dev/null &"
 
case "$1" in
start)
   echo "Starting $WSO2_PRODUCT_NAME ..."
   su -c "${startcmd}" $WSO2_USER
;;
restart)
   echo "Re-starting $WSO2_PRODUCT_NAME ..."
   su -c "${restartcmd}" $WSO2_USER
;;
stop)
   echo "Stopping $WSO2_PRODUCT_NAME ..."
   su -c "${stopcmd}" $WSO2_USER
;;
*)
   echo "Usage: $0 {start|stop|restart}"
exit 1
esac
