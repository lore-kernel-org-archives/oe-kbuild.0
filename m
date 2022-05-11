Content-Type: multipart/mixed; boundary="===============1894969136243305088=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:vsva-iommufd-v5.18-rc4-joerg-branch 38/42] drivers/iommu/iommufd/vfio_compat.c:495:2-8: preceding lock on line 492
Date: Wed, 11 May 2022 20:58:02 +0800
Message-ID: <202205112026.4dgoeeGC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1894969136243305088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd vsva-iommufd-v5.18-rc4-joerg-b=
ranch
head:   1da48fc20a9603c05ac0e88aa4bc063cc426b232
commit: c5bc8da26ecd07a0ca1a955a1bdc5c206e04c5d8 [38/42] vfio: Add iommufd =
VFIO compat support to group_fd
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-c001-20220509 (https://download.01.org/0day-ci/arch=
ive/20220511/202205112026.4dgoeeGC-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/vfio_compat.c:495:2-8: preceding lock on line 492

vim +495 drivers/iommu/iommufd/vfio_compat.c

f3c739aa1a7a8f Nicolin Chen 2022-01-31  482  =

f3c739aa1a7a8f Nicolin Chen 2022-01-31  483  void vfio_group_unset_iommufd(=
void *iommufd, struct list_head *device_list)
f3c739aa1a7a8f Nicolin Chen 2022-01-31  484  {
f3c739aa1a7a8f Nicolin Chen 2022-01-31  485  	struct iommufd_ctx *ictx =3D =
(struct iommufd_ctx *)iommufd;
f3c739aa1a7a8f Nicolin Chen 2022-01-31  486  	struct iommufd_ioas *ioas;
f3c739aa1a7a8f Nicolin Chen 2022-01-31  487  	struct vfio_device *device;
f3c739aa1a7a8f Nicolin Chen 2022-01-31  488  	unsigned int ioas_id;
f3c739aa1a7a8f Nicolin Chen 2022-01-31  489  =

f3c739aa1a7a8f Nicolin Chen 2022-01-31  490  	if (!ictx)
f3c739aa1a7a8f Nicolin Chen 2022-01-31  491  		return;
f3c739aa1a7a8f Nicolin Chen 2022-01-31 @492  	mutex_lock(&ictx->vfio_compat=
);
f3c739aa1a7a8f Nicolin Chen 2022-01-31  493  	ioas =3D get_compat_ioas(ictx=
);
f3c739aa1a7a8f Nicolin Chen 2022-01-31  494  	if (IS_ERR(ioas))
f3c739aa1a7a8f Nicolin Chen 2022-01-31 @495  		return;

:::::: The code at line 495 was first introduced by commit
:::::: f3c739aa1a7a8ff80f9997f02d36f2a63f53a251 iommufd: Add vfio_group_set=
/unset_iommufd helpers

:::::: TO: Nicolin Chen <nicolinc@nvidia.com>
:::::: CC: Yi Liu <yi.l.liu@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1894969136243305088==--

