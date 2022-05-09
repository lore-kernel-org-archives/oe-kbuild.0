Content-Type: multipart/mixed; boundary="===============1410217438596330119=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:vsva-iommufd-v5.18-rc4-joerg-branch 37/42] drivers/iommu/iommufd/vfio_compat.c:503 vfio_group_unset_iommufd() warn: inconsistent returns '&ictx->vfio_compat'.
Date: Tue, 10 May 2022 02:50:19 +0800
Message-ID: <202205100226.1PLMwvAu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1410217438596330119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd vsva-iommufd-v5.18-rc4-joerg-b=
ranch
head:   1da48fc20a9603c05ac0e88aa4bc063cc426b232
commit: f3c739aa1a7a8ff80f9997f02d36f2a63f53a251 [37/42] iommufd: Add vfio_=
group_set/unset_iommufd helpers
:::::: branch date: 13 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-m001-20220509 (https://download.01.org/0day-ci/ar=
chive/20220510/202205100226.1PLMwvAu-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iommu/iommufd/vfio_compat.c:503 vfio_group_unset_iommufd() warn: in=
consistent returns '&ictx->vfio_compat'.

vim +503 drivers/iommu/iommufd/vfio_compat.c

f3c739aa1a7a8f Nicolin Chen 2022-01-31  481  =

f3c739aa1a7a8f Nicolin Chen 2022-01-31  482  void vfio_group_unset_iommufd(=
void *iommufd, struct list_head *device_list)
f3c739aa1a7a8f Nicolin Chen 2022-01-31  483  {
f3c739aa1a7a8f Nicolin Chen 2022-01-31  484  	struct iommufd_ctx *ictx =3D =
(struct iommufd_ctx *)iommufd;
f3c739aa1a7a8f Nicolin Chen 2022-01-31  485  	struct iommufd_ioas *ioas;
f3c739aa1a7a8f Nicolin Chen 2022-01-31  486  	struct vfio_device *device;
f3c739aa1a7a8f Nicolin Chen 2022-01-31  487  	unsigned int ioas_id;
f3c739aa1a7a8f Nicolin Chen 2022-01-31  488  =

f3c739aa1a7a8f Nicolin Chen 2022-01-31  489  	if (!ictx)
f3c739aa1a7a8f Nicolin Chen 2022-01-31  490  		return;
f3c739aa1a7a8f Nicolin Chen 2022-01-31  491  	mutex_lock(&ictx->vfio_compat=
);
f3c739aa1a7a8f Nicolin Chen 2022-01-31  492  	ioas =3D get_compat_ioas(ictx=
);
f3c739aa1a7a8f Nicolin Chen 2022-01-31  493  	if (IS_ERR(ioas))
f3c739aa1a7a8f Nicolin Chen 2022-01-31  494  		return;
f3c739aa1a7a8f Nicolin Chen 2022-01-31  495  =

f3c739aa1a7a8f Nicolin Chen 2022-01-31  496  	ioas_id =3D ioas->obj.id;
f3c739aa1a7a8f Nicolin Chen 2022-01-31  497  	iommufd_put_object(&ioas->obj=
);
f3c739aa1a7a8f Nicolin Chen 2022-01-31  498  =

f3c739aa1a7a8f Nicolin Chen 2022-01-31  499  	vfio_device_detach_unbind(ict=
x, ioas_id, device, device_list);
f3c739aa1a7a8f Nicolin Chen 2022-01-31  500  	if (--ictx->groups =3D=3D 0)
f3c739aa1a7a8f Nicolin Chen 2022-01-31  501  		iommufd_ioas_destroy(&ioas->=
obj);
f3c739aa1a7a8f Nicolin Chen 2022-01-31  502  	mutex_unlock(&ictx->vfio_comp=
at);
f3c739aa1a7a8f Nicolin Chen 2022-01-31 @503  	fput(ictx->filp);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1410217438596330119==--

