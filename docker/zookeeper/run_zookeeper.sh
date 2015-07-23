#!/bin/bash
set -e

#Server array, add as many as you need IP or NAMES
SERVERS_IP[0]="172.16.14.77"
SERVERS_IP[1]="172.16.9.16"

#Variable you can adjust
ZK_LISTENING_PORT=2181

##------------------------------##
##DO NOT TOUCH BEYOND THIS POINT##
##------------------------------##
write_msg () {
   echo -e "--->$1"
}

create_folder () {
	if [ ! -d "$1" ]; then
		write_msg "Creating folder $1"
		mkdir -p $1
	fi
}

ZK_DIR=$(pwd)

write_msg "Configuring zoo.cfg"
sed -i -e "s|replace_data_dir|$ZK_DIR/data|g" $ZK_DIR/conf/zoo.cfg
sed -i -e "s|replace_port|$ZK_LISTENING_PORT|g" $ZK_DIR/conf/zoo.cfg

count=1
#Adding servers to config
for i in "${SERVERS_IP[@]}"
do
:
	echo "server.$count=$i:$ZK_LISTENING_PORT:3888" >> $ZOOK_DIR/conf/zoo.cfg

	#Writing myid number based on my ip	
	if [[ "${IP_LIST}" == *"${i}"* ]]; then
	    write_msg "Writing $count to myid file at $ZOOK_DIR/data/myid"
	    echo "$count" > $ZOOK_DIR/data/myid

	    MYIP=$i
	fi

	count=$((count+1))
done

bin/zkServer.sh start $ZK_DIR/conf/zoo.cfg