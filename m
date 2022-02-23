Content-Type: multipart/mixed; boundary="===============3493978748318478202=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.17-rc4 22/24] drivers/vfio/pci/vfio_pci_core.c:748:21-30: ERROR: vdev is NULL but dereferenced.
Date: Thu, 24 Feb 2022 04:17:55 +0800
Message-ID: <202202240416.1pv2dAu6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3493978748318478202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.17-rc4
head:   678d68bc41ac28646c6f1ef72c28f073e0d9200e
commit: 33796a4acfc6399542045e2425fe54cf457b5b69 [22/24] vfio/pci: Add VFIO=
_DEVICE_ATTACH_IOASPT
:::::: branch date: 9 hours ago
:::::: commit date: 13 hours ago
config: arc-randconfig-c024-20220223 (https://download.01.org/0day-ci/archi=
ve/20220224/202202240416.1pv2dAu6-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/vfio/pci/vfio_pci_core.c:748:21-30: ERROR: vdev is NULL but dere=
ferenced.

vim +748 drivers/vfio/pci/vfio_pci_core.c

33796a4acfc639 Liu Yi L 2021-12-10  724  =

33796a4acfc639 Liu Yi L 2021-12-10  725  void vfio_pci_core_detach_ioaspt(s=
truct vfio_device *core_vdev,
33796a4acfc639 Liu Yi L 2021-12-10  726  				 struct vfio_device_detach_ioa=
spt *detach)
33796a4acfc639 Liu Yi L 2021-12-10  727  {
33796a4acfc639 Liu Yi L 2021-12-10  728  	struct vfio_pci_core_device *vdev=
 =3D
33796a4acfc639 Liu Yi L 2021-12-10  729  		container_of(core_vdev, struct v=
fio_pci_core_device, vdev);
33796a4acfc639 Liu Yi L 2021-12-10  730  =

33796a4acfc639 Liu Yi L 2021-12-10  731  	mutex_lock(&vdev->idev_lock);
33796a4acfc639 Liu Yi L 2021-12-10  732  =

33796a4acfc639 Liu Yi L 2021-12-10  733  	if (!vdev)
33796a4acfc639 Liu Yi L 2021-12-10  734  		goto out_unlock;
33796a4acfc639 Liu Yi L 2021-12-10  735  =

33796a4acfc639 Liu Yi L 2021-12-10  736  	if (vdev->ioaspt_id =3D=3D IOMMUF=
D_INVALID_ID)
33796a4acfc639 Liu Yi L 2021-12-10  737  		goto out_unlock;
33796a4acfc639 Liu Yi L 2021-12-10  738  =

33796a4acfc639 Liu Yi L 2021-12-10  739  	if (vdev->iommufd !=3D detach->io=
mmufd ||
33796a4acfc639 Liu Yi L 2021-12-10  740  	    vdev->ioaspt_id !=3D detach->=
ioaspt_id)
33796a4acfc639 Liu Yi L 2021-12-10  741  		goto out_unlock;
33796a4acfc639 Liu Yi L 2021-12-10  742  =

33796a4acfc639 Liu Yi L 2021-12-10  743  	vdev->iommufd =3D -1;
33796a4acfc639 Liu Yi L 2021-12-10  744  	vdev->ioaspt_id =3D IOMMUFD_INVAL=
ID_ID;
33796a4acfc639 Liu Yi L 2021-12-10  745  	iommufd_device_detach(vdev->idev);
33796a4acfc639 Liu Yi L 2021-12-10  746  =

33796a4acfc639 Liu Yi L 2021-12-10  747  out_unlock:
33796a4acfc639 Liu Yi L 2021-12-10 @748  	mutex_unlock(&vdev->idev_lock);
33796a4acfc639 Liu Yi L 2021-12-10  749  }
33796a4acfc639 Liu Yi L 2021-12-10  750  EXPORT_SYMBOL_GPL(vfio_pci_core_de=
tach_ioaspt);
33796a4acfc639 Liu Yi L 2021-12-10  751  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3493978748318478202==--

