Content-Type: multipart/mixed; boundary="===============5301644667352978908=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/seccomp.c:1321 __secure_computing() warn: ignoring unreachable code.
Date: Tue, 15 Feb 2022 22:38:44 +0800
Message-ID: <202202152201.KD46907H-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5301644667352978908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d567f5db412ed52de0b3b3efca4a451263de6108
commit: 495ac3069a6235bfdf516812a2a9b256671bbdf9 seccomp: Invalidate seccom=
p mode to catch death failures
date:   4 days ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago
config: s390-randconfig-m031-20220214 (https://download.01.org/0day-ci/arch=
ive/20220215/202202152201.KD46907H-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/seccomp.c:1321 __secure_computing() warn: ignoring unreachable code.

vim +1321 kernel/seccomp.c

13aa72f0fd0a9f Andy Lutomirski  2014-07-21  1298  =

8112c4f140fa03 Kees Cook        2016-06-01  1299  int __secure_computing(co=
nst struct seccomp_data *sd)
13aa72f0fd0a9f Andy Lutomirski  2014-07-21  1300  {
13aa72f0fd0a9f Andy Lutomirski  2014-07-21  1301  	int mode =3D current->se=
ccomp.mode;
8112c4f140fa03 Kees Cook        2016-06-01  1302  	int this_syscall;
13aa72f0fd0a9f Andy Lutomirski  2014-07-21  1303  =

97f2645f358b41 Masahiro Yamada  2016-08-03  1304  	if (IS_ENABLED(CONFIG_CH=
ECKPOINT_RESTORE) &&
13c4a90119d28c Tycho Andersen   2015-06-13  1305  	    unlikely(current->pt=
race & PT_SUSPEND_SECCOMP))
8112c4f140fa03 Kees Cook        2016-06-01  1306  		return 0;
8112c4f140fa03 Kees Cook        2016-06-01  1307  =

8112c4f140fa03 Kees Cook        2016-06-01  1308  	this_syscall =3D sd ? sd=
->nr :
2d9ca267a944c2 Denis Efremov    2020-08-24  1309  		syscall_get_nr(current,=
 current_pt_regs());
13c4a90119d28c Tycho Andersen   2015-06-13  1310  =

13aa72f0fd0a9f Andy Lutomirski  2014-07-21  1311  	switch (mode) {
13aa72f0fd0a9f Andy Lutomirski  2014-07-21  1312  	case SECCOMP_MODE_STRICT:
13aa72f0fd0a9f Andy Lutomirski  2014-07-21  1313  		__secure_computing_stri=
ct(this_syscall);  /* may call do_exit */
8112c4f140fa03 Kees Cook        2016-06-01  1314  		return 0;
13aa72f0fd0a9f Andy Lutomirski  2014-07-21  1315  	case SECCOMP_MODE_FILTER:
ce6526e8afa4b6 Kees Cook        2016-06-01  1316  		return __seccomp_filter=
(this_syscall, sd, false);
495ac3069a6235 Kees Cook        2022-02-07  1317  	/* Surviving SECCOMP_RET=
_KILL_* must be proactively impossible. */
495ac3069a6235 Kees Cook        2022-02-07  1318  	case SECCOMP_MODE_DEAD:
495ac3069a6235 Kees Cook        2022-02-07  1319  		WARN_ON_ONCE(1);
495ac3069a6235 Kees Cook        2022-02-07  1320  		do_exit(SIGKILL);
495ac3069a6235 Kees Cook        2022-02-07 @1321  		return -1;
13aa72f0fd0a9f Andy Lutomirski  2014-07-21  1322  	default:
13aa72f0fd0a9f Andy Lutomirski  2014-07-21  1323  		BUG();
13aa72f0fd0a9f Andy Lutomirski  2014-07-21  1324  	}
13aa72f0fd0a9f Andy Lutomirski  2014-07-21  1325  }
a4412fc9486ec8 Andy Lutomirski  2014-07-21  1326  #endif /* CONFIG_HAVE_ARC=
H_SECCOMP_FILTER */
1d9d02feeee89e Andrea Arcangeli 2007-07-15  1327  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5301644667352978908==--

