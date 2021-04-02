Content-Type: multipart/mixed; boundary="===============0010459417831207236=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3408/9190] drivers/net/pcs/pcs-xpcs.c:843:13: warning: Identical inner 'return' condition is always true. [identicalInnerCondition]
Date: Fri, 02 Apr 2021 09:22:34 +0800
Message-ID: <202104020925.NhXL9ftx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0010459417831207236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ong Boon Leong <boon.leong.ong@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   454c576c3f5e51d60f00a4ac0dde07f4f9d70e9d
commit: b97b5331b8ab7f60fb880e0c31c9b09b73d2fa4e [3408/9190] net: pcs: add =
C37 SGMII AN support for intel mGbE controller
:::::: branch date: 17 hours ago
:::::: commit date: 2 weeks ago
compiler: sparc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/pcs/pcs-xpcs.c:843:13: warning: Identical inner 'return' con=
dition is always true. [identicalInnerCondition]
     return id | ret;
               ^
   drivers/net/pcs/pcs-xpcs.c:842:9: note: outer condition: id|ret
    if (id | ret)
           ^
   drivers/net/pcs/pcs-xpcs.c:843:13: note: identical inner condition: id|r=
et
     return id | ret;
               ^
   drivers/net/pcs/pcs-xpcs.c:858:13: warning: Identical inner 'return' con=
dition is always true. [identicalInnerCondition]
     return id | ret;
               ^
   drivers/net/pcs/pcs-xpcs.c:857:9: note: outer condition: id|ret
    if (id | ret)
           ^
   drivers/net/pcs/pcs-xpcs.c:858:13: note: identical inner condition: id|r=
et
     return id | ret;
               ^

vim +/return +843 drivers/net/pcs/pcs-xpcs.c

fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  824  =

fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  825  =
static u32 xpcs_get_id(struct mdio_xpcs_args *xpcs)
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  826  {
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  827  =
	int ret;
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  828  =
	u32 id;
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  829  =

b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  830  =
	/* First, search C73 PCS using PCS MMD */
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  831  =
	ret =3D xpcs_read(xpcs, MDIO_MMD_PCS, MII_PHYSID1);
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  832  =
	if (ret < 0)
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  833  =
		return 0xffffffff;
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  834  =

fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  835  =
	id =3D ret << 16;
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  836  =

fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  837  =
	ret =3D xpcs_read(xpcs, MDIO_MMD_PCS, MII_PHYSID2);
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  838  =
	if (ret < 0)
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  839  =
		return 0xffffffff;
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  840  =

b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  841  =
	/* If Device IDs are not all zeros, we found C73 AN-type device */
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  842  =
	if (id | ret)
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09 @843  =
		return id | ret;
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  844  =

b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  845  =
	/* Next, search C37 PCS using Vendor-Specific MII MMD */
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  846  =
	ret =3D xpcs_read(xpcs, MDIO_MMD_VEND2, MII_PHYSID1);
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  847  =
	if (ret < 0)
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  848  =
		return 0xffffffff;
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  849  =

b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  850  =
	id =3D ret << 16;
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  851  =

b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  852  =
	ret =3D xpcs_read(xpcs, MDIO_MMD_VEND2, MII_PHYSID2);
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  853  =
	if (ret < 0)
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  854  =
		return 0xffffffff;
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  855  =

b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  856  =
	/* If Device IDs are not all zeros, we found C37 AN-type device */
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  857  =
	if (id | ret)
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  858  =
		return id | ret;
b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  859  =

b97b5331b8ab7f drivers/net/pcs/pcs-xpcs.c  Ong Boon Leong 2021-03-15  860  =
	return 0xffffffff;
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  861  }
fcb26bd2b6cab5 drivers/net/phy/mdio-xpcs.c Jose Abreu     2020-03-09  862  =


:::::: The code@line 843 was first introduced by commit
:::::: fcb26bd2b6cab573f06e5855638368cf88e99c2b net: phy: Add Synopsys Desi=
gnWare XPCS MDIO module

:::::: TO: Jose Abreu <Jose.Abreu@synopsys.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0010459417831207236==--

