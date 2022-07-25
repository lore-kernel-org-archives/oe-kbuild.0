Content-Type: multipart/mixed; boundary="===============6208014052113232092=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/comedi/drivers/quatech_daqp_cs.c:691 daqp_do_insn_bits() warn: ignoring unreachable code.
Date: Mon, 25 Jul 2022 19:50:33 +0800
Message-ID: <202207251956.0C67LnJa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6208014052113232092==
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
head:   e0dccc3b76fb35bb257b4118367a883073d7390e
commit: 6968e707d371ef80511448c6771daf445b4a5cf5 parisc: io: Improve the ou=
tb(), outw() and outl() macros
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
config: parisc-randconfig-m031-20220724 (https://download.01.org/0day-ci/ar=
chive/20220725/202207251956.0C67LnJa-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/comedi/drivers/quatech_daqp_cs.c:691 daqp_do_insn_bits() warn: igno=
ring unreachable code.

Old smatch warnings:
drivers/comedi/drivers/quatech_daqp_cs.c:190 daqp_ai_cancel() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/quatech_daqp_cs.c:278 daqp_ai_set_one_scanlist_entry=
() warn: ignoring unreachable code.
drivers/comedi/drivers/quatech_daqp_cs.c:307 daqp_ai_insn_read() warn: igno=
ring unreachable code.
drivers/comedi/drivers/quatech_daqp_cs.c:366 daqp_set_pacer() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/quatech_daqp_cs.c:474 daqp_ai_cmd() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/quatech_daqp_cs.c:644 daqp_ao_insn_write() warn: ign=
oring unreachable code.

vim +691 drivers/comedi/drivers/quatech_daqp_cs.c

62ed666238aba1 drivers/staging/comedi/drivers/quatech_daqp_cs.c Brent Bacca=
la     2009-02-17  679  =

6a911d8aa54bc7 drivers/staging/comedi/drivers/quatech_daqp_cs.c H Hartley S=
weeten 2013-02-04  680  static int daqp_do_insn_bits(struct comedi_device *=
dev,
0a85b6f0ab0d2e drivers/staging/comedi/drivers/quatech_daqp_cs.c Mithlesh Th=
ukral  2009-06-08  681  			     struct comedi_subdevice *s,
6a911d8aa54bc7 drivers/staging/comedi/drivers/quatech_daqp_cs.c H Hartley S=
weeten 2013-02-04  682  			     struct comedi_insn *insn,
6a911d8aa54bc7 drivers/staging/comedi/drivers/quatech_daqp_cs.c H Hartley S=
weeten 2013-02-04  683  			     unsigned int *data)
62ed666238aba1 drivers/staging/comedi/drivers/quatech_daqp_cs.c Brent Bacca=
la     2009-02-17  684  {
1801726e877872 drivers/staging/comedi/drivers/quatech_daqp_cs.c H Hartley S=
weeten 2013-02-04  685  	struct daqp_private *devpriv =3D dev->private;
62ed666238aba1 drivers/staging/comedi/drivers/quatech_daqp_cs.c Brent Bacca=
la     2009-02-17  686  =

1801726e877872 drivers/staging/comedi/drivers/quatech_daqp_cs.c H Hartley S=
weeten 2013-02-04  687  	if (devpriv->stop)
62ed666238aba1 drivers/staging/comedi/drivers/quatech_daqp_cs.c Brent Bacca=
la     2009-02-17  688  		return -EIO;
62ed666238aba1 drivers/staging/comedi/drivers/quatech_daqp_cs.c Brent Bacca=
la     2009-02-17  689  =

97f4289ad08cff drivers/staging/comedi/drivers/quatech_daqp_cs.c H Hartley S=
weeten 2013-08-30  690  	if (comedi_dio_update_state(s, data))
bd9d00f105bf0f drivers/staging/comedi/drivers/quatech_daqp_cs.c H Hartley S=
weeten 2015-10-05 @691  		outb(s->state, dev->iobase + DAQP_DO_REG);
6a911d8aa54bc7 drivers/staging/comedi/drivers/quatech_daqp_cs.c H Hartley S=
weeten 2013-02-04  692  =

6a911d8aa54bc7 drivers/staging/comedi/drivers/quatech_daqp_cs.c H Hartley S=
weeten 2013-02-04  693  	data[1] =3D s->state;
6a911d8aa54bc7 drivers/staging/comedi/drivers/quatech_daqp_cs.c H Hartley S=
weeten 2013-02-04  694  =

6a911d8aa54bc7 drivers/staging/comedi/drivers/quatech_daqp_cs.c H Hartley S=
weeten 2013-02-04  695  	return insn->n;
62ed666238aba1 drivers/staging/comedi/drivers/quatech_daqp_cs.c Brent Bacca=
la     2009-02-17  696  }
62ed666238aba1 drivers/staging/comedi/drivers/quatech_daqp_cs.c Brent Bacca=
la     2009-02-17  697  =


:::::: The code at line 691 was first introduced by commit
:::::: bd9d00f105bf0fb26a85f5ad3b75d0b161304478 staging: comedi: quatech_da=
qp_cs: rename register offsets

:::::: TO: H Hartley Sweeten <hsweeten@visionengravers.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6208014052113232092==--

