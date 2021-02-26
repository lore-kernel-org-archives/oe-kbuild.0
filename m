Content-Type: multipart/mixed; boundary="===============6109436701935867869=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/intel/iommu.c:5877:3: warning: Either the condition '!info' is redundant or there is possible null pointer dereference: info.
Date: Fri, 26 Feb 2021 12:17:41 +0800
Message-ID: <202102261230.nAL1B3s5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6109436701935867869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Joerg Roedel <jroedel@suse.de>
CC: Jerry Snitselaar <jsnitsel@redhat.com>
CC: Lu Baolu <baolu.lu@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2c87f7a38f930ef6f6a7bdd04aeb82ce3971b54b
commit: 672cf6df9b8a3a6d70a6a5c30397f76fa40d3178 iommu/vt-d: Move Intel IOM=
MU driver into subdirectory
date:   9 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 months ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
   drivers/iommu/intel/iommu.c:148:2: warning: int result is returned as lo=
ng value. If the return value is long to avoid loss of information, then yo=
u have loss of information. [truncLongCastReturn]
    return  1 << min_t(int, (lvl - 1) * LEVEL_STRIDE, MAX_AGAW_PFN_WIDTH);
    ^
>> drivers/iommu/intel/iommu.c:1237:16: warning: Uninitialized variable: st=
s [uninitvar]
           readl, (sts & DMA_GSTS_RTPS), sts);
                  ^
>> drivers/iommu/intel/iommu.c:1255:19: warning: Uninitialized variable: va=
l [uninitvar]
           readl, (!(val & DMA_GSTS_WBFS)), val);
                     ^
   drivers/iommu/intel/iommu.c:1616:16: warning: Uninitialized variable: st=
s [uninitvar]
           readl, (sts & DMA_GSTS_TES), sts);
                  ^
   drivers/iommu/intel/iommu.c:1632:19: warning: Uninitialized variable: st=
s [uninitvar]
           readl, (!(sts & DMA_GSTS_TES)), sts);
                     ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iommu/intel/iommu.c:5877:3: warning: Either the condition '!info=
' is redundant or there is possible null pointer dereference: info. [nullPo=
interRedundantCheck]
     info->auxd_enabled =3D 0;
     ^
   drivers/iommu/intel/iommu.c:5876:15: note: Assuming that condition '!inf=
o' is not redundant
    if (!WARN_ON(!info))
                 ^
   drivers/iommu/intel/iommu.c:5877:3: note: Null pointer dereference
     info->auxd_enabled =3D 0;
     ^

vim +5877 drivers/iommu/intel/iommu.c

95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5868  =

95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5869  stat=
ic int intel_iommu_disable_auxd(struct device *dev)
95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5870  {
95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5871  	str=
uct device_domain_info *info;
95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5872  	uns=
igned long flags;
95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5873  =

95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5874  	spi=
n_lock_irqsave(&device_domain_lock, flags);
e85bb99b79ca5ad drivers/iommu/intel-iommu.c Lu Baolu 2020-05-16  5875  	inf=
o =3D get_domain_info(dev);
95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5876  	if =
(!WARN_ON(!info))
95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25 @5877  		in=
fo->auxd_enabled =3D 0;
95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5878  	spi=
n_unlock_irqrestore(&device_domain_lock, flags);
95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5879  =

95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5880  	ret=
urn 0;
95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5881  }
95587a75de179da drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5882  =


:::::: The code at line 5877 was first introduced by commit
:::::: 95587a75de179da35aea03735843be8278cf1857 iommu/vt-d: Add per-device =
IOMMU feature ops entries

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6109436701935867869==--

