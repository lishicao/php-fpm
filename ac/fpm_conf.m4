
AC_DEFUN([AC_FPM_ARGS],
[
	PHP_ARG_WITH(fpm-bin,,
	[  --with-fpm-bin[=PATH]   Set the path for the php-fpm binary [/usr/local/bin/php-fpm]], yes, no)

	PHP_ARG_WITH(fpm-conf,,
	[  --with-fpm-conf[=PATH]  Set the path for php-fpm configuration file [/etc/php-fpm.conf]], yes, no)

	PHP_ARG_WITH(fpm-log,,
	[  --with-fpm-log[=PATH]   Set the path for php-fpm log file [/var/log/php-fpm.log]], yes, no)

	PHP_ARG_WITH(fpm-pid,,
	[  --with-fpm-pid[=PATH]   Set the path for php-fpm pid file [/var/run/php-fpm.pid]], yes, no)

	PHP_ARG_WITH(fpm-user,,
	[  --with-fpm-user[=USER]  Set the user for php-fpm to run as [nobody]], yes, no)

	PHP_ARG_WITH(fpm-group,,
	[  --with-fpm-group[=GRP]  Set the group for php-fpm to run as. For a system user,
	                  this should be set to match the fpm username [nobody]], yes, no)
])

AC_DEFUN([AC_FPM_VARS],
[
	fpm_prefix=$ac_default_prefix
	if test $prefix != "NONE" -a $prefix != "" -a $prefix != "no" ; then
		fpm_prefix=$prefix
	fi

	fpm_bin_prefix=$fpm_prefix/bin
	if test $bindir != "NONE" -a $bindir != "" -a $bindir != "no" ; then
		fpm_bin_prefix=$bindir
	fi

	if test -z "$PHP_FPM_BIN" -o "$PHP_FPM_BIN" = "yes" -o "$PHP_FPM_BIN" = "no"; then
		php_fpm_bin_path="$fpm_bin_prefix/php-fpm"
	else
		php_fpm_bin_path="$PHP_FPM_BIN"
	fi
	php_fpm_bin=`basename $php_fpm_bin_path`
	php_fpm_bin_dir=`dirname $php_fpm_bin_path`

	if test -z "$PHP_FPM_CONF" -o "$PHP_FPM_CONF" = "yes" -o "$PHP_FPM_CONF" = "no"; then
		php_fpm_conf_path="/etc/php-fpm.conf"
	else
		php_fpm_conf_path="$PHP_FPM_CONF"
	fi
	php_fpm_conf=`basename $php_fpm_conf_path`
	php_fpm_conf_dir=`dirname $php_fpm_conf_path`

	if test -z "$PHP_FPM_LOG" -o "$PHP_FPM_LOG" = "yes" -o "$PHP_FPM_LOG" = "no"; then
		php_fpm_log_path="/var/log/php-fpm.log"
	else
		php_fpm_log_path="$PHP_FPM_LOG"
	fi
	php_fpm_log_dir=`dirname $php_fpm_log_path`

	if test -z "$PHP_FPM_PID" -o "$PHP_FPM_PID" = "yes" -o "$PHP_FPM_PID" = "no"; then
		php_fpm_pid_path="/var/run/php-fpm.pid"
	else
		php_fpm_pid_path="$PHP_FPM_PID"
	fi
	php_fpm_pid_dir=`dirname $php_fpm_pid_path`

	if test -z "$PHP_FPM_USER" -o "$PHP_FPM_USER" = "yes" -o "$PHP_FPM_USER" = "no"; then
		php_fpm_user="nobody"
	else
		php_fpm_user="$PHP_FPM_USER"
	fi

	if test -z "$PHP_FPM_GROUP" -o "$PHP_FPM_GROUP" = "yes" -o "$PHP_FPM_GROUP" = "no"; then
		php_fpm_group="nobody"
	else
		php_fpm_group="$PHP_FPM_GROUP"
	fi


	PHP_SUBST_OLD(fpm_version)
	PHP_SUBST_OLD(php_fpm_bin)
	PHP_SUBST_OLD(php_fpm_bin_dir)
	PHP_SUBST_OLD(php_fpm_bin_path)
	PHP_SUBST_OLD(php_fpm_conf)
	PHP_SUBST_OLD(php_fpm_conf_dir)
	PHP_SUBST_OLD(php_fpm_conf_path)
	PHP_SUBST_OLD(php_fpm_log_dir)
	PHP_SUBST_OLD(php_fpm_log_path)
	PHP_SUBST_OLD(php_fpm_pid_dir)
	PHP_SUBST_OLD(php_fpm_pid_path)
	PHP_SUBST_OLD(php_fpm_user)
	PHP_SUBST_OLD(php_fpm_group)


	AC_DEFINE_UNQUOTED(PHP_FPM_VERSION, "$fpm_version", [fpm version])
	AC_DEFINE_UNQUOTED(PHP_FPM_BIN, "$php_fpm_bin", [fpm binary executable])
	AC_DEFINE_UNQUOTED(PHP_FPM_BIN_DIR, "$php_fpm_bin_dir", [fpm binary dir])
	AC_DEFINE_UNQUOTED(PHP_FPM_BIN_PATH, "$php_fpm_bin_path", [fpm bin file path])
	AC_DEFINE_UNQUOTED(PHP_FPM_CONF, "$php_fpm_conf", [fpm conf file])
	AC_DEFINE_UNQUOTED(PHP_FPM_CONF_DIR, "$php_fpm_conf_dir", [fpm conf dir])
	AC_DEFINE_UNQUOTED(PHP_FPM_CONF_PATH, "$php_fpm_conf_path", [fpm conf file path])
	AC_DEFINE_UNQUOTED(PHP_FPM_LOG_DIR, "$php_fpm_log_dir", [fpm log dir])
	AC_DEFINE_UNQUOTED(PHP_FPM_LOG_PATH, "$php_fpm_log_path", [fpm log file path])
	AC_DEFINE_UNQUOTED(PHP_FPM_PID_DIR, "$php_fpm_pid_dir", [fpm pid dir])
	AC_DEFINE_UNQUOTED(PHP_FPM_PID_PATH, "$php_fpm_pid_path", [fpm pid file path])
	AC_DEFINE_UNQUOTED(PHP_FPM_USER, "$php_fpm_user", [fpm user name])
	AC_DEFINE_UNQUOTED(PHP_FPM_GROUP, "$php_fpm_group", [fpm group name])

])


AC_DEFUN([AC_FPM_OUTPUT],
[
	PHP_OUTPUT(sapi/fpm/$php_fpm_conf:sapi/fpm/conf/php-fpm.conf.in)
	PHP_OUTPUT(sapi/fpm/init.d.$php_fpm_bin:sapi/fpm/conf/init.d.php-fpm.in)
	PHP_OUTPUT(sapi/fpm/nginx-site-conf.sample:sapi/fpm/conf/nginx-site-conf.sample.in)
	PHP_OUTPUT(sapi/fpm/$php_fpm_bin.1:sapi/fpm/man/php-fpm.1.in)
])


AC_DEFUN([AC_FPM_CONF],
[
	AC_FPM_ARGS
	AC_FPM_VARS
	AC_FPM_OUTPUT
])

