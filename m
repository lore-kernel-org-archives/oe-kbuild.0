Content-Type: multipart/mixed; boundary="===============7446159729953640979=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/smsc/smc91x.c:2128 smc_request_attrib() warn: should '(64 * 1024) << (lp->io_shift)' be a 64 bit type?
Date: Sun, 13 Feb 2022 02:17:13 +0800
Message-ID: <202202122203.55RvxnRa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7446159729953640979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Masahiro,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   83e396641110663d3c7bb25b9bc0c6a750359ecf
commit: ea29b20a828511de3348334e529a3d046a180416 init/Kconfig: make COMPILE=
_TEST depend on HAS_IOMEM
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-m031-20220212 (https://download.01.org/0day-ci/arch=
ive/20220212/202202122203.55RvxnRa-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/smsc/smc91x.c:2128 smc_request_attrib() warn: should '=
(64 * 1024) << (lp->io_shift)' be a 64 bit type?
drivers/net/ethernet/smsc/smc91x.c:2141 smc_release_attrib() warn: should '=
(64 * 1024) << (lp->io_shift)' be a 64 bit type?
drivers/net/ethernet/smsc/smc91x.c:2344 smc_drv_probe() warn: should '16 <<=
 (lp->io_shift)' be a 64 bit type?
drivers/net/ethernet/smsc/smc91x.c:2434 smc_drv_remove() warn: should '16 <=
< (lp->io_shift)' be a 64 bit type?

Old smatch warnings:
drivers/net/ethernet/smsc/smc91x.c:2403 smc_drv_probe() warn: should '16 <<=
 (lp->io_shift)' be a 64 bit type?

vim +2128 drivers/net/ethernet/smsc/smc91x.c

^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2118  =

159198862adad7 drivers/net/smc91x.c Eric Miao       2008-06-24  2119  stati=
c int smc_request_attrib(struct platform_device *pdev,
159198862adad7 drivers/net/smc91x.c Eric Miao       2008-06-24  2120  			  =
    struct net_device *ndev)
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2121  {
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2122  	stru=
ct resource * res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "s=
mc91x-attrib");
55c8eb6c8eaa50 drivers/net/smc91x.c David S. Miller 2008-11-03  2123  	stru=
ct smc_local *lp __maybe_unused =3D netdev_priv(ndev);
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2124  =

^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2125  	if (=
!res)
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2126  		ret=
urn 0;
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2127  =

^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16 @2128  	if (=
!request_mem_region(res->start, ATTRIB_SIZE, CARDNAME))
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2129  		ret=
urn -EBUSY;
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2130  =

^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2131  	retu=
rn 0;
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2132  }
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2133  =

159198862adad7 drivers/net/smc91x.c Eric Miao       2008-06-24  2134  stati=
c void smc_release_attrib(struct platform_device *pdev,
159198862adad7 drivers/net/smc91x.c Eric Miao       2008-06-24  2135  			  =
     struct net_device *ndev)
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2136  {
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2137  	stru=
ct resource * res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "s=
mc91x-attrib");
55c8eb6c8eaa50 drivers/net/smc91x.c David S. Miller 2008-11-03  2138  	stru=
ct smc_local *lp __maybe_unused =3D netdev_priv(ndev);
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2139  =

^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2140  	if (=
res)
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16 @2141  		rel=
ease_mem_region(res->start, ATTRIB_SIZE);
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2142  }
^1da177e4c3f41 drivers/net/smc91x.c Linus Torvalds  2005-04-16  2143  =


:::::: The code at line 2128 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7446159729953640979==--

