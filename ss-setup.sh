#!/bin/sh

GIT_REPO="https://github.com/shadowsocks/shadowsocks-libev.git"
BUILD_PATH="./shadowsocks-libev"
INS_PATH=""

show_usage(){
	echo "Usage: ${0} [INSTALL_PATH]"
}

error_out(){
	echo "${1}, terminate."
	show_usage
	exit -1
}

try_run(){
        if [ ! -x ${1} ]; then 
                error_out "Cannot execute '${1}'"
        fi  
	echo "${1} ${2}"
        ${1} ${2}
}

exec_cmd(){
	echo ${1}
	${1}
}

if [ -z "${1}" ]; then
	error_out "Install path not specified"
fi

INS_PATH=${1}

echo "Get latest source code"
exec_cmd "git clone ${GIT_REPO} ${BUILD_PATH}"
exec_cmd "cd ${BUILD_PATH}"
exec_cmd "git submodule update --init --recursive"

try_run "./autogen.sh"
try_run "./configure" "--prefix=${INS_PATH}"

exec_cmd "make"
#exec_cmd "make install"
