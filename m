Content-Type: multipart/mixed; boundary="===============2229498429848316613=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gvt/kvmgt.c:1496 intel_vgpu_ioctl() warn: potential spectre issue 'vgpu->cfg_space.bar' [r]
Date: Thu, 06 Jan 2022 14:57:35 +0800
Message-ID: <202201061421.G9ZP1Hku-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2229498429848316613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Cornelia Huck <cohuck@redhat.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Kirti Wankhede <kwankhede@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   75acfdb6fd922598a408a0d864486aeb167c1a97
commit: af3ab3f9b986cdbc1b97b8a3341ce78851edb0dd vfio/mdev: Remove CONFIG_V=
FIO_MDEV_DEVICE
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-m001-20220105 (https://download.01.org/0day-ci/ar=
chive/20220106/202201061421.G9ZP1Hku-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/gvt/kvmgt.c:1496 intel_vgpu_ioctl() warn: potential sp=
ectre issue 'vgpu->cfg_space.bar' [r]
drivers/gpu/drm/i915/gvt/kvmgt.c:1566 intel_vgpu_ioctl() warn: potential sp=
ectre issue 'vdev->region' [r]

vim +1496 drivers/gpu/drm/i915/gvt/kvmgt.c

659643f7d81432 Jike Song           2016-12-08  1440  =

659643f7d81432 Jike Song           2016-12-08  1441  static long intel_vgpu=
_ioctl(struct mdev_device *mdev, unsigned int cmd,
659643f7d81432 Jike Song           2016-12-08  1442  			     unsigned long =
arg)
659643f7d81432 Jike Song           2016-12-08  1443  {
659643f7d81432 Jike Song           2016-12-08  1444  	struct intel_vgpu *vg=
pu =3D mdev_get_drvdata(mdev);
06d63c48dd30b9 Julian Stecklina    2020-02-17  1445  	struct kvmgt_vdev *vd=
ev =3D kvmgt_vdev(vgpu);
659643f7d81432 Jike Song           2016-12-08  1446  	unsigned long minsz;
659643f7d81432 Jike Song           2016-12-08  1447  =

659643f7d81432 Jike Song           2016-12-08  1448  	gvt_dbg_core("vgpu%d =
ioctl, cmd: %d\n", vgpu->id, cmd);
659643f7d81432 Jike Song           2016-12-08  1449  =

659643f7d81432 Jike Song           2016-12-08  1450  	if (cmd =3D=3D VFIO_D=
EVICE_GET_INFO) {
659643f7d81432 Jike Song           2016-12-08  1451  		struct vfio_device_i=
nfo info;
659643f7d81432 Jike Song           2016-12-08  1452  =

659643f7d81432 Jike Song           2016-12-08  1453  		minsz =3D offsetofen=
d(struct vfio_device_info, num_irqs);
659643f7d81432 Jike Song           2016-12-08  1454  =

659643f7d81432 Jike Song           2016-12-08  1455  		if (copy_from_user(&=
info, (void __user *)arg, minsz))
659643f7d81432 Jike Song           2016-12-08  1456  			return -EFAULT;
659643f7d81432 Jike Song           2016-12-08  1457  =

659643f7d81432 Jike Song           2016-12-08  1458  		if (info.argsz < min=
sz)
659643f7d81432 Jike Song           2016-12-08  1459  			return -EINVAL;
659643f7d81432 Jike Song           2016-12-08  1460  =

659643f7d81432 Jike Song           2016-12-08  1461  		info.flags =3D VFIO_=
DEVICE_FLAGS_PCI;
659643f7d81432 Jike Song           2016-12-08  1462  		info.flags |=3D VFIO=
_DEVICE_FLAGS_RESET;
b851adeac0858c Tina Zhang          2017-11-20  1463  		info.num_regions =3D=
 VFIO_PCI_NUM_REGIONS +
06d63c48dd30b9 Julian Stecklina    2020-02-17  1464  				vdev->num_regions;
659643f7d81432 Jike Song           2016-12-08  1465  		info.num_irqs =3D VF=
IO_PCI_NUM_IRQS;
659643f7d81432 Jike Song           2016-12-08  1466  =

659643f7d81432 Jike Song           2016-12-08  1467  		return copy_to_user(=
(void __user *)arg, &info, minsz) ?
659643f7d81432 Jike Song           2016-12-08  1468  			-EFAULT : 0;
659643f7d81432 Jike Song           2016-12-08  1469  =

659643f7d81432 Jike Song           2016-12-08  1470  	} else if (cmd =3D=3D=
 VFIO_DEVICE_GET_REGION_INFO) {
659643f7d81432 Jike Song           2016-12-08  1471  		struct vfio_region_i=
nfo info;
659643f7d81432 Jike Song           2016-12-08  1472  		struct vfio_info_cap=
 caps =3D { .buf =3D NULL, .size =3D 0 };
de5372da605d3b Gustavo A. R. Silva 2018-08-02  1473  		unsigned int i;
de5372da605d3b Gustavo A. R. Silva 2018-08-02  1474  		int ret;
659643f7d81432 Jike Song           2016-12-08  1475  		struct vfio_region_i=
nfo_cap_sparse_mmap *sparse =3D NULL;
659643f7d81432 Jike Song           2016-12-08  1476  		int nr_areas =3D 1;
659643f7d81432 Jike Song           2016-12-08  1477  		int cap_type_id;
659643f7d81432 Jike Song           2016-12-08  1478  =

659643f7d81432 Jike Song           2016-12-08  1479  		minsz =3D offsetofen=
d(struct vfio_region_info, offset);
659643f7d81432 Jike Song           2016-12-08  1480  =

659643f7d81432 Jike Song           2016-12-08  1481  		if (copy_from_user(&=
info, (void __user *)arg, minsz))
659643f7d81432 Jike Song           2016-12-08  1482  			return -EFAULT;
659643f7d81432 Jike Song           2016-12-08  1483  =

659643f7d81432 Jike Song           2016-12-08  1484  		if (info.argsz < min=
sz)
659643f7d81432 Jike Song           2016-12-08  1485  			return -EINVAL;
659643f7d81432 Jike Song           2016-12-08  1486  =

659643f7d81432 Jike Song           2016-12-08  1487  		switch (info.index) {
659643f7d81432 Jike Song           2016-12-08  1488  		case VFIO_PCI_CONFIG=
_REGION_INDEX:
659643f7d81432 Jike Song           2016-12-08  1489  			info.offset =3D VFI=
O_PCI_INDEX_TO_OFFSET(info.index);
02d578e5edd980 Changbin Du         2017-08-23  1490  			info.size =3D vgpu-=
>gvt->device_info.cfg_space_size;
659643f7d81432 Jike Song           2016-12-08  1491  			info.flags =3D VFIO=
_REGION_INFO_FLAG_READ |
659643f7d81432 Jike Song           2016-12-08  1492  				     VFIO_REGION_I=
NFO_FLAG_WRITE;
659643f7d81432 Jike Song           2016-12-08  1493  			break;
659643f7d81432 Jike Song           2016-12-08  1494  		case VFIO_PCI_BAR0_R=
EGION_INDEX:
659643f7d81432 Jike Song           2016-12-08  1495  			info.offset =3D VFI=
O_PCI_INDEX_TO_OFFSET(info.index);
659643f7d81432 Jike Song           2016-12-08 @1496  			info.size =3D vgpu-=
>cfg_space.bar[info.index].size;
659643f7d81432 Jike Song           2016-12-08  1497  			if (!info.size) {
659643f7d81432 Jike Song           2016-12-08  1498  				info.flags =3D 0;
659643f7d81432 Jike Song           2016-12-08  1499  				break;
659643f7d81432 Jike Song           2016-12-08  1500  			}
659643f7d81432 Jike Song           2016-12-08  1501  =

659643f7d81432 Jike Song           2016-12-08  1502  			info.flags =3D VFIO=
_REGION_INFO_FLAG_READ |
659643f7d81432 Jike Song           2016-12-08  1503  				     VFIO_REGION_I=
NFO_FLAG_WRITE;
659643f7d81432 Jike Song           2016-12-08  1504  			break;
659643f7d81432 Jike Song           2016-12-08  1505  		case VFIO_PCI_BAR1_R=
EGION_INDEX:
659643f7d81432 Jike Song           2016-12-08  1506  			info.offset =3D VFI=
O_PCI_INDEX_TO_OFFSET(info.index);
659643f7d81432 Jike Song           2016-12-08  1507  			info.size =3D 0;
659643f7d81432 Jike Song           2016-12-08  1508  			info.flags =3D 0;
659643f7d81432 Jike Song           2016-12-08  1509  			break;
659643f7d81432 Jike Song           2016-12-08  1510  		case VFIO_PCI_BAR2_R=
EGION_INDEX:
659643f7d81432 Jike Song           2016-12-08  1511  			info.offset =3D VFI=
O_PCI_INDEX_TO_OFFSET(info.index);
659643f7d81432 Jike Song           2016-12-08  1512  			info.flags =3D VFIO=
_REGION_INFO_FLAG_CAPS |
659643f7d81432 Jike Song           2016-12-08  1513  					VFIO_REGION_INFO_=
FLAG_MMAP |
659643f7d81432 Jike Song           2016-12-08  1514  					VFIO_REGION_INFO_=
FLAG_READ |
659643f7d81432 Jike Song           2016-12-08  1515  					VFIO_REGION_INFO_=
FLAG_WRITE;
659643f7d81432 Jike Song           2016-12-08  1516  			info.size =3D gvt_a=
perture_sz(vgpu->gvt);
659643f7d81432 Jike Song           2016-12-08  1517  =

cd3e05836fc665 Gustavo A. R. Silva 2019-05-24  1518  			sparse =3D kzalloc(=
struct_size(sparse, areas, nr_areas),
cd3e05836fc665 Gustavo A. R. Silva 2019-05-24  1519  					 GFP_KERNEL);
659643f7d81432 Jike Song           2016-12-08  1520  			if (!sparse)
659643f7d81432 Jike Song           2016-12-08  1521  				return -ENOMEM;
659643f7d81432 Jike Song           2016-12-08  1522  =

dda01f787df9f9 Alex Williamson     2017-12-12  1523  			sparse->header.id =
=3D VFIO_REGION_INFO_CAP_SPARSE_MMAP;
dda01f787df9f9 Alex Williamson     2017-12-12  1524  			sparse->header.vers=
ion =3D 1;
659643f7d81432 Jike Song           2016-12-08  1525  			sparse->nr_areas =
=3D nr_areas;
659643f7d81432 Jike Song           2016-12-08  1526  			cap_type_id =3D VFI=
O_REGION_INFO_CAP_SPARSE_MMAP;
659643f7d81432 Jike Song           2016-12-08  1527  			sparse->areas[0].of=
fset =3D
659643f7d81432 Jike Song           2016-12-08  1528  					PAGE_ALIGN(vgpu_a=
perture_offset(vgpu));
659643f7d81432 Jike Song           2016-12-08  1529  			sparse->areas[0].si=
ze =3D vgpu_aperture_sz(vgpu);
659643f7d81432 Jike Song           2016-12-08  1530  			break;
659643f7d81432 Jike Song           2016-12-08  1531  =

659643f7d81432 Jike Song           2016-12-08  1532  		case VFIO_PCI_BAR3_R=
EGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
659643f7d81432 Jike Song           2016-12-08  1533  			info.offset =3D VFI=
O_PCI_INDEX_TO_OFFSET(info.index);
659643f7d81432 Jike Song           2016-12-08  1534  			info.size =3D 0;
659643f7d81432 Jike Song           2016-12-08  1535  			info.flags =3D 0;
072ec93d50fd4c Pei Zhang           2017-12-08  1536  =

659643f7d81432 Jike Song           2016-12-08  1537  			gvt_dbg_core("get r=
egion info bar:%d\n", info.index);
659643f7d81432 Jike Song           2016-12-08  1538  			break;
659643f7d81432 Jike Song           2016-12-08  1539  =

659643f7d81432 Jike Song           2016-12-08  1540  		case VFIO_PCI_ROM_RE=
GION_INDEX:
659643f7d81432 Jike Song           2016-12-08  1541  		case VFIO_PCI_VGA_RE=
GION_INDEX:
072ec93d50fd4c Pei Zhang           2017-12-08  1542  			info.offset =3D VFI=
O_PCI_INDEX_TO_OFFSET(info.index);
072ec93d50fd4c Pei Zhang           2017-12-08  1543  			info.size =3D 0;
072ec93d50fd4c Pei Zhang           2017-12-08  1544  			info.flags =3D 0;
072ec93d50fd4c Pei Zhang           2017-12-08  1545  =

659643f7d81432 Jike Song           2016-12-08  1546  			gvt_dbg_core("get r=
egion info index:%d\n", info.index);
659643f7d81432 Jike Song           2016-12-08  1547  			break;
659643f7d81432 Jike Song           2016-12-08  1548  		default:
659643f7d81432 Jike Song           2016-12-08  1549  			{
dda01f787df9f9 Alex Williamson     2017-12-12  1550  				struct vfio_region=
_info_cap_type cap_type =3D {
dda01f787df9f9 Alex Williamson     2017-12-12  1551  					.header.id =3D VF=
IO_REGION_INFO_CAP_TYPE,
dda01f787df9f9 Alex Williamson     2017-12-12  1552  					.header.version =
=3D 1 };
659643f7d81432 Jike Song           2016-12-08  1553  =

659643f7d81432 Jike Song           2016-12-08  1554  				if (info.index >=
=3D VFIO_PCI_NUM_REGIONS +
06d63c48dd30b9 Julian Stecklina    2020-02-17  1555  						vdev->num_region=
s)
659643f7d81432 Jike Song           2016-12-08  1556  					return -EINVAL;
de5372da605d3b Gustavo A. R. Silva 2018-08-02  1557  				info.index =3D
de5372da605d3b Gustavo A. R. Silva 2018-08-02  1558  					array_index_nospe=
c(info.index,
de5372da605d3b Gustavo A. R. Silva 2018-08-02  1559  							VFIO_PCI_NUM_RE=
GIONS +
06d63c48dd30b9 Julian Stecklina    2020-02-17  1560  							vdev->num_regio=
ns);
659643f7d81432 Jike Song           2016-12-08  1561  =

659643f7d81432 Jike Song           2016-12-08  1562  				i =3D info.index -=
 VFIO_PCI_NUM_REGIONS;
659643f7d81432 Jike Song           2016-12-08  1563  =

659643f7d81432 Jike Song           2016-12-08  1564  				info.offset =3D
659643f7d81432 Jike Song           2016-12-08  1565  					VFIO_PCI_INDEX_TO=
_OFFSET(info.index);
06d63c48dd30b9 Julian Stecklina    2020-02-17 @1566  				info.size =3D vdev=
->region[i].size;
06d63c48dd30b9 Julian Stecklina    2020-02-17  1567  				info.flags =3D vde=
v->region[i].flags;
659643f7d81432 Jike Song           2016-12-08  1568  =

06d63c48dd30b9 Julian Stecklina    2020-02-17  1569  				cap_type.type =3D =
vdev->region[i].type;
06d63c48dd30b9 Julian Stecklina    2020-02-17  1570  				cap_type.subtype =
=3D vdev->region[i].subtype;
659643f7d81432 Jike Song           2016-12-08  1571  =

659643f7d81432 Jike Song           2016-12-08  1572  				ret =3D vfio_info_=
add_capability(&caps,
dda01f787df9f9 Alex Williamson     2017-12-12  1573  							&cap_type.heade=
r,
dda01f787df9f9 Alex Williamson     2017-12-12  1574  							sizeof(cap_type=
));
659643f7d81432 Jike Song           2016-12-08  1575  				if (ret)
659643f7d81432 Jike Song           2016-12-08  1576  					return ret;
659643f7d81432 Jike Song           2016-12-08  1577  			}
659643f7d81432 Jike Song           2016-12-08  1578  		}
659643f7d81432 Jike Song           2016-12-08  1579  =

659643f7d81432 Jike Song           2016-12-08  1580  		if ((info.flags & VF=
IO_REGION_INFO_FLAG_CAPS) && sparse) {
659643f7d81432 Jike Song           2016-12-08  1581  			switch (cap_type_id=
) {
659643f7d81432 Jike Song           2016-12-08  1582  			case VFIO_REGION_IN=
FO_CAP_SPARSE_MMAP:
659643f7d81432 Jike Song           2016-12-08  1583  				ret =3D vfio_info_=
add_capability(&caps,
cd3e05836fc665 Gustavo A. R. Silva 2019-05-24  1584  					&sparse->header,
cd3e05836fc665 Gustavo A. R. Silva 2019-05-24  1585  					struct_size(spars=
e, areas,
cd3e05836fc665 Gustavo A. R. Silva 2019-05-24  1586  						    sparse->nr_a=
reas));
7590ebb8b45646 Yi Wang             2018-08-08  1587  				if (ret) {
659643f7d81432 Jike Song           2016-12-08  1588  					kfree(sparse);
659643f7d81432 Jike Song           2016-12-08  1589  					return ret;
7590ebb8b45646 Yi Wang             2018-08-08  1590  				}
659643f7d81432 Jike Song           2016-12-08  1591  				break;
659643f7d81432 Jike Song           2016-12-08  1592  			default:
7590ebb8b45646 Yi Wang             2018-08-08  1593  				kfree(sparse);
659643f7d81432 Jike Song           2016-12-08  1594  				return -EINVAL;
659643f7d81432 Jike Song           2016-12-08  1595  			}
659643f7d81432 Jike Song           2016-12-08  1596  		}
659643f7d81432 Jike Song           2016-12-08  1597  =

659643f7d81432 Jike Song           2016-12-08  1598  		if (caps.size) {
b851adeac0858c Tina Zhang          2017-11-20  1599  			info.flags |=3D VFI=
O_REGION_INFO_FLAG_CAPS;
659643f7d81432 Jike Song           2016-12-08  1600  			if (info.argsz < si=
zeof(info) + caps.size) {
659643f7d81432 Jike Song           2016-12-08  1601  				info.argsz =3D siz=
eof(info) + caps.size;
659643f7d81432 Jike Song           2016-12-08  1602  				info.cap_offset =
=3D 0;
659643f7d81432 Jike Song           2016-12-08  1603  			} else {
659643f7d81432 Jike Song           2016-12-08  1604  				vfio_info_cap_shif=
t(&caps, sizeof(info));
659643f7d81432 Jike Song           2016-12-08  1605  				if (copy_to_user((=
void __user *)arg +
659643f7d81432 Jike Song           2016-12-08  1606  						  sizeof(info), =
caps.buf,
659643f7d81432 Jike Song           2016-12-08  1607  						  caps.size)) {
659643f7d81432 Jike Song           2016-12-08  1608  					kfree(caps.buf);
7590ebb8b45646 Yi Wang             2018-08-08  1609  					kfree(sparse);
659643f7d81432 Jike Song           2016-12-08  1610  					return -EFAULT;
659643f7d81432 Jike Song           2016-12-08  1611  				}
659643f7d81432 Jike Song           2016-12-08  1612  				info.cap_offset =
=3D sizeof(info);
659643f7d81432 Jike Song           2016-12-08  1613  			}
659643f7d81432 Jike Song           2016-12-08  1614  =

659643f7d81432 Jike Song           2016-12-08  1615  			kfree(caps.buf);
659643f7d81432 Jike Song           2016-12-08  1616  		}
659643f7d81432 Jike Song           2016-12-08  1617  =

7590ebb8b45646 Yi Wang             2018-08-08  1618  		kfree(sparse);
659643f7d81432 Jike Song           2016-12-08  1619  		return copy_to_user(=
(void __user *)arg, &info, minsz) ?
659643f7d81432 Jike Song           2016-12-08  1620  			-EFAULT : 0;
659643f7d81432 Jike Song           2016-12-08  1621  	} else if (cmd =3D=3D=
 VFIO_DEVICE_GET_IRQ_INFO) {
659643f7d81432 Jike Song           2016-12-08  1622  		struct vfio_irq_info=
 info;
659643f7d81432 Jike Song           2016-12-08  1623  =

659643f7d81432 Jike Song           2016-12-08  1624  		minsz =3D offsetofen=
d(struct vfio_irq_info, count);
659643f7d81432 Jike Song           2016-12-08  1625  =

659643f7d81432 Jike Song           2016-12-08  1626  		if (copy_from_user(&=
info, (void __user *)arg, minsz))
659643f7d81432 Jike Song           2016-12-08  1627  			return -EFAULT;
659643f7d81432 Jike Song           2016-12-08  1628  =

659643f7d81432 Jike Song           2016-12-08  1629  		if (info.argsz < min=
sz || info.index >=3D VFIO_PCI_NUM_IRQS)
659643f7d81432 Jike Song           2016-12-08  1630  			return -EINVAL;
659643f7d81432 Jike Song           2016-12-08  1631  =

659643f7d81432 Jike Song           2016-12-08  1632  		switch (info.index) {
659643f7d81432 Jike Song           2016-12-08  1633  		case VFIO_PCI_INTX_I=
RQ_INDEX:
659643f7d81432 Jike Song           2016-12-08  1634  		case VFIO_PCI_MSI_IR=
Q_INDEX:
659643f7d81432 Jike Song           2016-12-08  1635  			break;
659643f7d81432 Jike Song           2016-12-08  1636  		default:
659643f7d81432 Jike Song           2016-12-08  1637  			return -EINVAL;
659643f7d81432 Jike Song           2016-12-08  1638  		}
659643f7d81432 Jike Song           2016-12-08  1639  =

659643f7d81432 Jike Song           2016-12-08  1640  		info.flags =3D VFIO_=
IRQ_INFO_EVENTFD;
659643f7d81432 Jike Song           2016-12-08  1641  =

659643f7d81432 Jike Song           2016-12-08  1642  		info.count =3D intel=
_vgpu_get_irq_count(vgpu, info.index);
659643f7d81432 Jike Song           2016-12-08  1643  =

659643f7d81432 Jike Song           2016-12-08  1644  		if (info.index =3D=
=3D VFIO_PCI_INTX_IRQ_INDEX)
659643f7d81432 Jike Song           2016-12-08  1645  			info.flags |=3D (VF=
IO_IRQ_INFO_MASKABLE |
659643f7d81432 Jike Song           2016-12-08  1646  				       VFIO_IRQ_IN=
FO_AUTOMASKED);
659643f7d81432 Jike Song           2016-12-08  1647  		else
659643f7d81432 Jike Song           2016-12-08  1648  			info.flags |=3D VFI=
O_IRQ_INFO_NORESIZE;
659643f7d81432 Jike Song           2016-12-08  1649  =

659643f7d81432 Jike Song           2016-12-08  1650  		return copy_to_user(=
(void __user *)arg, &info, minsz) ?
659643f7d81432 Jike Song           2016-12-08  1651  			-EFAULT : 0;
659643f7d81432 Jike Song           2016-12-08  1652  	} else if (cmd =3D=3D=
 VFIO_DEVICE_SET_IRQS) {
659643f7d81432 Jike Song           2016-12-08  1653  		struct vfio_irq_set =
hdr;
659643f7d81432 Jike Song           2016-12-08  1654  		u8 *data =3D NULL;
659643f7d81432 Jike Song           2016-12-08  1655  		int ret =3D 0;
659643f7d81432 Jike Song           2016-12-08  1656  		size_t data_size =3D=
 0;
659643f7d81432 Jike Song           2016-12-08  1657  =

659643f7d81432 Jike Song           2016-12-08  1658  		minsz =3D offsetofen=
d(struct vfio_irq_set, count);
659643f7d81432 Jike Song           2016-12-08  1659  =

659643f7d81432 Jike Song           2016-12-08  1660  		if (copy_from_user(&=
hdr, (void __user *)arg, minsz))
659643f7d81432 Jike Song           2016-12-08  1661  			return -EFAULT;
659643f7d81432 Jike Song           2016-12-08  1662  =

659643f7d81432 Jike Song           2016-12-08  1663  		if (!(hdr.flags & VF=
IO_IRQ_SET_DATA_NONE)) {
659643f7d81432 Jike Song           2016-12-08  1664  			int max =3D intel_v=
gpu_get_irq_count(vgpu, hdr.index);
659643f7d81432 Jike Song           2016-12-08  1665  =

659643f7d81432 Jike Song           2016-12-08  1666  			ret =3D vfio_set_ir=
qs_validate_and_prepare(&hdr, max,
659643f7d81432 Jike Song           2016-12-08  1667  						VFIO_PCI_NUM_IRQ=
S, &data_size);
659643f7d81432 Jike Song           2016-12-08  1668  			if (ret) {
695fbc08d80f93 Tina Zhang          2017-03-10  1669  				gvt_vgpu_err("inte=
l:vfio_set_irqs_validate_and_prepare failed\n");
659643f7d81432 Jike Song           2016-12-08  1670  				return -EINVAL;
659643f7d81432 Jike Song           2016-12-08  1671  			}
659643f7d81432 Jike Song           2016-12-08  1672  			if (data_size) {
659643f7d81432 Jike Song           2016-12-08  1673  				data =3D memdup_us=
er((void __user *)(arg + minsz),
659643f7d81432 Jike Song           2016-12-08  1674  						   data_size);
659643f7d81432 Jike Song           2016-12-08  1675  				if (IS_ERR(data))
659643f7d81432 Jike Song           2016-12-08  1676  					return PTR_ERR(da=
ta);
659643f7d81432 Jike Song           2016-12-08  1677  			}
659643f7d81432 Jike Song           2016-12-08  1678  		}
659643f7d81432 Jike Song           2016-12-08  1679  =

659643f7d81432 Jike Song           2016-12-08  1680  		ret =3D intel_vgpu_s=
et_irqs(vgpu, hdr.flags, hdr.index,
659643f7d81432 Jike Song           2016-12-08  1681  					hdr.start, hdr.co=
unt, data);
659643f7d81432 Jike Song           2016-12-08  1682  		kfree(data);
659643f7d81432 Jike Song           2016-12-08  1683  =

659643f7d81432 Jike Song           2016-12-08  1684  		return ret;
659643f7d81432 Jike Song           2016-12-08  1685  	} else if (cmd =3D=3D=
 VFIO_DEVICE_RESET) {
659643f7d81432 Jike Song           2016-12-08  1686  		intel_gvt_ops->vgpu_=
reset(vgpu);
659643f7d81432 Jike Song           2016-12-08  1687  		return 0;
e546e281d33d1f Tina Zhang          2017-11-23  1688  	} else if (cmd =3D=3D=
 VFIO_DEVICE_QUERY_GFX_PLANE) {
e546e281d33d1f Tina Zhang          2017-11-23  1689  		struct vfio_device_g=
fx_plane_info dmabuf;
e546e281d33d1f Tina Zhang          2017-11-23  1690  		int ret =3D 0;
e546e281d33d1f Tina Zhang          2017-11-23  1691  =

e546e281d33d1f Tina Zhang          2017-11-23  1692  		minsz =3D offsetofen=
d(struct vfio_device_gfx_plane_info,
e546e281d33d1f Tina Zhang          2017-11-23  1693  				    dmabuf_id);
e546e281d33d1f Tina Zhang          2017-11-23  1694  		if (copy_from_user(&=
dmabuf, (void __user *)arg, minsz))
e546e281d33d1f Tina Zhang          2017-11-23  1695  			return -EFAULT;
e546e281d33d1f Tina Zhang          2017-11-23  1696  		if (dmabuf.argsz < m=
insz)
e546e281d33d1f Tina Zhang          2017-11-23  1697  			return -EINVAL;
e546e281d33d1f Tina Zhang          2017-11-23  1698  =

e546e281d33d1f Tina Zhang          2017-11-23  1699  		ret =3D intel_gvt_op=
s->vgpu_query_plane(vgpu, &dmabuf);
e546e281d33d1f Tina Zhang          2017-11-23  1700  		if (ret !=3D 0)
e546e281d33d1f Tina Zhang          2017-11-23  1701  			return ret;
e546e281d33d1f Tina Zhang          2017-11-23  1702  =

e546e281d33d1f Tina Zhang          2017-11-23  1703  		return copy_to_user(=
(void __user *)arg, &dmabuf, minsz) ?
e546e281d33d1f Tina Zhang          2017-11-23  1704  								-EFAULT : 0;
e546e281d33d1f Tina Zhang          2017-11-23  1705  	} else if (cmd =3D=3D=
 VFIO_DEVICE_GET_GFX_DMABUF) {
e546e281d33d1f Tina Zhang          2017-11-23  1706  		__u32 dmabuf_id;
e546e281d33d1f Tina Zhang          2017-11-23  1707  		__s32 dmabuf_fd;
e546e281d33d1f Tina Zhang          2017-11-23  1708  =

e546e281d33d1f Tina Zhang          2017-11-23  1709  		if (get_user(dmabuf_=
id, (__u32 __user *)arg))
e546e281d33d1f Tina Zhang          2017-11-23  1710  			return -EFAULT;
e546e281d33d1f Tina Zhang          2017-11-23  1711  =

e546e281d33d1f Tina Zhang          2017-11-23  1712  		dmabuf_fd =3D intel_=
gvt_ops->vgpu_get_dmabuf(vgpu, dmabuf_id);
e546e281d33d1f Tina Zhang          2017-11-23  1713  		return dmabuf_fd;
e546e281d33d1f Tina Zhang          2017-11-23  1714  =

659643f7d81432 Jike Song           2016-12-08  1715  	}
659643f7d81432 Jike Song           2016-12-08  1716  =

9f591ae60e1be0 Gerd Hoffmann       2018-03-21  1717  	return -ENOTTY;
659643f7d81432 Jike Song           2016-12-08  1718  }
659643f7d81432 Jike Song           2016-12-08  1719  =


:::::: The code at line 1496 was first introduced by commit
:::::: 659643f7d81432189c2c87230e2feee4c75c14c1 drm/i915/gvt/kvmgt: add vfi=
o/mdev support to KVMGT

:::::: TO: Jike Song <jike.song@intel.com>
:::::: CC: Zhenyu Wang <zhenyuw@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2229498429848316613==--

