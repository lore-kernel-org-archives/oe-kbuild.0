Content-Type: multipart/mixed; boundary="===============8971615763248501808=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vfio/pci/vfio_pci_config.c:1544:13: warning: Identical condition 'ret', second condition is always false
Date: Tue, 20 Oct 2020 01:06:29 +0800
Message-ID: <202010200122.J4Qw0htX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8971615763248501808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chen Zhou <chenzhou10@huawei.com>
CC: Ben Skeggs <bskeggs@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7cf726a59435301046250c42131554d9ccc566b8
commit: ee8642162a9edd40daafd3fb894e3fd3f909e361 drm/nouveau: fix build err=
or without CONFIG_IOMMU_API
date:   9 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 9 months ago
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/vfio/pci/vfio_pci_config.c:1544:13: warning: Identical condition=
 'ret', second condition is always false [identicalConditionAfterEarlyExit]
        return ret;
               ^
   drivers/vfio/pci/vfio_pci_config.c:1534:7: note: first condition
     if (ret)
         ^
   drivers/vfio/pci/vfio_pci_config.c:1544:13: note: second condition
        return ret;
               ^

vim +/ret +1544 drivers/vfio/pci/vfio_pci_config.c

89e1f7d4c66d85f Alex Williamson 2012-07-31  1511  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1512  static int vfio_ecap_init=
(struct vfio_pci_device *vdev)
89e1f7d4c66d85f Alex Williamson 2012-07-31  1513  {
89e1f7d4c66d85f Alex Williamson 2012-07-31  1514  	struct pci_dev *pdev =3D=
 vdev->pdev;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1515  	u8 *map =3D vdev->pci_co=
nfig_map;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1516  	u16 epos;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1517  	__le32 *prev =3D NULL;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1518  	int loops, ret, ecaps =
=3D 0;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1519  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1520  	if (!vdev->extended_caps)
89e1f7d4c66d85f Alex Williamson 2012-07-31  1521  		return 0;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1522  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1523  	epos =3D PCI_CFG_SPACE_S=
IZE;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1524  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1525  	loops =3D (pdev->cfg_siz=
e - PCI_CFG_SPACE_SIZE) / PCI_CAP_SIZEOF;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1526  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1527  	while (loops-- && epos >=
=3D PCI_CFG_SPACE_SIZE) {
89e1f7d4c66d85f Alex Williamson 2012-07-31  1528  		u32 header;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1529  		u16 ecap;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1530  		int i, len =3D 0;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1531  		bool hidden =3D false;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1532  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1533  		ret =3D pci_read_config=
_dword(pdev, epos, &header);
89e1f7d4c66d85f Alex Williamson 2012-07-31  1534  		if (ret)
89e1f7d4c66d85f Alex Williamson 2012-07-31  1535  			return ret;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1536  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1537  		ecap =3D PCI_EXT_CAP_ID=
(header);
89e1f7d4c66d85f Alex Williamson 2012-07-31  1538  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1539  		if (ecap <=3D PCI_EXT_C=
AP_ID_MAX) {
89e1f7d4c66d85f Alex Williamson 2012-07-31  1540  			len =3D pci_ext_cap_le=
ngth[ecap];
89e1f7d4c66d85f Alex Williamson 2012-07-31  1541  			if (len =3D=3D 0xFF) {
89e1f7d4c66d85f Alex Williamson 2012-07-31  1542  				len =3D vfio_ext_cap_=
len(vdev, ecap, epos);
89e1f7d4c66d85f Alex Williamson 2012-07-31  1543  				if (len < 0)
89e1f7d4c66d85f Alex Williamson 2012-07-31 @1544  					return ret;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1545  			}
89e1f7d4c66d85f Alex Williamson 2012-07-31  1546  		}
89e1f7d4c66d85f Alex Williamson 2012-07-31  1547  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1548  		if (!len) {
a88a7b3eb076ade Bjorn Helgaas   2019-03-30  1549  			pci_info(pdev, "%s: hi=
ding ecap %#x@%#x\n",
a88a7b3eb076ade Bjorn Helgaas   2019-03-30  1550  				 __func__, ecap, epos=
);
89e1f7d4c66d85f Alex Williamson 2012-07-31  1551  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1552  			/* If not the first in=
 the chain, we can skip over it */
89e1f7d4c66d85f Alex Williamson 2012-07-31  1553  			if (prev) {
89e1f7d4c66d85f Alex Williamson 2012-07-31  1554  				u32 val =3D epos =3D =
PCI_EXT_CAP_NEXT(header);
89e1f7d4c66d85f Alex Williamson 2012-07-31  1555  				*prev &=3D cpu_to_le3=
2(~(0xffcU << 20));
89e1f7d4c66d85f Alex Williamson 2012-07-31  1556  				*prev |=3D cpu_to_le3=
2(val << 20);
89e1f7d4c66d85f Alex Williamson 2012-07-31  1557  				continue;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1558  			}
89e1f7d4c66d85f Alex Williamson 2012-07-31  1559  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1560  			/*
89e1f7d4c66d85f Alex Williamson 2012-07-31  1561  			 * Otherwise, fill in =
a placeholder, the direct
89e1f7d4c66d85f Alex Williamson 2012-07-31  1562  			 * readfn will virtual=
ize this automatically
89e1f7d4c66d85f Alex Williamson 2012-07-31  1563  			 */
89e1f7d4c66d85f Alex Williamson 2012-07-31  1564  			len =3D PCI_CAP_SIZEOF;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1565  			hidden =3D true;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1566  		}
89e1f7d4c66d85f Alex Williamson 2012-07-31  1567  =

180b1381078924b Alex Williamson 2013-04-01  1568  		for (i =3D 0; i < len; =
i++) {
180b1381078924b Alex Williamson 2013-04-01  1569  			if (likely(map[epos + =
i] =3D=3D PCI_CAP_ID_INVALID))
89e1f7d4c66d85f Alex Williamson 2012-07-31  1570  				continue;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1571  =

a88a7b3eb076ade Bjorn Helgaas   2019-03-30  1572  			pci_warn(pdev, "%s: PC=
I config conflict @%#x, was ecap %#x now ecap %#x\n",
a88a7b3eb076ade Bjorn Helgaas   2019-03-30  1573  				 __func__, epos + i, =
map[epos + i], ecap);
89e1f7d4c66d85f Alex Williamson 2012-07-31  1574  		}
89e1f7d4c66d85f Alex Williamson 2012-07-31  1575  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1576  		/*
89e1f7d4c66d85f Alex Williamson 2012-07-31  1577  		 * Even though ecap is =
2 bytes, we're currently a long way
89e1f7d4c66d85f Alex Williamson 2012-07-31  1578  		 * from exceeding 1 byt=
e capabilities.  If we ever make it
345d710491e2d2c Alex Williamson 2016-02-22  1579  		 * up to 0xFE we'll nee=
d to up this to a two-byte, byte map.
89e1f7d4c66d85f Alex Williamson 2012-07-31  1580  		 */
345d710491e2d2c Alex Williamson 2016-02-22  1581  		BUILD_BUG_ON(PCI_EXT_CA=
P_ID_MAX >=3D PCI_CAP_ID_INVALID_VIRT);
89e1f7d4c66d85f Alex Williamson 2012-07-31  1582  =

180b1381078924b Alex Williamson 2013-04-01  1583  		memset(map + epos, ecap=
, len);
89e1f7d4c66d85f Alex Williamson 2012-07-31  1584  		ret =3D vfio_fill_vconf=
ig_bytes(vdev, epos, len);
89e1f7d4c66d85f Alex Williamson 2012-07-31  1585  		if (ret)
89e1f7d4c66d85f Alex Williamson 2012-07-31  1586  			return ret;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1587  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1588  		/*
89e1f7d4c66d85f Alex Williamson 2012-07-31  1589  		 * If we're just using =
this capability to anchor the list,
89e1f7d4c66d85f Alex Williamson 2012-07-31  1590  		 * hide the real ID.  O=
nly count real ecaps.  XXX PCI spec
89e1f7d4c66d85f Alex Williamson 2012-07-31  1591  		 * indicates to use cap=
 id =3D 0, version =3D 0, next =3D 0 if
89e1f7d4c66d85f Alex Williamson 2012-07-31  1592  		 * ecaps are absent, ho=
pe users check all the way to next.
89e1f7d4c66d85f Alex Williamson 2012-07-31  1593  		 */
89e1f7d4c66d85f Alex Williamson 2012-07-31  1594  		if (hidden)
89e1f7d4c66d85f Alex Williamson 2012-07-31  1595  			*(__le32 *)&vdev->vcon=
fig[epos] &=3D
89e1f7d4c66d85f Alex Williamson 2012-07-31  1596  				cpu_to_le32((0xffcU <=
< 20));
89e1f7d4c66d85f Alex Williamson 2012-07-31  1597  		else
89e1f7d4c66d85f Alex Williamson 2012-07-31  1598  			ecaps++;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1599  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1600  		prev =3D (__le32 *)&vde=
v->vconfig[epos];
89e1f7d4c66d85f Alex Williamson 2012-07-31  1601  		epos =3D PCI_EXT_CAP_NE=
XT(header);
89e1f7d4c66d85f Alex Williamson 2012-07-31  1602  	}
89e1f7d4c66d85f Alex Williamson 2012-07-31  1603  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1604  	if (!ecaps)
89e1f7d4c66d85f Alex Williamson 2012-07-31  1605  		*(u32 *)&vdev->vconfig[=
PCI_CFG_SPACE_SIZE] =3D 0;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1606  =

89e1f7d4c66d85f Alex Williamson 2012-07-31  1607  	return 0;
89e1f7d4c66d85f Alex Williamson 2012-07-31  1608  }
89e1f7d4c66d85f Alex Williamson 2012-07-31  1609  =


:::::: The code at line 1544 was first introduced by commit
:::::: 89e1f7d4c66d85f42c3d52ea3866eb10cadf6153 vfio: Add PCI device driver

:::::: TO: Alex Williamson <alex.williamson@redhat.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8971615763248501808==--

