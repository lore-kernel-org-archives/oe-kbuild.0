Content-Type: multipart/mixed; boundary="===============6341000977275893172=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/hamradio/scc.c:1748 scc_net_siocdevprivate() warn: potential spectre issue 'Ivec' [w] (local cap)
Date: Mon, 18 Apr 2022 15:54:34 +0800
Message-ID: <202204181517.KfEdiI1H-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6341000977275893172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: 25ec92fbdd23a0a2bfd2bdf489e60ea4f0ae46d1 hamradio: use ndo_siocdevp=
rivate
date:   9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-m021-20220418 (https://download.01.org/0day-ci/arch=
ive/20220418/202204181517.KfEdiI1H-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/hamradio/scc.c:1748 scc_net_siocdevprivate() warn: potential sp=
ectre issue 'Ivec' [w] (local cap)

Old smatch warnings:
drivers/net/hamradio/scc.c:2042 scc_net_seq_show() warn: argument 8 to %2.2=
x specifier has type 'char'

vim +/Ivec +1748 drivers/net/hamradio/scc.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  1695  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1696  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  1697   * SIOCSCCCFG		- config=
ure driver	arg: (struct scc_hw_config *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1698   * SIOCSCCINI		- initia=
lize driver	arg: ---
^1da177e4c3f41 Linus Torvalds     2005-04-16  1699   * SIOCSCCCHANINI	- ini=
tialize channel	arg: (struct scc_modem *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1700   * SIOCSCCSMEM		- set m=
emory		arg: (struct scc_mem_config *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1701   * SIOCSCCGKISS		- get =
level 1 parameter	arg: (struct scc_kiss_cmd *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1702   * SIOCSCCSKISS		- set =
level 1 parameter arg: (struct scc_kiss_cmd *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1703   * SIOCSCCGSTAT		- get =
driver status	arg: (struct scc_stat *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1704   * SIOCSCCCAL		- send c=
alib. pattern	arg: (struct scc_calibrate *) arg
^1da177e4c3f41 Linus Torvalds     2005-04-16  1705   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1706  =

25ec92fbdd23a0 Arnd Bergmann      2021-07-27  1707  static int scc_net_sioc=
devprivate(struct net_device *dev,
25ec92fbdd23a0 Arnd Bergmann      2021-07-27  1708  				  struct ifreq *ifr=
, void __user *arg, int cmd)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1709  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1710  	struct scc_kiss_cmd ki=
ss_cmd;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1711  	struct scc_mem_config =
memcfg;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1712  	struct scc_hw_config h=
wcfg;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1713  	struct scc_calibrate c=
al;
f4bdd264b43cc6 Wang Chen          2008-11-20  1714  	struct scc_channel *sc=
c =3D (struct scc_channel *) dev->ml_priv;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1715  	int chan;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1716  	unsigned char device_n=
ame[IFNAMSIZ];
^1da177e4c3f41 Linus Torvalds     2005-04-16  1717  	=

^1da177e4c3f41 Linus Torvalds     2005-04-16  1718  	if (!Driver_Initialize=
d)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1719  	{
^1da177e4c3f41 Linus Torvalds     2005-04-16  1720  		if (cmd =3D=3D SIOCSC=
CCFG)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1721  		{
^1da177e4c3f41 Linus Torvalds     2005-04-16  1722  			int found =3D 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1723  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1724  			if (!capable(CAP_SYS=
_RAWIO)) return -EPERM;
25ec92fbdd23a0 Arnd Bergmann      2021-07-27  1725  			if (in_compat_syscal=
l())
25ec92fbdd23a0 Arnd Bergmann      2021-07-27  1726  				return -EOPNOTSUPP;
25ec92fbdd23a0 Arnd Bergmann      2021-07-27  1727  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1728  			if (!arg) return -EF=
AULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1729  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1730  			if (Nchips >=3D SCC_=
MAXCHIPS) =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1731  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1732  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1733  			if (copy_from_user(&=
hwcfg, arg, sizeof(hwcfg)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1734  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1735  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1736  			if (hwcfg.irq =3D=3D=
 2) hwcfg.irq =3D 9;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1737  =

60e4ad7a72fd7c Yinghai Lu         2008-08-19  1738  			if (hwcfg.irq < 0 ||=
 hwcfg.irq >=3D nr_irqs)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1739  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1740  				=

^1da177e4c3f41 Linus Torvalds     2005-04-16  1741  			if (!Ivec[hwcfg.irq]=
.used && hwcfg.irq)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1742  			{
1b36efe07f83ec Jeff Garzik        2007-10-29  1743  				if (request_irq(hwc=
fg.irq, scc_isr,
9714481e677562 Michael Opdenacker 2013-10-05  1744  						0, "AX.25 SCC",
1b36efe07f83ec Jeff Garzik        2007-10-29  1745  						(void *)(long) hw=
cfg.irq))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1746  					printk(KERN_WARNIN=
G "z8530drv: warning, cannot get IRQ %d\n", hwcfg.irq);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1747  				else
^1da177e4c3f41 Linus Torvalds     2005-04-16 @1748  					Ivec[hwcfg.irq].us=
ed =3D 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1749  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1750  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1751  			if (hwcfg.vector_lat=
ch && !Vector_Latch) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1752  				if (!request_region=
(hwcfg.vector_latch, 1, "scc vector latch"))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1753  					printk(KERN_WARNIN=
G "z8530drv: warning, cannot reserve vector latch port 0x%lx\n, disabled.",=
 hwcfg.vector_latch);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1754  				else
^1da177e4c3f41 Linus Torvalds     2005-04-16  1755  					Vector_Latch =3D h=
wcfg.vector_latch;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1756  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1757  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1758  			if (hwcfg.clock =3D=
=3D 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1759  				hwcfg.clock =3D SCC=
_DEFAULT_CLOCK;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1760  =


:::::: The code at line 1748 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6341000977275893172==--

