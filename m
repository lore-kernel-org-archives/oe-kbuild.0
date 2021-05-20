Content-Type: multipart/mixed; boundary="===============3595904016353519998=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/intel/dmar.c:1543:45: warning: Uninitialized variable: sts [uninitvar]
Date: Thu, 20 May 2021 17:22:49 +0800
Message-ID: <202105201737.0Ks9BvdP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3595904016353519998==
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
head:   c3d0e3fd41b7f0f5d5d5b6022ab7e813f04ea727
commit: 672cf6df9b8a3a6d70a6a5c30397f76fa40d3178 iommu/vt-d: Move Intel IOM=
MU driver into subdirectory
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iommu/intel/dmar.c:1543:45: warning: Uninitialized variable: sts=
 [uninitvar]
    IOMMU_WAIT_OP(iommu, DMAR_GSTS_REG, readl, (sts & DMA_GSTS_QIES), sts);
                                               ^
>> drivers/iommu/intel/dmar.c:1866:22: warning: Uninitialized variable: pas=
id [uninitvar]
          pasid_present ? pasid : -1,
                        ^
--
>> drivers/iommu/intel/pasid.c:40:11: warning: Uninitialized variable: res =
[uninitvar]
           !(res & VCMD_VRSP_IP), res);
             ^
   drivers/iommu/intel/pasid.c:71:11: warning: Uninitialized variable: res =
[uninitvar]
           !(res & VCMD_VRSP_IP), res);
             ^

vim +1543 drivers/iommu/intel/dmar.c

eba67e5da6e971 drivers/pci/dmar.c   Suresh Siddha   2009-03-16  1511  =

eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1512  /*
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1513   * En=
able queued invalidation.
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1514   */
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1515  stati=
c void __dmar_enable_qi(struct intel_iommu *iommu)
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1516  {
c416daa98a5845 drivers/pci/dmar.c   David Woodhouse 2009-05-10  1517  	u32 =
sts;
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1518  	unsi=
gned long flags;
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1519  	stru=
ct q_inval *qi =3D iommu->qi;
5d308fc1ecf535 drivers/iommu/dmar.c Lu Baolu        2018-12-10  1520  	u64 =
val =3D virt_to_phys(qi->desc);
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1521  =

eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1522  	qi->=
free_head =3D qi->free_tail =3D 0;
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1523  	qi->=
free_cnt =3D QI_LENGTH;
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1524  =

5d308fc1ecf535 drivers/iommu/dmar.c Lu Baolu        2018-12-10  1525  	/*
5d308fc1ecf535 drivers/iommu/dmar.c Lu Baolu        2018-12-10  1526  	 * S=
et DW=3D1 and QS=3D1 in IQA_REG when Scalable Mode capability
5d308fc1ecf535 drivers/iommu/dmar.c Lu Baolu        2018-12-10  1527  	 * i=
s present.
5d308fc1ecf535 drivers/iommu/dmar.c Lu Baolu        2018-12-10  1528  	 */
5d308fc1ecf535 drivers/iommu/dmar.c Lu Baolu        2018-12-10  1529  	if (=
ecap_smts(iommu->ecap))
5d308fc1ecf535 drivers/iommu/dmar.c Lu Baolu        2018-12-10  1530  		val=
 |=3D (1 << 11) | 1;
5d308fc1ecf535 drivers/iommu/dmar.c Lu Baolu        2018-12-10  1531  =

1f5b3c3fd2d73d drivers/iommu/dmar.c Thomas Gleixner 2011-07-19  1532  	raw_=
spin_lock_irqsave(&iommu->register_lock, flags);
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1533  =

eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1534  	/* w=
rite zero to the tail reg */
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1535  	writ=
el(0, iommu->reg + DMAR_IQT_REG);
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1536  =

5d308fc1ecf535 drivers/iommu/dmar.c Lu Baolu        2018-12-10  1537  	dmar=
_writeq(iommu->reg + DMAR_IQA_REG, val);
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1538  =

eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1539  	iomm=
u->gcmd |=3D DMA_GCMD_QIE;
c416daa98a5845 drivers/pci/dmar.c   David Woodhouse 2009-05-10  1540  	writ=
el(iommu->gcmd, iommu->reg + DMAR_GCMD_REG);
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1541  =

eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1542  	/* M=
ake sure hardware complete it */
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27 @1543  	IOMM=
U_WAIT_OP(iommu, DMAR_GSTS_REG, readl, (sts & DMA_GSTS_QIES), sts);
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1544  =

1f5b3c3fd2d73d drivers/iommu/dmar.c Thomas Gleixner 2011-07-19  1545  	raw_=
spin_unlock_irqrestore(&iommu->register_lock, flags);
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1546  }
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu      2009-03-27  1547  =


:::::: The code at line 1543 was first introduced by commit
:::::: eb4a52bc660ea835482c582eaaf4893742cbd160 Intel IOMMU Suspend/Resume =
Support - Queued Invalidation

:::::: TO: Fenghua Yu <fenghua.yu@intel.com>
:::::: CC: David Woodhouse <David.Woodhouse@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3595904016353519998==--

