Content-Type: multipart/mixed; boundary="===============7313905534338929630=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.19-rc5 84/104] drivers/iommu/iommufd/device.c:131:21: sparse: sparse: dubious: !x & y
Date: Fri, 15 Jul 2022 02:34:53 +0800
Message-ID: <202207150258.it1dsIG7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7313905534338929630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/i=
ommu/iommufd/device.c:131:21: sparse: sparse: dubious: !x & y"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.19-rc5
head:   f200d9a1de755f3bb98e21535e22b9adf6ba83f7
commit: 4e9347bc44832ec0e1557796ed0b42674a960a4e [84/104] iommufd: Add driv=
er facing API for PASID support
:::::: branch date: 8 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20220=
715/202207150258.it1dsIG7-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/luxis1999/iommufd/commit/4e9347bc44832ec0e1557=
796ed0b42674a960a4e
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommu=
fd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.19-rc5
        git checkout 4e9347bc44832ec0e1557796ed0b42674a960a4e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash ./ drivers/iommu/iommufd/ kernel/bp=
f/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/device.c:131:21: sparse: sparse: dubious: !x & y

vim +131 drivers/iommu/iommufd/device.c

6f915f4df4ae49 Jason Gunthorpe 2021-11-11   53  =

6f915f4df4ae49 Jason Gunthorpe 2021-11-11   54  /**
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   55   * iommufd_bind_device - Bi=
nd a physical device to an iommu fd
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   56   * @fd: iommufd file descri=
ptor.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   57   * @pdev: Pointer to a phys=
ical PCI device struct
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   58   * @id: Output ID number to=
 return to userspace for this device
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   59   *
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   60   * A successful bind establ=
ishes an ownership over the device and returns
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   61   * struct iommufd_device po=
inter, otherwise returns error pointer.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   62   *
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   63   * A driver using this API =
must set driver_managed_dma and must not touch
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   64   * the device until this ro=
utine succeeds and establishes ownership.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   65   *
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   66   * Binding a PCI device pla=
ces the entire RID under iommufd control.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   67   *
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   68   * The caller must undo thi=
s with iommufd_unbind_device()
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   69   */
4e9347bc44832e Yi Liu          2022-06-22   70  struct iommufd_device *iomm=
ufd_bind_device(int fd, struct device *dev,
4e9347bc44832e Yi Liu          2022-06-22   71  					   unsigned int flags,=
 u32 *id)
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   72  {
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   73  	struct iommufd_device *ide=
v;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   74  	struct iommufd_ctx *ictx;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   75  	struct iommu_group *group;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   76  	int rc;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   77  =

6f915f4df4ae49 Jason Gunthorpe 2021-11-11   78         /*
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   79          * iommufd always se=
ts IOMMU_CACHE because we offer no way for userspace
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   80          * to restore cache =
coherency.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   81          */
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   82         if (!iommu_capable(d=
ev->bus, IOMMU_CAP_CACHE_COHERENCY))
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   83  		return ERR_PTR(-EINVAL);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   84  =

6f915f4df4ae49 Jason Gunthorpe 2021-11-11   85  	ictx =3D iommufd_fget(fd);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   86  	if (!ictx)
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   87  		return ERR_PTR(-EINVAL);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   88  =

6f915f4df4ae49 Jason Gunthorpe 2021-11-11   89  	group =3D iommu_group_get(=
dev);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   90  	if (!group) {
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   91  		rc =3D -ENODEV;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   92  		goto out_file_put;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   93  	}
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   94  =

6f915f4df4ae49 Jason Gunthorpe 2021-11-11   95  	/*
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   96  	 * FIXME: Use a device-cen=
tric iommu api and this won't work with
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   97  	 * multi-device groups
6f915f4df4ae49 Jason Gunthorpe 2021-11-11   98  	 */
4e9347bc44832e Yi Liu          2022-06-22   99  	if (!(flags & IOMMUFD_BIND=
_FLAGS_BYPASS_DMA_OWNERSHIP)) {
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  100  		rc =3D iommu_group_claim_=
dma_owner(group, ictx->filp);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  101  		if (rc)
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  102  			goto out_group_put;
4e9347bc44832e Yi Liu          2022-06-22  103  	}
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  104  =

6f915f4df4ae49 Jason Gunthorpe 2021-11-11  105  	idev =3D iommufd_object_al=
loc(ictx, idev, IOMMUFD_OBJ_DEVICE);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  106  	if (IS_ERR(idev)) {
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  107  		rc =3D PTR_ERR(idev);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  108  		goto out_release_owner;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  109  	}
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  110  	idev->ictx =3D ictx;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  111  	idev->dev =3D dev;
4e9347bc44832e Yi Liu          2022-06-22  112  	idev->dma_owner_claimed =
=3D
4e9347bc44832e Yi Liu          2022-06-22  113  		!(flags & IOMMUFD_BIND_FL=
AGS_BYPASS_DMA_OWNERSHIP);
4e9347bc44832e Yi Liu          2022-06-22  114  	xa_init_flags(&idev->pasid=
_xa, XA_FLAGS_ALLOC | XA_FLAGS_ACCOUNT);
4e9347bc44832e Yi Liu          2022-06-22  115  	mutex_init(&idev->pasid_lo=
ck);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  116  	/* The calling driver is a=
 user until iommufd_unbind_device() */
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  117  	refcount_inc(&idev->obj.us=
ers);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  118  	/* group refcount moves in=
to iommufd_device */
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  119  	idev->group =3D group;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  120  =

6f915f4df4ae49 Jason Gunthorpe 2021-11-11  121  	/*
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  122  	 * If the caller fails aft=
er this success it must call
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  123  	 * iommufd_unbind_device()=
 which is safe since we hold this refcount.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  124  	 * This also means the dev=
ice is a leaf in the graph and no other object
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  125  	 * can take a reference on=
 it.
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  126  	 */
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  127  	iommufd_object_finalize(ic=
tx, &idev->obj);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  128  	*id =3D idev->obj.id;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  129  	return idev;
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  130  out_release_owner:
4e9347bc44832e Yi Liu          2022-06-22 @131  	if ((!flags & IOMMUFD_BIND=
_FLAGS_BYPASS_DMA_OWNERSHIP))
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  132  		iommu_group_release_dma_o=
wner(group);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  133  out_group_put:
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  134  	iommu_group_put(group);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  135  out_file_put:
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  136  	fput(ictx->filp);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  137  	return ERR_PTR(rc);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  138  }
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  139  EXPORT_SYMBOL_GPL(iommufd_b=
ind_device);
6f915f4df4ae49 Jason Gunthorpe 2021-11-11  140  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7313905534338929630==--

