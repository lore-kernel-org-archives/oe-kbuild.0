Content-Type: multipart/mixed; boundary="===============4978801165657360068=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 05/16] iommu: Move bus setup to IOMMU device registration
Date: Tue, 16 Aug 2022 10:37:32 +0800
Message-ID: <202208161020.ZiuDgisa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4978801165657360068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/i=
ommu/iommu.c:191:57: warning: Parameter 'data' can be declared with const [=
constParameter]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <d342b6f27efb5ef3e93aacaa3012d25386d74866.1660572783.git.robin=
.murphy@arm.com>
References: <d342b6f27efb5ef3e93aacaa3012d25386d74866.1660572783.git.robin.=
murphy@arm.com>
TO: Robin Murphy <robin.murphy@arm.com>
TO: joro(a)8bytes.org
CC: will(a)kernel.org
CC: iommu(a)lists.linux.dev
CC: linux-arm-kernel(a)lists.infradead.org
CC: baolu.lu(a)linux.intel.com
CC: kevin.tian(a)intel.com
CC: suravee.suthikulpanit(a)amd.com
CC: vasant.hegde(a)amd.com
CC: mjrosato(a)linux.ibm.com
CC: schnelle(a)linux.ibm.com
CC: linux-kernel(a)vger.kernel.org

Hi Robin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on v6.0-rc1]
[also build test WARNING on linus/master next-20220815]
[cannot apply to joro-iommu/next krzk/for-next tegra/for-next rockchip/for-=
next sunxi/sunxi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/iommu-r=
etire-bus_set_iommu/20220816-002348
base:    568035b01cfb107af8d2e4bd2fb9aea22cf5b868
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 6227cfa1406324ce434f5524a321e87687386208
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iommu/iommu.c:191:57: warning: Parameter 'data' can be declared =
with const [constParameter]
   static int remove_iommu_group(struct device *dev, void *data)
                                                           ^
>> drivers/iommu/iommu.c:2031:47: warning: Parameter 'domain' can be declar=
ed with const [constParameter]
   void iommu_detach_device(struct iommu_domain *domain, struct device *dev)
                                                 ^
>> drivers/iommu/iommu.c:2652:69: warning: Parameter 'fwnode' can be declar=
ed with const [constParameter]
   const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwno=
de)
                                                                       ^
>> drivers/iommu/iommu.c:580:16: warning: Uninitialized variable: device->d=
ev [uninitvar]
     if (!device->dev->iommu)
                  ^
>> drivers/iommu/iommu.c:1020:19: warning: Uninitialized variable: tmp_devi=
ce->dev [uninitvar]
     if (tmp_device->dev =3D=3D dev) {
                     ^
   drivers/iommu/iommu.c:1013:6: note: Assuming condition is false
    if (!group)
        ^
   drivers/iommu/iommu.c:1020:19: note: Uninitialized variable: tmp_device-=
>dev
     if (tmp_device->dev =3D=3D dev) {
                     ^
>> drivers/iommu/iommu.c:1808:35: warning: Uninitialized variables: group.k=
obj, group.devices_kobj, group.devices, group.iommu_data, group.iommu_data_=
release, group.name, group.id, group.default_domain, group.blocking_domain,=
 group.domain, group.owner_cnt, group.owner [uninitvar]
     probe_alloc_default_domain(bus, group);
                                     ^
   drivers/iommu/iommu.c:1798:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1798:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1798:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1798:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1798:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1798:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1798:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1798:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1798:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1798:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1798:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1798:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/iommu/iommu.c:1808:35: note: Uninitialized variables: group.kobj=
, group.devices_kobj, group.devices, group.iommu_data, group.iommu_data_rel=
ease, group.name, group.id, group.default_domain, group.blocking_domain, gr=
oup.domain, group.owner_cnt, group.owner
     probe_alloc_default_domain(bus, group);
                                     ^

vim +/data +191 drivers/iommu/iommu.c

5fa9e7c5fa50f2 Joerg Roedel 2019-08-19  190  =

6227cfa1406324 Robin Murphy 2022-08-15 @191  static int remove_iommu_group(=
struct device *dev, void *data)
6227cfa1406324 Robin Murphy 2022-08-15  192  {
6227cfa1406324 Robin Murphy 2022-08-15  193  	if (dev->iommu && dev->iommu-=
>iommu_dev =3D=3D data)
6227cfa1406324 Robin Murphy 2022-08-15  194  		iommu_release_device(dev);
6227cfa1406324 Robin Murphy 2022-08-15  195  =

6227cfa1406324 Robin Murphy 2022-08-15  196  	return 0;
6227cfa1406324 Robin Murphy 2022-08-15  197  }
6227cfa1406324 Robin Murphy 2022-08-15  198  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4978801165657360068==--

