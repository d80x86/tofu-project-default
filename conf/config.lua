--
-- 配置文件,
-- 根据运行环境额外加载, config.development.lua | config.production.lua
-- 设置环境变量 通过 tofu.ENV 获取
-- 预置值有: 
-- development	: 使用命令 tofu console 启动
-- production		: 使用命令 tofu start 启动
--

local _isdev = 'development' == tofu.ENV

TOFU_VERSION = tofu.VERSION
-- ------------------------------------------------------------------------
--
--
-- state_field		= 'errno'
-- message_field	= 'errmsg'
-- default_state	= 0
--



-- -------------------------------------------------------------------------
-- nginx 配置文件 tofu.nginx.conf
--
--
-- 这些配置可在 tofu.nginx.conf 使用${xxx}获取,只支持基础类型(string, int, boolean, number)
-- 约定以变量名以 ngx_ 开头,属于tofu.nginx.conf
--
-- 定义端口
ngx_port = 9527

-- 日志,当开发环境时输出到终端方便调试
ngx_error_log = _isdev and '/dev/stdout warn' or 'logs/error.log warn'

-- 约定以 _EXP 结尾的为完整的nginx配置项
ngx_worker_shutdown_timeout_EXP = _isdev and 'worker_shutdown_timeout 1;' or ''

-- ngx 的启动用户
-- 一般都不需要指定
-- 如有碰到用户权限错误,可根据系统环境指定
-- 如:
-- ngx_user_EXP = 'user nginx;'
-- 或
-- ngx_user_EXP = 'user nginx;'
--
-- 也可以根据tofu.ENV环境指定
-- ngx_user_EXP = _isdev and 'user '..tofu.ENV_USER..';' or '## user nobody;'


--  运行时目录，存放一些生成的配置和临时文件
-- ngx_runtime_dir = '.runtime'
--
-- 如需要更高级的控制，开启 lua-resty-template 模板支持
-- 在 tofu.package.lua 中添加依赖: bungle/lua-resty-template
-- 然后执行 ./tofu install 安装所需的依赖
-- ngx_conf_file_template = false
--



