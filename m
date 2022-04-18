Content-Type: multipart/mixed; boundary="===============0353308256935159330=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.17-rc6 21/29] drivers/iommu/iommufd/hw_pagetable.c:48:13: warning: Uninitialized variable: hwpt->domain [uninitvar]
Date: Tue, 19 Apr 2022 01:31:52 +0800
Message-ID: <202204190136.VJiUT8SL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0353308256935159330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.17-rc6
head:   10674417c235cb4a4caf2202fffb078611441da2
commit: 085c3eb8ff8b6ef7093d9c798b04d5fab76c41ac [21/29] vfio/pci: Add bind=
_iommufd() support
:::::: branch date: 15 hours ago
:::::: commit date: 4 weeks ago
compiler: sparc-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 085c3eb8ff8b6ef7093d9c798b04d5fab76c41ac
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iommu/iommufd/hw_pagetable.c:48:13: warning: Uninitialized varia=
ble: hwpt->domain [uninitvar]
     if (hwpt->domain->ops =3D=3D dev_iommu_ops(dev)->default_domain_ops) {
               ^
--
>> drivers/iommu/iommufd/device.c:124:29: warning: Parameter 'group' can be=
 declared with const [constParameter]
           struct iommu_group *group)
                               ^

vim +48 drivers/iommu/iommufd/hw_pagetable.c

be2881f40dc8ab Jason Gunthorpe 2021-11-11  24  =

be2881f40dc8ab Jason Gunthorpe 2021-11-11  25  /*
be2881f40dc8ab Jason Gunthorpe 2021-11-11  26   * When automatically managi=
ng the domains we search for a compatible domain in
be2881f40dc8ab Jason Gunthorpe 2021-11-11  27   * the iopt and if one is fo=
und use it, otherwise create a new domain.
be2881f40dc8ab Jason Gunthorpe 2021-11-11  28   * Automatic domain selectio=
n will never pick a manually created domain.
be2881f40dc8ab Jason Gunthorpe 2021-11-11  29   */
be2881f40dc8ab Jason Gunthorpe 2021-11-11  30  static struct iommufd_hw_pag=
etable *
be2881f40dc8ab Jason Gunthorpe 2021-11-11  31  iommufd_hw_pagetable_auto_ge=
t(struct iommufd_ctx *ictx,
be2881f40dc8ab Jason Gunthorpe 2021-11-11  32  			      struct iommufd_ioas=
 *ioas, struct device *dev)
be2881f40dc8ab Jason Gunthorpe 2021-11-11  33  {
be2881f40dc8ab Jason Gunthorpe 2021-11-11  34  	struct iommufd_hw_pagetable=
 *hwpt;
be2881f40dc8ab Jason Gunthorpe 2021-11-11  35  	int rc;
be2881f40dc8ab Jason Gunthorpe 2021-11-11  36  =

be2881f40dc8ab Jason Gunthorpe 2021-11-11  37  	/*
be2881f40dc8ab Jason Gunthorpe 2021-11-11  38  	 * There is no differentiat=
ion when domains are allocated, so any domain
be2881f40dc8ab Jason Gunthorpe 2021-11-11  39  	 * from the right ops is in=
terchangeable with any other.
be2881f40dc8ab Jason Gunthorpe 2021-11-11  40  	 */
be2881f40dc8ab Jason Gunthorpe 2021-11-11  41  	mutex_lock(&ioas->mutex);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  42  	list_for_each_entry (hwpt, =
&ioas->auto_domains, auto_domains_item) {
be2881f40dc8ab Jason Gunthorpe 2021-11-11  43  		/*
be2881f40dc8ab Jason Gunthorpe 2021-11-11  44  		 * FIXME: We really need a=
n op from the driver to test if a
be2881f40dc8ab Jason Gunthorpe 2021-11-11  45  		 * device is compatible wi=
th a domain. This thing from VFIO
be2881f40dc8ab Jason Gunthorpe 2021-11-11  46  		 * works sometimes.
be2881f40dc8ab Jason Gunthorpe 2021-11-11  47  		 */
be2881f40dc8ab Jason Gunthorpe 2021-11-11 @48  		if (hwpt->domain->ops =3D=
=3D dev_iommu_ops(dev)->default_domain_ops) {
be2881f40dc8ab Jason Gunthorpe 2021-11-11  49  			if (refcount_inc_not_zero=
(&hwpt->obj.users)) {
be2881f40dc8ab Jason Gunthorpe 2021-11-11  50  				mutex_unlock(&ioas->mute=
x);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  51  				return hwpt;
be2881f40dc8ab Jason Gunthorpe 2021-11-11  52  			}
be2881f40dc8ab Jason Gunthorpe 2021-11-11  53  		}
be2881f40dc8ab Jason Gunthorpe 2021-11-11  54  	}
be2881f40dc8ab Jason Gunthorpe 2021-11-11  55  =

be2881f40dc8ab Jason Gunthorpe 2021-11-11  56  	hwpt =3D iommufd_object_all=
oc(ictx, hwpt, IOMMUFD_OBJ_HW_PAGETABLE);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  57  	if (IS_ERR(hwpt)) {
be2881f40dc8ab Jason Gunthorpe 2021-11-11  58  		rc =3D PTR_ERR(hwpt);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  59  		goto out_unlock;
be2881f40dc8ab Jason Gunthorpe 2021-11-11  60  	}
be2881f40dc8ab Jason Gunthorpe 2021-11-11  61  =

be2881f40dc8ab Jason Gunthorpe 2021-11-11  62  	hwpt->domain =3D iommu_doma=
in_alloc(dev->bus);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  63  	if (!hwpt->domain) {
be2881f40dc8ab Jason Gunthorpe 2021-11-11  64  		rc =3D -ENOMEM;
be2881f40dc8ab Jason Gunthorpe 2021-11-11  65  		goto out_abort;
be2881f40dc8ab Jason Gunthorpe 2021-11-11  66  	}
be2881f40dc8ab Jason Gunthorpe 2021-11-11  67  =

be2881f40dc8ab Jason Gunthorpe 2021-11-11  68  	INIT_LIST_HEAD(&hwpt->devic=
es);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  69  	mutex_init(&hwpt->devices_l=
ock);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  70  	hwpt->ioas =3D ioas;
be2881f40dc8ab Jason Gunthorpe 2021-11-11  71  	/* The calling driver is a =
user until iommufd_hw_pagetable_put() */
be2881f40dc8ab Jason Gunthorpe 2021-11-11  72  	refcount_inc(&ioas->obj.use=
rs);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  73  =

be2881f40dc8ab Jason Gunthorpe 2021-11-11  74  	list_add_tail(&hwpt->auto_d=
omains_item, &ioas->auto_domains);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  75  	/*
be2881f40dc8ab Jason Gunthorpe 2021-11-11  76  	 * iommufd_object_finalize(=
) consumes the refcount, get one for the
be2881f40dc8ab Jason Gunthorpe 2021-11-11  77  	 * caller. This pairs with =
the first put in
be2881f40dc8ab Jason Gunthorpe 2021-11-11  78  	 * iommufd_object_destroy_u=
ser()
be2881f40dc8ab Jason Gunthorpe 2021-11-11  79  	 */
be2881f40dc8ab Jason Gunthorpe 2021-11-11  80  	refcount_inc(&hwpt->obj.use=
rs);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  81  	iommufd_object_finalize(ict=
x, &hwpt->obj);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  82  =

be2881f40dc8ab Jason Gunthorpe 2021-11-11  83  	mutex_unlock(&ioas->mutex);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  84  	return hwpt;
be2881f40dc8ab Jason Gunthorpe 2021-11-11  85  =

be2881f40dc8ab Jason Gunthorpe 2021-11-11  86  out_abort:
be2881f40dc8ab Jason Gunthorpe 2021-11-11  87  	iommufd_object_abort(ictx, =
&hwpt->obj);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  88  out_unlock:
be2881f40dc8ab Jason Gunthorpe 2021-11-11  89  	mutex_unlock(&ioas->mutex);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  90  	return ERR_PTR(rc);
be2881f40dc8ab Jason Gunthorpe 2021-11-11  91  }
be2881f40dc8ab Jason Gunthorpe 2021-11-11  92  =


:::::: The code at line 48 was first introduced by commit
:::::: be2881f40dc8ab1549dffa80bdf5f982796a17b9 iommufd: Add a HW pagetable=
 object

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0353308256935159330==--

