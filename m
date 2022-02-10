Content-Type: multipart/mixed; boundary="===============8612297754388811073=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4792/4901] kernel/seccomp.c:1321 __secure_computing() warn: ignoring unreachable code.
Date: Fri, 11 Feb 2022 06:09:00 +0800
Message-ID: <202202110647.rLY9N0Ku-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8612297754388811073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   395a61741f7ea29e1f4a0d6e160197fe8e377572
commit: 4cf829c9d35e35a8702dba0dbbc0408bb2521acd [4792/4901] seccomp: Inval=
idate seccomp mode to catch death failures
:::::: branch date: 14 hours ago
:::::: commit date: 19 hours ago
config: powerpc-randconfig-m031-20220210 (https://download.01.org/0day-ci/a=
rchive/20220211/202202110647.rLY9N0Ku-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/seccomp.c:1321 __secure_computing() warn: ignoring unreachable code.

vim +1321 kernel/seccomp.c

13aa72f0fd0a9f9 Andy Lutomirski  2014-07-21  1298  =

8112c4f140fa03f Kees Cook        2016-06-01  1299  int __secure_computing(c=
onst struct seccomp_data *sd)
13aa72f0fd0a9f9 Andy Lutomirski  2014-07-21  1300  {
13aa72f0fd0a9f9 Andy Lutomirski  2014-07-21  1301  	int mode =3D current->s=
eccomp.mode;
8112c4f140fa03f Kees Cook        2016-06-01  1302  	int this_syscall;
13aa72f0fd0a9f9 Andy Lutomirski  2014-07-21  1303  =

97f2645f358b411 Masahiro Yamada  2016-08-03  1304  	if (IS_ENABLED(CONFIG_C=
HECKPOINT_RESTORE) &&
13c4a90119d28cf Tycho Andersen   2015-06-13  1305  	    unlikely(current->p=
trace & PT_SUSPEND_SECCOMP))
8112c4f140fa03f Kees Cook        2016-06-01  1306  		return 0;
8112c4f140fa03f Kees Cook        2016-06-01  1307  =

8112c4f140fa03f Kees Cook        2016-06-01  1308  	this_syscall =3D sd ? s=
d->nr :
2d9ca267a944c2b Denis Efremov    2020-08-24  1309  		syscall_get_nr(current=
, current_pt_regs());
13c4a90119d28cf Tycho Andersen   2015-06-13  1310  =

13aa72f0fd0a9f9 Andy Lutomirski  2014-07-21  1311  	switch (mode) {
13aa72f0fd0a9f9 Andy Lutomirski  2014-07-21  1312  	case SECCOMP_MODE_STRIC=
T:
13aa72f0fd0a9f9 Andy Lutomirski  2014-07-21  1313  		__secure_computing_str=
ict(this_syscall);  /* may call do_exit */
8112c4f140fa03f Kees Cook        2016-06-01  1314  		return 0;
13aa72f0fd0a9f9 Andy Lutomirski  2014-07-21  1315  	case SECCOMP_MODE_FILTE=
R:
ce6526e8afa4b6a Kees Cook        2016-06-01  1316  		return __seccomp_filte=
r(this_syscall, sd, false);
4cf829c9d35e35a Kees Cook        2022-02-07  1317  	/* Surviving SECCOMP_RE=
T_KILL_* must be proactively impossible. */
4cf829c9d35e35a Kees Cook        2022-02-07  1318  	case SECCOMP_MODE_DEAD:
4cf829c9d35e35a Kees Cook        2022-02-07  1319  		WARN_ON_ONCE(1);
4cf829c9d35e35a Kees Cook        2022-02-07  1320  		do_exit(SIGKILL);
4cf829c9d35e35a Kees Cook        2022-02-07 @1321  		return -1;
13aa72f0fd0a9f9 Andy Lutomirski  2014-07-21  1322  	default:
13aa72f0fd0a9f9 Andy Lutomirski  2014-07-21  1323  		BUG();
13aa72f0fd0a9f9 Andy Lutomirski  2014-07-21  1324  	}
13aa72f0fd0a9f9 Andy Lutomirski  2014-07-21  1325  }
a4412fc9486ec85 Andy Lutomirski  2014-07-21  1326  #endif /* CONFIG_HAVE_AR=
CH_SECCOMP_FILTER */
1d9d02feeee89e9 Andrea Arcangeli 2007-07-15  1327  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8612297754388811073==--

