Content-Type: multipart/mixed; boundary="===============7142844366498351015=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-5.16.y-rt-rebase 16/132] kernel/printk/printk.c:2339 __alloc_atomic_data() warn: returning -1 instead of -ENOMEM is sloppy
Date: Sat, 22 Jan 2022 13:08:02 +0800
Message-ID: <202201221259.fzbUIBAU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7142844366498351015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.16.y-rt-rebase
head:   1722f531f5244c70dcd9687c40729860bb254e8d
commit: e1fd5438186d729df636919574f08231f7ecdd1d [16/132] serial: 8250: imp=
lement write_atomic
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-m001-20220117 (https://download.01.org/0day-ci/ar=
chive/20220122/202201221259.fzbUIBAU-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/printk/printk.c:2339 __alloc_atomic_data() warn: returning -1 instea=
d of -ENOMEM is sloppy

vim +2339 kernel/printk/printk.c

02489ebe320634 John Ogness 2021-12-22  2334  =

02489ebe320634 John Ogness 2021-12-22  2335  static int __alloc_atomic_data=
(struct console_atomic_data *d, short flags)
02489ebe320634 John Ogness 2021-12-22  2336  {
02489ebe320634 John Ogness 2021-12-22  2337  	d->text =3D kmalloc(CONSOLE_L=
OG_MAX, GFP_KERNEL);
02489ebe320634 John Ogness 2021-12-22  2338  	if (!d->text)
02489ebe320634 John Ogness 2021-12-22 @2339  		return -1;
02489ebe320634 John Ogness 2021-12-22  2340  =

02489ebe320634 John Ogness 2021-12-22  2341  	if (flags & CON_EXTENDED) {
02489ebe320634 John Ogness 2021-12-22  2342  		d->ext_text =3D kmalloc(CONS=
OLE_EXT_LOG_MAX, GFP_KERNEL);
02489ebe320634 John Ogness 2021-12-22  2343  		if (!d->ext_text)
02489ebe320634 John Ogness 2021-12-22  2344  			return -1;
02489ebe320634 John Ogness 2021-12-22  2345  	} else {
02489ebe320634 John Ogness 2021-12-22  2346  		d->dropped_text =3D kmalloc(=
DROPPED_TEXT_MAX, GFP_KERNEL);
02489ebe320634 John Ogness 2021-12-22  2347  		if (!d->dropped_text)
02489ebe320634 John Ogness 2021-12-22  2348  			return -1;
02489ebe320634 John Ogness 2021-12-22  2349  	}
02489ebe320634 John Ogness 2021-12-22  2350  =

02489ebe320634 John Ogness 2021-12-22  2351  	return 0;
02489ebe320634 John Ogness 2021-12-22  2352  }
02489ebe320634 John Ogness 2021-12-22  2353  =


:::::: The code at line 2339 was first introduced by commit
:::::: 02489ebe320634155c5ddb3110d7d456fa68d304 printk: add infrastucture f=
or atomic consoles

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7142844366498351015==--

