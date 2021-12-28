Content-Type: multipart/mixed; boundary="===============1339546055367761077=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.16-rc3 23/26] drivers/iommu/iommufd/io_pagetable.c:425: undefined reference to `interval_tree_iter_first'
Date: Wed, 29 Dec 2021 01:24:03 +0800
Message-ID: <202112290140.pe0slnR3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1339546055367761077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.16-rc3
head:   9194d1d84235002ef9e0ae8666bc205840e3be74
commit: 4aa75d972a71aafba6e3b57ca91f6a04bdd37611 [23/26] vfio/pci: Add bind=
_iommufd() support
:::::: branch date: 33 hours ago
:::::: commit date: 12 days ago
config: i386-randconfig-s002-20211228 (https://download.01.org/0day-ci/arch=
ive/20211229/202112290140.pe0slnR3-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/luxis1999/iommufd/commit/4aa75d972a71aafba6e3b=
57ca91f6a04bdd37611
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommu=
fd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.16-rc3
        git checkout 4aa75d972a71aafba6e3b57ca91f6a04bdd37611
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_area_iter_fi=
rst':
>> drivers/iommu/iommufd/io_pagetable.c:425: undefined reference to `interv=
al_tree_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_pages_unpin':
>> drivers/iommu/iommufd/io_pagetable.c:678: undefined reference to `interv=
al_tree_span_iter_first'
>> ld: drivers/iommu/iommufd/io_pagetable.c:681: undefined reference to `in=
terval_tree_span_iter_next'
>> ld: drivers/iommu/iommufd/io_pagetable.c:685: undefined reference to `in=
terval_tree_span_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.c:689: undefined reference to `in=
terval_tree_span_iter_next'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_pages_get_ex=
act_user':
   drivers/iommu/iommufd/io_pagetable.c:1443: undefined reference to `inter=
val_tree_iter_first'
>> ld: drivers/iommu/iommufd/io_pagetable.c:1444: undefined reference to `i=
nterval_tree_iter_next'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_area_iter_ne=
xt':
>> drivers/iommu/iommufd/io_pagetable.c:437: undefined reference to `interv=
al_tree_iter_next'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_pfn_reader_i=
nit':
   drivers/iommu/iommufd/io_pagetable.c:788: undefined reference to `interv=
al_tree_span_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_alloc_area':
   drivers/iommu/iommufd/io_pagetable.c:1178: undefined reference to `inter=
val_tree_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_find_domain_=
area':
   drivers/iommu/iommufd/io_pagetable.c:502: undefined reference to `interv=
al_tree_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_pfn_reader_n=
ext':
>> drivers/iommu/iommufd/io_pagetable.c:755: undefined reference to `interv=
al_tree_span_iter_next'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_pages_unfill=
_xarray':
   drivers/iommu/iommufd/io_pagetable.c:1059: undefined reference to `inter=
val_tree_span_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.c:1062: undefined reference to `i=
nterval_tree_span_iter_next'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_fully_covers=
':
   drivers/iommu/iommufd/io_pagetable.c:835: undefined reference to `interv=
al_tree_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_pages_clean_=
xarray':
   drivers/iommu/iommufd/io_pagetable.c:1038: undefined reference to `inter=
val_tree_span_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.c:1041: undefined reference to `i=
nterval_tree_span_iter_next'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_pages_fill_x=
array':
   drivers/iommu/iommufd/io_pagetable.c:1116: undefined reference to `inter=
val_tree_span_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.c:1119: undefined reference to `i=
nterval_tree_span_iter_next'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_fully_covers=
':
   drivers/iommu/iommufd/io_pagetable.c:835: undefined reference to `interv=
al_tree_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `__iopt_unmap_iova=
':
>> drivers/iommu/iommufd/io_pagetable.c:1377: undefined reference to `inter=
val_tree_remove'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_area_unfill_=
domains':
   drivers/iommu/iommufd/io_pagetable.c:1021: undefined reference to `inter=
val_tree_remove'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_area_fill_do=
mains':
>> drivers/iommu/iommufd/io_pagetable.c:975: undefined reference to `interv=
al_tree_insert'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_alloc_iova':
   drivers/iommu/iommufd/io_pagetable.c:1252: undefined reference to `inter=
val_tree_span_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.c:1255: undefined reference to `i=
nterval_tree_span_iter_next'
   ld: drivers/iommu/iommufd/io_pagetable.c:1260: undefined reference to `i=
nterval_tree_span_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.c:1264: undefined reference to `i=
nterval_tree_span_iter_next'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_map_user_pag=
es':
   drivers/iommu/iommufd/io_pagetable.c:1310: undefined reference to `inter=
val_tree_insert'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_copy_iova':
   drivers/iommu/iommufd/io_pagetable.c:1363: undefined reference to `inter=
val_tree_insert'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_pages_add_us=
er':
   drivers/iommu/iommufd/io_pagetable.c:1482: undefined reference to `inter=
val_tree_insert'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_reserve_iova=
':
   drivers/iommu/iommufd/io_pagetable.c:1632: undefined reference to `inter=
val_tree_insert'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_remove_reser=
ved_iova':
   drivers/iommu/iommufd/io_pagetable.c:1641: undefined reference to `inter=
val_tree_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.c:1647: undefined reference to `i=
nterval_tree_iter_next'
>> ld: drivers/iommu/iommufd/io_pagetable.c:1650: undefined reference to `i=
nterval_tree_remove'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_populate_new=
_domain':
   drivers/iommu/iommufd/io_pagetable.c:1749: undefined reference to `inter=
val_tree_insert'
   ld: drivers/iommu/iommufd/io_pagetable.c:1763: undefined reference to `i=
nterval_tree_remove'
   ld: drivers/iommu/iommufd/io_pagetable.o: in function `iopt_unpopulate_d=
omain':
   drivers/iommu/iommufd/io_pagetable.c:1710: undefined reference to `inter=
val_tree_span_iter_first'
   ld: drivers/iommu/iommufd/io_pagetable.c:1713: undefined reference to `i=
nterval_tree_span_iter_next'
   ld: drivers/iommu/iommufd/io_pagetable.c:1726: undefined reference to `i=
nterval_tree_remove'
   ld: drivers/iommu/iommufd/ioas_pt.o: in function `iommufd_ioas_pagetable=
_iova_ranges':
>> drivers/iommu/iommufd/ioas_pt.c:77: undefined reference to `interval_tre=
e_span_iter_first'
>> ld: drivers/iommu/iommufd/ioas_pt.c:80: undefined reference to `interval=
_tree_span_iter_next'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMUFD
   Depends on IOMMU_SUPPORT
   Selected by
   - VFIO_PCI_CORE && VFIO && PCI && MMU


vim +425 drivers/iommu/iommufd/io_pagetable.c

b1baa437fe5478b Jason Gunthorpe 2021-11-11  418  =

b1baa437fe5478b Jason Gunthorpe 2021-11-11  419  static struct iopt_area *i=
opt_area_iter_first(struct io_pagetable *iopt,
b1baa437fe5478b Jason Gunthorpe 2021-11-11  420  					      unsigned long s=
tart,
b1baa437fe5478b Jason Gunthorpe 2021-11-11  421  					      unsigned long l=
ast)
b1baa437fe5478b Jason Gunthorpe 2021-11-11  422  {
b1baa437fe5478b Jason Gunthorpe 2021-11-11  423  	struct interval_tree_node=
 *node;
b1baa437fe5478b Jason Gunthorpe 2021-11-11  424  =

b1baa437fe5478b Jason Gunthorpe 2021-11-11 @425  	node =3D interval_tree_it=
er_first(&iopt->area_itree, start, last);
b1baa437fe5478b Jason Gunthorpe 2021-11-11  426  	if (!node)
b1baa437fe5478b Jason Gunthorpe 2021-11-11  427  		return NULL;
b1baa437fe5478b Jason Gunthorpe 2021-11-11  428  	return container_of(node,=
 struct iopt_area, node);
b1baa437fe5478b Jason Gunthorpe 2021-11-11  429  }
b1baa437fe5478b Jason Gunthorpe 2021-11-11  430  =

b1baa437fe5478b Jason Gunthorpe 2021-11-11  431  static struct iopt_area *i=
opt_area_iter_next(struct iopt_area *area,
b1baa437fe5478b Jason Gunthorpe 2021-11-11  432  					     unsigned long st=
art,
b1baa437fe5478b Jason Gunthorpe 2021-11-11  433  					     unsigned long la=
st)
b1baa437fe5478b Jason Gunthorpe 2021-11-11  434  {
b1baa437fe5478b Jason Gunthorpe 2021-11-11  435  	struct interval_tree_node=
 *node;
b1baa437fe5478b Jason Gunthorpe 2021-11-11  436  =

b1baa437fe5478b Jason Gunthorpe 2021-11-11 @437  	node =3D interval_tree_it=
er_next(&area->node, start, last);
b1baa437fe5478b Jason Gunthorpe 2021-11-11  438  	if (!node)
b1baa437fe5478b Jason Gunthorpe 2021-11-11  439  		return NULL;
b1baa437fe5478b Jason Gunthorpe 2021-11-11  440  	return container_of(node,=
 struct iopt_area, node);
b1baa437fe5478b Jason Gunthorpe 2021-11-11  441  }
b1baa437fe5478b Jason Gunthorpe 2021-11-11  442  =


:::::: The code at line 425 was first introduced by commit
:::::: b1baa437fe5478bf8f79e53f49409b2f413ea27e iommufd: Data structure to =
provide IOVA to PFN mapping

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1339546055367761077==--

