AC_PREREQ(2.52)

AC_INIT([apertium-zho-spa], [0.1.0], [spectre360@users.sourceforge.net])
AM_INIT_AUTOMAKE([apertium-zho-spa], [0.1.0], no-define)
AC_PROG_LN_S
AC_PROG_AWK

m4_define([required_apertium_version], [3.4.0])
m4_define([required_lttoolbox_version], [3.3.1])

PKG_CHECK_MODULES(APERTIUM,   apertium >= required_apertium_version, [], [PKG_CHECK_MODULES(APERTIUM,   apertium >= required_apertium_version)])
PKG_CHECK_MODULES(LTTOOLBOX,   lttoolbox >= required_lttoolbox_version, [], [PKG_CHECK_MODULES(LTTOOLBOX,   lttoolbox >= required_lttoolbox_version)])


AC_PATH_PROG(LRXCOMP, lrx-comp, no)
if test x$ac_cv_path_LRXCOMP = x
then
  AC_MSG_ERROR([You don't have lrx-comp installed.])
fi
if test x$ac_cv_path_LRXCOMP = xno
then
  AC_MSG_ERROR([You don't have lrx-comp installed.])
fi

AC_PATH_PROG(LRXPROC, lrx-proc, no)
if test x$ac_cv_path_LRXPROC = x
then
  AC_MSG_ERROR([You don't have lrx-proc installed.])
fi
if test x$ac_cv_path_LRXPROC = xno
then
  AC_MSG_ERROR([You don't have lrx-proc installed.])
fi


AP_CHECK_LING([1], [apertium-zho])
AP_CHECK_LING([2], [apertium-spa])

AP_MKINCLUDE

AC_OUTPUT([Makefile])

