#!/bin/sh

show_usage(){
	echo "Usage: ${0} [SVC_NAME] [EXEC_PATH] [CONF_PATH] [OPTIONS]"
}

error_out(){
	echo "${1}, terminate."
	show_usage
	exit -1
}

exec_cmd(){
	echo ${1}
	${1}
}

if [ -z "${1}" ]; then
	error_out "No service name specified"
fi

if [ -z "${2}" ]; then
	error_out "No excutable path specified"
fi

if [ ! -x "${2}" ]; then
	error_out "File not excutable"
fi

if [ -z "${3}" ]; then
	error_out "No config path specified"
fi

if [ ! -f "${3}" ]; then
	error_out "Config path not exist"
fi

SVC_NAME=${1}
#SVC_EXEC="/opt/ss-libev/bin/obfs-local"
SVC_EXEC=${2}
#SVC_PARM="-v -c /root/breakwall/obfs-client.json"
SVC_PARM="${4} ${3}"

cat <<EOF > ./${SVC_NAME}.service
[Unit]
Description=${SVC_NAME} service
After=network.target

[Service]
ExecStart=${SVC_EXEC} ${SVC_PARM}
Restart=on-abort

[Install]
WantedBy=multi-user.target
EOF

exec_cmd "systemctl stop ${SVC_NAME}"
exec_cmd "systemctl disable ${SVC_NAME}"
exec_cmd "cp -fv ./${SVC_NAME}.service /etc/systemd/system/"
exec_cmd "systemctl enable ${SVC_NAME}"
exec_cmd "systemctl start ${SVC_NAME}"

