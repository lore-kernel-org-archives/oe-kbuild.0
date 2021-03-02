Content-Type: multipart/mixed; boundary="===============5508604627681284784=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jgunthorpe:pr/3 41/49] drivers/vfio/pci/vfio_pci.c:891:23-24: WARNING this kind of initialization is deprecated (https://www.kernel.org/doc/html/latest/process/deprecated.html#uninitialized-var)
Date: Tue, 02 Mar 2021 17:17:23 +0800
Message-ID: <202103021719.s09KDz55-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5508604627681284784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux pr/3
head:   149ed847a48641c2da496c00eec4d077d1ce61a6
commit: a310ee236e20e2bc5defd5d5c3bec23d89c132bd [41/49] vfio/pci: Get rid =
of vfio_pci_device pdev
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm64-randconfig-c003-20210302 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


"coccinelle warnings: (new ones prefixed by >>)"
>> drivers/vfio/pci/vfio_pci.c:891:23-24: WARNING this kind of initializati=
on is deprecated (https://www.kernel.org/doc/html/latest/process/deprecated=
.html#uninitialized-var)

vim +891 drivers/vfio/pci/vfio_pci.c

abafbc551fdded Alex Williamson         2020-04-22   824  =

3276126e86c808 Jason Gunthorpe         2021-02-19   825  static long vfio_p=
ci_ioctl(struct vfio_device *core_vdev,
89e1f7d4c66d85 Alex Williamson         2012-07-31   826  			   unsigned int=
 cmd, unsigned long arg)
89e1f7d4c66d85 Alex Williamson         2012-07-31   827  {
3276126e86c808 Jason Gunthorpe         2021-02-19   828  	struct vfio_pci_d=
evice *vdev =3D
3276126e86c808 Jason Gunthorpe         2021-02-19   829  		container_of(cor=
e_vdev, struct vfio_pci_device, vdev);
a310ee236e20e2 Jason Gunthorpe         2021-02-19   830  	struct pci_dev *p=
dev =3D to_pci_dev(vdev->vdev.dev);
89e1f7d4c66d85 Alex Williamson         2012-07-31   831  	unsigned long min=
sz;
89e1f7d4c66d85 Alex Williamson         2012-07-31   832  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   833  	if (cmd =3D=3D VF=
IO_DEVICE_GET_INFO) {
89e1f7d4c66d85 Alex Williamson         2012-07-31   834  		struct vfio_devi=
ce_info info;
e6b817d4b8217a Matthew Rosato          2020-10-07   835  		struct vfio_info=
_cap caps =3D { .buf =3D NULL, .size =3D 0 };
e6b817d4b8217a Matthew Rosato          2020-10-07   836  		unsigned long ca=
psz;
b9abef43a08ef7 Max Gurtovoy            2021-02-18   837  		int ret;
89e1f7d4c66d85 Alex Williamson         2012-07-31   838  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   839  		minsz =3D offset=
ofend(struct vfio_device_info, num_irqs);
89e1f7d4c66d85 Alex Williamson         2012-07-31   840  =

e6b817d4b8217a Matthew Rosato          2020-10-07   841  		/* For backward =
compatibility, cannot require this */
e6b817d4b8217a Matthew Rosato          2020-10-07   842  		capsz =3D offset=
ofend(struct vfio_iommu_type1_info, cap_offset);
e6b817d4b8217a Matthew Rosato          2020-10-07   843  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   844  		if (copy_from_us=
er(&info, (void __user *)arg, minsz))
89e1f7d4c66d85 Alex Williamson         2012-07-31   845  			return -EFAULT;
89e1f7d4c66d85 Alex Williamson         2012-07-31   846  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   847  		if (info.argsz <=
 minsz)
89e1f7d4c66d85 Alex Williamson         2012-07-31   848  			return -EINVAL;
89e1f7d4c66d85 Alex Williamson         2012-07-31   849  =

e6b817d4b8217a Matthew Rosato          2020-10-07   850  		if (info.argsz >=
=3D capsz) {
e6b817d4b8217a Matthew Rosato          2020-10-07   851  			minsz =3D capsz;
e6b817d4b8217a Matthew Rosato          2020-10-07   852  			info.cap_offset=
 =3D 0;
e6b817d4b8217a Matthew Rosato          2020-10-07   853  		}
e6b817d4b8217a Matthew Rosato          2020-10-07   854  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   855  		info.flags =3D V=
FIO_DEVICE_FLAGS_PCI;
89e1f7d4c66d85 Alex Williamson         2012-07-31   856  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   857  		if (vdev->reset_=
works)
89e1f7d4c66d85 Alex Williamson         2012-07-31   858  			info.flags |=3D=
 VFIO_DEVICE_FLAGS_RESET;
89e1f7d4c66d85 Alex Williamson         2012-07-31   859  =

28541d41c9e04c Alex Williamson         2016-02-22   860  		info.num_regions=
 =3D VFIO_PCI_NUM_REGIONS + vdev->num_regions;
89e1f7d4c66d85 Alex Williamson         2012-07-31   861  		info.num_irqs =
=3D VFIO_PCI_NUM_IRQS;
89e1f7d4c66d85 Alex Williamson         2012-07-31   862  =

b9abef43a08ef7 Max Gurtovoy            2021-02-18   863  		ret =3D vfio_pci=
_info_zdev_add_caps(vdev, &caps);
e6b817d4b8217a Matthew Rosato          2020-10-07   864  		if (ret && ret !=
=3D -ENODEV) {
a310ee236e20e2 Jason Gunthorpe         2021-02-19   865  			pci_warn(pdev, =
"Failed to setup zPCI info capabilities\n");
e6b817d4b8217a Matthew Rosato          2020-10-07   866  			return ret;
e6b817d4b8217a Matthew Rosato          2020-10-07   867  		}
e6b817d4b8217a Matthew Rosato          2020-10-07   868  =

e6b817d4b8217a Matthew Rosato          2020-10-07   869  		if (caps.size) {
e6b817d4b8217a Matthew Rosato          2020-10-07   870  			info.flags |=3D=
 VFIO_DEVICE_FLAGS_CAPS;
e6b817d4b8217a Matthew Rosato          2020-10-07   871  			if (info.argsz =
< sizeof(info) + caps.size) {
e6b817d4b8217a Matthew Rosato          2020-10-07   872  				info.argsz =3D=
 sizeof(info) + caps.size;
e6b817d4b8217a Matthew Rosato          2020-10-07   873  			} else {
e6b817d4b8217a Matthew Rosato          2020-10-07   874  				vfio_info_cap_=
shift(&caps, sizeof(info));
e6b817d4b8217a Matthew Rosato          2020-10-07   875  				if (copy_to_us=
er((void __user *)arg +
e6b817d4b8217a Matthew Rosato          2020-10-07   876  						  sizeof(inf=
o), caps.buf,
e6b817d4b8217a Matthew Rosato          2020-10-07   877  						  caps.size)=
) {
e6b817d4b8217a Matthew Rosato          2020-10-07   878  					kfree(caps.bu=
f);
e6b817d4b8217a Matthew Rosato          2020-10-07   879  					return -EFAUL=
T;
e6b817d4b8217a Matthew Rosato          2020-10-07   880  				}
e6b817d4b8217a Matthew Rosato          2020-10-07   881  				info.cap_offse=
t =3D sizeof(info);
e6b817d4b8217a Matthew Rosato          2020-10-07   882  			}
e6b817d4b8217a Matthew Rosato          2020-10-07   883  =

e6b817d4b8217a Matthew Rosato          2020-10-07   884  			kfree(caps.buf);
e6b817d4b8217a Matthew Rosato          2020-10-07   885  		}
e6b817d4b8217a Matthew Rosato          2020-10-07   886  =

8160c4e455820d Michael S. Tsirkin      2016-02-28   887  		return copy_to_u=
ser((void __user *)arg, &info, minsz) ?
8160c4e455820d Michael S. Tsirkin      2016-02-28   888  			-EFAULT : 0;
89e1f7d4c66d85 Alex Williamson         2012-07-31   889  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   890  	} else if (cmd =
=3D=3D VFIO_DEVICE_GET_REGION_INFO) {
a310ee236e20e2 Jason Gunthorpe         2021-02-19  @891  		struct pci_dev *=
pdev =3D pdev;
89e1f7d4c66d85 Alex Williamson         2012-07-31   892  		struct vfio_regi=
on_info info;
188ad9d6cbbce4 Alex Williamson         2016-02-22   893  		struct vfio_info=
_cap caps =3D { .buf =3D NULL, .size =3D 0 };
28541d41c9e04c Alex Williamson         2016-02-22   894  		int i, ret;
89e1f7d4c66d85 Alex Williamson         2012-07-31   895  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   896  		minsz =3D offset=
ofend(struct vfio_region_info, offset);
89e1f7d4c66d85 Alex Williamson         2012-07-31   897  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   898  		if (copy_from_us=
er(&info, (void __user *)arg, minsz))
89e1f7d4c66d85 Alex Williamson         2012-07-31   899  			return -EFAULT;
89e1f7d4c66d85 Alex Williamson         2012-07-31   900  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   901  		if (info.argsz <=
 minsz)
89e1f7d4c66d85 Alex Williamson         2012-07-31   902  			return -EINVAL;
89e1f7d4c66d85 Alex Williamson         2012-07-31   903  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   904  		switch (info.ind=
ex) {
89e1f7d4c66d85 Alex Williamson         2012-07-31   905  		case VFIO_PCI_CO=
NFIG_REGION_INDEX:
89e1f7d4c66d85 Alex Williamson         2012-07-31   906  			info.offset =3D=
 VFIO_PCI_INDEX_TO_OFFSET(info.index);
89e1f7d4c66d85 Alex Williamson         2012-07-31   907  			info.size =3D p=
dev->cfg_size;
89e1f7d4c66d85 Alex Williamson         2012-07-31   908  			info.flags =3D =
VFIO_REGION_INFO_FLAG_READ |
89e1f7d4c66d85 Alex Williamson         2012-07-31   909  				     VFIO_REGI=
ON_INFO_FLAG_WRITE;
89e1f7d4c66d85 Alex Williamson         2012-07-31   910  			break;
89e1f7d4c66d85 Alex Williamson         2012-07-31   911  		case VFIO_PCI_BA=
R0_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
89e1f7d4c66d85 Alex Williamson         2012-07-31   912  			info.offset =3D=
 VFIO_PCI_INDEX_TO_OFFSET(info.index);
89e1f7d4c66d85 Alex Williamson         2012-07-31   913  			info.size =3D p=
ci_resource_len(pdev, info.index);
89e1f7d4c66d85 Alex Williamson         2012-07-31   914  			if (!info.size)=
 {
89e1f7d4c66d85 Alex Williamson         2012-07-31   915  				info.flags =3D=
 0;
89e1f7d4c66d85 Alex Williamson         2012-07-31   916  				break;
89e1f7d4c66d85 Alex Williamson         2012-07-31   917  			}
89e1f7d4c66d85 Alex Williamson         2012-07-31   918  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   919  			info.flags =3D =
VFIO_REGION_INFO_FLAG_READ |
89e1f7d4c66d85 Alex Williamson         2012-07-31   920  				     VFIO_REGI=
ON_INFO_FLAG_WRITE;
05f0c03fbac181 Yongji Xie              2016-06-30   921  			if (vdev->bar_m=
map_supported[info.index]) {
89e1f7d4c66d85 Alex Williamson         2012-07-31   922  				info.flags |=
=3D VFIO_REGION_INFO_FLAG_MMAP;
188ad9d6cbbce4 Alex Williamson         2016-02-22   923  				if (info.index=
 =3D=3D vdev->msix_bar) {
a32295c612c579 Alexey Kardashevskiy    2017-12-13   924  					ret =3D msix_=
mmappable_cap(vdev, &caps);
188ad9d6cbbce4 Alex Williamson         2016-02-22   925  					if (ret)
188ad9d6cbbce4 Alex Williamson         2016-02-22   926  						return ret;
188ad9d6cbbce4 Alex Williamson         2016-02-22   927  				}
188ad9d6cbbce4 Alex Williamson         2016-02-22   928  			}
188ad9d6cbbce4 Alex Williamson         2016-02-22   929  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   930  			break;
89e1f7d4c66d85 Alex Williamson         2012-07-31   931  		case VFIO_PCI_RO=
M_REGION_INDEX:
89e1f7d4c66d85 Alex Williamson         2012-07-31   932  		{
89e1f7d4c66d85 Alex Williamson         2012-07-31   933  			void __iomem *i=
o;
89e1f7d4c66d85 Alex Williamson         2012-07-31   934  			size_t size;
abafbc551fdded Alex Williamson         2020-04-22   935  			u16 cmd;
89e1f7d4c66d85 Alex Williamson         2012-07-31   936  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   937  			info.offset =3D=
 VFIO_PCI_INDEX_TO_OFFSET(info.index);
89e1f7d4c66d85 Alex Williamson         2012-07-31   938  			info.flags =3D =
0;
89e1f7d4c66d85 Alex Williamson         2012-07-31   939  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   940  			/* Report the B=
AR size, not the ROM size */
89e1f7d4c66d85 Alex Williamson         2012-07-31   941  			info.size =3D p=
ci_resource_len(pdev, info.index);
a13b64591747e8 Alex Williamson         2016-02-22   942  			if (!info.size)=
 {
a13b64591747e8 Alex Williamson         2016-02-22   943  				/* Shadow ROMs=
 appear as PCI option ROMs */
a13b64591747e8 Alex Williamson         2016-02-22   944  				if (pdev->reso=
urce[PCI_ROM_RESOURCE].flags &
a13b64591747e8 Alex Williamson         2016-02-22   945  							IORESOURCE_=
ROM_SHADOW)
a13b64591747e8 Alex Williamson         2016-02-22   946  					info.size =3D=
 0x20000;
a13b64591747e8 Alex Williamson         2016-02-22   947  				else
89e1f7d4c66d85 Alex Williamson         2012-07-31   948  					break;
a13b64591747e8 Alex Williamson         2016-02-22   949  			}
89e1f7d4c66d85 Alex Williamson         2012-07-31   950  =

0cfd027be1d6de Eric Auger              2019-02-15   951  			/*
0cfd027be1d6de Eric Auger              2019-02-15   952  			 * Is it really=
 there?  Enable memory decode for
0cfd027be1d6de Eric Auger              2019-02-15   953  			 * implicit acc=
ess in pci_map_rom().
0cfd027be1d6de Eric Auger              2019-02-15   954  			 */
abafbc551fdded Alex Williamson         2020-04-22   955  			cmd =3D vfio_pc=
i_memory_lock_and_enable(vdev);
89e1f7d4c66d85 Alex Williamson         2012-07-31   956  			io =3D pci_map_=
rom(pdev, &size);
0cfd027be1d6de Eric Auger              2019-02-15   957  			if (io) {
0cfd027be1d6de Eric Auger              2019-02-15   958  				info.flags =3D=
 VFIO_REGION_INFO_FLAG_READ;
0cfd027be1d6de Eric Auger              2019-02-15   959  				pci_unmap_rom(=
pdev, io);
0cfd027be1d6de Eric Auger              2019-02-15   960  			} else {
89e1f7d4c66d85 Alex Williamson         2012-07-31   961  				info.size =3D =
0;
89e1f7d4c66d85 Alex Williamson         2012-07-31   962  			}
abafbc551fdded Alex Williamson         2020-04-22   963  			vfio_pci_memory=
_unlock_and_restore(vdev, cmd);
89e1f7d4c66d85 Alex Williamson         2012-07-31   964  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   965  			break;
89e1f7d4c66d85 Alex Williamson         2012-07-31   966  		}
84237a826b261d Alex Williamson         2013-02-18   967  		case VFIO_PCI_VG=
A_REGION_INDEX:
84237a826b261d Alex Williamson         2013-02-18   968  			if (!vdev->has_=
vga)
84237a826b261d Alex Williamson         2013-02-18   969  				return -EINVAL;
84237a826b261d Alex Williamson         2013-02-18   970  =

84237a826b261d Alex Williamson         2013-02-18   971  			info.offset =3D=
 VFIO_PCI_INDEX_TO_OFFSET(info.index);
84237a826b261d Alex Williamson         2013-02-18   972  			info.size =3D 0=
xc0000;
84237a826b261d Alex Williamson         2013-02-18   973  			info.flags =3D =
VFIO_REGION_INFO_FLAG_READ |
84237a826b261d Alex Williamson         2013-02-18   974  				     VFIO_REGI=
ON_INFO_FLAG_WRITE;
84237a826b261d Alex Williamson         2013-02-18   975  =

84237a826b261d Alex Williamson         2013-02-18   976  			break;
89e1f7d4c66d85 Alex Williamson         2012-07-31   977  		default:
c535d34569bbc6 Kirti Wankhede          2016-11-17   978  		{
dda01f787df9f9 Alex Williamson         2017-12-12   979  			struct vfio_reg=
ion_info_cap_type cap_type =3D {
dda01f787df9f9 Alex Williamson         2017-12-12   980  					.header.id =
=3D VFIO_REGION_INFO_CAP_TYPE,
dda01f787df9f9 Alex Williamson         2017-12-12   981  					.header.versi=
on =3D 1 };
c535d34569bbc6 Kirti Wankhede          2016-11-17   982  =

28541d41c9e04c Alex Williamson         2016-02-22   983  			if (info.index =
>=3D
28541d41c9e04c Alex Williamson         2016-02-22   984  			    VFIO_PCI_NU=
M_REGIONS + vdev->num_regions)
89e1f7d4c66d85 Alex Williamson         2012-07-31   985  				return -EINVAL;
0e714d27786ce1 Gustavo A. R. Silva     2018-07-17   986  			info.index =3D =
array_index_nospec(info.index,
0e714d27786ce1 Gustavo A. R. Silva     2018-07-17   987  							VFIO_PCI_NU=
M_REGIONS +
0e714d27786ce1 Gustavo A. R. Silva     2018-07-17   988  							vdev->num_r=
egions);
28541d41c9e04c Alex Williamson         2016-02-22   989  =

28541d41c9e04c Alex Williamson         2016-02-22   990  			i =3D info.inde=
x - VFIO_PCI_NUM_REGIONS;
28541d41c9e04c Alex Williamson         2016-02-22   991  =

28541d41c9e04c Alex Williamson         2016-02-22   992  			info.offset =3D=
 VFIO_PCI_INDEX_TO_OFFSET(info.index);
28541d41c9e04c Alex Williamson         2016-02-22   993  			info.size =3D v=
dev->region[i].size;
28541d41c9e04c Alex Williamson         2016-02-22   994  			info.flags =3D =
vdev->region[i].flags;
28541d41c9e04c Alex Williamson         2016-02-22   995  =

c535d34569bbc6 Kirti Wankhede          2016-11-17   996  			cap_type.type =
=3D vdev->region[i].type;
c535d34569bbc6 Kirti Wankhede          2016-11-17   997  			cap_type.subtyp=
e =3D vdev->region[i].subtype;
c535d34569bbc6 Kirti Wankhede          2016-11-17   998  =

dda01f787df9f9 Alex Williamson         2017-12-12   999  			ret =3D vfio_in=
fo_add_capability(&caps, &cap_type.header,
dda01f787df9f9 Alex Williamson         2017-12-12  1000  						       sizeo=
f(cap_type));
28541d41c9e04c Alex Williamson         2016-02-22  1001  			if (ret)
28541d41c9e04c Alex Williamson         2016-02-22  1002  				return ret;
c535d34569bbc6 Kirti Wankhede          2016-11-17  1003  =

c2c0f1cde0ef56 Alexey Kardashevskiy    2018-12-19  1004  			if (vdev->regio=
n[i].ops->add_capability) {
c2c0f1cde0ef56 Alexey Kardashevskiy    2018-12-19  1005  				ret =3D vdev->=
region[i].ops->add_capability(vdev,
c2c0f1cde0ef56 Alexey Kardashevskiy    2018-12-19  1006  						&vdev->regio=
n[i], &caps);
c2c0f1cde0ef56 Alexey Kardashevskiy    2018-12-19  1007  				if (ret)
c2c0f1cde0ef56 Alexey Kardashevskiy    2018-12-19  1008  					return ret;
c2c0f1cde0ef56 Alexey Kardashevskiy    2018-12-19  1009  			}
c535d34569bbc6 Kirti Wankhede          2016-11-17  1010  		}
89e1f7d4c66d85 Alex Williamson         2012-07-31  1011  		}
89e1f7d4c66d85 Alex Williamson         2012-07-31  1012  =

188ad9d6cbbce4 Alex Williamson         2016-02-22  1013  		if (caps.size) {
188ad9d6cbbce4 Alex Williamson         2016-02-22  1014  			info.flags |=3D=
 VFIO_REGION_INFO_FLAG_CAPS;
188ad9d6cbbce4 Alex Williamson         2016-02-22  1015  			if (info.argsz =
< sizeof(info) + caps.size) {
188ad9d6cbbce4 Alex Williamson         2016-02-22  1016  				info.argsz =3D=
 sizeof(info) + caps.size;
188ad9d6cbbce4 Alex Williamson         2016-02-22  1017  				info.cap_offse=
t =3D 0;
188ad9d6cbbce4 Alex Williamson         2016-02-22  1018  			} else {
188ad9d6cbbce4 Alex Williamson         2016-02-22  1019  				vfio_info_cap_=
shift(&caps, sizeof(info));
c4aec3101319f8 Dan Carpenter           2016-02-25  1020  				if (copy_to_us=
er((void __user *)arg +
188ad9d6cbbce4 Alex Williamson         2016-02-22  1021  						  sizeof(inf=
o), caps.buf,
c4aec3101319f8 Dan Carpenter           2016-02-25  1022  						  caps.size)=
) {
188ad9d6cbbce4 Alex Williamson         2016-02-22  1023  					kfree(caps.bu=
f);
c4aec3101319f8 Dan Carpenter           2016-02-25  1024  					return -EFAUL=
T;
188ad9d6cbbce4 Alex Williamson         2016-02-22  1025  				}
188ad9d6cbbce4 Alex Williamson         2016-02-22  1026  				info.cap_offse=
t =3D sizeof(info);
188ad9d6cbbce4 Alex Williamson         2016-02-22  1027  			}
188ad9d6cbbce4 Alex Williamson         2016-02-22  1028  =

188ad9d6cbbce4 Alex Williamson         2016-02-22  1029  			kfree(caps.buf);
89e1f7d4c66d85 Alex Williamson         2012-07-31  1030  		}
89e1f7d4c66d85 Alex Williamson         2012-07-31  1031  =

8160c4e455820d Michael S. Tsirkin      2016-02-28  1032  		return copy_to_u=
ser((void __user *)arg, &info, minsz) ?
8160c4e455820d Michael S. Tsirkin      2016-02-28  1033  			-EFAULT : 0;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1034  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1035  	} else if (cmd =
=3D=3D VFIO_DEVICE_GET_IRQ_INFO) {
89e1f7d4c66d85 Alex Williamson         2012-07-31  1036  		struct vfio_irq_=
info info;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1037  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1038  		minsz =3D offset=
ofend(struct vfio_irq_info, count);
89e1f7d4c66d85 Alex Williamson         2012-07-31  1039  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1040  		if (copy_from_us=
er(&info, (void __user *)arg, minsz))
89e1f7d4c66d85 Alex Williamson         2012-07-31  1041  			return -EFAULT;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1042  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1043  		if (info.argsz <=
 minsz || info.index >=3D VFIO_PCI_NUM_IRQS)
89e1f7d4c66d85 Alex Williamson         2012-07-31  1044  			return -EINVAL;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1045  =

dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11  1046  		switch (info.ind=
ex) {
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11  1047  		case VFIO_PCI_IN=
TX_IRQ_INDEX ... VFIO_PCI_MSIX_IRQ_INDEX:
6140a8f5623820 Alex Williamson         2015-02-06  1048  		case VFIO_PCI_RE=
Q_IRQ_INDEX:
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11  1049  			break;
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11  1050  		case VFIO_PCI_ER=
R_IRQ_INDEX:
a310ee236e20e2 Jason Gunthorpe         2021-02-19  1051  			if (pci_is_pcie=
(pdev))
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11  1052  				break;
df561f6688fef7 Gustavo A. R. Silva     2020-08-23  1053  			fallthrough;
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11  1054  		default:
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11  1055  			return -EINVAL;
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11  1056  		}
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11  1057  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1058  		info.flags =3D V=
FIO_IRQ_INFO_EVENTFD;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1059  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1060  		info.count =3D v=
fio_pci_get_irq_count(vdev, info.index);
89e1f7d4c66d85 Alex Williamson         2012-07-31  1061  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1062  		if (info.index =
=3D=3D VFIO_PCI_INTX_IRQ_INDEX)
89e1f7d4c66d85 Alex Williamson         2012-07-31  1063  			info.flags |=3D=
 (VFIO_IRQ_INFO_MASKABLE |
89e1f7d4c66d85 Alex Williamson         2012-07-31  1064  				       VFIO_IR=
Q_INFO_AUTOMASKED);
89e1f7d4c66d85 Alex Williamson         2012-07-31  1065  		else
89e1f7d4c66d85 Alex Williamson         2012-07-31  1066  			info.flags |=3D=
 VFIO_IRQ_INFO_NORESIZE;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1067  =

8160c4e455820d Michael S. Tsirkin      2016-02-28  1068  		return copy_to_u=
ser((void __user *)arg, &info, minsz) ?
8160c4e455820d Michael S. Tsirkin      2016-02-28  1069  			-EFAULT : 0;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1070  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1071  	} else if (cmd =
=3D=3D VFIO_DEVICE_SET_IRQS) {
89e1f7d4c66d85 Alex Williamson         2012-07-31  1072  		struct vfio_irq_=
set hdr;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1073  		u8 *data =3D NUL=
L;
05692d7005a364 Vlad Tsyrklevich        2016-10-12  1074  		int max, ret =3D=
 0;
ef198aaa169c61 Kirti Wankhede          2016-11-17  1075  		size_t data_size=
 =3D 0;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1076  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1077  		minsz =3D offset=
ofend(struct vfio_irq_set, count);
89e1f7d4c66d85 Alex Williamson         2012-07-31  1078  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1079  		if (copy_from_us=
er(&hdr, (void __user *)arg, minsz))
89e1f7d4c66d85 Alex Williamson         2012-07-31  1080  			return -EFAULT;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1081  =

05692d7005a364 Vlad Tsyrklevich        2016-10-12  1082  		max =3D vfio_pci=
_get_irq_count(vdev, hdr.index);
89e1f7d4c66d85 Alex Williamson         2012-07-31  1083  =

ef198aaa169c61 Kirti Wankhede          2016-11-17  1084  		ret =3D vfio_set=
_irqs_validate_and_prepare(&hdr, max,
ef198aaa169c61 Kirti Wankhede          2016-11-17  1085  						 VFIO_PCI_NU=
M_IRQS, &data_size);
ef198aaa169c61 Kirti Wankhede          2016-11-17  1086  		if (ret)
ef198aaa169c61 Kirti Wankhede          2016-11-17  1087  			return ret;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1088  =

ef198aaa169c61 Kirti Wankhede          2016-11-17  1089  		if (data_size) {
3a1f7041ddd59e Fengguang Wu            2012-12-07  1090  			data =3D memdup=
_user((void __user *)(arg + minsz),
ef198aaa169c61 Kirti Wankhede          2016-11-17  1091  					    data_size=
);
3a1f7041ddd59e Fengguang Wu            2012-12-07  1092  			if (IS_ERR(data=
))
3a1f7041ddd59e Fengguang Wu            2012-12-07  1093  				return PTR_ERR=
(data);
89e1f7d4c66d85 Alex Williamson         2012-07-31  1094  		}
89e1f7d4c66d85 Alex Williamson         2012-07-31  1095  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1096  		mutex_lock(&vdev=
->igate);
89e1f7d4c66d85 Alex Williamson         2012-07-31  1097  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1098  		ret =3D vfio_pci=
_set_irqs_ioctl(vdev, hdr.flags, hdr.index,
89e1f7d4c66d85 Alex Williamson         2012-07-31  1099  					      hdr.sta=
rt, hdr.count, data);
89e1f7d4c66d85 Alex Williamson         2012-07-31  1100  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1101  		mutex_unlock(&vd=
ev->igate);
89e1f7d4c66d85 Alex Williamson         2012-07-31  1102  		kfree(data);
89e1f7d4c66d85 Alex Williamson         2012-07-31  1103  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1104  		return ret;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1105  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1106  	} else if (cmd =
=3D=3D VFIO_DEVICE_RESET) {
abafbc551fdded Alex Williamson         2020-04-22  1107  		int ret;
abafbc551fdded Alex Williamson         2020-04-22  1108  =

abafbc551fdded Alex Williamson         2020-04-22  1109  		if (!vdev->reset=
_works)
abafbc551fdded Alex Williamson         2020-04-22  1110  			return -EINVAL;
abafbc551fdded Alex Williamson         2020-04-22  1111  =

abafbc551fdded Alex Williamson         2020-04-22  1112  		vfio_pci_zap_and=
_down_write_memory_lock(vdev);
a310ee236e20e2 Jason Gunthorpe         2021-02-19  1113  		ret =3D pci_try_=
reset_function(pdev);
abafbc551fdded Alex Williamson         2020-04-22  1114  		up_write(&vdev->=
memory_lock);
abafbc551fdded Alex Williamson         2020-04-22  1115  =

abafbc551fdded Alex Williamson         2020-04-22  1116  		return ret;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1117  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1118  	} else if (cmd =
=3D=3D VFIO_DEVICE_GET_PCI_HOT_RESET_INFO) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1119  		struct vfio_pci_=
hot_reset_info hdr;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1120  		struct vfio_pci_=
fill_info fill =3D { 0 };
8b27ee60bfd6bb Alex Williamson         2013-09-04  1121  		struct vfio_pci_=
dependent_device *devices =3D NULL;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1122  		bool slot =3D fa=
lse;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1123  		int ret =3D 0;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1124  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1125  		minsz =3D offset=
ofend(struct vfio_pci_hot_reset_info, count);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1126  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1127  		if (copy_from_us=
er(&hdr, (void __user *)arg, minsz))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1128  			return -EFAULT;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1129  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1130  		if (hdr.argsz < =
minsz)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1131  			return -EINVAL;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1132  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1133  		hdr.flags =3D 0;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1134  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1135  		/* Can we do a s=
lot or bus reset or neither? */
a310ee236e20e2 Jason Gunthorpe         2021-02-19  1136  		if (!pci_probe_r=
eset_slot(pdev->slot))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1137  			slot =3D true;
a310ee236e20e2 Jason Gunthorpe         2021-02-19  1138  		else if (pci_pro=
be_reset_bus(pdev->bus))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1139  			return -ENODEV;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1140  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1141  		/* How many devi=
ces are affected? */
a310ee236e20e2 Jason Gunthorpe         2021-02-19  1142  		ret =3D vfio_pci=
_for_each_slot_or_bus(pdev,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1143  						    vfio_pci=
_count_devs,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1144  						    &fill.ma=
x, slot);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1145  		if (ret)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1146  			return ret;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1147  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1148  		WARN_ON(!fill.ma=
x); /* Should always be at least one */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1149  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1150  		/*
8b27ee60bfd6bb Alex Williamson         2013-09-04  1151  		 * If there's en=
ough space, fill it now, otherwise return
8b27ee60bfd6bb Alex Williamson         2013-09-04  1152  		 * -ENOSPC and t=
he number of devices affected.
8b27ee60bfd6bb Alex Williamson         2013-09-04  1153  		 */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1154  		if (hdr.argsz < =
sizeof(hdr) + (fill.max * sizeof(*devices))) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1155  			ret =3D -ENOSPC;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1156  			hdr.count =3D f=
ill.max;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1157  			goto reset_info=
_exit;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1158  		}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1159  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1160  		devices =3D kcal=
loc(fill.max, sizeof(*devices), GFP_KERNEL);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1161  		if (!devices)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1162  			return -ENOMEM;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1163  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1164  		fill.devices =3D=
 devices;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1165  =

a310ee236e20e2 Jason Gunthorpe         2021-02-19  1166  		ret =3D vfio_pci=
_for_each_slot_or_bus(pdev,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1167  						    vfio_pci=
_fill_devs,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1168  						    &fill, s=
lot);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1169  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1170  		/*
8b27ee60bfd6bb Alex Williamson         2013-09-04  1171  		 * If a device w=
as removed between counting and filling,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1172  		 * we may come u=
p short of fill.max.  If a device was
8b27ee60bfd6bb Alex Williamson         2013-09-04  1173  		 * added, we'll =
have a return of -EAGAIN above.
8b27ee60bfd6bb Alex Williamson         2013-09-04  1174  		 */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1175  		if (!ret)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1176  			hdr.count =3D f=
ill.cur;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1177  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1178  reset_info_exit:
8b27ee60bfd6bb Alex Williamson         2013-09-04  1179  		if (copy_to_user=
((void __user *)arg, &hdr, minsz))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1180  			ret =3D -EFAULT;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1181  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1182  		if (!ret) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1183  			if (copy_to_use=
r((void __user *)(arg + minsz), devices,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1184  					 hdr.count * =
sizeof(*devices)))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1185  				ret =3D -EFAUL=
T;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1186  		}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1187  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1188  		kfree(devices);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1189  		return ret;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1190  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1191  	} else if (cmd =
=3D=3D VFIO_DEVICE_PCI_HOT_RESET) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1192  		struct vfio_pci_=
hot_reset hdr;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1193  		int32_t *group_f=
ds;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1194  		struct vfio_pci_=
group_entry *groups;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1195  		struct vfio_pci_=
group_info info;
abafbc551fdded Alex Williamson         2020-04-22  1196  		struct vfio_devi=
ces devs =3D { .cur_index =3D 0 };
8b27ee60bfd6bb Alex Williamson         2013-09-04  1197  		bool slot =3D fa=
lse;
abafbc551fdded Alex Williamson         2020-04-22  1198  		int i, group_idx=
, mem_idx =3D 0, count =3D 0, ret =3D 0;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1199  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1200  		minsz =3D offset=
ofend(struct vfio_pci_hot_reset, count);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1201  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1202  		if (copy_from_us=
er(&hdr, (void __user *)arg, minsz))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1203  			return -EFAULT;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1204  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1205  		if (hdr.argsz < =
minsz || hdr.flags)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1206  			return -EINVAL;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1207  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1208  		/* Can we do a s=
lot or bus reset or neither? */
a310ee236e20e2 Jason Gunthorpe         2021-02-19  1209  		if (!pci_probe_r=
eset_slot(pdev->slot))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1210  			slot =3D true;
a310ee236e20e2 Jason Gunthorpe         2021-02-19  1211  		else if (pci_pro=
be_reset_bus(pdev->bus))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1212  			return -ENODEV;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1213  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1214  		/*
8b27ee60bfd6bb Alex Williamson         2013-09-04  1215  		 * We can't let =
userspace give us an arbitrarily large
8b27ee60bfd6bb Alex Williamson         2013-09-04  1216  		 * buffer to cop=
y, so verify how many we think there
8b27ee60bfd6bb Alex Williamson         2013-09-04  1217  		 * could be.  No=
te groups can have multiple devices so
8b27ee60bfd6bb Alex Williamson         2013-09-04  1218  		 * one group per=
 device is the max.
8b27ee60bfd6bb Alex Williamson         2013-09-04  1219  		 */
a310ee236e20e2 Jason Gunthorpe         2021-02-19  1220  		ret =3D vfio_pci=
_for_each_slot_or_bus(pdev,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1221  						    vfio_pci=
_count_devs,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1222  						    &count, =
slot);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1223  		if (ret)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1224  			return ret;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1225  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1226  		/* Somewhere bet=
ween 1 and count is OK */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1227  		if (!hdr.count |=
| hdr.count > count)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1228  			return -EINVAL;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1229  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1230  		group_fds =3D kc=
alloc(hdr.count, sizeof(*group_fds), GFP_KERNEL);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1231  		groups =3D kcall=
oc(hdr.count, sizeof(*groups), GFP_KERNEL);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1232  		if (!group_fds |=
| !groups) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1233  			kfree(group_fds=
);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1234  			kfree(groups);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1235  			return -ENOMEM;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1236  		}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1237  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1238  		if (copy_from_us=
er(group_fds, (void __user *)(arg + minsz),
8b27ee60bfd6bb Alex Williamson         2013-09-04  1239  				   hdr.count *=
 sizeof(*group_fds))) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1240  			kfree(group_fds=
);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1241  			kfree(groups);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1242  			return -EFAULT;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1243  		}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1244  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1245  		/*
8b27ee60bfd6bb Alex Williamson         2013-09-04  1246  		 * For each grou=
p_fd, get the group through the vfio external
8b27ee60bfd6bb Alex Williamson         2013-09-04  1247  		 * user interfac=
e and store the group and iommu ID.  This
8b27ee60bfd6bb Alex Williamson         2013-09-04  1248  		 * ensures the g=
roup is held across the reset.
8b27ee60bfd6bb Alex Williamson         2013-09-04  1249  		 */
abafbc551fdded Alex Williamson         2020-04-22  1250  		for (group_idx =
=3D 0; group_idx < hdr.count; group_idx++) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1251  			struct vfio_gro=
up *group;
abafbc551fdded Alex Williamson         2020-04-22  1252  			struct fd f =3D=
 fdget(group_fds[group_idx]);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1253  			if (!f.file) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1254  				ret =3D -EBADF;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1255  				break;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1256  			}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1257  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1258  			group =3D vfio_=
group_get_external_user(f.file);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1259  			fdput(f);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1260  			if (IS_ERR(grou=
p)) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1261  				ret =3D PTR_ER=
R(group);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1262  				break;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1263  			}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1264  =

abafbc551fdded Alex Williamson         2020-04-22  1265  			groups[group_id=
x].group =3D group;
abafbc551fdded Alex Williamson         2020-04-22  1266  			groups[group_id=
x].id =3D
abafbc551fdded Alex Williamson         2020-04-22  1267  					vfio_external=
_user_iommu_id(group);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1268  		}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1269  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1270  		kfree(group_fds);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1271  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1272  		/* release refer=
ence to groups on error */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1273  		if (ret)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1274  			goto hot_reset_=
release;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1275  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1276  		info.count =3D h=
dr.count;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1277  		info.groups =3D =
groups;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1278  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1279  		/*
8b27ee60bfd6bb Alex Williamson         2013-09-04  1280  		 * Test whether =
all the affected devices are contained
8b27ee60bfd6bb Alex Williamson         2013-09-04  1281  		 * by the set of=
 groups provided by the user.
8b27ee60bfd6bb Alex Williamson         2013-09-04  1282  		 */
a310ee236e20e2 Jason Gunthorpe         2021-02-19  1283  		ret =3D vfio_pci=
_for_each_slot_or_bus(pdev,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1284  						    vfio_pci=
_validate_devs,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1285  						    &info, s=
lot);
abafbc551fdded Alex Williamson         2020-04-22  1286  		if (ret)
abafbc551fdded Alex Williamson         2020-04-22  1287  			goto hot_reset_=
release;
abafbc551fdded Alex Williamson         2020-04-22  1288  =

abafbc551fdded Alex Williamson         2020-04-22  1289  		devs.max_index =
=3D count;
abafbc551fdded Alex Williamson         2020-04-22  1290  		devs.devices =3D=
 kcalloc(count, sizeof(struct vfio_device *),
abafbc551fdded Alex Williamson         2020-04-22  1291  				       GFP_KER=
NEL);
abafbc551fdded Alex Williamson         2020-04-22  1292  		if (!devs.device=
s) {
abafbc551fdded Alex Williamson         2020-04-22  1293  			ret =3D -ENOMEM;
abafbc551fdded Alex Williamson         2020-04-22  1294  			goto hot_reset_=
release;
abafbc551fdded Alex Williamson         2020-04-22  1295  		}
abafbc551fdded Alex Williamson         2020-04-22  1296  =

abafbc551fdded Alex Williamson         2020-04-22  1297  		/*
abafbc551fdded Alex Williamson         2020-04-22  1298  		 * We need to ge=
t memory_lock for each device, but devices
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  1299  		 * can share mma=
p_lock, therefore we need to zap and hold
abafbc551fdded Alex Williamson         2020-04-22  1300  		 * the vma_lock =
for each device, and only then get each
abafbc551fdded Alex Williamson         2020-04-22  1301  		 * memory_lock.
abafbc551fdded Alex Williamson         2020-04-22  1302  		 */
a310ee236e20e2 Jason Gunthorpe         2021-02-19  1303  		ret =3D vfio_pci=
_for_each_slot_or_bus(pdev,
abafbc551fdded Alex Williamson         2020-04-22  1304  					    vfio_pci_=
try_zap_and_vma_lock_cb,
abafbc551fdded Alex Williamson         2020-04-22  1305  					    &devs, sl=
ot);
abafbc551fdded Alex Williamson         2020-04-22  1306  		if (ret)
abafbc551fdded Alex Williamson         2020-04-22  1307  			goto hot_reset_=
release;
abafbc551fdded Alex Williamson         2020-04-22  1308  =

abafbc551fdded Alex Williamson         2020-04-22  1309  		for (; mem_idx <=
 devs.cur_index; mem_idx++) {
0622dfb22def6e Jason Gunthorpe         2021-02-19  1310  			struct vfio_pci=
_device *tmp =3D devs.devices[mem_idx];
abafbc551fdded Alex Williamson         2020-04-22  1311  =

abafbc551fdded Alex Williamson         2020-04-22  1312  			ret =3D down_wr=
ite_trylock(&tmp->memory_lock);
abafbc551fdded Alex Williamson         2020-04-22  1313  			if (!ret) {
abafbc551fdded Alex Williamson         2020-04-22  1314  				ret =3D -EBUSY;
abafbc551fdded Alex Williamson         2020-04-22  1315  				goto hot_reset=
_release;
abafbc551fdded Alex Williamson         2020-04-22  1316  			}
abafbc551fdded Alex Williamson         2020-04-22  1317  			mutex_unlock(&t=
mp->vma_lock);
abafbc551fdded Alex Williamson         2020-04-22  1318  		}
abafbc551fdded Alex Williamson         2020-04-22  1319  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1320  		/* User has acce=
ss, do the reset */
a310ee236e20e2 Jason Gunthorpe         2021-02-19  1321  		ret =3D pci_rese=
t_bus(pdev);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1322  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1323  hot_reset_release:
abafbc551fdded Alex Williamson         2020-04-22  1324  		for (i =3D 0; i =
< devs.cur_index; i++) {
0622dfb22def6e Jason Gunthorpe         2021-02-19  1325  			struct vfio_pci=
_device *tmp =3D devs.devices[i];
abafbc551fdded Alex Williamson         2020-04-22  1326  =

abafbc551fdded Alex Williamson         2020-04-22  1327  			if (i < mem_idx)
abafbc551fdded Alex Williamson         2020-04-22  1328  				up_write(&tmp-=
>memory_lock);
abafbc551fdded Alex Williamson         2020-04-22  1329  			else
abafbc551fdded Alex Williamson         2020-04-22  1330  				mutex_unlock(&=
tmp->vma_lock);
0622dfb22def6e Jason Gunthorpe         2021-02-19  1331  			vfio_device_put=
(&tmp->vdev);
abafbc551fdded Alex Williamson         2020-04-22  1332  		}
abafbc551fdded Alex Williamson         2020-04-22  1333  		kfree(devs.devic=
es);
abafbc551fdded Alex Williamson         2020-04-22  1334  =

abafbc551fdded Alex Williamson         2020-04-22  1335  		for (group_idx--=
; group_idx >=3D 0; group_idx--)
abafbc551fdded Alex Williamson         2020-04-22  1336  			vfio_group_put_=
external_user(groups[group_idx].group);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1337  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1338  		kfree(groups);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1339  		return ret;
30656177c40804 Alex Williamson         2018-03-21  1340  	} else if (cmd =
=3D=3D VFIO_DEVICE_IOEVENTFD) {
30656177c40804 Alex Williamson         2018-03-21  1341  		struct vfio_devi=
ce_ioeventfd ioeventfd;
30656177c40804 Alex Williamson         2018-03-21  1342  		int count;
30656177c40804 Alex Williamson         2018-03-21  1343  =

30656177c40804 Alex Williamson         2018-03-21  1344  		minsz =3D offset=
ofend(struct vfio_device_ioeventfd, fd);
30656177c40804 Alex Williamson         2018-03-21  1345  =

30656177c40804 Alex Williamson         2018-03-21  1346  		if (copy_from_us=
er(&ioeventfd, (void __user *)arg, minsz))
30656177c40804 Alex Williamson         2018-03-21  1347  			return -EFAULT;
30656177c40804 Alex Williamson         2018-03-21  1348  =

30656177c40804 Alex Williamson         2018-03-21  1349  		if (ioeventfd.ar=
gsz < minsz)
30656177c40804 Alex Williamson         2018-03-21  1350  			return -EINVAL;
30656177c40804 Alex Williamson         2018-03-21  1351  =

30656177c40804 Alex Williamson         2018-03-21  1352  		if (ioeventfd.fl=
ags & ~VFIO_DEVICE_IOEVENTFD_SIZE_MASK)
30656177c40804 Alex Williamson         2018-03-21  1353  			return -EINVAL;
30656177c40804 Alex Williamson         2018-03-21  1354  =

30656177c40804 Alex Williamson         2018-03-21  1355  		count =3D ioeven=
tfd.flags & VFIO_DEVICE_IOEVENTFD_SIZE_MASK;
30656177c40804 Alex Williamson         2018-03-21  1356  =

30656177c40804 Alex Williamson         2018-03-21  1357  		if (hweight8(cou=
nt) !=3D 1 || ioeventfd.fd < -1)
30656177c40804 Alex Williamson         2018-03-21  1358  			return -EINVAL;
30656177c40804 Alex Williamson         2018-03-21  1359  =

30656177c40804 Alex Williamson         2018-03-21  1360  		return vfio_pci_=
ioeventfd(vdev, ioeventfd.offset,
30656177c40804 Alex Williamson         2018-03-21  1361  					  ioeventfd.d=
ata, count, ioeventfd.fd);
43eeeecc8ed5fa Alex Williamson         2020-03-24  1362  	} else if (cmd =
=3D=3D VFIO_DEVICE_FEATURE) {
43eeeecc8ed5fa Alex Williamson         2020-03-24  1363  		struct vfio_devi=
ce_feature feature;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1364  		uuid_t uuid;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1365  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1366  		minsz =3D offset=
ofend(struct vfio_device_feature, flags);
43eeeecc8ed5fa Alex Williamson         2020-03-24  1367  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1368  		if (copy_from_us=
er(&feature, (void __user *)arg, minsz))
43eeeecc8ed5fa Alex Williamson         2020-03-24  1369  			return -EFAULT;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1370  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1371  		if (feature.args=
z < minsz)
43eeeecc8ed5fa Alex Williamson         2020-03-24  1372  			return -EINVAL;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1373  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1374  		/* Check unknown=
 flags */
43eeeecc8ed5fa Alex Williamson         2020-03-24  1375  		if (feature.flag=
s & ~(VFIO_DEVICE_FEATURE_MASK |
43eeeecc8ed5fa Alex Williamson         2020-03-24  1376  				      VFIO_DEV=
ICE_FEATURE_SET |
43eeeecc8ed5fa Alex Williamson         2020-03-24  1377  				      VFIO_DEV=
ICE_FEATURE_GET |
43eeeecc8ed5fa Alex Williamson         2020-03-24  1378  				      VFIO_DEV=
ICE_FEATURE_PROBE))
43eeeecc8ed5fa Alex Williamson         2020-03-24  1379  			return -EINVAL;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1380  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1381  		/* GET & SET are=
 mutually exclusive except with PROBE */
43eeeecc8ed5fa Alex Williamson         2020-03-24  1382  		if (!(feature.fl=
ags & VFIO_DEVICE_FEATURE_PROBE) &&
43eeeecc8ed5fa Alex Williamson         2020-03-24  1383  		    (feature.fla=
gs & VFIO_DEVICE_FEATURE_SET) &&
43eeeecc8ed5fa Alex Williamson         2020-03-24  1384  		    (feature.fla=
gs & VFIO_DEVICE_FEATURE_GET))
43eeeecc8ed5fa Alex Williamson         2020-03-24  1385  			return -EINVAL;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1386  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1387  		switch (feature.=
flags & VFIO_DEVICE_FEATURE_MASK) {
43eeeecc8ed5fa Alex Williamson         2020-03-24  1388  		case VFIO_DEVICE=
_FEATURE_PCI_VF_TOKEN:
43eeeecc8ed5fa Alex Williamson         2020-03-24  1389  			if (!vdev->vf_t=
oken)
43eeeecc8ed5fa Alex Williamson         2020-03-24  1390  				return -ENOTTY;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1391  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1392  			/*
43eeeecc8ed5fa Alex Williamson         2020-03-24  1393  			 * We do not su=
pport GET of the VF Token UUID as this
43eeeecc8ed5fa Alex Williamson         2020-03-24  1394  			 * could expose=
 the token of the previous device user.
43eeeecc8ed5fa Alex Williamson         2020-03-24  1395  			 */
43eeeecc8ed5fa Alex Williamson         2020-03-24  1396  			if (feature.fla=
gs & VFIO_DEVICE_FEATURE_GET)
43eeeecc8ed5fa Alex Williamson         2020-03-24  1397  				return -EINVAL;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1398  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1399  			if (feature.fla=
gs & VFIO_DEVICE_FEATURE_PROBE)
43eeeecc8ed5fa Alex Williamson         2020-03-24  1400  				return 0;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1401  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1402  			/* Don't SET un=
less told to do so */
43eeeecc8ed5fa Alex Williamson         2020-03-24  1403  			if (!(feature.f=
lags & VFIO_DEVICE_FEATURE_SET))
43eeeecc8ed5fa Alex Williamson         2020-03-24  1404  				return -EINVAL;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1405  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1406  			if (feature.arg=
sz < minsz + sizeof(uuid))
43eeeecc8ed5fa Alex Williamson         2020-03-24  1407  				return -EINVAL;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1408  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1409  			if (copy_from_u=
ser(&uuid, (void __user *)(arg + minsz),
43eeeecc8ed5fa Alex Williamson         2020-03-24  1410  					   sizeof(uui=
d)))
43eeeecc8ed5fa Alex Williamson         2020-03-24  1411  				return -EFAULT;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1412  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1413  			mutex_lock(&vde=
v->vf_token->lock);
43eeeecc8ed5fa Alex Williamson         2020-03-24  1414  			uuid_copy(&vdev=
->vf_token->uuid, &uuid);
43eeeecc8ed5fa Alex Williamson         2020-03-24  1415  			mutex_unlock(&v=
dev->vf_token->lock);
43eeeecc8ed5fa Alex Williamson         2020-03-24  1416  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1417  			return 0;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1418  		default:
43eeeecc8ed5fa Alex Williamson         2020-03-24  1419  			return -ENOTTY;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1420  		}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1421  	}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1422  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1423  	return -ENOTTY;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1424  }
89e1f7d4c66d85 Alex Williamson         2012-07-31  1425  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5508604627681284784==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5508604627681284784==--

