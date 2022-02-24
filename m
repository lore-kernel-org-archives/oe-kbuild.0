Content-Type: multipart/mixed; boundary="===============8431336582245734099=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/sja1000/sja1000_isa.c:88 sja1000_isa_port_write_reg() warn: ignoring unreachable code.
Date: Thu, 24 Feb 2022 12:34:10 +0800
Message-ID: <202202241239.cqiM0rGJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8431336582245734099==
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
head:   23d04328444a8fa0ca060c5e532220dac8e8bc26
commit: 6968e707d371ef80511448c6771daf445b4a5cf5 parisc: io: Improve the ou=
tb(), outw() and outl() macros
date:   7 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 weeks ago
config: parisc-randconfig-m031-20220223 (https://download.01.org/0day-ci/ar=
chive/20220224/202202241239.cqiM0rGJ-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/can/sja1000/sja1000_isa.c:88 sja1000_isa_port_write_reg() warn:=
 ignoring unreachable code.

Old smatch warnings:
drivers/net/can/sja1000/sja1000_isa.c:98 sja1000_isa_port_read_reg_indirect=
() warn: ignoring unreachable code.
drivers/net/can/sja1000/sja1000_isa.c:111 sja1000_isa_port_write_reg_indire=
ct() warn: ignoring unreachable code.

vim +88 drivers/net/can/sja1000/sja1000_isa.c

2a6ba39ad6a277 Wolfgang Grandegger 2009-09-01  84  =

2a6ba39ad6a277 Wolfgang Grandegger 2009-09-01  85  static void sja1000_isa_=
port_write_reg(const struct sja1000_priv *priv,
2a6ba39ad6a277 Wolfgang Grandegger 2009-09-01  86  				       int reg, u8 v=
al)
2a6ba39ad6a277 Wolfgang Grandegger 2009-09-01  87  {
2a6ba39ad6a277 Wolfgang Grandegger 2009-09-01 @88  	outb(val, (unsigned lon=
g)priv->reg_base + reg);
2a6ba39ad6a277 Wolfgang Grandegger 2009-09-01  89  }
2a6ba39ad6a277 Wolfgang Grandegger 2009-09-01  90  =


:::::: The code at line 88 was first introduced by commit
:::::: 2a6ba39ad6a277595ef9a0187a44f09e062dd3b2 can: sja1000: legacy SJA100=
0 ISA bus driver

:::::: TO: Wolfgang Grandegger <wg@grandegger.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8431336582245734099==--

