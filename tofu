#!/bin/bash
##
## author: d
## version: 0.1.3
##


## openresty
OR_BIN=$(which openresty || exit 1)
if [ ! -x $OPM_BIN ]; then
	echo 'ERROR: can not found openresty.'
	exit
fi


## tofu cli
if [ -s './lua_modules/resty/lualib/resty/tofu/cli/tofu.lua' ]; then
	TOFU_LUA=./lua_modules/resty/lualib/resty/tofu/cli/tofu.lua
elif [ -s './resty_modules/lualib/resty/tofu/cli/tofu.lua' ]; then
	TOFU_LUA=./resty_modules/lualib/resty/tofu/cli/tofu.lua
elif [ -s './lib/resty/tofu/cli/tofu.lua' ]; then
	TOFU_LUA=./lib/resty/tofu/cli/tofu.lua
elif [ -s '/use/local/openresty/lualib/resty/tofu/cli/tofu.lua' ]; then
	TOFU_LUA=/use/local/openresty/lualib/resty/tofu/cli/tofu.lua
else
	## opm
	OPM_BIN=$(which opm || exit 1)
	if [ ! -x $OPM_BIN ]; then
		echo 'ERROR: can not found the opm.'
		exit
	fi

	## install depends
	mkdir -p lua_modules/resty
	opm --install-dir=lua_modules/resty get d80x86/lua-resty-tofu
	opm --install-dir=lua_modules/resty get d80x86/tofu-cli
	if [ ! $? -eq 0 ]; then
		exit
	fi

	TOFU_LUA=./lua_modules/resty/lualib/resty/tofu/cli/tofu.lua
fi

LUA_BIN=$(${OR_BIN} -V 2>&1 | grep prefix | grep -Eo 'prefix=(.*)/nginx' | grep -Eo '/.*/')luajit/bin/luajit

if [[ -x $LUA_BIN ]]; then
	$LUA_BIN $TOFU_LUA $*
else
	echo 'ERROR: please type "openresty -V" check of openresty'
fi

