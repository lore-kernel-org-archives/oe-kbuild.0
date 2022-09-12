Content-Type: multipart/mixed; boundary="===============6804340614208840104=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-6.0.y-rt-rebase 40/70] kernel/printk/printk.c:2471 __alloc_atomic_data() warn: returning -1 instead of -ENOMEM is sloppy
Date: Mon, 12 Sep 2022 19:25:22 +0800
Message-ID: <202209121953.WOW5sqcg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6804340614208840104==
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
head:   376548593b4d47763e838b8bcd1f91051f918dab
commit: 7bb39d2b7c7a6c79458113dbdb360340267c7a52 [40/70] serial: 8250: impl=
ement write_atomic
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20912/202209121953.WOW5sqcg-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/printk/printk.c:2471 __alloc_atomic_data() warn: returning -1 instea=
d of -ENOMEM is sloppy

vim +2471 kernel/printk/printk.c

f86a98cb01f5b3 John Ogness 2022-02-04  2466  =

f86a98cb01f5b3 John Ogness 2022-02-04  2467  static int __alloc_atomic_data=
(struct console_atomic_data *d, short flags)
f86a98cb01f5b3 John Ogness 2022-02-04  2468  {
f86a98cb01f5b3 John Ogness 2022-02-04  2469  	d->text =3D kmalloc(CONSOLE_L=
OG_MAX, GFP_KERNEL);
f86a98cb01f5b3 John Ogness 2022-02-04  2470  	if (!d->text)
f86a98cb01f5b3 John Ogness 2022-02-04 @2471  		return -1;
f86a98cb01f5b3 John Ogness 2022-02-04  2472  =

f86a98cb01f5b3 John Ogness 2022-02-04  2473  	if (flags & CON_EXTENDED) {
f86a98cb01f5b3 John Ogness 2022-02-04  2474  		d->ext_text =3D kmalloc(CONS=
OLE_EXT_LOG_MAX, GFP_KERNEL);
f86a98cb01f5b3 John Ogness 2022-02-04  2475  		if (!d->ext_text)
f86a98cb01f5b3 John Ogness 2022-02-04  2476  			return -1;
f86a98cb01f5b3 John Ogness 2022-02-04  2477  	} else {
f86a98cb01f5b3 John Ogness 2022-02-04  2478  		d->dropped_text =3D kmalloc(=
DROPPED_TEXT_MAX, GFP_KERNEL);
f86a98cb01f5b3 John Ogness 2022-02-04  2479  		if (!d->dropped_text)
f86a98cb01f5b3 John Ogness 2022-02-04  2480  			return -1;
f86a98cb01f5b3 John Ogness 2022-02-04  2481  	}
f86a98cb01f5b3 John Ogness 2022-02-04  2482  =

f86a98cb01f5b3 John Ogness 2022-02-04  2483  	return 0;
f86a98cb01f5b3 John Ogness 2022-02-04  2484  }
f86a98cb01f5b3 John Ogness 2022-02-04  2485  =


:::::: The code at line 2471 was first introduced by commit
:::::: f86a98cb01f5b33ebd4f84b258982e408ff6defe printk: add infrastucture f=
or atomic consoles

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6804340614208840104==--

