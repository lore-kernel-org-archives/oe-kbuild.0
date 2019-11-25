Content-Type: multipart/mixed; boundary="===============1909300683808048980=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 2/2] tty: add retry to tty_init_dev() to workaround a race condition
Date: Mon, 25 Nov 2019 09:27:22 +0300
Message-ID: <20191125062722.GD1749@kadam>
In-Reply-To: <20191120151709.14148-2-sudipm.mukherjee@gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1909300683808048980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sudip,

[auto build test WARNING on v5.4-rc8]
[cannot apply to tty/tty-testing next-20191122]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Sudip-Mukherjee/tty-remove=
-unused-argument-from-tty_open_by_driver/20191123-164153
base:    af42d3466bdc8f39806b26f593604fdc54140bcb

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/tty/tty_io.c:1360 tty_init_dev() error: we previously assumed 'tty-=
>port' could be null (see line 1348)

# https://github.com/0day-ci/linux/commit/8de47da07f8c6fe6f631965cafb384cd0=
d72ce40
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 8de47da07f8c6fe6f631965cafb384cd0d72ce40
vim +1360 drivers/tty/tty_io.c

8de47da07f8c6f drivers/tty/tty_io.c  Sudip Mukherjee     2019-11-20  1318  =
struct tty_struct *tty_init_dev(struct tty_driver *driver, int idx,
8de47da07f8c6f drivers/tty/tty_io.c  Sudip Mukherjee     2019-11-20  1319  =
				int retry)
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds      2005-04-16  1320  {
bf970ee46e0fb3 drivers/char/tty_io.c Alan Cox            2008-10-13  1321  =
	struct tty_struct *tty;
73ec06fc5f5c8e drivers/char/tty_io.c Alan Cox            2008-10-13  1322  =
	int retval;
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds      2005-04-16  1323  =

^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds      2005-04-16  1324  =
	/*
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds      2005-04-16  1325  =
	 * First time open is complex, especially for PTY devices.
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds      2005-04-16  1326  =
	 * This code guarantees that either everything succeeds and the
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds      2005-04-16  1327  =
	 * TTY is ready for operation, or else the table slots are vacated
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds      2005-04-16  1328  =
	 * and the allocated memory released.  (Except that the termios
16b00ae82dce0e drivers/tty/tty_io.c  Johan Hovold        2017-03-30  1329  =
	 * may be retained.)
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds      2005-04-16  1330  =
	 */
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds      2005-04-16  1331  =

73ec06fc5f5c8e drivers/char/tty_io.c Alan Cox            2008-10-13  1332  =
	if (!try_module_get(driver->owner))
73ec06fc5f5c8e drivers/char/tty_io.c Alan Cox            2008-10-13  1333  =
		return ERR_PTR(-ENODEV);
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds      2005-04-16  1334  =

2c964a2f4191f2 drivers/tty/tty_io.c  Rasmus Villemoes    2014-07-10  1335  =
	tty =3D alloc_tty_struct(driver, idx);
d5543503753983 drivers/tty/tty_io.c  Jiri Slaby          2011-03-23  1336  =
	if (!tty) {
d5543503753983 drivers/tty/tty_io.c  Jiri Slaby          2011-03-23  1337  =
		retval =3D -ENOMEM;
d5543503753983 drivers/tty/tty_io.c  Jiri Slaby          2011-03-23  1338  =
		goto err_module_put;
d5543503753983 drivers/tty/tty_io.c  Jiri Slaby          2011-03-23  1339  =
	}
^1da177e4c3f41 drivers/char/tty_io.c Linus Torvalds      2005-04-16  1340  =

89c8d91e31f267 drivers/tty/tty_io.c  Alan Cox            2012-08-08  1341  =
	tty_lock(tty);
73ec06fc5f5c8e drivers/char/tty_io.c Alan Cox            2008-10-13  1342  =
	retval =3D tty_driver_install_tty(driver, tty);
d5543503753983 drivers/tty/tty_io.c  Jiri Slaby          2011-03-23  1343  =
	if (retval < 0)
c8b710b3e43481 drivers/tty/tty_io.c  Peter Hurley        2016-01-09  1344  =
		goto err_free_tty;
8b0a88d5912ab5 drivers/char/tty_io.c Alan Cox            2008-10-13  1345  =

04831dc154df9b drivers/tty/tty_io.c  Jiri Slaby          2012-06-04  1346  =
	if (!tty->port)
04831dc154df9b drivers/tty/tty_io.c  Jiri Slaby          2012-06-04  1347  =
		tty->port =3D driver->ports[idx];
8de47da07f8c6f drivers/tty/tty_io.c  Sudip Mukherjee     2019-11-20 @1348  =
	if (!tty->port && retry) {
                                                                           =
         ^^^^^^^^^^
Check

8de47da07f8c6f drivers/tty/tty_io.c  Sudip Mukherjee     2019-11-20  1349  =
		retval =3D -EAGAIN;
8de47da07f8c6f drivers/tty/tty_io.c  Sudip Mukherjee     2019-11-20  1350  =
		goto err_release_driver;
8de47da07f8c6f drivers/tty/tty_io.c  Sudip Mukherjee     2019-11-20  1351  =
	}
04831dc154df9b drivers/tty/tty_io.c  Jiri Slaby          2012-06-04  1352  =

5d4121c04b3577 drivers/tty/tty_io.c  Jiri Slaby          2012-08-17  1353  =
	WARN_RATELIMIT(!tty->port,
5d4121c04b3577 drivers/tty/tty_io.c  Jiri Slaby          2012-08-17  1354  =
			"%s: %s driver does not set tty->port. This will crash the kernel later.=
 Fix the driver!\n",
5d4121c04b3577 drivers/tty/tty_io.c  Jiri Slaby          2012-08-17  1355  =
			__func__, tty->driver->name);
5d4121c04b3577 drivers/tty/tty_io.c  Jiri Slaby          2012-08-17  1356  =

b027e2298bd588 drivers/tty/tty_io.c  Gaurav Kohli        2018-01-23  1357  =
	retval =3D tty_ldisc_lock(tty, 5 * HZ);
b027e2298bd588 drivers/tty/tty_io.c  Gaurav Kohli        2018-01-23  1358  =
	if (retval)
b027e2298bd588 drivers/tty/tty_io.c  Gaurav Kohli        2018-01-23  1359  =
		goto err_release_lock;
967fab6916681e drivers/tty/tty_io.c  Jiri Slaby          2012-10-18 @1360  =
	tty->port->itty =3D tty;
                                                                           =
     ^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference.

967fab6916681e drivers/tty/tty_io.c  Jiri Slaby          2012-10-18  1361  =


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============1909300683808048980==--

