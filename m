Content-Type: multipart/mixed; boundary="===============0586608480641066420=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.17-rc6 24/28] drivers/iommu/iommufd/vfio_compat.c:494:2-8: preceding lock on line 491
Date: Fri, 15 Apr 2022 13:40:44 +0800
Message-ID: <202204151332.VXctgcaF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0586608480641066420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.17-rc6
head:   71a58479a11e89a480ebc59ed5163440d3e2772c
commit: a3273f1f88fe60e784d6e9916269a7d70fc6daf4 [24/28] iommufd: Add vfio_=
group_set/unset_iommufd helpers
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: sparc64-randconfig-c024-20220414 (https://download.01.org/0day-ci/a=
rchive/20220415/202204151332.VXctgcaF-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/vfio_compat.c:494:2-8: preceding lock on line 491

vim +494 drivers/iommu/iommufd/vfio_compat.c

a3273f1f88fe60 Nicolin Chen 2022-01-31  481  =

a3273f1f88fe60 Nicolin Chen 2022-01-31  482  void vfio_group_unset_iommufd(=
void *iommufd, struct list_head *device_list)
a3273f1f88fe60 Nicolin Chen 2022-01-31  483  {
a3273f1f88fe60 Nicolin Chen 2022-01-31  484  	struct iommufd_ctx *ictx =3D =
(struct iommufd_ctx *)iommufd;
a3273f1f88fe60 Nicolin Chen 2022-01-31  485  	struct iommufd_ioas *ioas;
a3273f1f88fe60 Nicolin Chen 2022-01-31  486  	struct vfio_device *device;
a3273f1f88fe60 Nicolin Chen 2022-01-31  487  	unsigned int ioas_id;
a3273f1f88fe60 Nicolin Chen 2022-01-31  488  =

a3273f1f88fe60 Nicolin Chen 2022-01-31  489  	if (!ictx)
a3273f1f88fe60 Nicolin Chen 2022-01-31  490  		return;
a3273f1f88fe60 Nicolin Chen 2022-01-31 @491  	mutex_lock(&ictx->vfio_compat=
);
a3273f1f88fe60 Nicolin Chen 2022-01-31  492  	ioas =3D get_compat_ioas(ictx=
);
a3273f1f88fe60 Nicolin Chen 2022-01-31  493  	if (IS_ERR(ioas))
a3273f1f88fe60 Nicolin Chen 2022-01-31 @494  		return;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0586608480641066420==--

