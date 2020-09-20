Content-Type: multipart/mixed; boundary="===============1477955821900711934=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/amd/iommu.c:1444:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Mon, 21 Sep 2020 03:13:20 +0800
Message-ID: <202009210312.YT4cE4wu%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1477955821900711934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Joerg Roedel <jroedel@suse.de>
CC: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
CC: Jerry Snitselaar <jsnitsel@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   325d0eab4f31c6240b59d5b2b8042c88f59405b5
commit: ad8694bac410e5d72ad610dfb146f58bf2fe0365 iommu/amd: Move AMD IOMMU =
driver into subdirectory
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/iommu/amd/iommu.c:1444:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D true;
        ^
   drivers/iommu/amd/iommu.c:1422:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D false;
        ^
   drivers/iommu/amd/iommu.c:1444:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D true;
        ^
   drivers/iommu/amd/iommu.c:1653:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D -ENOMEM;
        ^
   drivers/iommu/amd/iommu.c:1646:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D -EINVAL;
        ^
   drivers/iommu/amd/iommu.c:1653:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D -ENOMEM;
        ^
   drivers/iommu/amd/iommu.c:1677:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/iommu/amd/iommu.c:1653:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D -ENOMEM;
        ^
   drivers/iommu/amd/iommu.c:1677:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D 0;
        ^
   drivers/iommu/amd/iommu.c:2061:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/iommu/amd/iommu.c:2031:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D -EBUSY;
        ^
   drivers/iommu/amd/iommu.c:2061:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D 0;
        ^
   drivers/iommu/amd/iommu.c:2061:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/iommu/amd/iommu.c:2042:7: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
     ret =3D -EINVAL;
         ^
   drivers/iommu/amd/iommu.c:2061:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D 0;
        ^
   drivers/iommu/amd/iommu.c:2756:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D -ENOMEM;
        ^
   drivers/iommu/amd/iommu.c:2752:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D -EBUSY;
        ^
   drivers/iommu/amd/iommu.c:2756:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D -ENOMEM;
        ^
   drivers/iommu/amd/iommu.c:2766:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/iommu/amd/iommu.c:2756:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D -ENOMEM;
        ^
   drivers/iommu/amd/iommu.c:2766:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D 0;
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dad8694bac410e5d72ad610dfb146f58bf2fe0365
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout ad8694bac410e5d72ad610dfb146f58bf2fe0365
vim +/ret +1444 drivers/iommu/amd/iommu.c

ac3a7092ebcb01 drivers/iommu/amd_iommu.c   Joerg Roedel 2018-11-09  1400  =

308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1401  /*
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1402   =
* This function is used to add another level to an IO page table. Adding
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1403   =
* another level increases the size of the address space by 9 bits to a size=
 up
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1404   =
* to 64 bits.
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1405   =
*/
f15d9a992f901d drivers/iommu/amd_iommu.c   Joerg Roedel 2019-09-25  1406  s=
tatic bool increase_address_space(struct protection_domain *domain,
46ac18c347b00b drivers/iommu/amd_iommu.c   Joerg Roedel 2019-10-18  1407  	=
			   unsigned long address,
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1408  	=
			   gfp_t gfp)
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1409  {
eb791aa70b90c5 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1410  	=
struct domain_pgtable pgtable;
754265bcab78a9 drivers/iommu/amd_iommu.c   Joerg Roedel 2019-09-06  1411  	=
unsigned long flags;
119b2b2c3e256f drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1412  	=
bool ret =3D true;
eb791aa70b90c5 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1413  	=
u64 *pte, root;
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1414  =

754265bcab78a9 drivers/iommu/amd_iommu.c   Joerg Roedel 2019-09-06  1415  	=
spin_lock_irqsave(&domain->lock, flags);
754265bcab78a9 drivers/iommu/amd_iommu.c   Joerg Roedel 2019-09-06  1416  =

eb791aa70b90c5 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1417  	=
amd_iommu_domain_get_pgtable(domain, &pgtable);
eb791aa70b90c5 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1418  =

119b2b2c3e256f drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1419  	=
if (address <=3D PM_LEVEL_SIZE(pgtable.mode))
119b2b2c3e256f drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1420  	=
	goto out;
119b2b2c3e256f drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1421  =

119b2b2c3e256f drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1422  	=
ret =3D false;
119b2b2c3e256f drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1423  	=
if (WARN_ON_ONCE(pgtable.mode =3D=3D PAGE_MODE_6_LEVEL))
754265bcab78a9 drivers/iommu/amd_iommu.c   Joerg Roedel 2019-09-06  1424  	=
	goto out;
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1425  =

308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1426  	=
pte =3D (void *)get_zeroed_page(gfp);
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1427  	=
if (!pte)
754265bcab78a9 drivers/iommu/amd_iommu.c   Joerg Roedel 2019-09-06  1428  	=
	goto out;
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1429  =

eb791aa70b90c5 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1430  	=
*pte =3D PM_LEVEL_PDE(pgtable.mode, iommu_virt_to_phys(pgtable.root));
eb791aa70b90c5 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1431  =

19c6978fba68a2 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1432  	=
pgtable.root  =3D pte;
19c6978fba68a2 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1433  	=
pgtable.mode +=3D 1;
19c6978fba68a2 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1434  	=
update_and_flush_device_table(domain, &pgtable);
19c6978fba68a2 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1435  	=
domain_flush_complete(domain);
eb791aa70b90c5 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1436  =

19c6978fba68a2 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1437  	=
/*
19c6978fba68a2 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1438  	=
 * Device Table needs to be updated and flushed before the new root can
19c6978fba68a2 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1439  	=
 * be published.
19c6978fba68a2 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1440  	=
 */
19c6978fba68a2 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1441  	=
root =3D amd_iommu_domain_encode_pgtable(pte, pgtable.mode);
eb791aa70b90c5 drivers/iommu/amd_iommu.c   Joerg Roedel 2020-05-04  1442  	=
atomic64_set(&domain->pt_root, root);
f15d9a992f901d drivers/iommu/amd_iommu.c   Joerg Roedel 2019-09-25  1443  =

f15d9a992f901d drivers/iommu/amd_iommu.c   Joerg Roedel 2019-09-25 @1444  	=
ret =3D true;
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1445  =

754265bcab78a9 drivers/iommu/amd_iommu.c   Joerg Roedel 2019-09-06  1446  o=
ut:
754265bcab78a9 drivers/iommu/amd_iommu.c   Joerg Roedel 2019-09-06  1447  	=
spin_unlock_irqrestore(&domain->lock, flags);
754265bcab78a9 drivers/iommu/amd_iommu.c   Joerg Roedel 2019-09-06  1448  =

f15d9a992f901d drivers/iommu/amd_iommu.c   Joerg Roedel 2019-09-25  1449  	=
return ret;
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1450  }
308973d3b958b9 arch/x86/kernel/amd_iommu.c Joerg Roedel 2009-11-24  1451  =


:::::: The code at line 1444 was first introduced by commit
:::::: f15d9a992f901d4f22db868adf800844d1cac9f2 iommu/amd: Remove domain->u=
pdated

:::::: TO: Joerg Roedel <jroedel@suse.de>
:::::: CC: Joerg Roedel <jroedel@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1477955821900711934==--

