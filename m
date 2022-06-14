Content-Type: multipart/mixed; boundary="===============1199998551576850347=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.18-rc4-nesting 48/70] drivers/iommu/iommufd/device.c:80:21: sparse: sparse: dubious: !x & y
Date: Tue, 14 Jun 2022 08:56:09 +0800
Message-ID: <202206140846.icPRERoE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1199998551576850347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/i=
ommu/iommufd/device.c:80:21: sparse: sparse: dubious: !x & y"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.18-rc4-nesting
head:   e642747ca46aa568063964b5b5101e35258ea0d5
commit: d507176b02c1c8113388d7dbac46ac3244453e24 [48/70] iommufd/device: Ad=
d iommufd_device_attach_pasid()
:::::: branch date: 17 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220614/202206140846.icPRERoE-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/luxis1999/iommufd/commit/d507176b02c1c8113388d=
7dbac46ac3244453e24
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommu=
fd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.18-rc4-nesting
        git checkout d507176b02c1c8113388d7dbac46ac3244453e24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/iommufd/device.c:80:21: sparse: sparse: dubious: !x & y
   drivers/iommu/iommufd/device.c:109:21: sparse: sparse: dubious: !x & y

vim +80 drivers/iommu/iommufd/device.c

a9447b06c53bd3 Jason Gunthorpe 2021-11-11   41  =

a9447b06c53bd3 Jason Gunthorpe 2021-11-11   42  /**
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   43   * iommufd_bind_pci_device =
- Bind a physical device to an iommu fd
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   44   * @fd: iommufd file descri=
ptor.
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   45   * @pdev: Pointer to a phys=
ical PCI device struct
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   46   * @id: Output ID number to=
 return to userspace for this device
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   47   *
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   48   * A successful bind establ=
ishes an ownership over the device and returns
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   49   * struct iommufd_device po=
inter, otherwise returns error pointer.
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   50   *
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   51   * A driver using this API =
must set driver_managed_dma and must not touch
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   52   * the device until this ro=
utine succeeds and establishes ownership.
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   53   *
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   54   * Binding a PCI device pla=
ces the entire RID under iommufd control.
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   55   *
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   56   * The caller must undo thi=
s with iommufd_unbind_device()
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   57   */
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   58  struct iommufd_device *iomm=
ufd_bind_pci_device(int fd, struct pci_dev *pdev,
d507176b02c1c8 Yi Liu          2022-05-13   59  					       unsigned int fl=
ags, u32 *id)
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   60  {
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   61  	struct iommufd_device *ide=
v;
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   62  	struct iommufd_ctx *ictx;
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   63  	struct iommu_group *group;
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   64  	int rc;
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   65  =

a9447b06c53bd3 Jason Gunthorpe 2021-11-11   66  	ictx =3D iommufd_fget(fd);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   67  	if (!ictx)
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   68  		return ERR_PTR(-EINVAL);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   69  =

a9447b06c53bd3 Jason Gunthorpe 2021-11-11   70  	group =3D iommu_group_get(=
&pdev->dev);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   71  	if (!group) {
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   72  		rc =3D -ENODEV;
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   73  		goto out_file_put;
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   74  	}
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   75  =

a9447b06c53bd3 Jason Gunthorpe 2021-11-11   76  	/*
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   77  	 * FIXME: Use a device-cen=
tric iommu api and this won't work with
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   78  	 * multi-device groups
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   79  	 */
d507176b02c1c8 Yi Liu          2022-05-13  @80  	if ((!flags & IOMMUFD_BIND=
_FLAGS_BYPASS_DMA_OWNERSHIP)) {
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   81  		rc =3D iommu_group_claim_=
dma_owner(group, ictx->filp);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   82  		if (rc)
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   83  			goto out_group_put;
d507176b02c1c8 Yi Liu          2022-05-13   84  	}
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   85  =

a9447b06c53bd3 Jason Gunthorpe 2021-11-11   86  	idev =3D iommufd_object_al=
loc(ictx, idev, IOMMUFD_OBJ_DEVICE);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   87  	if (IS_ERR(idev)) {
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   88  		rc =3D PTR_ERR(idev);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   89  		goto out_release_owner;
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   90  	}
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   91  	idev->ictx =3D ictx;
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   92  	idev->dev =3D &pdev->dev;
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   93  	/* The calling driver is a=
 user until iommufd_unbind_device() */
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   94  	refcount_inc(&idev->obj.us=
ers);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   95  	/* group refcount moves in=
to iommufd_device */
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   96  	idev->group =3D group;
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   97  =

a9447b06c53bd3 Jason Gunthorpe 2021-11-11   98  	/*
a9447b06c53bd3 Jason Gunthorpe 2021-11-11   99  	 * If the caller fails aft=
er this success it must call
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  100  	 * iommufd_unbind_device()=
 which is safe since we hold this refcount.
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  101  	 * This also means the dev=
ice is a leaf in the graph and no other object
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  102  	 * can take a reference on=
 it.
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  103  	 */
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  104  	iommufd_object_finalize(ic=
tx, &idev->obj);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  105  	*id =3D idev->obj.id;
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  106  	return idev;
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  107  =

a9447b06c53bd3 Jason Gunthorpe 2021-11-11  108  out_release_owner:
d507176b02c1c8 Yi Liu          2022-05-13  109  	if ((!flags & IOMMUFD_BIND=
_FLAGS_BYPASS_DMA_OWNERSHIP))
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  110  		iommu_group_release_dma_o=
wner(group);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  111  out_group_put:
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  112  	iommu_group_put(group);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  113  out_file_put:
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  114  	fput(ictx->filp);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  115  	return ERR_PTR(rc);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  116  }
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  117  EXPORT_SYMBOL_GPL(iommufd_b=
ind_pci_device);
a9447b06c53bd3 Jason Gunthorpe 2021-11-11  118  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1199998551576850347==--

