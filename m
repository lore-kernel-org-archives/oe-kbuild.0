Content-Type: multipart/mixed; boundary="===============0122459471697956647=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jgunthorpe:iommufd 3/13] drivers/iommu/iommufd/main.c:171:13: warning: Uninitialized variable: obj->type [uninitvar]
Date: Mon, 18 Apr 2022 15:44:12 +0800
Message-ID: <202204181532.LRaEH9kw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0122459471697956647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Yi Liu <yi.l.liu@intel.com>

tree:   https://github.com/jgunthorpe/linux iommufd
head:   fc388f906088fe5f5f2db6a36931e00124f52042
commit: 80866de54d68bbcdb9a65b74f93d4eba596a6f3d [3/13] iommufd: File descr=
iptor, context, kconfig and makefiles
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 80866de54d68bbcdb9a65b74f93d4eba596a6f3d
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iommu/iommufd/main.c:171:13: warning: Uninitialized variable: ob=
j->type [uninitvar]
      if (obj->type !=3D cur)
               ^
--
>> drivers/vfio/pci/vfio_pci_core.c:746:8: warning: Local variable 'cmd' sh=
adows outer argument [shadowArgument]
      u16 cmd;
          ^
   drivers/vfio/pci/vfio_pci_core.c:637:70: note: Shadowed declaration
   long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
                                                                        ^
   drivers/vfio/pci/vfio_pci_core.c:746:8: note: Shadow variable
      u16 cmd;
          ^

vim +171 drivers/iommu/iommufd/main.c

80866de54d68bb Jason Gunthorpe 2021-11-11  160  =

80866de54d68bb Jason Gunthorpe 2021-11-11  161  static int iommufd_fops_rel=
ease(struct inode *inode, struct file *filp)
80866de54d68bb Jason Gunthorpe 2021-11-11  162  {
80866de54d68bb Jason Gunthorpe 2021-11-11  163  	struct iommufd_ctx *ictx =
=3D filp->private_data;
80866de54d68bb Jason Gunthorpe 2021-11-11  164  	struct iommufd_object *obj;
80866de54d68bb Jason Gunthorpe 2021-11-11  165  	unsigned long index =3D 0;
80866de54d68bb Jason Gunthorpe 2021-11-11  166  	int cur =3D 0;
80866de54d68bb Jason Gunthorpe 2021-11-11  167  =

80866de54d68bb Jason Gunthorpe 2021-11-11  168  	/* Destroy the graph from =
depth first */
80866de54d68bb Jason Gunthorpe 2021-11-11  169  	while (cur < IOMMUFD_OBJ_M=
AX) {
80866de54d68bb Jason Gunthorpe 2021-11-11  170  		xa_for_each(&ictx->object=
s, index, obj) {
80866de54d68bb Jason Gunthorpe 2021-11-11 @171  			if (obj->type !=3D cur)
80866de54d68bb Jason Gunthorpe 2021-11-11  172  				continue;
80866de54d68bb Jason Gunthorpe 2021-11-11  173  			xa_erase(&ictx->objects,=
 index);
80866de54d68bb Jason Gunthorpe 2021-11-11  174  			if (WARN_ON(!refcount_de=
c_and_test(&obj->users)))
80866de54d68bb Jason Gunthorpe 2021-11-11  175  				continue;
80866de54d68bb Jason Gunthorpe 2021-11-11  176  			iommufd_object_ops[obj->=
type].destroy(obj);
80866de54d68bb Jason Gunthorpe 2021-11-11  177  			kfree(obj);
80866de54d68bb Jason Gunthorpe 2021-11-11  178  		}
80866de54d68bb Jason Gunthorpe 2021-11-11  179  		cur++;
80866de54d68bb Jason Gunthorpe 2021-11-11  180  	}
80866de54d68bb Jason Gunthorpe 2021-11-11  181  	WARN_ON(!xa_empty(&ictx->o=
bjects));
80866de54d68bb Jason Gunthorpe 2021-11-11  182  	kfree(ictx);
80866de54d68bb Jason Gunthorpe 2021-11-11  183  	return 0;
80866de54d68bb Jason Gunthorpe 2021-11-11  184  }
80866de54d68bb Jason Gunthorpe 2021-11-11  185  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0122459471697956647==--

