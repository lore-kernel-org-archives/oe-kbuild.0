Content-Type: multipart/mixed; boundary="===============2624353494424359511=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-6.0.y-rt-rebase 29/59] kernel/printk/printk.c:2471 __alloc_atomic_data() warn: returning -1 instead of -ENOMEM is sloppy
Date: Wed, 24 Aug 2022 19:16:26 +0800
Message-ID: <202208241943.RA6mMw4r-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2624353494424359511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-6.0.y-rt-rebase
head:   1d8c2694d3f649c97636d991dca099bd86f63f97
commit: 15b527e196320901ae7acc6a060c64d69a4bbdc7 [29/59] serial: 8250: impl=
ement write_atomic
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20824/202208241943.RA6mMw4r-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/printk/printk.c:2471 __alloc_atomic_data() warn: returning -1 instea=
d of -ENOMEM is sloppy

vim +2471 kernel/printk/printk.c

e2c203102ac06a John Ogness 2022-02-04  2466  =

e2c203102ac06a John Ogness 2022-02-04  2467  static int __alloc_atomic_data=
(struct console_atomic_data *d, short flags)
e2c203102ac06a John Ogness 2022-02-04  2468  {
e2c203102ac06a John Ogness 2022-02-04  2469  	d->text =3D kmalloc(CONSOLE_L=
OG_MAX, GFP_KERNEL);
e2c203102ac06a John Ogness 2022-02-04  2470  	if (!d->text)
e2c203102ac06a John Ogness 2022-02-04 @2471  		return -1;
e2c203102ac06a John Ogness 2022-02-04  2472  =

e2c203102ac06a John Ogness 2022-02-04  2473  	if (flags & CON_EXTENDED) {
e2c203102ac06a John Ogness 2022-02-04  2474  		d->ext_text =3D kmalloc(CONS=
OLE_EXT_LOG_MAX, GFP_KERNEL);
e2c203102ac06a John Ogness 2022-02-04  2475  		if (!d->ext_text)
e2c203102ac06a John Ogness 2022-02-04  2476  			return -1;
e2c203102ac06a John Ogness 2022-02-04  2477  	} else {
e2c203102ac06a John Ogness 2022-02-04  2478  		d->dropped_text =3D kmalloc(=
DROPPED_TEXT_MAX, GFP_KERNEL);
e2c203102ac06a John Ogness 2022-02-04  2479  		if (!d->dropped_text)
e2c203102ac06a John Ogness 2022-02-04  2480  			return -1;
e2c203102ac06a John Ogness 2022-02-04  2481  	}
e2c203102ac06a John Ogness 2022-02-04  2482  =

e2c203102ac06a John Ogness 2022-02-04  2483  	return 0;
e2c203102ac06a John Ogness 2022-02-04  2484  }
e2c203102ac06a John Ogness 2022-02-04  2485  =


:::::: The code at line 2471 was first introduced by commit
:::::: e2c203102ac06a753b2d35ee377887350ad82b84 printk: add infrastucture f=
or atomic consoles

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2624353494424359511==--

