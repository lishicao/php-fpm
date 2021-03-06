AC_INIT(php-fpm, 0.6, andrei.nigmatulin@gmail.com)
fpm_version="$PACKAGE_VERSION"

AM_INIT_AUTOMAKE
AC_CONFIG_SRCDIR([fpm/fpm.c])
AC_CONFIG_HEADER([fpm_autoconfig.h])

AC_SEARCH_LIBS(socket, socket)
AC_SEARCH_LIBS(inet_addr, nsl)

AC_PROG_CC
AC_PROG_CPP
AC_PROG_INSTALL
AC_PROG_LIBTOOL

AC_FPM_CC
AC_FPM_PATHS
AC_FPM_PHP
AC_FPM_LIBXML
AC_FPM_PRCTL
AC_FPM_CLOCK
AC_FPM_TRACE
AC_LIB_EVENT([1.4.3],[1.4.11])

AC_CHECK_FUNCS(setenv clearenv)

AC_CHECK_HEADERS([errno.h fcntl.h stdio.h stdlib.h unistd.h sys/uio.h])
AC_CHECK_HEADERS([sys/select.h sys/socket.h sys/time.h])
AC_CHECK_HEADERS([arpa/inet.h netinet/in.h])

php_fpm_ADD_CFLAGS="$LIBEVENT_CFLAGS $LIBXML_CFLAGS"
php_fpm_ADD_LIBS="$LIBEVENT_LIBS $LIBXML_LIBS $PHP_EXTRA_LIBS"

ENDIF=endif
AC_SUBST(ENDIF)

AC_SUBST(AM_CFLAGS)
AC_SUBST(LIBS)

AC_SUBST(php_fpm_ADD_CFLAGS)
AC_SUBST(php_fpm_ADD_LIBS)

AC_SUBST(fpm_version)
AC_SUBST(php_fpm_bin)
AC_SUBST(php_fpm_bin_dir)
AC_SUBST(php_fpm_bin_path)
AC_SUBST(php_fpm_port)
AC_SUBST(php_fpm_conf)
AC_SUBST(php_fpm_conf_dir)
AC_SUBST(php_fpm_conf_path)
AC_SUBST(php_fpm_init)
AC_SUBST(php_fpm_init_dir)
AC_SUBST(php_fpm_init_path)
AC_SUBST(php_fpm_log_dir)
AC_SUBST(php_fpm_log_path)
AC_SUBST(php_fpm_pid_dir)
AC_SUBST(php_fpm_pid_path)
AC_SUBST(php_fpm_user)
AC_SUBST(php_fpm_group)

AC_DEFINE_UNQUOTED(PHP_FPM_VERSION, "$fpm_version", [fpm version])
AC_DEFINE_UNQUOTED(PHP_FPM_BIN, "$php_fpm_bin", [fpm binary executable])
AC_DEFINE_UNQUOTED(PHP_FPM_BIN_DIR, "$php_fpm_bin_dir", [fpm binary dir])
AC_DEFINE_UNQUOTED(PHP_FPM_BIN_PATH, "$php_fpm_bin_path", [fpm bin file path])
AC_DEFINE_UNQUOTED(PHP_FPM_PORT, "$php_fpm_port", [tcp port])
AC_DEFINE_UNQUOTED(PHP_FPM_CONF, "$php_fpm_conf", [fpm conf file])
AC_DEFINE_UNQUOTED(PHP_FPM_CONF_DIR, "$php_fpm_conf_dir", [fpm conf dir])
AC_DEFINE_UNQUOTED(PHP_FPM_CONF_PATH, "$php_fpm_conf_path", [fpm conf file path])
AC_DEFINE_UNQUOTED(PHP_FPM_INIT, "$php_fpm_init", [fpm init file])
AC_DEFINE_UNQUOTED(PHP_FPM_INIT_DIR, "$php_fpm_init_dir", [fpm init dir])
AC_DEFINE_UNQUOTED(PHP_FPM_INIT_PATH, "$php_fpm_init_path", [fpm init file path])
AC_DEFINE_UNQUOTED(PHP_FPM_LOG_DIR, "$php_fpm_log_dir", [fpm log dir])
AC_DEFINE_UNQUOTED(PHP_FPM_LOG_PATH, "$php_fpm_log_path", [fpm log file path])
AC_DEFINE_UNQUOTED(PHP_FPM_PID_DIR, "$php_fpm_pid_dir", [fpm pid dir])
AC_DEFINE_UNQUOTED(PHP_FPM_PID_PATH, "$php_fpm_pid_path", [fpm pid file path])
AC_DEFINE_UNQUOTED(PHP_FPM_USER, "$php_fpm_user", [fpm user name])
AC_DEFINE_UNQUOTED(PHP_FPM_GROUP, "$php_fpm_group", [fpm group name])


AC_CONFIG_FILES([Makefile cgi/Makefile fpm/Makefile])


AC_OUTPUT( \
	php_fpm.conf:conf/php-fpm.conf.in \
	init.d.php_fpm:conf/init.d.php-fpm.in \
	nginx-site-conf.sample:conf/nginx-site-conf.sample.in \
	$php_fpm_bin.1:man/php-fpm.1.in \
)

