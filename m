Content-Type: multipart/mixed; boundary="===============1577871586359699344=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.18-rc4-nesting 37/70] drivers/iommu/iommufd/vfio_compat.c:494:2-8: preceding lock on line 491
Date: Wed, 15 Jun 2022 08:33:40 +0800
Message-ID: <202206150817.8ZznTMcP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1577871586359699344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.18-rc4-nesting
head:   e642747ca46aa568063964b5b5101e35258ea0d5
commit: f3c739aa1a7a8ff80f9997f02d36f2a63f53a251 [37/70] iommufd: Add vfio_=
group_set/unset_iommufd helpers
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-c002-20220613 (https://download.01.org/0day-ci/ar=
chive/20220615/202206150817.8ZznTMcP-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/vfio_compat.c:494:2-8: preceding lock on line 491

vim +494 drivers/iommu/iommufd/vfio_compat.c

f3c739aa1a7a8ff Nicolin Chen 2022-01-31  481  =

f3c739aa1a7a8ff Nicolin Chen 2022-01-31  482  void vfio_group_unset_iommufd=
(void *iommufd, struct list_head *device_list)
f3c739aa1a7a8ff Nicolin Chen 2022-01-31  483  {
f3c739aa1a7a8ff Nicolin Chen 2022-01-31  484  	struct iommufd_ctx *ictx =3D=
 (struct iommufd_ctx *)iommufd;
f3c739aa1a7a8ff Nicolin Chen 2022-01-31  485  	struct iommufd_ioas *ioas;
f3c739aa1a7a8ff Nicolin Chen 2022-01-31  486  	struct vfio_device *device;
f3c739aa1a7a8ff Nicolin Chen 2022-01-31  487  	unsigned int ioas_id;
f3c739aa1a7a8ff Nicolin Chen 2022-01-31  488  =

f3c739aa1a7a8ff Nicolin Chen 2022-01-31  489  	if (!ictx)
f3c739aa1a7a8ff Nicolin Chen 2022-01-31  490  		return;
f3c739aa1a7a8ff Nicolin Chen 2022-01-31 @491  	mutex_lock(&ictx->vfio_compa=
t);
f3c739aa1a7a8ff Nicolin Chen 2022-01-31  492  	ioas =3D get_compat_ioas(ict=
x);
f3c739aa1a7a8ff Nicolin Chen 2022-01-31  493  	if (IS_ERR(ioas))
f3c739aa1a7a8ff Nicolin Chen 2022-01-31 @494  		return;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1577871586359699344==--

