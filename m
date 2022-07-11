Content-Type: multipart/mixed; boundary="===============8071503317712002812=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1342/8914] drivers/i2c/busses/i2c-npcm7xx.c:639 npcm_i2c_slave_enable() error: buffer overflow 'npcm_i2caddr' 2 <= 9
Date: Mon, 11 Jul 2022 09:31:50 +0800
Message-ID: <202207110811.lWIJpo4l-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8071503317712002812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Tyrone Ting <kfting@nuvoton.com>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Tyrone,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f2528c29385819a84480cacef4886b049761e2c5
commit: bbc38ed53a02a759d8e5c01e834eca49304a2315 [1342/8914] i2c: npcm: Sup=
port NPCM845
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: microblaze-randconfig-m031-20220706 (https://download.01.org/0day-c=
i/archive/20220711/202207110811.lWIJpo4l-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/i2c/busses/i2c-npcm7xx.c:639 npcm_i2c_slave_enable() error: buffer =
overflow 'npcm_i2caddr' 2 <=3D 9

vim +/npcm_i2caddr +639 drivers/i2c/busses/i2c-npcm7xx.c

f54736925a4f83 Tali Perry 2020-05-27  606  =

f54736925a4f83 Tali Perry 2020-05-27  607  static int npcm_i2c_slave_enable=
(struct npcm_i2c *bus, enum i2c_addr addr_type,
f54736925a4f83 Tali Perry 2020-05-27  608  				 u8 addr, bool enable)
f54736925a4f83 Tali Perry 2020-05-27  609  {
f54736925a4f83 Tali Perry 2020-05-27  610  	u8 i2cctl1;
f54736925a4f83 Tali Perry 2020-05-27  611  	u8 i2cctl3;
f54736925a4f83 Tali Perry 2020-05-27  612  	u8 sa_reg;
f54736925a4f83 Tali Perry 2020-05-27  613  =

f54736925a4f83 Tali Perry 2020-05-27  614  	sa_reg =3D (addr & 0x7F) | FIEL=
D_PREP(NPCM_I2CADDR_SAEN, enable);
f54736925a4f83 Tali Perry 2020-05-27  615  	if (addr_type =3D=3D I2C_GC_ADD=
R) {
f54736925a4f83 Tali Perry 2020-05-27  616  		i2cctl1 =3D ioread8(bus->reg +=
 NPCM_I2CCTL1);
f54736925a4f83 Tali Perry 2020-05-27  617  		if (enable)
f54736925a4f83 Tali Perry 2020-05-27  618  			i2cctl1 |=3D NPCM_I2CCTL1_GCM=
EN;
f54736925a4f83 Tali Perry 2020-05-27  619  		else
f54736925a4f83 Tali Perry 2020-05-27  620  			i2cctl1 &=3D ~NPCM_I2CCTL1_GC=
MEN;
f54736925a4f83 Tali Perry 2020-05-27  621  		iowrite8(i2cctl1, bus->reg + N=
PCM_I2CCTL1);
f54736925a4f83 Tali Perry 2020-05-27  622  		return 0;
47d506d1a28fd1 Tali Perry 2022-05-25  623  	} else if (addr_type =3D=3D I2C=
_ARP_ADDR) {
f54736925a4f83 Tali Perry 2020-05-27  624  		i2cctl3 =3D ioread8(bus->reg +=
 NPCM_I2CCTL3);
f54736925a4f83 Tali Perry 2020-05-27  625  		if (enable)
f54736925a4f83 Tali Perry 2020-05-27  626  			i2cctl3 |=3D I2CCTL3_ARPMEN;
f54736925a4f83 Tali Perry 2020-05-27  627  		else
f54736925a4f83 Tali Perry 2020-05-27  628  			i2cctl3 &=3D ~I2CCTL3_ARPMEN;
f54736925a4f83 Tali Perry 2020-05-27  629  		iowrite8(i2cctl3, bus->reg + N=
PCM_I2CCTL3);
f54736925a4f83 Tali Perry 2020-05-27  630  		return 0;
f54736925a4f83 Tali Perry 2020-05-27  631  	}
47d506d1a28fd1 Tali Perry 2022-05-25  632  	if (addr_type > I2C_SLAVE_ADDR2=
 && addr_type <=3D I2C_SLAVE_ADDR10)
47d506d1a28fd1 Tali Perry 2022-05-25  633  		dev_err(bus->dev, "try to enab=
le more than 2 SA not supported\n");
47d506d1a28fd1 Tali Perry 2022-05-25  634  =

f54736925a4f83 Tali Perry 2020-05-27  635  	if (addr_type >=3D I2C_ARP_ADDR)
f54736925a4f83 Tali Perry 2020-05-27  636  		return -EFAULT;
47d506d1a28fd1 Tali Perry 2022-05-25  637  =

f54736925a4f83 Tali Perry 2020-05-27  638  	/* Set and enable the address */
f54736925a4f83 Tali Perry 2020-05-27 @639  	iowrite8(sa_reg, bus->reg + npc=
m_i2caddr[addr_type]);
f54736925a4f83 Tali Perry 2020-05-27  640  	npcm_i2c_slave_int_enable(bus, =
enable);
47d506d1a28fd1 Tali Perry 2022-05-25  641  =

f54736925a4f83 Tali Perry 2020-05-27  642  	return 0;
f54736925a4f83 Tali Perry 2020-05-27  643  }
f54736925a4f83 Tali Perry 2020-05-27  644  #endif
f54736925a4f83 Tali Perry 2020-05-27  645  =


:::::: The code at line 639 was first introduced by commit
:::::: f54736925a4f83a67588381d0ead69d19323b526 i2c: npcm7xx: Add support f=
or slave mode for Nuvoton

:::::: TO: Tali Perry <tali.perry1@gmail.com>
:::::: CC: Wolfram Sang <wsa@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8071503317712002812==--

