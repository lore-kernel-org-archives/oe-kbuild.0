Content-Type: multipart/mixed; boundary="===============1081005101603399180=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/intel/iommu.c:5877:3: warning: Either the condition '!info' is redundant or there is possible null pointer dereference: info.
Date: Wed, 09 Dec 2020 12:34:33 +0800
Message-ID: <202012091220.pIKWVOCV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1081005101603399180==
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
head:   c6f7e1510b872c281ff603a3108c084b6548d35c
commit: 672cf6df9b8a3a6d70a6a5c30397f76fa40d3178 iommu/vt-d: Move Intel IOM=
MU driver into subdirectory
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

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
>> drivers/iommu/intel/irq_remapping.c:514:16: warning: Uninitialized varia=
ble: sts [uninitvar]
           readl, (sts & DMA_GSTS_IRES), sts);
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
>> drivers/iommu/intel/irq_remapping.c:821:2: warning: Redundant code: Foun=
d a statement that begins with numeric constant. [constStatement]
    irq_remapping_enabled =3D 1;
    ^

vim +5877 drivers/iommu/intel/iommu.c

95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5868  =

95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5869  stati=
c int intel_iommu_disable_auxd(struct device *dev)
95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5870  {
95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5871  	stru=
ct device_domain_info *info;
95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5872  	unsi=
gned long flags;
95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5873  =

95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5874  	spin=
_lock_irqsave(&device_domain_lock, flags);
e85bb99b79ca5a drivers/iommu/intel-iommu.c Lu Baolu 2020-05-16  5875  	info=
 =3D get_domain_info(dev);
95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5876  	if (=
!WARN_ON(!info))
95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25 @5877  		inf=
o->auxd_enabled =3D 0;
95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5878  	spin=
_unlock_irqrestore(&device_domain_lock, flags);
95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5879  =

95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5880  	retu=
rn 0;
95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5881  }
95587a75de179d drivers/iommu/intel-iommu.c Lu Baolu 2019-03-25  5882  =


:::::: The code at line 5877 was first introduced by commit
:::::: 95587a75de179da35aea03735843be8278cf1857 iommu/vt-d: Add per-device =
IOMMU feature ops entries

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1081005101603399180==--

