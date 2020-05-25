Content-Type: multipart/mixed; boundary="===============3764230533535419751=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v3 3/3] vfio-pci: Invalidate mmaps and block MMIO access on disabled memory
Date: Mon, 25 May 2020 18:09:07 +0800
Message-ID: <202005251817.h2rt0LjL%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3764230533535419751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <159017506369.18853.17306023099999811263.stgit@gimli.home>
References: <159017506369.18853.17306023099999811263.stgit@gimli.home>
TO: Alex Williamson <alex.williamson@redhat.com>

Hi Alex,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.7-rc7]
[cannot apply to vfio/next linux/master next-20200522]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Alex-Williamson/vfio-pci-B=
lock-user-access-to-disabled-device-MMIO/20200523-031907
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
4286d192c803571e8ca43b0f1f8ea04d663a278a
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=3D1 build):
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/vfio/pci/vfio_pci.c:820:8: warning: Local variable 'cmd' shadows=
 outer argument [shadowArgument]
      u16 cmd;
          ^
   drivers/vfio/pci/vfio_pci.c:748:20: note: Shadowed declaration
         unsigned int cmd, unsigned long arg)
                      ^
   drivers/vfio/pci/vfio_pci.c:820:8: note: Shadow variable
      u16 cmd;
          ^
>> drivers/vfio/vfio_iommu_type1.c:1226:12: warning: Local variable 'n' sha=
dows outer variable [shadowVariable]
       size_t n =3D dma->iova + dma->size - iova;
              ^
   drivers/vfio/vfio_iommu_type1.c:1183:18: note: Shadowed declaration
    struct rb_node *n;
                    ^
   drivers/vfio/vfio_iommu_type1.c:1226:12: note: Shadow variable
       size_t n =3D dma->iova + dma->size - iova;
              ^

# https://github.com/0day-ci/linux/commit/3c9d9870c815814c4891775ab2950062e=
014a85c
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 3c9d9870c815814c4891775ab2950062e014a85c
vim +/cmd +820 drivers/vfio/pci/vfio_pci.c

3c9d9870c81581 Alex Williamson         2020-05-22   746  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   747  static long vfio_p=
ci_ioctl(void *device_data,
89e1f7d4c66d85 Alex Williamson         2012-07-31   748  			   unsigned int=
 cmd, unsigned long arg)
89e1f7d4c66d85 Alex Williamson         2012-07-31   749  {
89e1f7d4c66d85 Alex Williamson         2012-07-31   750  	struct vfio_pci_d=
evice *vdev =3D device_data;
89e1f7d4c66d85 Alex Williamson         2012-07-31   751  	unsigned long min=
sz;
89e1f7d4c66d85 Alex Williamson         2012-07-31   752  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   753  	if (cmd =3D=3D VF=
IO_DEVICE_GET_INFO) {
89e1f7d4c66d85 Alex Williamson         2012-07-31   754  		struct vfio_devi=
ce_info info;
89e1f7d4c66d85 Alex Williamson         2012-07-31   755  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   756  		minsz =3D offset=
ofend(struct vfio_device_info, num_irqs);
89e1f7d4c66d85 Alex Williamson         2012-07-31   757  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   758  		if (copy_from_us=
er(&info, (void __user *)arg, minsz))
89e1f7d4c66d85 Alex Williamson         2012-07-31   759  			return -EFAULT;
89e1f7d4c66d85 Alex Williamson         2012-07-31   760  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   761  		if (info.argsz <=
 minsz)
89e1f7d4c66d85 Alex Williamson         2012-07-31   762  			return -EINVAL;
89e1f7d4c66d85 Alex Williamson         2012-07-31   763  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   764  		info.flags =3D V=
FIO_DEVICE_FLAGS_PCI;
89e1f7d4c66d85 Alex Williamson         2012-07-31   765  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   766  		if (vdev->reset_=
works)
89e1f7d4c66d85 Alex Williamson         2012-07-31   767  			info.flags |=3D=
 VFIO_DEVICE_FLAGS_RESET;
89e1f7d4c66d85 Alex Williamson         2012-07-31   768  =

28541d41c9e04c Alex Williamson         2016-02-22   769  		info.num_regions=
 =3D VFIO_PCI_NUM_REGIONS + vdev->num_regions;
89e1f7d4c66d85 Alex Williamson         2012-07-31   770  		info.num_irqs =
=3D VFIO_PCI_NUM_IRQS;
89e1f7d4c66d85 Alex Williamson         2012-07-31   771  =

8160c4e455820d Michael S. Tsirkin      2016-02-28   772  		return copy_to_u=
ser((void __user *)arg, &info, minsz) ?
8160c4e455820d Michael S. Tsirkin      2016-02-28   773  			-EFAULT : 0;
89e1f7d4c66d85 Alex Williamson         2012-07-31   774  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   775  	} else if (cmd =
=3D=3D VFIO_DEVICE_GET_REGION_INFO) {
89e1f7d4c66d85 Alex Williamson         2012-07-31   776  		struct pci_dev *=
pdev =3D vdev->pdev;
89e1f7d4c66d85 Alex Williamson         2012-07-31   777  		struct vfio_regi=
on_info info;
188ad9d6cbbce4 Alex Williamson         2016-02-22   778  		struct vfio_info=
_cap caps =3D { .buf =3D NULL, .size =3D 0 };
28541d41c9e04c Alex Williamson         2016-02-22   779  		int i, ret;
89e1f7d4c66d85 Alex Williamson         2012-07-31   780  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   781  		minsz =3D offset=
ofend(struct vfio_region_info, offset);
89e1f7d4c66d85 Alex Williamson         2012-07-31   782  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   783  		if (copy_from_us=
er(&info, (void __user *)arg, minsz))
89e1f7d4c66d85 Alex Williamson         2012-07-31   784  			return -EFAULT;
89e1f7d4c66d85 Alex Williamson         2012-07-31   785  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   786  		if (info.argsz <=
 minsz)
89e1f7d4c66d85 Alex Williamson         2012-07-31   787  			return -EINVAL;
89e1f7d4c66d85 Alex Williamson         2012-07-31   788  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   789  		switch (info.ind=
ex) {
89e1f7d4c66d85 Alex Williamson         2012-07-31   790  		case VFIO_PCI_CO=
NFIG_REGION_INDEX:
89e1f7d4c66d85 Alex Williamson         2012-07-31   791  			info.offset =3D=
 VFIO_PCI_INDEX_TO_OFFSET(info.index);
89e1f7d4c66d85 Alex Williamson         2012-07-31   792  			info.size =3D p=
dev->cfg_size;
89e1f7d4c66d85 Alex Williamson         2012-07-31   793  			info.flags =3D =
VFIO_REGION_INFO_FLAG_READ |
89e1f7d4c66d85 Alex Williamson         2012-07-31   794  				     VFIO_REGI=
ON_INFO_FLAG_WRITE;
89e1f7d4c66d85 Alex Williamson         2012-07-31   795  			break;
89e1f7d4c66d85 Alex Williamson         2012-07-31   796  		case VFIO_PCI_BA=
R0_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
89e1f7d4c66d85 Alex Williamson         2012-07-31   797  			info.offset =3D=
 VFIO_PCI_INDEX_TO_OFFSET(info.index);
89e1f7d4c66d85 Alex Williamson         2012-07-31   798  			info.size =3D p=
ci_resource_len(pdev, info.index);
89e1f7d4c66d85 Alex Williamson         2012-07-31   799  			if (!info.size)=
 {
89e1f7d4c66d85 Alex Williamson         2012-07-31   800  				info.flags =3D=
 0;
89e1f7d4c66d85 Alex Williamson         2012-07-31   801  				break;
89e1f7d4c66d85 Alex Williamson         2012-07-31   802  			}
89e1f7d4c66d85 Alex Williamson         2012-07-31   803  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   804  			info.flags =3D =
VFIO_REGION_INFO_FLAG_READ |
89e1f7d4c66d85 Alex Williamson         2012-07-31   805  				     VFIO_REGI=
ON_INFO_FLAG_WRITE;
05f0c03fbac181 Yongji Xie              2016-06-30   806  			if (vdev->bar_m=
map_supported[info.index]) {
89e1f7d4c66d85 Alex Williamson         2012-07-31   807  				info.flags |=
=3D VFIO_REGION_INFO_FLAG_MMAP;
188ad9d6cbbce4 Alex Williamson         2016-02-22   808  				if (info.index=
 =3D=3D vdev->msix_bar) {
a32295c612c579 Alexey Kardashevskiy    2017-12-13   809  					ret =3D msix_=
mmappable_cap(vdev, &caps);
188ad9d6cbbce4 Alex Williamson         2016-02-22   810  					if (ret)
188ad9d6cbbce4 Alex Williamson         2016-02-22   811  						return ret;
188ad9d6cbbce4 Alex Williamson         2016-02-22   812  				}
188ad9d6cbbce4 Alex Williamson         2016-02-22   813  			}
188ad9d6cbbce4 Alex Williamson         2016-02-22   814  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   815  			break;
89e1f7d4c66d85 Alex Williamson         2012-07-31   816  		case VFIO_PCI_RO=
M_REGION_INDEX:
89e1f7d4c66d85 Alex Williamson         2012-07-31   817  		{
89e1f7d4c66d85 Alex Williamson         2012-07-31   818  			void __iomem *i=
o;
89e1f7d4c66d85 Alex Williamson         2012-07-31   819  			size_t size;
3c9d9870c81581 Alex Williamson         2020-05-22  @820  			u16 cmd;
89e1f7d4c66d85 Alex Williamson         2012-07-31   821  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   822  			info.offset =3D=
 VFIO_PCI_INDEX_TO_OFFSET(info.index);
89e1f7d4c66d85 Alex Williamson         2012-07-31   823  			info.flags =3D =
0;
89e1f7d4c66d85 Alex Williamson         2012-07-31   824  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   825  			/* Report the B=
AR size, not the ROM size */
89e1f7d4c66d85 Alex Williamson         2012-07-31   826  			info.size =3D p=
ci_resource_len(pdev, info.index);
a13b64591747e8 Alex Williamson         2016-02-22   827  			if (!info.size)=
 {
a13b64591747e8 Alex Williamson         2016-02-22   828  				/* Shadow ROMs=
 appear as PCI option ROMs */
a13b64591747e8 Alex Williamson         2016-02-22   829  				if (pdev->reso=
urce[PCI_ROM_RESOURCE].flags &
a13b64591747e8 Alex Williamson         2016-02-22   830  							IORESOURCE_=
ROM_SHADOW)
a13b64591747e8 Alex Williamson         2016-02-22   831  					info.size =3D=
 0x20000;
a13b64591747e8 Alex Williamson         2016-02-22   832  				else
89e1f7d4c66d85 Alex Williamson         2012-07-31   833  					break;
a13b64591747e8 Alex Williamson         2016-02-22   834  			}
89e1f7d4c66d85 Alex Williamson         2012-07-31   835  =

0cfd027be1d6de Eric Auger              2019-02-15   836  			/*
0cfd027be1d6de Eric Auger              2019-02-15   837  			 * Is it really=
 there?  Enable memory decode for
0cfd027be1d6de Eric Auger              2019-02-15   838  			 * implicit acc=
ess in pci_map_rom().
0cfd027be1d6de Eric Auger              2019-02-15   839  			 */
3c9d9870c81581 Alex Williamson         2020-05-22   840  			cmd =3D vfio_pc=
i_memory_lock_and_enable(vdev);
89e1f7d4c66d85 Alex Williamson         2012-07-31   841  			io =3D pci_map_=
rom(pdev, &size);
0cfd027be1d6de Eric Auger              2019-02-15   842  			if (io) {
0cfd027be1d6de Eric Auger              2019-02-15   843  				info.flags =3D=
 VFIO_REGION_INFO_FLAG_READ;
0cfd027be1d6de Eric Auger              2019-02-15   844  				pci_unmap_rom(=
pdev, io);
0cfd027be1d6de Eric Auger              2019-02-15   845  			} else {
89e1f7d4c66d85 Alex Williamson         2012-07-31   846  				info.size =3D =
0;
89e1f7d4c66d85 Alex Williamson         2012-07-31   847  			}
3c9d9870c81581 Alex Williamson         2020-05-22   848  			vfio_pci_memory=
_unlock_and_restore(vdev, cmd);
89e1f7d4c66d85 Alex Williamson         2012-07-31   849  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   850  			break;
89e1f7d4c66d85 Alex Williamson         2012-07-31   851  		}
84237a826b261d Alex Williamson         2013-02-18   852  		case VFIO_PCI_VG=
A_REGION_INDEX:
84237a826b261d Alex Williamson         2013-02-18   853  			if (!vdev->has_=
vga)
84237a826b261d Alex Williamson         2013-02-18   854  				return -EINVAL;
84237a826b261d Alex Williamson         2013-02-18   855  =

84237a826b261d Alex Williamson         2013-02-18   856  			info.offset =3D=
 VFIO_PCI_INDEX_TO_OFFSET(info.index);
84237a826b261d Alex Williamson         2013-02-18   857  			info.size =3D 0=
xc0000;
84237a826b261d Alex Williamson         2013-02-18   858  			info.flags =3D =
VFIO_REGION_INFO_FLAG_READ |
84237a826b261d Alex Williamson         2013-02-18   859  				     VFIO_REGI=
ON_INFO_FLAG_WRITE;
84237a826b261d Alex Williamson         2013-02-18   860  =

84237a826b261d Alex Williamson         2013-02-18   861  			break;
89e1f7d4c66d85 Alex Williamson         2012-07-31   862  		default:
c535d34569bbc6 Kirti Wankhede          2016-11-17   863  		{
dda01f787df9f9 Alex Williamson         2017-12-12   864  			struct vfio_reg=
ion_info_cap_type cap_type =3D {
dda01f787df9f9 Alex Williamson         2017-12-12   865  					.header.id =
=3D VFIO_REGION_INFO_CAP_TYPE,
dda01f787df9f9 Alex Williamson         2017-12-12   866  					.header.versi=
on =3D 1 };
c535d34569bbc6 Kirti Wankhede          2016-11-17   867  =

28541d41c9e04c Alex Williamson         2016-02-22   868  			if (info.index =
>=3D
28541d41c9e04c Alex Williamson         2016-02-22   869  			    VFIO_PCI_NU=
M_REGIONS + vdev->num_regions)
89e1f7d4c66d85 Alex Williamson         2012-07-31   870  				return -EINVAL;
0e714d27786ce1 Gustavo A. R. Silva     2018-07-17   871  			info.index =3D =
array_index_nospec(info.index,
0e714d27786ce1 Gustavo A. R. Silva     2018-07-17   872  							VFIO_PCI_NU=
M_REGIONS +
0e714d27786ce1 Gustavo A. R. Silva     2018-07-17   873  							vdev->num_r=
egions);
28541d41c9e04c Alex Williamson         2016-02-22   874  =

28541d41c9e04c Alex Williamson         2016-02-22   875  			i =3D info.inde=
x - VFIO_PCI_NUM_REGIONS;
28541d41c9e04c Alex Williamson         2016-02-22   876  =

28541d41c9e04c Alex Williamson         2016-02-22   877  			info.offset =3D=
 VFIO_PCI_INDEX_TO_OFFSET(info.index);
28541d41c9e04c Alex Williamson         2016-02-22   878  			info.size =3D v=
dev->region[i].size;
28541d41c9e04c Alex Williamson         2016-02-22   879  			info.flags =3D =
vdev->region[i].flags;
28541d41c9e04c Alex Williamson         2016-02-22   880  =

c535d34569bbc6 Kirti Wankhede          2016-11-17   881  			cap_type.type =
=3D vdev->region[i].type;
c535d34569bbc6 Kirti Wankhede          2016-11-17   882  			cap_type.subtyp=
e =3D vdev->region[i].subtype;
c535d34569bbc6 Kirti Wankhede          2016-11-17   883  =

dda01f787df9f9 Alex Williamson         2017-12-12   884  			ret =3D vfio_in=
fo_add_capability(&caps, &cap_type.header,
dda01f787df9f9 Alex Williamson         2017-12-12   885  						       sizeo=
f(cap_type));
28541d41c9e04c Alex Williamson         2016-02-22   886  			if (ret)
28541d41c9e04c Alex Williamson         2016-02-22   887  				return ret;
c535d34569bbc6 Kirti Wankhede          2016-11-17   888  =

c2c0f1cde0ef56 Alexey Kardashevskiy    2018-12-19   889  			if (vdev->regio=
n[i].ops->add_capability) {
c2c0f1cde0ef56 Alexey Kardashevskiy    2018-12-19   890  				ret =3D vdev->=
region[i].ops->add_capability(vdev,
c2c0f1cde0ef56 Alexey Kardashevskiy    2018-12-19   891  						&vdev->regio=
n[i], &caps);
c2c0f1cde0ef56 Alexey Kardashevskiy    2018-12-19   892  				if (ret)
c2c0f1cde0ef56 Alexey Kardashevskiy    2018-12-19   893  					return ret;
c2c0f1cde0ef56 Alexey Kardashevskiy    2018-12-19   894  			}
c535d34569bbc6 Kirti Wankhede          2016-11-17   895  		}
89e1f7d4c66d85 Alex Williamson         2012-07-31   896  		}
89e1f7d4c66d85 Alex Williamson         2012-07-31   897  =

188ad9d6cbbce4 Alex Williamson         2016-02-22   898  		if (caps.size) {
188ad9d6cbbce4 Alex Williamson         2016-02-22   899  			info.flags |=3D=
 VFIO_REGION_INFO_FLAG_CAPS;
188ad9d6cbbce4 Alex Williamson         2016-02-22   900  			if (info.argsz =
< sizeof(info) + caps.size) {
188ad9d6cbbce4 Alex Williamson         2016-02-22   901  				info.argsz =3D=
 sizeof(info) + caps.size;
188ad9d6cbbce4 Alex Williamson         2016-02-22   902  				info.cap_offse=
t =3D 0;
188ad9d6cbbce4 Alex Williamson         2016-02-22   903  			} else {
188ad9d6cbbce4 Alex Williamson         2016-02-22   904  				vfio_info_cap_=
shift(&caps, sizeof(info));
c4aec3101319f8 Dan Carpenter           2016-02-25   905  				if (copy_to_us=
er((void __user *)arg +
188ad9d6cbbce4 Alex Williamson         2016-02-22   906  						  sizeof(inf=
o), caps.buf,
c4aec3101319f8 Dan Carpenter           2016-02-25   907  						  caps.size)=
) {
188ad9d6cbbce4 Alex Williamson         2016-02-22   908  					kfree(caps.bu=
f);
c4aec3101319f8 Dan Carpenter           2016-02-25   909  					return -EFAUL=
T;
188ad9d6cbbce4 Alex Williamson         2016-02-22   910  				}
188ad9d6cbbce4 Alex Williamson         2016-02-22   911  				info.cap_offse=
t =3D sizeof(info);
188ad9d6cbbce4 Alex Williamson         2016-02-22   912  			}
188ad9d6cbbce4 Alex Williamson         2016-02-22   913  =

188ad9d6cbbce4 Alex Williamson         2016-02-22   914  			kfree(caps.buf);
89e1f7d4c66d85 Alex Williamson         2012-07-31   915  		}
89e1f7d4c66d85 Alex Williamson         2012-07-31   916  =

8160c4e455820d Michael S. Tsirkin      2016-02-28   917  		return copy_to_u=
ser((void __user *)arg, &info, minsz) ?
8160c4e455820d Michael S. Tsirkin      2016-02-28   918  			-EFAULT : 0;
89e1f7d4c66d85 Alex Williamson         2012-07-31   919  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   920  	} else if (cmd =
=3D=3D VFIO_DEVICE_GET_IRQ_INFO) {
89e1f7d4c66d85 Alex Williamson         2012-07-31   921  		struct vfio_irq_=
info info;
89e1f7d4c66d85 Alex Williamson         2012-07-31   922  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   923  		minsz =3D offset=
ofend(struct vfio_irq_info, count);
89e1f7d4c66d85 Alex Williamson         2012-07-31   924  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   925  		if (copy_from_us=
er(&info, (void __user *)arg, minsz))
89e1f7d4c66d85 Alex Williamson         2012-07-31   926  			return -EFAULT;
89e1f7d4c66d85 Alex Williamson         2012-07-31   927  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   928  		if (info.argsz <=
 minsz || info.index >=3D VFIO_PCI_NUM_IRQS)
89e1f7d4c66d85 Alex Williamson         2012-07-31   929  			return -EINVAL;
89e1f7d4c66d85 Alex Williamson         2012-07-31   930  =

dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11   931  		switch (info.ind=
ex) {
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11   932  		case VFIO_PCI_IN=
TX_IRQ_INDEX ... VFIO_PCI_MSIX_IRQ_INDEX:
6140a8f5623820 Alex Williamson         2015-02-06   933  		case VFIO_PCI_RE=
Q_IRQ_INDEX:
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11   934  			break;
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11   935  		case VFIO_PCI_ER=
R_IRQ_INDEX:
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11   936  			if (pci_is_pcie=
(vdev->pdev))
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11   937  				break;
544c05a60aef7d Gustavo A. R. Silva     2018-07-09   938  		/* fall through =
*/
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11   939  		default:
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11   940  			return -EINVAL;
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11   941  		}
dad9f8972e04cd Vijay Mohan Pandarathil 2013-03-11   942  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   943  		info.flags =3D V=
FIO_IRQ_INFO_EVENTFD;
89e1f7d4c66d85 Alex Williamson         2012-07-31   944  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   945  		info.count =3D v=
fio_pci_get_irq_count(vdev, info.index);
89e1f7d4c66d85 Alex Williamson         2012-07-31   946  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   947  		if (info.index =
=3D=3D VFIO_PCI_INTX_IRQ_INDEX)
89e1f7d4c66d85 Alex Williamson         2012-07-31   948  			info.flags |=3D=
 (VFIO_IRQ_INFO_MASKABLE |
89e1f7d4c66d85 Alex Williamson         2012-07-31   949  				       VFIO_IR=
Q_INFO_AUTOMASKED);
89e1f7d4c66d85 Alex Williamson         2012-07-31   950  		else
89e1f7d4c66d85 Alex Williamson         2012-07-31   951  			info.flags |=3D=
 VFIO_IRQ_INFO_NORESIZE;
89e1f7d4c66d85 Alex Williamson         2012-07-31   952  =

8160c4e455820d Michael S. Tsirkin      2016-02-28   953  		return copy_to_u=
ser((void __user *)arg, &info, minsz) ?
8160c4e455820d Michael S. Tsirkin      2016-02-28   954  			-EFAULT : 0;
89e1f7d4c66d85 Alex Williamson         2012-07-31   955  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   956  	} else if (cmd =
=3D=3D VFIO_DEVICE_SET_IRQS) {
89e1f7d4c66d85 Alex Williamson         2012-07-31   957  		struct vfio_irq_=
set hdr;
89e1f7d4c66d85 Alex Williamson         2012-07-31   958  		u8 *data =3D NUL=
L;
05692d7005a364 Vlad Tsyrklevich        2016-10-12   959  		int max, ret =3D=
 0;
ef198aaa169c61 Kirti Wankhede          2016-11-17   960  		size_t data_size=
 =3D 0;
89e1f7d4c66d85 Alex Williamson         2012-07-31   961  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   962  		minsz =3D offset=
ofend(struct vfio_irq_set, count);
89e1f7d4c66d85 Alex Williamson         2012-07-31   963  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   964  		if (copy_from_us=
er(&hdr, (void __user *)arg, minsz))
89e1f7d4c66d85 Alex Williamson         2012-07-31   965  			return -EFAULT;
89e1f7d4c66d85 Alex Williamson         2012-07-31   966  =

05692d7005a364 Vlad Tsyrklevich        2016-10-12   967  		max =3D vfio_pci=
_get_irq_count(vdev, hdr.index);
89e1f7d4c66d85 Alex Williamson         2012-07-31   968  =

ef198aaa169c61 Kirti Wankhede          2016-11-17   969  		ret =3D vfio_set=
_irqs_validate_and_prepare(&hdr, max,
ef198aaa169c61 Kirti Wankhede          2016-11-17   970  						 VFIO_PCI_NU=
M_IRQS, &data_size);
ef198aaa169c61 Kirti Wankhede          2016-11-17   971  		if (ret)
ef198aaa169c61 Kirti Wankhede          2016-11-17   972  			return ret;
89e1f7d4c66d85 Alex Williamson         2012-07-31   973  =

ef198aaa169c61 Kirti Wankhede          2016-11-17   974  		if (data_size) {
3a1f7041ddd59e Fengguang Wu            2012-12-07   975  			data =3D memdup=
_user((void __user *)(arg + minsz),
ef198aaa169c61 Kirti Wankhede          2016-11-17   976  					    data_size=
);
3a1f7041ddd59e Fengguang Wu            2012-12-07   977  			if (IS_ERR(data=
))
3a1f7041ddd59e Fengguang Wu            2012-12-07   978  				return PTR_ERR=
(data);
89e1f7d4c66d85 Alex Williamson         2012-07-31   979  		}
89e1f7d4c66d85 Alex Williamson         2012-07-31   980  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   981  		mutex_lock(&vdev=
->igate);
89e1f7d4c66d85 Alex Williamson         2012-07-31   982  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   983  		ret =3D vfio_pci=
_set_irqs_ioctl(vdev, hdr.flags, hdr.index,
89e1f7d4c66d85 Alex Williamson         2012-07-31   984  					      hdr.sta=
rt, hdr.count, data);
89e1f7d4c66d85 Alex Williamson         2012-07-31   985  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   986  		mutex_unlock(&vd=
ev->igate);
89e1f7d4c66d85 Alex Williamson         2012-07-31   987  		kfree(data);
89e1f7d4c66d85 Alex Williamson         2012-07-31   988  =

89e1f7d4c66d85 Alex Williamson         2012-07-31   989  		return ret;
89e1f7d4c66d85 Alex Williamson         2012-07-31   990  =

8b27ee60bfd6bb Alex Williamson         2013-09-04   991  	} else if (cmd =
=3D=3D VFIO_DEVICE_RESET) {
3c9d9870c81581 Alex Williamson         2020-05-22   992  		int ret;
3c9d9870c81581 Alex Williamson         2020-05-22   993  =

3c9d9870c81581 Alex Williamson         2020-05-22   994  		if (!vdev->reset=
_works)
3c9d9870c81581 Alex Williamson         2020-05-22   995  			return -EINVAL;
3c9d9870c81581 Alex Williamson         2020-05-22   996  =

3c9d9870c81581 Alex Williamson         2020-05-22   997  		vfio_pci_zap_and=
_down_write_memory_lock(vdev);
3c9d9870c81581 Alex Williamson         2020-05-22   998  		ret =3D pci_try_=
reset_function(vdev->pdev);
3c9d9870c81581 Alex Williamson         2020-05-22   999  		up_write(&vdev->=
memory_lock);
3c9d9870c81581 Alex Williamson         2020-05-22  1000  =

3c9d9870c81581 Alex Williamson         2020-05-22  1001  		return ret;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1002  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1003  	} else if (cmd =
=3D=3D VFIO_DEVICE_GET_PCI_HOT_RESET_INFO) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1004  		struct vfio_pci_=
hot_reset_info hdr;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1005  		struct vfio_pci_=
fill_info fill =3D { 0 };
8b27ee60bfd6bb Alex Williamson         2013-09-04  1006  		struct vfio_pci_=
dependent_device *devices =3D NULL;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1007  		bool slot =3D fa=
lse;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1008  		int ret =3D 0;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1009  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1010  		minsz =3D offset=
ofend(struct vfio_pci_hot_reset_info, count);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1011  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1012  		if (copy_from_us=
er(&hdr, (void __user *)arg, minsz))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1013  			return -EFAULT;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1014  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1015  		if (hdr.argsz < =
minsz)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1016  			return -EINVAL;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1017  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1018  		hdr.flags =3D 0;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1019  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1020  		/* Can we do a s=
lot or bus reset or neither? */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1021  		if (!pci_probe_r=
eset_slot(vdev->pdev->slot))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1022  			slot =3D true;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1023  		else if (pci_pro=
be_reset_bus(vdev->pdev->bus))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1024  			return -ENODEV;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1025  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1026  		/* How many devi=
ces are affected? */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1027  		ret =3D vfio_pci=
_for_each_slot_or_bus(vdev->pdev,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1028  						    vfio_pci=
_count_devs,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1029  						    &fill.ma=
x, slot);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1030  		if (ret)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1031  			return ret;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1032  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1033  		WARN_ON(!fill.ma=
x); /* Should always be at least one */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1034  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1035  		/*
8b27ee60bfd6bb Alex Williamson         2013-09-04  1036  		 * If there's en=
ough space, fill it now, otherwise return
8b27ee60bfd6bb Alex Williamson         2013-09-04  1037  		 * -ENOSPC and t=
he number of devices affected.
8b27ee60bfd6bb Alex Williamson         2013-09-04  1038  		 */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1039  		if (hdr.argsz < =
sizeof(hdr) + (fill.max * sizeof(*devices))) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1040  			ret =3D -ENOSPC;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1041  			hdr.count =3D f=
ill.max;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1042  			goto reset_info=
_exit;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1043  		}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1044  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1045  		devices =3D kcal=
loc(fill.max, sizeof(*devices), GFP_KERNEL);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1046  		if (!devices)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1047  			return -ENOMEM;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1048  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1049  		fill.devices =3D=
 devices;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1050  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1051  		ret =3D vfio_pci=
_for_each_slot_or_bus(vdev->pdev,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1052  						    vfio_pci=
_fill_devs,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1053  						    &fill, s=
lot);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1054  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1055  		/*
8b27ee60bfd6bb Alex Williamson         2013-09-04  1056  		 * If a device w=
as removed between counting and filling,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1057  		 * we may come u=
p short of fill.max.  If a device was
8b27ee60bfd6bb Alex Williamson         2013-09-04  1058  		 * added, we'll =
have a return of -EAGAIN above.
8b27ee60bfd6bb Alex Williamson         2013-09-04  1059  		 */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1060  		if (!ret)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1061  			hdr.count =3D f=
ill.cur;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1062  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1063  reset_info_exit:
8b27ee60bfd6bb Alex Williamson         2013-09-04  1064  		if (copy_to_user=
((void __user *)arg, &hdr, minsz))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1065  			ret =3D -EFAULT;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1066  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1067  		if (!ret) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1068  			if (copy_to_use=
r((void __user *)(arg + minsz), devices,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1069  					 hdr.count * =
sizeof(*devices)))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1070  				ret =3D -EFAUL=
T;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1071  		}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1072  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1073  		kfree(devices);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1074  		return ret;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1075  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1076  	} else if (cmd =
=3D=3D VFIO_DEVICE_PCI_HOT_RESET) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1077  		struct vfio_pci_=
hot_reset hdr;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1078  		int32_t *group_f=
ds;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1079  		struct vfio_pci_=
group_entry *groups;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1080  		struct vfio_pci_=
group_info info;
3c9d9870c81581 Alex Williamson         2020-05-22  1081  		struct vfio_devi=
ces devs =3D { .cur_index =3D 0 };
8b27ee60bfd6bb Alex Williamson         2013-09-04  1082  		bool slot =3D fa=
lse;
3c9d9870c81581 Alex Williamson         2020-05-22  1083  		int i, group_idx=
, mem_idx =3D 0, count =3D 0, ret =3D 0;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1084  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1085  		minsz =3D offset=
ofend(struct vfio_pci_hot_reset, count);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1086  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1087  		if (copy_from_us=
er(&hdr, (void __user *)arg, minsz))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1088  			return -EFAULT;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1089  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1090  		if (hdr.argsz < =
minsz || hdr.flags)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1091  			return -EINVAL;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1092  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1093  		/* Can we do a s=
lot or bus reset or neither? */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1094  		if (!pci_probe_r=
eset_slot(vdev->pdev->slot))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1095  			slot =3D true;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1096  		else if (pci_pro=
be_reset_bus(vdev->pdev->bus))
8b27ee60bfd6bb Alex Williamson         2013-09-04  1097  			return -ENODEV;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1098  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1099  		/*
8b27ee60bfd6bb Alex Williamson         2013-09-04  1100  		 * We can't let =
userspace give us an arbitrarily large
8b27ee60bfd6bb Alex Williamson         2013-09-04  1101  		 * buffer to cop=
y, so verify how many we think there
8b27ee60bfd6bb Alex Williamson         2013-09-04  1102  		 * could be.  No=
te groups can have multiple devices so
8b27ee60bfd6bb Alex Williamson         2013-09-04  1103  		 * one group per=
 device is the max.
8b27ee60bfd6bb Alex Williamson         2013-09-04  1104  		 */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1105  		ret =3D vfio_pci=
_for_each_slot_or_bus(vdev->pdev,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1106  						    vfio_pci=
_count_devs,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1107  						    &count, =
slot);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1108  		if (ret)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1109  			return ret;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1110  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1111  		/* Somewhere bet=
ween 1 and count is OK */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1112  		if (!hdr.count |=
| hdr.count > count)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1113  			return -EINVAL;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1114  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1115  		group_fds =3D kc=
alloc(hdr.count, sizeof(*group_fds), GFP_KERNEL);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1116  		groups =3D kcall=
oc(hdr.count, sizeof(*groups), GFP_KERNEL);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1117  		if (!group_fds |=
| !groups) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1118  			kfree(group_fds=
);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1119  			kfree(groups);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1120  			return -ENOMEM;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1121  		}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1122  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1123  		if (copy_from_us=
er(group_fds, (void __user *)(arg + minsz),
8b27ee60bfd6bb Alex Williamson         2013-09-04  1124  				   hdr.count *=
 sizeof(*group_fds))) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1125  			kfree(group_fds=
);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1126  			kfree(groups);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1127  			return -EFAULT;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1128  		}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1129  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1130  		/*
8b27ee60bfd6bb Alex Williamson         2013-09-04  1131  		 * For each grou=
p_fd, get the group through the vfio external
8b27ee60bfd6bb Alex Williamson         2013-09-04  1132  		 * user interfac=
e and store the group and iommu ID.  This
8b27ee60bfd6bb Alex Williamson         2013-09-04  1133  		 * ensures the g=
roup is held across the reset.
8b27ee60bfd6bb Alex Williamson         2013-09-04  1134  		 */
3c9d9870c81581 Alex Williamson         2020-05-22  1135  		for (group_idx =
=3D 0; group_idx < hdr.count; group_idx++) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1136  			struct vfio_gro=
up *group;
3c9d9870c81581 Alex Williamson         2020-05-22  1137  			struct fd f =3D=
 fdget(group_fds[group_idx]);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1138  			if (!f.file) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1139  				ret =3D -EBADF;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1140  				break;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1141  			}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1142  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1143  			group =3D vfio_=
group_get_external_user(f.file);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1144  			fdput(f);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1145  			if (IS_ERR(grou=
p)) {
8b27ee60bfd6bb Alex Williamson         2013-09-04  1146  				ret =3D PTR_ER=
R(group);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1147  				break;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1148  			}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1149  =

3c9d9870c81581 Alex Williamson         2020-05-22  1150  			groups[group_id=
x].group =3D group;
3c9d9870c81581 Alex Williamson         2020-05-22  1151  			groups[group_id=
x].id =3D
3c9d9870c81581 Alex Williamson         2020-05-22  1152  					vfio_external=
_user_iommu_id(group);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1153  		}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1154  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1155  		kfree(group_fds);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1156  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1157  		/* release refer=
ence to groups on error */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1158  		if (ret)
8b27ee60bfd6bb Alex Williamson         2013-09-04  1159  			goto hot_reset_=
release;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1160  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1161  		info.count =3D h=
dr.count;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1162  		info.groups =3D =
groups;
8b27ee60bfd6bb Alex Williamson         2013-09-04  1163  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1164  		/*
8b27ee60bfd6bb Alex Williamson         2013-09-04  1165  		 * Test whether =
all the affected devices are contained
8b27ee60bfd6bb Alex Williamson         2013-09-04  1166  		 * by the set of=
 groups provided by the user.
8b27ee60bfd6bb Alex Williamson         2013-09-04  1167  		 */
8b27ee60bfd6bb Alex Williamson         2013-09-04  1168  		ret =3D vfio_pci=
_for_each_slot_or_bus(vdev->pdev,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1169  						    vfio_pci=
_validate_devs,
8b27ee60bfd6bb Alex Williamson         2013-09-04  1170  						    &info, s=
lot);
3c9d9870c81581 Alex Williamson         2020-05-22  1171  		if (ret)
3c9d9870c81581 Alex Williamson         2020-05-22  1172  			goto hot_reset_=
release;
3c9d9870c81581 Alex Williamson         2020-05-22  1173  =

3c9d9870c81581 Alex Williamson         2020-05-22  1174  		devs.max_index =
=3D count;
3c9d9870c81581 Alex Williamson         2020-05-22  1175  		devs.devices =3D=
 kcalloc(count, sizeof(struct vfio_device *),
3c9d9870c81581 Alex Williamson         2020-05-22  1176  				       GFP_KER=
NEL);
3c9d9870c81581 Alex Williamson         2020-05-22  1177  		if (!devs.device=
s) {
3c9d9870c81581 Alex Williamson         2020-05-22  1178  			ret =3D -ENOMEM;
3c9d9870c81581 Alex Williamson         2020-05-22  1179  			goto hot_reset_=
release;
3c9d9870c81581 Alex Williamson         2020-05-22  1180  		}
3c9d9870c81581 Alex Williamson         2020-05-22  1181  =

3c9d9870c81581 Alex Williamson         2020-05-22  1182  		/*
3c9d9870c81581 Alex Williamson         2020-05-22  1183  		 * We need to ge=
t memory_lock for each device, but devices
3c9d9870c81581 Alex Williamson         2020-05-22  1184  		 * can share mma=
p_sem, therefore we need to zap and hold
3c9d9870c81581 Alex Williamson         2020-05-22  1185  		 * the vma_lock =
for each device, and only then get each
3c9d9870c81581 Alex Williamson         2020-05-22  1186  		 * memory_lock.
3c9d9870c81581 Alex Williamson         2020-05-22  1187  		 */
3c9d9870c81581 Alex Williamson         2020-05-22  1188  		ret =3D vfio_pci=
_for_each_slot_or_bus(vdev->pdev,
3c9d9870c81581 Alex Williamson         2020-05-22  1189  					    vfio_pci_=
try_zap_and_vma_lock_cb,
3c9d9870c81581 Alex Williamson         2020-05-22  1190  					    &devs, sl=
ot);
3c9d9870c81581 Alex Williamson         2020-05-22  1191  		if (ret)
3c9d9870c81581 Alex Williamson         2020-05-22  1192  			goto hot_reset_=
release;
3c9d9870c81581 Alex Williamson         2020-05-22  1193  =

3c9d9870c81581 Alex Williamson         2020-05-22  1194  		for (; mem_idx <=
 devs.cur_index; mem_idx++) {
3c9d9870c81581 Alex Williamson         2020-05-22  1195  			struct vfio_pci=
_device *tmp;
3c9d9870c81581 Alex Williamson         2020-05-22  1196  =

3c9d9870c81581 Alex Williamson         2020-05-22  1197  			tmp =3D vfio_de=
vice_data(devs.devices[mem_idx]);
3c9d9870c81581 Alex Williamson         2020-05-22  1198  =

3c9d9870c81581 Alex Williamson         2020-05-22  1199  			ret =3D down_wr=
ite_trylock(&tmp->memory_lock);
3c9d9870c81581 Alex Williamson         2020-05-22  1200  			if (!ret) {
3c9d9870c81581 Alex Williamson         2020-05-22  1201  				ret =3D -EBUSY;
3c9d9870c81581 Alex Williamson         2020-05-22  1202  				goto hot_reset=
_release;
3c9d9870c81581 Alex Williamson         2020-05-22  1203  			}
3c9d9870c81581 Alex Williamson         2020-05-22  1204  			mutex_unlock(&t=
mp->vma_lock);
3c9d9870c81581 Alex Williamson         2020-05-22  1205  		}
3c9d9870c81581 Alex Williamson         2020-05-22  1206  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1207  		/* User has acce=
ss, do the reset */
c6a44ba950d147 Sinan Kaya              2018-07-19  1208  		ret =3D pci_rese=
t_bus(vdev->pdev);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1209  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1210  hot_reset_release:
3c9d9870c81581 Alex Williamson         2020-05-22  1211  		for (i =3D 0; i =
< devs.cur_index; i++) {
3c9d9870c81581 Alex Williamson         2020-05-22  1212  			struct vfio_dev=
ice *device;
3c9d9870c81581 Alex Williamson         2020-05-22  1213  			struct vfio_pci=
_device *tmp;
3c9d9870c81581 Alex Williamson         2020-05-22  1214  =

3c9d9870c81581 Alex Williamson         2020-05-22  1215  			device =3D devs=
.devices[i];
3c9d9870c81581 Alex Williamson         2020-05-22  1216  			tmp =3D vfio_de=
vice_data(device);
3c9d9870c81581 Alex Williamson         2020-05-22  1217  =

3c9d9870c81581 Alex Williamson         2020-05-22  1218  			if (i < mem_idx)
3c9d9870c81581 Alex Williamson         2020-05-22  1219  				up_write(&tmp-=
>memory_lock);
3c9d9870c81581 Alex Williamson         2020-05-22  1220  			else
3c9d9870c81581 Alex Williamson         2020-05-22  1221  				mutex_unlock(&=
tmp->vma_lock);
3c9d9870c81581 Alex Williamson         2020-05-22  1222  			vfio_device_put=
(device);
3c9d9870c81581 Alex Williamson         2020-05-22  1223  		}
3c9d9870c81581 Alex Williamson         2020-05-22  1224  		kfree(devs.devic=
es);
3c9d9870c81581 Alex Williamson         2020-05-22  1225  =

3c9d9870c81581 Alex Williamson         2020-05-22  1226  		for (group_idx--=
; group_idx >=3D 0; group_idx--)
3c9d9870c81581 Alex Williamson         2020-05-22  1227  			vfio_group_put_=
external_user(groups[group_idx].group);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1228  =

8b27ee60bfd6bb Alex Williamson         2013-09-04  1229  		kfree(groups);
8b27ee60bfd6bb Alex Williamson         2013-09-04  1230  		return ret;
30656177c40804 Alex Williamson         2018-03-21  1231  	} else if (cmd =
=3D=3D VFIO_DEVICE_IOEVENTFD) {
30656177c40804 Alex Williamson         2018-03-21  1232  		struct vfio_devi=
ce_ioeventfd ioeventfd;
30656177c40804 Alex Williamson         2018-03-21  1233  		int count;
30656177c40804 Alex Williamson         2018-03-21  1234  =

30656177c40804 Alex Williamson         2018-03-21  1235  		minsz =3D offset=
ofend(struct vfio_device_ioeventfd, fd);
30656177c40804 Alex Williamson         2018-03-21  1236  =

30656177c40804 Alex Williamson         2018-03-21  1237  		if (copy_from_us=
er(&ioeventfd, (void __user *)arg, minsz))
30656177c40804 Alex Williamson         2018-03-21  1238  			return -EFAULT;
30656177c40804 Alex Williamson         2018-03-21  1239  =

30656177c40804 Alex Williamson         2018-03-21  1240  		if (ioeventfd.ar=
gsz < minsz)
30656177c40804 Alex Williamson         2018-03-21  1241  			return -EINVAL;
30656177c40804 Alex Williamson         2018-03-21  1242  =

30656177c40804 Alex Williamson         2018-03-21  1243  		if (ioeventfd.fl=
ags & ~VFIO_DEVICE_IOEVENTFD_SIZE_MASK)
30656177c40804 Alex Williamson         2018-03-21  1244  			return -EINVAL;
30656177c40804 Alex Williamson         2018-03-21  1245  =

30656177c40804 Alex Williamson         2018-03-21  1246  		count =3D ioeven=
tfd.flags & VFIO_DEVICE_IOEVENTFD_SIZE_MASK;
30656177c40804 Alex Williamson         2018-03-21  1247  =

30656177c40804 Alex Williamson         2018-03-21  1248  		if (hweight8(cou=
nt) !=3D 1 || ioeventfd.fd < -1)
30656177c40804 Alex Williamson         2018-03-21  1249  			return -EINVAL;
30656177c40804 Alex Williamson         2018-03-21  1250  =

30656177c40804 Alex Williamson         2018-03-21  1251  		return vfio_pci_=
ioeventfd(vdev, ioeventfd.offset,
30656177c40804 Alex Williamson         2018-03-21  1252  					  ioeventfd.d=
ata, count, ioeventfd.fd);
43eeeecc8ed5fa Alex Williamson         2020-03-24  1253  	} else if (cmd =
=3D=3D VFIO_DEVICE_FEATURE) {
43eeeecc8ed5fa Alex Williamson         2020-03-24  1254  		struct vfio_devi=
ce_feature feature;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1255  		uuid_t uuid;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1256  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1257  		minsz =3D offset=
ofend(struct vfio_device_feature, flags);
43eeeecc8ed5fa Alex Williamson         2020-03-24  1258  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1259  		if (copy_from_us=
er(&feature, (void __user *)arg, minsz))
43eeeecc8ed5fa Alex Williamson         2020-03-24  1260  			return -EFAULT;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1261  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1262  		if (feature.args=
z < minsz)
43eeeecc8ed5fa Alex Williamson         2020-03-24  1263  			return -EINVAL;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1264  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1265  		/* Check unknown=
 flags */
43eeeecc8ed5fa Alex Williamson         2020-03-24  1266  		if (feature.flag=
s & ~(VFIO_DEVICE_FEATURE_MASK |
43eeeecc8ed5fa Alex Williamson         2020-03-24  1267  				      VFIO_DEV=
ICE_FEATURE_SET |
43eeeecc8ed5fa Alex Williamson         2020-03-24  1268  				      VFIO_DEV=
ICE_FEATURE_GET |
43eeeecc8ed5fa Alex Williamson         2020-03-24  1269  				      VFIO_DEV=
ICE_FEATURE_PROBE))
43eeeecc8ed5fa Alex Williamson         2020-03-24  1270  			return -EINVAL;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1271  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1272  		/* GET & SET are=
 mutually exclusive except with PROBE */
43eeeecc8ed5fa Alex Williamson         2020-03-24  1273  		if (!(feature.fl=
ags & VFIO_DEVICE_FEATURE_PROBE) &&
43eeeecc8ed5fa Alex Williamson         2020-03-24  1274  		    (feature.fla=
gs & VFIO_DEVICE_FEATURE_SET) &&
43eeeecc8ed5fa Alex Williamson         2020-03-24  1275  		    (feature.fla=
gs & VFIO_DEVICE_FEATURE_GET))
43eeeecc8ed5fa Alex Williamson         2020-03-24  1276  			return -EINVAL;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1277  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1278  		switch (feature.=
flags & VFIO_DEVICE_FEATURE_MASK) {
43eeeecc8ed5fa Alex Williamson         2020-03-24  1279  		case VFIO_DEVICE=
_FEATURE_PCI_VF_TOKEN:
43eeeecc8ed5fa Alex Williamson         2020-03-24  1280  			if (!vdev->vf_t=
oken)
43eeeecc8ed5fa Alex Williamson         2020-03-24  1281  				return -ENOTTY;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1282  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1283  			/*
43eeeecc8ed5fa Alex Williamson         2020-03-24  1284  			 * We do not su=
pport GET of the VF Token UUID as this
43eeeecc8ed5fa Alex Williamson         2020-03-24  1285  			 * could expose=
 the token of the previous device user.
43eeeecc8ed5fa Alex Williamson         2020-03-24  1286  			 */
43eeeecc8ed5fa Alex Williamson         2020-03-24  1287  			if (feature.fla=
gs & VFIO_DEVICE_FEATURE_GET)
43eeeecc8ed5fa Alex Williamson         2020-03-24  1288  				return -EINVAL;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1289  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1290  			if (feature.fla=
gs & VFIO_DEVICE_FEATURE_PROBE)
43eeeecc8ed5fa Alex Williamson         2020-03-24  1291  				return 0;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1292  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1293  			/* Don't SET un=
less told to do so */
43eeeecc8ed5fa Alex Williamson         2020-03-24  1294  			if (!(feature.f=
lags & VFIO_DEVICE_FEATURE_SET))
43eeeecc8ed5fa Alex Williamson         2020-03-24  1295  				return -EINVAL;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1296  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1297  			if (feature.arg=
sz < minsz + sizeof(uuid))
43eeeecc8ed5fa Alex Williamson         2020-03-24  1298  				return -EINVAL;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1299  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1300  			if (copy_from_u=
ser(&uuid, (void __user *)(arg + minsz),
43eeeecc8ed5fa Alex Williamson         2020-03-24  1301  					   sizeof(uui=
d)))
43eeeecc8ed5fa Alex Williamson         2020-03-24  1302  				return -EFAULT;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1303  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1304  			mutex_lock(&vde=
v->vf_token->lock);
43eeeecc8ed5fa Alex Williamson         2020-03-24  1305  			uuid_copy(&vdev=
->vf_token->uuid, &uuid);
43eeeecc8ed5fa Alex Williamson         2020-03-24  1306  			mutex_unlock(&v=
dev->vf_token->lock);
43eeeecc8ed5fa Alex Williamson         2020-03-24  1307  =

43eeeecc8ed5fa Alex Williamson         2020-03-24  1308  			return 0;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1309  		default:
43eeeecc8ed5fa Alex Williamson         2020-03-24  1310  			return -ENOTTY;
43eeeecc8ed5fa Alex Williamson         2020-03-24  1311  		}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1312  	}
8b27ee60bfd6bb Alex Williamson         2013-09-04  1313  =

89e1f7d4c66d85 Alex Williamson         2012-07-31  1314  	return -ENOTTY;
89e1f7d4c66d85 Alex Williamson         2012-07-31  1315  }
89e1f7d4c66d85 Alex Williamson         2012-07-31  1316  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3764230533535419751==--

