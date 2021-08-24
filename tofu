#!/bin/bash
##
## author: d
## version: 0.1.2
##

## 
if [ -s './lua_modules/resty/lualib/resty/tofu/cli/tofu.lua' ]; then
	TOFU_LUA=./lua_modules/resty/lualib/resty/tofu/cli/tofu.lua
elif [ -s './resty_modules/lualib/resty/tofu/cli/tofu.lua' ]; then
	TOFU_LUA=./resty_modules/lualib/resty/tofu/cli/tofu.lua
elif [ -s './lib/resty/tofu/cli/tofu.lua' ]; then
	TOFU_LUA=./lib/resty/tofu/cli/tofu.lua
elif [ -s '/use/local/openresty/lualib/resty/tofu/cli/tofu.lua' ]; then
	TOFU_LUA=/use/local/openresty/lualib/resty/tofu/cli/tofu.lua
else
	echo 'ERROR: can not found the tofu framework.'
	exit
fi

## openresty
OR_BIN=$(which openresty || exit 1)
LUA_BIN=$(${OR_BIN} -V 2>&1 | grep prefix | grep -Eo 'prefix=(.*)/nginx' | grep -Eo '/.*/')luajit/bin/luajit

if [[ -e $LUA_BIN ]]; then
	$LUA_BIN $TOFU_LUA $*
else
	echo 'ERROR: please type "openresty -V" check of openresty'
fi
