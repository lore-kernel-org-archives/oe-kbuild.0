Content-Type: multipart/mixed; boundary="===============1588376180264440220=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-5.19.y-rt-rebase 24/55] kernel/printk/printk.c:2471 __alloc_atomic_data() warn: returning -1 instead of -ENOMEM is sloppy
Date: Sun, 31 Jul 2022 10:04:35 +0800
Message-ID: <202207310935.JGnbLvQu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1588376180264440220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.19.y-rt-rebase
head:   4730816e7a6aab17945765fc82d47cdc9a05b8fa
commit: 6eb7d10a338af10245f976ea32922acea68f36a1 [24/55] serial: 8250: impl=
ement write_atomic
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20731/202207310935.JGnbLvQu-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/printk/printk.c:2471 __alloc_atomic_data() warn: returning -1 instea=
d of -ENOMEM is sloppy

vim +2471 kernel/printk/printk.c

565dc55e237ca6 John Ogness 2022-02-04  2466  =

565dc55e237ca6 John Ogness 2022-02-04  2467  static int __alloc_atomic_data=
(struct console_atomic_data *d, short flags)
565dc55e237ca6 John Ogness 2022-02-04  2468  {
565dc55e237ca6 John Ogness 2022-02-04  2469  	d->text =3D kmalloc(CONSOLE_L=
OG_MAX, GFP_KERNEL);
565dc55e237ca6 John Ogness 2022-02-04  2470  	if (!d->text)
565dc55e237ca6 John Ogness 2022-02-04 @2471  		return -1;
565dc55e237ca6 John Ogness 2022-02-04  2472  =

565dc55e237ca6 John Ogness 2022-02-04  2473  	if (flags & CON_EXTENDED) {
565dc55e237ca6 John Ogness 2022-02-04  2474  		d->ext_text =3D kmalloc(CONS=
OLE_EXT_LOG_MAX, GFP_KERNEL);
565dc55e237ca6 John Ogness 2022-02-04  2475  		if (!d->ext_text)
565dc55e237ca6 John Ogness 2022-02-04  2476  			return -1;
565dc55e237ca6 John Ogness 2022-02-04  2477  	} else {
565dc55e237ca6 John Ogness 2022-02-04  2478  		d->dropped_text =3D kmalloc(=
DROPPED_TEXT_MAX, GFP_KERNEL);
565dc55e237ca6 John Ogness 2022-02-04  2479  		if (!d->dropped_text)
565dc55e237ca6 John Ogness 2022-02-04  2480  			return -1;
565dc55e237ca6 John Ogness 2022-02-04  2481  	}
565dc55e237ca6 John Ogness 2022-02-04  2482  =

565dc55e237ca6 John Ogness 2022-02-04  2483  	return 0;
565dc55e237ca6 John Ogness 2022-02-04  2484  }
565dc55e237ca6 John Ogness 2022-02-04  2485  =


:::::: The code at line 2471 was first introduced by commit
:::::: 565dc55e237ca6ad85f6af783b3d5dd3928e8871 printk: add infrastucture f=
or atomic consoles

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1588376180264440220==--

