Content-Type: multipart/mixed; boundary="===============8810625839093731671=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vfio/vfio.c:1127:45: warning: Uninitialized variables: driver.ops, driver.vfio_next [uninitvar]
Date: Tue, 03 May 2022 23:58:12 +0800
Message-ID: <202205032347.cDgBXbpa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8810625839093731671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9050ba3a61a4b5bd84c2cde092a100404f814f31
commit: b00621603d050f77a6af9e81e32daeccfd246d6a vfio: factor out a vfio_io=
mmu_driver_allowed helper
date:   7 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 months ago
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b00621603d050f77a6af9e81e32daeccfd246d6a
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/vfio/vfio.c:542:66: warning: Parameter 'iommu_group' can be decl=
ared with const [constParameter]
   struct vfio_group *vfio_group_get_from_iommu(struct iommu_group *iommu_g=
roup)
                                                                    ^
   drivers/vfio/vfio.c:607:23: warning: Parameter 'dev' can be declared wit=
h const [constParameter]
          struct device *dev)
                         ^
   drivers/vfio/vfio.c:1808:56: warning: Parameter 'test_group' can be decl=
ared with const [constParameter]
   bool vfio_external_group_match_file(struct vfio_group *test_group,
                                                          ^
   drivers/vfio/vfio.c:295:12: warning: Uninitialized variable: tmp->ops [u=
ninitvar]
     if (tmp->ops =3D=3D ops) {
              ^
   drivers/vfio/vfio.c:286:6: note: Assuming condition is false
    if (!driver)
        ^
   drivers/vfio/vfio.c:295:12: note: Uninitialized variable: tmp->ops
     if (tmp->ops =3D=3D ops) {
              ^
   drivers/vfio/vfio.c:316:15: warning: Uninitialized variable: driver->ops=
 [uninitvar]
     if (driver->ops =3D=3D ops) {
                 ^
   drivers/vfio/vfio.c:548:14: warning: Uninitialized variable: group->iomm=
u_group [uninitvar]
     if (group->iommu_group =3D=3D iommu_group) {
                ^
   drivers/vfio/vfio.c:678:23: warning: Uninitialized variable: unbound->de=
v [uninitvar]
     if (dev =3D=3D unbound->dev) {
                         ^
>> drivers/vfio/vfio.c:1127:45: warning: Uninitialized variables: driver.op=
s, driver.vfio_next [uninitvar]
     if (!vfio_iommu_driver_allowed(container, driver))
                                               ^
   drivers/vfio/vfio.c:1118:41: note: Assuming condition is false
    if (list_empty(&container->group_list) || container->iommu_driver) {
                                           ^
   drivers/vfio/vfio.c:1118:41: note: Assuming condition is false
    if (list_empty(&container->group_list) || container->iommu_driver) {
                                           ^
   drivers/vfio/vfio.c:1127:45: note: Uninitialized variables: driver.ops, =
driver.vfio_next
     if (!vfio_iommu_driver_allowed(container, driver))
                                               ^

vim +1127 drivers/vfio/vfio.c

cba3345cc494ad Alex Williamson   2012-07-31  1101  =

cba3345cc494ad Alex Williamson   2012-07-31  1102  static long vfio_ioctl_s=
et_iommu(struct vfio_container *container,
cba3345cc494ad Alex Williamson   2012-07-31  1103  				 unsigned long arg)
cba3345cc494ad Alex Williamson   2012-07-31  1104  {
cba3345cc494ad Alex Williamson   2012-07-31  1105  	struct vfio_iommu_drive=
r *driver;
cba3345cc494ad Alex Williamson   2012-07-31  1106  	long ret =3D -ENODEV;
cba3345cc494ad Alex Williamson   2012-07-31  1107  =

9587f44aa69a4c Alex Williamson   2013-04-25  1108  	down_write(&container->=
group_lock);
cba3345cc494ad Alex Williamson   2012-07-31  1109  =

cba3345cc494ad Alex Williamson   2012-07-31  1110  	/*
cba3345cc494ad Alex Williamson   2012-07-31  1111  	 * The container is des=
igned to be an unprivileged interface while
cba3345cc494ad Alex Williamson   2012-07-31  1112  	 * the group can be ass=
igned to specific users.  Therefore, only by
cba3345cc494ad Alex Williamson   2012-07-31  1113  	 * adding a group to a =
container does the user get the privilege of
cba3345cc494ad Alex Williamson   2012-07-31  1114  	 * enabling the iommu, =
which may allocate finite resources.  There
cba3345cc494ad Alex Williamson   2012-07-31  1115  	 * is no unset_iommu, b=
ut by removing all the groups from a container,
cba3345cc494ad Alex Williamson   2012-07-31  1116  	 * the container is dep=
rivileged and returns to an unset state.
cba3345cc494ad Alex Williamson   2012-07-31  1117  	 */
cba3345cc494ad Alex Williamson   2012-07-31  1118  	if (list_empty(&contain=
er->group_list) || container->iommu_driver) {
9587f44aa69a4c Alex Williamson   2013-04-25  1119  		up_write(&container->g=
roup_lock);
cba3345cc494ad Alex Williamson   2012-07-31  1120  		return -EINVAL;
cba3345cc494ad Alex Williamson   2012-07-31  1121  	}
cba3345cc494ad Alex Williamson   2012-07-31  1122  =

cba3345cc494ad Alex Williamson   2012-07-31  1123  	mutex_lock(&vfio.iommu_=
drivers_lock);
ae5515d66362b9 Alex Williamson   2015-12-04  1124  	list_for_each_entry(dri=
ver, &vfio.iommu_drivers_list, vfio_next) {
cba3345cc494ad Alex Williamson   2012-07-31  1125  		void *data;
cba3345cc494ad Alex Williamson   2012-07-31  1126  =

b00621603d050f Christoph Hellwig 2021-09-24 @1127  		if (!vfio_iommu_driver=
_allowed(container, driver))
03a76b60f8ba27 Alex Williamson   2015-12-21  1128  			continue;
cba3345cc494ad Alex Williamson   2012-07-31  1129  		if (!try_module_get(dr=
iver->ops->owner))
cba3345cc494ad Alex Williamson   2012-07-31  1130  			continue;
cba3345cc494ad Alex Williamson   2012-07-31  1131  =

cba3345cc494ad Alex Williamson   2012-07-31  1132  		/*
cba3345cc494ad Alex Williamson   2012-07-31  1133  		 * The arg magic for S=
ET_IOMMU is the same as CHECK_EXTENSION,
cba3345cc494ad Alex Williamson   2012-07-31  1134  		 * so test which iommu=
 driver reported support for this
cba3345cc494ad Alex Williamson   2012-07-31  1135  		 * extension and call =
open on them.  We also pass them the
cba3345cc494ad Alex Williamson   2012-07-31  1136  		 * magic, allowing a s=
ingle driver to support multiple
cba3345cc494ad Alex Williamson   2012-07-31  1137  		 * interfaces if they'=
d like.
cba3345cc494ad Alex Williamson   2012-07-31  1138  		 */
cba3345cc494ad Alex Williamson   2012-07-31  1139  		if (driver->ops->ioctl=
(NULL, VFIO_CHECK_EXTENSION, arg) <=3D 0) {
cba3345cc494ad Alex Williamson   2012-07-31  1140  			module_put(driver->op=
s->owner);
cba3345cc494ad Alex Williamson   2012-07-31  1141  			continue;
cba3345cc494ad Alex Williamson   2012-07-31  1142  		}
cba3345cc494ad Alex Williamson   2012-07-31  1143  =

cba3345cc494ad Alex Williamson   2012-07-31  1144  		data =3D driver->ops->=
open(arg);
cba3345cc494ad Alex Williamson   2012-07-31  1145  		if (IS_ERR(data)) {
cba3345cc494ad Alex Williamson   2012-07-31  1146  			ret =3D PTR_ERR(data);
cba3345cc494ad Alex Williamson   2012-07-31  1147  			module_put(driver->op=
s->owner);
7c435b46c29a02 Alex Williamson   2016-02-22  1148  			continue;
cba3345cc494ad Alex Williamson   2012-07-31  1149  		}
cba3345cc494ad Alex Williamson   2012-07-31  1150  =

cba3345cc494ad Alex Williamson   2012-07-31  1151  		ret =3D __vfio_contain=
er_attach_groups(container, driver, data);
7c435b46c29a02 Alex Williamson   2016-02-22  1152  		if (ret) {
cba3345cc494ad Alex Williamson   2012-07-31  1153  			driver->ops->release(=
data);
cba3345cc494ad Alex Williamson   2012-07-31  1154  			module_put(driver->op=
s->owner);
7c435b46c29a02 Alex Williamson   2016-02-22  1155  			continue;
cba3345cc494ad Alex Williamson   2012-07-31  1156  		}
cba3345cc494ad Alex Williamson   2012-07-31  1157  =

7c435b46c29a02 Alex Williamson   2016-02-22  1158  		container->iommu_drive=
r =3D driver;
7c435b46c29a02 Alex Williamson   2016-02-22  1159  		container->iommu_data =
=3D data;
7c435b46c29a02 Alex Williamson   2016-02-22  1160  		break;
cba3345cc494ad Alex Williamson   2012-07-31  1161  	}
cba3345cc494ad Alex Williamson   2012-07-31  1162  =

cba3345cc494ad Alex Williamson   2012-07-31  1163  	mutex_unlock(&vfio.iomm=
u_drivers_lock);
9587f44aa69a4c Alex Williamson   2013-04-25  1164  	up_write(&container->gr=
oup_lock);
cba3345cc494ad Alex Williamson   2012-07-31  1165  =

cba3345cc494ad Alex Williamson   2012-07-31  1166  	return ret;
cba3345cc494ad Alex Williamson   2012-07-31  1167  }
cba3345cc494ad Alex Williamson   2012-07-31  1168  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8810625839093731671==--

