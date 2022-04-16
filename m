Content-Type: multipart/mixed; boundary="===============5600900424635912790=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [luxis1999-iommufd:iommufd-v5.17-rc6 3/28] drivers/vfio/mdev/mdev_sysfs.c:239:32: warning: Uninitialized variables: ltype.kobj, ltype.devices_kobj, ltype.parent, ltype.available, ltype.type_group_id [uninitvar]
Date: Sat, 16 Apr 2022 17:04:40 +0800
Message-ID: <202204161621.fphy1MU3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5600900424635912790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Liu Yi L <yi.l.liu@intel.com>

tree:   https://github.com/luxis1999/iommufd iommufd-v5.17-rc6
head:   71a58479a11e89a480ebc59ed5163440d3e2772c
commit: 32c7255422ff37fe8423f0065860803f8e1ec0e0 [3/28] vfio/mdev: Add mdev=
 available instance checking to the core
:::::: branch date: 3 days ago
:::::: commit date: 4 weeks ago
compiler: sparc-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 32c7255422ff37fe8423f0065860803f8e1ec0e0
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/vfio/mdev/mdev_sysfs.c:239:32: warning: Uninitialized variables:=
 ltype.kobj, ltype.devices_kobj, ltype.parent, ltype.available, ltype.type_=
group_id [uninitvar]
       remove_mdev_supported_type(ltype);
                                  ^
>> drivers/vfio/mdev/mdev_sysfs.c:255:30: warning: Uninitialized variables:=
 type.kobj, type.devices_kobj, type.parent, type.available, type.type_group=
_id [uninitvar]
     remove_mdev_supported_type(type);
                                ^
--
>> drivers/vfio/vfio.c:306:49: warning: Parameter 'iommu_group' can be decl=
ared with const [constParameter]
   __vfio_group_get_from_iommu(struct iommu_group *iommu_group)
                                                   ^
>> drivers/vfio/vfio.c:479:23: warning: Parameter 'dev' can be declared wit=
h const [constParameter]
          struct device *dev)
                         ^
>> drivers/vfio/vfio.c:1492:56: warning: Parameter 'test_group' can be decl=
ared with const [constParameter]
   bool vfio_external_group_match_file(struct vfio_group *test_group,
                                                          ^
>> drivers/vfio/vfio.c:244:12: warning: Uninitialized variable: tmp->ops [u=
ninitvar]
     if (tmp->ops =3D=3D ops) {
              ^
   drivers/vfio/vfio.c:235:6: note: Assuming condition is false
    if (!driver)
        ^
   drivers/vfio/vfio.c:244:12: note: Uninitialized variable: tmp->ops
     if (tmp->ops =3D=3D ops) {
              ^
>> drivers/vfio/vfio.c:265:15: warning: Uninitialized variable: driver->ops=
 [uninitvar]
     if (driver->ops =3D=3D ops) {
                 ^
>> drivers/vfio/vfio.c:311:14: warning: Uninitialized variable: group->iomm=
u_group [uninitvar]
     if (group->iommu_group =3D=3D iommu_group) {
                ^
>> drivers/vfio/vfio.c:854:45: warning: Uninitialized variables: driver.ops=
, driver.vfio_next [uninitvar]
     if (!vfio_iommu_driver_allowed(container, driver))
                                               ^
   drivers/vfio/vfio.c:845:41: note: Assuming condition is false
    if (list_empty(&container->group_list) || container->iommu_driver) {
                                           ^
   drivers/vfio/vfio.c:845:41: note: Assuming condition is false
    if (list_empty(&container->group_list) || container->iommu_driver) {
                                           ^
   drivers/vfio/vfio.c:854:45: note: Uninitialized variables: driver.ops, d=
river.vfio_next
     if (!vfio_iommu_driver_allowed(container, driver))
                                               ^

vim +239 drivers/vfio/mdev/mdev_sysfs.c

7b96953bc640b6 Kirti Wankhede  2016-11-17  224  =

42930553a7c11f Alex Williamson 2016-12-30  225  static int add_mdev_support=
ed_type_groups(struct mdev_parent *parent)
7b96953bc640b6 Kirti Wankhede  2016-11-17  226  {
7b96953bc640b6 Kirti Wankhede  2016-11-17  227  	int i;
7b96953bc640b6 Kirti Wankhede  2016-11-17  228  =

7b96953bc640b6 Kirti Wankhede  2016-11-17  229  	for (i =3D 0; parent->ops-=
>supported_type_groups[i]; i++) {
7b96953bc640b6 Kirti Wankhede  2016-11-17  230  		struct mdev_type *type;
7b96953bc640b6 Kirti Wankhede  2016-11-17  231  =

15fcc44be0c7af Jason Gunthorpe 2021-04-06  232  		type =3D add_mdev_support=
ed_type(parent, i);
7b96953bc640b6 Kirti Wankhede  2016-11-17  233  		if (IS_ERR(type)) {
7b96953bc640b6 Kirti Wankhede  2016-11-17  234  			struct mdev_type *ltype,=
 *tmp;
7b96953bc640b6 Kirti Wankhede  2016-11-17  235  =

7b96953bc640b6 Kirti Wankhede  2016-11-17  236  			list_for_each_entry_safe=
(ltype, tmp, &parent->type_list,
7b96953bc640b6 Kirti Wankhede  2016-11-17  237  						  next) {
7b96953bc640b6 Kirti Wankhede  2016-11-17  238  				list_del(&ltype->next);
7b96953bc640b6 Kirti Wankhede  2016-11-17 @239  				remove_mdev_supported_t=
ype(ltype);
7b96953bc640b6 Kirti Wankhede  2016-11-17  240  			}
7b96953bc640b6 Kirti Wankhede  2016-11-17  241  			return PTR_ERR(type);
7b96953bc640b6 Kirti Wankhede  2016-11-17  242  		}
7b96953bc640b6 Kirti Wankhede  2016-11-17  243  		list_add(&type->next, &pa=
rent->type_list);
7b96953bc640b6 Kirti Wankhede  2016-11-17  244  	}
7b96953bc640b6 Kirti Wankhede  2016-11-17  245  	return 0;
7b96953bc640b6 Kirti Wankhede  2016-11-17  246  }
7b96953bc640b6 Kirti Wankhede  2016-11-17  247  =

7b96953bc640b6 Kirti Wankhede  2016-11-17  248  /* mdev sysfs functions */
42930553a7c11f Alex Williamson 2016-12-30  249  void parent_remove_sysfs_fi=
les(struct mdev_parent *parent)
7b96953bc640b6 Kirti Wankhede  2016-11-17  250  {
7b96953bc640b6 Kirti Wankhede  2016-11-17  251  	struct mdev_type *type, *t=
mp;
7b96953bc640b6 Kirti Wankhede  2016-11-17  252  =

7b96953bc640b6 Kirti Wankhede  2016-11-17  253  	list_for_each_entry_safe(t=
ype, tmp, &parent->type_list, next) {
7b96953bc640b6 Kirti Wankhede  2016-11-17  254  		list_del(&type->next);
7b96953bc640b6 Kirti Wankhede  2016-11-17 @255  		remove_mdev_supported_typ=
e(type);
7b96953bc640b6 Kirti Wankhede  2016-11-17  256  	}
7b96953bc640b6 Kirti Wankhede  2016-11-17  257  =

7b96953bc640b6 Kirti Wankhede  2016-11-17  258  	sysfs_remove_groups(&paren=
t->dev->kobj, parent->ops->dev_attr_groups);
7b96953bc640b6 Kirti Wankhede  2016-11-17  259  	kset_unregister(parent->md=
ev_types_kset);
7b96953bc640b6 Kirti Wankhede  2016-11-17  260  }
7b96953bc640b6 Kirti Wankhede  2016-11-17  261  =


:::::: The code at line 239 was first introduced by commit
:::::: 7b96953bc640b6b25665fe17ffca4b668b371f14 vfio: Mediated device Core =
driver

:::::: TO: Kirti Wankhede <kwankhede@nvidia.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5600900424635912790==--

