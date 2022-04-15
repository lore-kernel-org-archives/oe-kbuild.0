Content-Type: multipart/mixed; boundary="===============0259609315621311472=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.17-rc6 24/28] drivers/iommu/iommufd/vfio_compat.c:503 vfio_group_unset_iommufd() warn: inconsistent returns '&ictx->vfio_compat'.
Date: Fri, 15 Apr 2022 22:52:45 +0800
Message-ID: <202204152248.K66L5JbF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0259609315621311472==
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
config: arm64-randconfig-m031-20220415 (https://download.01.org/0day-ci/arc=
hive/20220415/202204152248.K66L5JbF-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iommu/iommufd/vfio_compat.c:503 vfio_group_unset_iommufd() warn: in=
consistent returns '&ictx->vfio_compat'.

vim +503 drivers/iommu/iommufd/vfio_compat.c

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
a3273f1f88fe60 Nicolin Chen 2022-01-31  491  	mutex_lock(&ictx->vfio_compat=
);
a3273f1f88fe60 Nicolin Chen 2022-01-31  492  	ioas =3D get_compat_ioas(ictx=
);
a3273f1f88fe60 Nicolin Chen 2022-01-31  493  	if (IS_ERR(ioas))
a3273f1f88fe60 Nicolin Chen 2022-01-31  494  		return;
a3273f1f88fe60 Nicolin Chen 2022-01-31  495  =

a3273f1f88fe60 Nicolin Chen 2022-01-31  496  	ioas_id =3D ioas->obj.id;
a3273f1f88fe60 Nicolin Chen 2022-01-31  497  	iommufd_put_object(&ioas->obj=
);
a3273f1f88fe60 Nicolin Chen 2022-01-31  498  =

a3273f1f88fe60 Nicolin Chen 2022-01-31  499  	vfio_device_detach_unbind(ict=
x, ioas_id, device, device_list);
a3273f1f88fe60 Nicolin Chen 2022-01-31  500  	if (--ictx->groups =3D=3D 0)
a3273f1f88fe60 Nicolin Chen 2022-01-31  501  		iommufd_ioas_destroy(&ioas->=
obj);
a3273f1f88fe60 Nicolin Chen 2022-01-31  502  	mutex_unlock(&ictx->vfio_comp=
at);
a3273f1f88fe60 Nicolin Chen 2022-01-31 @503  	fput(ictx->filp);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0259609315621311472==--

