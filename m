Content-Type: multipart/mixed; boundary="===============4936477515601281618=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v18] tty: Fix the keyboard led light display problem
Date: Mon, 29 Nov 2021 19:53:34 +0800
Message-ID: <202111291912.gGbp6mtv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4936477515601281618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211129040445.24134-1-changlianzhi@uniontech.com>
References: <20211129040445.24134-1-changlianzhi@uniontech.com>
TO: lianzhi chang <changlianzhi@uniontech.com>
TO: linux-kernel(a)vger.kernel.org
CC: dmitry.torokhov(a)gmail.com
CC: gregkh(a)linuxfoundation.org
CC: jirislaby(a)kernel.org
CC: andriy.shevchenko(a)linux.intel.com
CC: 282827961(a)qq.com
CC: lianzhi chang <changlianzhi@uniontech.com>

Hi lianzhi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on linux/master linus/master v5.16-rc3 next-202111=
26]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/lianzhi-chang/tty-Fix-the-=
keyboard-led-light-display-problem/20211129-120853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-m021-20211128 (https://download.01.org/0day-ci/arch=
ive/20211129/202111291912.gGbp6mtv-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/tty/vt/keyboard.c:425 vt_set_leds_compute_shiftstate() warn: was &&=
 intended here instead of ||?

Old smatch warnings:
drivers/tty/vt/keyboard.c:2091 vt_do_kdgkb_ioctl() warn: possible info leak=
 'kbs'
drivers/tty/vt/keyboard.c:2113 vt_do_kdgkb_ioctl() error: uninitialized sym=
bol 'kbs'.
drivers/tty/vt/keyboard.c:2115 vt_do_kdgkb_ioctl() error: uninitialized sym=
bol 'ret'.

vim +425 drivers/tty/vt/keyboard.c

^1da177e4c3f41 drivers/char/keyboard.c   Linus Torvalds 2005-04-16  412  =

079c9534a96da9 drivers/tty/vt/keyboard.c Alan Cox       2012-02-28  413  /*=
 We still have to export this method to vt.c */
63f24a7fafd448 drivers/tty/vt/keyboard.c Jiri Slaby     2021-01-05  414  vo=
id vt_set_leds_compute_shiftstate(void)
079c9534a96da9 drivers/tty/vt/keyboard.c Alan Cox       2012-02-28  415  {
560757cc1f5e54 drivers/tty/vt/keyboard.c lianzhi chang  2021-11-29  416  	s=
truct kbd_struct *kb;
079c9534a96da9 drivers/tty/vt/keyboard.c Alan Cox       2012-02-28  417  	u=
nsigned long flags;
63f24a7fafd448 drivers/tty/vt/keyboard.c Jiri Slaby     2021-01-05  418  =

560757cc1f5e54 drivers/tty/vt/keyboard.c lianzhi chang  2021-11-29  419  	/*
560757cc1f5e54 drivers/tty/vt/keyboard.c lianzhi chang  2021-11-29  420  	 =
* When switching VT, according to the value of kb->kbdmode,
560757cc1f5e54 drivers/tty/vt/keyboard.c lianzhi chang  2021-11-29  421  	 =
* judge whether it is necessary to force the keyboard light
560757cc1f5e54 drivers/tty/vt/keyboard.c lianzhi chang  2021-11-29  422  	 =
* state to be issued.
560757cc1f5e54 drivers/tty/vt/keyboard.c lianzhi chang  2021-11-29  423  	 =
*/
560757cc1f5e54 drivers/tty/vt/keyboard.c lianzhi chang  2021-11-29  424  	k=
b =3D kbd_table + fg_console;
560757cc1f5e54 drivers/tty/vt/keyboard.c lianzhi chang  2021-11-29 @425  	i=
f (kb->kbdmode !=3D VC_RAW ||
560757cc1f5e54 drivers/tty/vt/keyboard.c lianzhi chang  2021-11-29  426  		=
 kb->kbdmode !=3D VC_MEDIUMRAW ||
560757cc1f5e54 drivers/tty/vt/keyboard.c lianzhi chang  2021-11-29  427  		=
 kb->kbdmode !=3D VC_OFF) {
560757cc1f5e54 drivers/tty/vt/keyboard.c lianzhi chang  2021-11-29  428  		=
vt_switch =3D true;
63f24a7fafd448 drivers/tty/vt/keyboard.c Jiri Slaby     2021-01-05  429  		=
set_leds();
560757cc1f5e54 drivers/tty/vt/keyboard.c lianzhi chang  2021-11-29  430  	}
63f24a7fafd448 drivers/tty/vt/keyboard.c Jiri Slaby     2021-01-05  431  =

079c9534a96da9 drivers/tty/vt/keyboard.c Alan Cox       2012-02-28  432  	s=
pin_lock_irqsave(&kbd_event_lock, flags);
079c9534a96da9 drivers/tty/vt/keyboard.c Alan Cox       2012-02-28  433  	d=
o_compute_shiftstate();
079c9534a96da9 drivers/tty/vt/keyboard.c Alan Cox       2012-02-28  434  	s=
pin_unlock_irqrestore(&kbd_event_lock, flags);
079c9534a96da9 drivers/tty/vt/keyboard.c Alan Cox       2012-02-28  435  }
079c9534a96da9 drivers/tty/vt/keyboard.c Alan Cox       2012-02-28  436  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4936477515601281618==--

