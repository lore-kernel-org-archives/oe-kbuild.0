Content-Type: multipart/mixed; boundary="===============1745331107238071740=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.18-rc4-nesting 46/53] drivers/iommu/iommufd/device.c:78 iommufd_bind_pci_device() warn: add some parenthesis here?
Date: Tue, 17 May 2022 02:16:19 +0800
Message-ID: <202205170248.v7sNFj7r-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1745331107238071740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.18-rc4-nesting
head:   402999460191d8f40e06d874b1ea2e860957ead5
commit: 953f3f716a272968792cd61ebbe82941d31d0a64 [46/53] iommufd/device: Ad=
d iommufd_device_at[de]tach_pasid()
:::::: branch date: 30 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20220516 (https://download.01.org/0day-ci/arch=
ive/20220517/202205170248.v7sNFj7r-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/iommu/iommufd/device.c:78 iommufd_bind_pci_device() warn: add some =
parenthesis here?
drivers/iommu/iommufd/device.c:78 iommufd_bind_pci_device() warn: maybe use=
 && instead of &

Old smatch warnings:
drivers/iommu/iommufd/device.c:107 iommufd_bind_pci_device() warn: add some=
 parenthesis here?
drivers/iommu/iommufd/device.c:107 iommufd_bind_pci_device() warn: maybe us=
e && instead of &

vim +78 drivers/iommu/iommufd/device.c

a9447b06c53bd3f Jason Gunthorpe 2021-11-11   39  =

a9447b06c53bd3f Jason Gunthorpe 2021-11-11   40  /**
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   41   * iommufd_bind_pci_device=
 - Bind a physical device to an iommu fd
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   42   * @fd: iommufd file descr=
iptor.
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   43   * @pdev: Pointer to a phy=
sical PCI device struct
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   44   * @id: Output ID number t=
o return to userspace for this device
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   45   *
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   46   * A successful bind estab=
lishes an ownership over the device and returns
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   47   * struct iommufd_device p=
ointer, otherwise returns error pointer.
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   48   *
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   49   * A driver using this API=
 must set driver_managed_dma and must not touch
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   50   * the device until this r=
outine succeeds and establishes ownership.
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   51   *
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   52   * Binding a PCI device pl=
aces the entire RID under iommufd control.
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   53   *
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   54   * The caller must undo th=
is with iommufd_unbind_device()
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   55   */
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   56  struct iommufd_device *iom=
mufd_bind_pci_device(int fd, struct pci_dev *pdev,
953f3f716a27296 Yi Liu          2022-05-13   57  					       unsigned int f=
lags, u32 *id)
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   58  {
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   59  	struct iommufd_device *id=
ev;
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   60  	struct iommufd_ctx *ictx;
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   61  	struct iommu_group *group;
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   62  	int rc;
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   63  =

a9447b06c53bd3f Jason Gunthorpe 2021-11-11   64  	ictx =3D iommufd_fget(fd);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   65  	if (!ictx)
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   66  		return ERR_PTR(-EINVAL);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   67  =

a9447b06c53bd3f Jason Gunthorpe 2021-11-11   68  	group =3D iommu_group_get=
(&pdev->dev);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   69  	if (!group) {
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   70  		rc =3D -ENODEV;
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   71  		goto out_file_put;
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   72  	}
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   73  =

a9447b06c53bd3f Jason Gunthorpe 2021-11-11   74  	/*
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   75  	 * FIXME: Use a device-ce=
ntric iommu api and this won't work with
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   76  	 * multi-device groups
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   77  	 */
953f3f716a27296 Yi Liu          2022-05-13  @78  	if ((!flags & IOMMUFD_BIN=
D_FLAGS_BYPASS_DMA_OWNERSHIP)) {
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   79  		rc =3D iommu_group_claim=
_dma_owner(group, ictx->filp);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   80  		if (rc)
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   81  			goto out_group_put;
953f3f716a27296 Yi Liu          2022-05-13   82  	}
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   83  =

a9447b06c53bd3f Jason Gunthorpe 2021-11-11   84  	idev =3D iommufd_object_a=
lloc(ictx, idev, IOMMUFD_OBJ_DEVICE);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   85  	if (IS_ERR(idev)) {
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   86  		rc =3D PTR_ERR(idev);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   87  		goto out_release_owner;
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   88  	}
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   89  	idev->ictx =3D ictx;
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   90  	idev->dev =3D &pdev->dev;
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   91  	/* The calling driver is =
a user until iommufd_unbind_device() */
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   92  	refcount_inc(&idev->obj.u=
sers);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   93  	/* group refcount moves i=
nto iommufd_device */
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   94  	idev->group =3D group;
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   95  =

a9447b06c53bd3f Jason Gunthorpe 2021-11-11   96  	/*
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   97  	 * If the caller fails af=
ter this success it must call
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   98  	 * iommufd_unbind_device(=
) which is safe since we hold this refcount.
a9447b06c53bd3f Jason Gunthorpe 2021-11-11   99  	 * This also means the de=
vice is a leaf in the graph and no other object
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  100  	 * can take a reference o=
n it.
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  101  	 */
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  102  	iommufd_object_finalize(i=
ctx, &idev->obj);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  103  	*id =3D idev->obj.id;
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  104  	return idev;
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  105  =

a9447b06c53bd3f Jason Gunthorpe 2021-11-11  106  out_release_owner:
953f3f716a27296 Yi Liu          2022-05-13  107  	if ((!flags & IOMMUFD_BIN=
D_FLAGS_BYPASS_DMA_OWNERSHIP))
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  108  		iommu_group_release_dma_=
owner(group);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  109  out_group_put:
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  110  	iommu_group_put(group);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  111  out_file_put:
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  112  	fput(ictx->filp);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  113  	return ERR_PTR(rc);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  114  }
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  115  EXPORT_SYMBOL_GPL(iommufd_=
bind_pci_device);
a9447b06c53bd3f Jason Gunthorpe 2021-11-11  116  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1745331107238071740==--

