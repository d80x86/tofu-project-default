--
-- 配置文件,
-- 根据运行环境额外加载, config.development.lua | config.production.lua
-- 设置环境变量 通过 tofu.ENV 获取
-- 预置值有: 
-- development	: 使用命令 tofu console 启动
-- production		: 使用命令 tofu start 启动
--

local _isdev = 'development' == tofu.ENV

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
-- 如定义端口，日志等等...
-- 约定以变量名以 ngx_ 开头
--
ngx_port = 9527
ngx_error_log = _isdev and '/dev/stdout' or 'logs/error.log info'

-- 约定以 _EXP 结尾的为完整的nginx配置项
ngx_worker_shutdown_timeout_EXP = _isdev and 'worker_shutdown_timeout 1;' or ''
ngx_user_EXP = '## user nobody;'


--  运行时目录
-- ngx_runtime_dir = '.runtime'
--
-- 如需要更高级的控制，开启 lua-resty-template 模板支持
-- 依赖: bungle/lua-resty-template
-- ngx_conf_file_template = false



