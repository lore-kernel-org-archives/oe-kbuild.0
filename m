Content-Type: multipart/mixed; boundary="===============6928695647060336921=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/char/pcmcia/synclink_cs.c:340 irq_disable() warn: ignoring unreachable code.
Date: Mon, 25 Jul 2022 16:58:25 +0000
Message-ID: <202207240910.k3WWR5RV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6928695647060336921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   515f71412bb73ebd7f41f90e1684fc80b8730789
commit: 6968e707d371ef80511448c6771daf445b4a5cf5 parisc: io: Improve the ou=
tb(), outw() and outl() macros
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: parisc-randconfig-m031-20220724 (https://download.01.org/0day-ci/ar=
chive/20220724/202207240910.k3WWR5RV-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/char/pcmcia/synclink_cs.c:340 irq_disable() warn: ignoring unreacha=
ble code.
drivers/char/pcmcia/synclink_cs.c:350 irq_enable() warn: ignoring unreachab=
le code.
drivers/char/pcmcia/synclink_cs.c:699 issue_command() warn: ignoring unreac=
hable code.
drivers/char/pcmcia/synclink_cs.c:1122 dsr_change() warn: ignoring unreacha=
ble code.
drivers/char/pcmcia/synclink_cs.c:1137 ri_change() warn: ignoring unreachab=
le code.
drivers/char/pcmcia/synclink_cs.c:3551 tx_set_idle() warn: ignoring unreach=
able code.

Old smatch warnings:
drivers/char/pcmcia/synclink_cs.c:343 irq_disable() warn: ignoring unreacha=
ble code.
drivers/char/pcmcia/synclink_cs.c:353 irq_enable() warn: ignoring unreachab=
le code.
drivers/char/pcmcia/synclink_cs.c:1023 tx_ready() warn: ignoring unreachabl=
e code.
drivers/char/pcmcia/synclink_cs.c:1025 tx_ready() warn: ignoring unreachabl=
e code.
drivers/char/pcmcia/synclink_cs.c:1388 mgslpc_program_hw() warn: ignoring u=
nreachable code.
drivers/char/pcmcia/synclink_cs.c:1873 set_interface() warn: ignoring unrea=
chable code.
drivers/char/pcmcia/synclink_cs.c:2176 mgslpc_break() warn: ignoring unreac=
hable code.
drivers/char/pcmcia/synclink_cs.c:2178 mgslpc_break() warn: ignoring unreac=
hable code.
drivers/char/pcmcia/synclink_cs.c:2490 mgslpc_open() error: we previously a=
ssumed 'info' could be null (see line 2476)
drivers/char/pcmcia/synclink_cs.c:2885 mgslpc_set_rate() warn: ignoring unr=
eachable code.
drivers/char/pcmcia/synclink_cs.c:2916 enable_auxclk() warn: ignoring unrea=
chable code.
drivers/char/pcmcia/synclink_cs.c:2988 loopback_enable() warn: ignoring unr=
eachable code.
drivers/char/pcmcia/synclink_cs.c:3013 hdlc_mode() warn: ignoring unreachab=
le code.
drivers/char/pcmcia/synclink_cs.c:3252 rx_stop() warn: ignoring unreachable=
 code.
drivers/char/pcmcia/synclink_cs.c:3269 rx_start() warn: ignoring unreachabl=
e code.
drivers/char/pcmcia/synclink_cs.c:3329 reset_device() warn: ignoring unreac=
hable code.
drivers/char/pcmcia/synclink_cs.c:3383 async_mode() warn: ignoring unreacha=
ble code.
drivers/char/pcmcia/synclink_cs.c:3553 tx_set_idle() warn: ignoring unreach=
able code.
drivers/char/pcmcia/synclink_cs.c:3596 set_signals() warn: ignoring unreach=
able code.
drivers/char/pcmcia/synclink_cs.c:3720 register_test() warn: ignoring unrea=
chable code.
drivers/char/pcmcia/synclink_cs.c:3749 irq_test() warn: ignoring unreachabl=
e code.

vim +340 drivers/char/pcmcia/synclink_cs.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  326  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  327  #define set_reg_bits(info, =
reg, mask) \
^1da177e4c3f415 Linus Torvalds 2005-04-16  328  	write_reg(info, (reg), \
^1da177e4c3f415 Linus Torvalds 2005-04-16  329  		 (unsigned char) (read_re=
g(info, (reg)) | (mask)))
^1da177e4c3f415 Linus Torvalds 2005-04-16  330  #define clear_reg_bits(info=
, reg, mask) \
^1da177e4c3f415 Linus Torvalds 2005-04-16  331  	write_reg(info, (reg), \
^1da177e4c3f415 Linus Torvalds 2005-04-16  332  		 (unsigned char) (read_re=
g(info, (reg)) & ~(mask)))
^1da177e4c3f415 Linus Torvalds 2005-04-16  333  /*
^1da177e4c3f415 Linus Torvalds 2005-04-16  334   * interrupt enable/disable=
 routines
^1da177e4c3f415 Linus Torvalds 2005-04-16  335   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  336  static void irq_disable(MGS=
LPC_INFO *info, unsigned char channel, unsigned short mask)
^1da177e4c3f415 Linus Torvalds 2005-04-16  337  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  338  	if (channel =3D=3D CHA) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  339  		info->imra_value |=3D mas=
k;
^1da177e4c3f415 Linus Torvalds 2005-04-16 @340  		write_reg16(info, CHA + I=
MR, info->imra_value);
^1da177e4c3f415 Linus Torvalds 2005-04-16  341  	} else {
^1da177e4c3f415 Linus Torvalds 2005-04-16  342  		info->imrb_value |=3D mas=
k;
^1da177e4c3f415 Linus Torvalds 2005-04-16  343  		write_reg16(info, CHB + I=
MR, info->imrb_value);
^1da177e4c3f415 Linus Torvalds 2005-04-16  344  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  345  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  346  static void irq_enable(MGSL=
PC_INFO *info, unsigned char channel, unsigned short mask)
^1da177e4c3f415 Linus Torvalds 2005-04-16  347  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  348  	if (channel =3D=3D CHA) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  349  		info->imra_value &=3D ~ma=
sk;
^1da177e4c3f415 Linus Torvalds 2005-04-16 @350  		write_reg16(info, CHA + I=
MR, info->imra_value);
^1da177e4c3f415 Linus Torvalds 2005-04-16  351  	} else {
^1da177e4c3f415 Linus Torvalds 2005-04-16  352  		info->imrb_value &=3D ~ma=
sk;
^1da177e4c3f415 Linus Torvalds 2005-04-16  353  		write_reg16(info, CHB + I=
MR, info->imrb_value);
^1da177e4c3f415 Linus Torvalds 2005-04-16  354  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  355  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  356  =


:::::: The code at line 340 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6928695647060336921==--

