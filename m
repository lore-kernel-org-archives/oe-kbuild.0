Content-Type: multipart/mixed; boundary="===============3940177260408428604=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7460/8914] drivers/iommu/iommu.c:2021:47: warning: Parameter 'domain' can be declared with const [constParameter]
Date: Sat, 09 Jul 2022 08:23:37 +0800
Message-ID: <202207090832.w2AeFCw4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3940177260408428604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/i=
ommu/iommu.c:2021:47: warning: Parameter 'domain' can be declared with cons=
t [constParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f2528c29385819a84480cacef4886b049761e2c5
commit: 3b7e2482f9a3f2e99628048b945c9c6cc53bd38e [7460/8914] iommu: Introdu=
ce a callback to struct iommu_resv_region
:::::: branch date: 14 hours ago
:::::: commit date: 3 days ago
compiler: microblaze-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 3b7e2482f9a3f2e99628048b945c9c6cc53bd38e
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iommu/iommu.c:2021:47: warning: Parameter 'domain' can be declar=
ed with const [constParameter]
   void iommu_detach_device(struct iommu_domain *domain, struct device *dev)
                                                 ^
>> drivers/iommu/iommu.c:2651:69: warning: Parameter 'fwnode' can be declar=
ed with const [constParameter]
   const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwno=
de)
                                                                       ^
>> drivers/iommu/iommu.c:518:16: warning: Uninitialized variable: device->d=
ev [uninitvar]
     if (!device->dev->iommu)
                  ^
>> drivers/iommu/iommu.c:958:19: warning: Uninitialized variable: tmp_devic=
e->dev [uninitvar]
     if (tmp_device->dev =3D=3D dev) {
                     ^
   drivers/iommu/iommu.c:951:6: note: Assuming condition is false
    if (!group)
        ^
   drivers/iommu/iommu.c:958:19: note: Uninitialized variable: tmp_device->=
dev
     if (tmp_device->dev =3D=3D dev) {
                     ^
>> drivers/iommu/iommu.c:1753:35: warning: Uninitialized variables: group.k=
obj, group.devices_kobj, group.devices, group.iommu_data, group.iommu_data_=
release, group.name, group.id, group.default_domain, group.blocking_domain,=
 group.domain, group.owner_cnt, group.owner [uninitvar]
     probe_alloc_default_domain(bus, group);
                                     ^
   drivers/iommu/iommu.c:1743:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1743:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1743:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1743:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1743:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1743:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1743:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1743:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1743:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1743:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1743:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1743:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1753:35: note: Uninitialized variables: group.kobj=
, group.devices_kobj, group.devices, group.iommu_data, group.iommu_data_rel=
ease, group.name, group.id, group.default_domain, group.blocking_domain, gr=
oup.domain, group.owner_cnt, group.owner
     probe_alloc_default_domain(bus, group);
                                     ^

vim +/domain +2021 drivers/iommu/iommu.c

426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2020  =

426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
@2021  void iommu_detach_device(struct iommu_domain *domain, struct device =
*dev)
426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2022  {
426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2023  	struct iommu_group *group;
426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2024  =

426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2025  	group =3D iommu_group_get(dev);
9ae9df035c274c8 drivers/iommu/iommu.c Jordan Crouse             2017-12-20 =
 2026  	if (!group)
9ae9df035c274c8 drivers/iommu/iommu.c Jordan Crouse             2017-12-20 =
 2027  		return;
426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2028  =

426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2029  	mutex_lock(&group->mutex);
0286300e6045553 drivers/iommu/iommu.c Jason Gunthorpe via iommu 2022-05-09 =
 2030  	if (WARN_ON(domain !=3D group->domain) ||
0286300e6045553 drivers/iommu/iommu.c Jason Gunthorpe via iommu 2022-05-09 =
 2031  	    WARN_ON(iommu_group_device_count(group) !=3D 1))
426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2032  		goto out_unlock;
0286300e6045553 drivers/iommu/iommu.c Jason Gunthorpe via iommu 2022-05-09 =
 2033  	__iommu_group_set_core_domain(group);
426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2034  =

426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2035  out_unlock:
426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2036  	mutex_unlock(&group->mutex);
426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2037  	iommu_group_put(group);
426a273834eae65 drivers/iommu/iommu.c Joerg Roedel              2015-05-28 =
 2038  }
fc2100eb4d0960b drivers/base/iommu.c  Joerg Roedel              2008-11-26 =
 2039  EXPORT_SYMBOL_GPL(iommu_detach_device);
fc2100eb4d0960b drivers/base/iommu.c  Joerg Roedel              2008-11-26 =
 2040  =


:::::: The code at line 2021 was first introduced by commit
:::::: 426a273834eae65abcfc7132a21a85b3151e0bce iommu: Limit iommu_attach/d=
etach_device to devices with their own group

:::::: TO: Joerg Roedel <jroedel@suse.de>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3940177260408428604==--

