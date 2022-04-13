Content-Type: multipart/mixed; boundary="===============8415353742837121139=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/msi/msi.c:759:13: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Thu, 14 Apr 2022 06:43:02 +0800
Message-ID: <202204140640.KtlQkVd6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8415353742837121139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a19944809fe9942e6a96292490717904d0690c21
commit: ae24e28fef14687a26f98050e64153b8e4fee7c7 PCI/MSI: Use msi_on_each_d=
esc()
date:   4 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-c006-20220413 (https://download.01.org/0day-ci/arc=
hive/20220414/202204140640.KtlQkVd6-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478=
d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dae24e28fef14687a26f98050e64153b8e4fee7c7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ae24e28fef14687a26f98050e64153b8e4fee7c7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:973:6: note: Left side of '&&' is true
           if (!result && powerplay_table->usDcefclkDependencyTableOffset)
               ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:973:17: note: Assuming field 'usDcefclkDependencyTableOffset' is 0
           if (!result && powerplay_table->usDcefclkDependencyTableOffset)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:973:2: note: Taking false branch
           if (!result && powerplay_table->usDcefclkDependencyTableOffset)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:978:7: note: 'result' is 0
           if (!result && powerplay_table->usMclkDependencyTableOffset)
                ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:978:6: note: Left side of '&&' is true
           if (!result && powerplay_table->usMclkDependencyTableOffset)
               ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:978:17: note: Assuming field 'usMclkDependencyTableOffset' is 0
           if (!result && powerplay_table->usMclkDependencyTableOffset)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:978:2: note: Taking false branch
           if (!result && powerplay_table->usMclkDependencyTableOffset)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:983:7: note: 'result' is 0
           if (!result && powerplay_table->usPCIETableOffset)
                ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:983:6: note: Left side of '&&' is true
           if (!result && powerplay_table->usPCIETableOffset)
               ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:983:17: note: Assuming field 'usPCIETableOffset' is not equal to 0
           if (!result && powerplay_table->usPCIETableOffset)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:983:2: note: Taking true branch
           if (!result && powerplay_table->usPCIETableOffset)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:984:12: note: Calling 'get_pcie_table'
                   result =3D get_pcie_table(hwmgr,
                            ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:794:2: note: Assuming field 'ucNumEntries' is not equal to 0
           PP_ASSERT_WITH_CODE(atom_pcie_table->ucNumEntries,
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:39:7: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
                   if (!(cond)) {                  \
                       ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:794:2: note: Taking false branch
           PP_ASSERT_WITH_CODE(atom_pcie_table->ucNumEntries,
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:39:3: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
                   if (!(cond)) {                  \
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:794:2: note: Loop condition is false.  Exiting loop
           PP_ASSERT_WITH_CODE(atom_pcie_table->ucNumEntries,
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/inc/pp_debug.h:38:2: note: expanded fro=
m macro 'PP_ASSERT_WITH_CODE'
           do {                                    \
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:798:15: note: Calling 'kzalloc'
           pcie_table =3D kzalloc(struct_size(pcie_table, entries, atom_pci=
e_table->ucNumEntries),
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:578:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:595:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:798:15: note: Returning from 'kzalloc'
           pcie_table =3D kzalloc(struct_size(pcie_table, entries, atom_pci=
e_table->ucNumEntries),
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:800:6: note: Assuming 'pcie_table' is non-null
           if (!pcie_table)
               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:800:2: note: Taking false branch
           if (!pcie_table)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_processpptables.=
c:803:15: note: Access to field 'count' results in a dereference of a null =
pointer (loaded from field 'vdd_dep_on_sclk')
           pcie_count =3D table_info->vdd_dep_on_sclk->count;
                        ^           ~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/pci/msi/msi.c:759:13: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
           dev->irq =3D desc->pci.msi_attrib.default_irq;
                      ^
   drivers/pci/msi/msi.c:331:2: note: Calling 'pci_free_irq_vectors'
           pci_free_irq_vectors(dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:1060:2: note: Calling 'pci_disable_msix'
           pci_disable_msix(dev);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:854:6: note: Assuming 'pci_msi_enable' is not equa=
l to 0
           if (!pci_msi_enable || !dev || !dev->msix_enabled)
               ^~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:854:6: note: Left side of '||' is false
   drivers/pci/msi/msi.c:854:26: note: 'dev' is non-null
           if (!pci_msi_enable || !dev || !dev->msix_enabled)
                                   ^~~
   drivers/pci/msi/msi.c:854:6: note: Left side of '||' is false
           if (!pci_msi_enable || !dev || !dev->msix_enabled)
               ^
   drivers/pci/msi/msi.c:854:33: note: Assuming field 'msix_enabled' is 0
           if (!pci_msi_enable || !dev || !dev->msix_enabled)
                                          ^~~~~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:854:2: note: Taking true branch
           if (!pci_msi_enable || !dev || !dev->msix_enabled)
           ^
   drivers/pci/msi/msi.c:855:3: note: Returning without writing to 'dev->ms=
i_enabled', which participates in a condition later
                   return;
                   ^
   drivers/pci/msi/msi.c:1060:2: note: Returning from 'pci_disable_msix'
           pci_disable_msix(dev);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:1061:2: note: Calling 'pci_disable_msi'
           pci_disable_msi(dev);
           ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:765:7: note: 'pci_msi_enable' is not equal to 0
           if (!pci_msi_enable || !dev || !dev->msi_enabled)
                ^~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:765:6: note: Left side of '||' is false
           if (!pci_msi_enable || !dev || !dev->msi_enabled)
               ^
   drivers/pci/msi/msi.c:765:26: note: 'dev' is non-null
           if (!pci_msi_enable || !dev || !dev->msi_enabled)
                                   ^~~
   drivers/pci/msi/msi.c:765:6: note: Left side of '||' is false
           if (!pci_msi_enable || !dev || !dev->msi_enabled)
               ^
   drivers/pci/msi/msi.c:765:33: note: Assuming field 'msi_enabled' is not =
equal to 0
           if (!pci_msi_enable || !dev || !dev->msi_enabled)
                                          ^~~~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:765:2: note: Taking false branch
           if (!pci_msi_enable || !dev || !dev->msi_enabled)
           ^
   drivers/pci/msi/msi.c:769:2: note: Calling 'pci_msi_shutdown'
           pci_msi_shutdown(dev);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:746:6: note: Assuming 'pci_msi_enable' is not equa=
l to 0
           if (!pci_msi_enable || !dev || !dev->msi_enabled)
               ^~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:746:6: note: Left side of '||' is false
   drivers/pci/msi/msi.c:746:26: note: 'dev' is non-null
           if (!pci_msi_enable || !dev || !dev->msi_enabled)
                                   ^~~
   drivers/pci/msi/msi.c:746:6: note: Left side of '||' is false
           if (!pci_msi_enable || !dev || !dev->msi_enabled)
               ^
   drivers/pci/msi/msi.c:746:33: note: Assuming field 'msi_enabled' is not =
equal to 0
           if (!pci_msi_enable || !dev || !dev->msi_enabled)
                                          ^~~~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:746:2: note: Taking false branch
           if (!pci_msi_enable || !dev || !dev->msi_enabled)
           ^
   drivers/pci/msi/msi.c:754:2: note: Value assigned to 'desc'
           desc =3D msi_first_desc(&dev->dev, MSI_DESC_ALL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/msi/msi.c:755:20: note: Assuming 'desc' is null
           if (!WARN_ON_ONCE(!desc))
                             ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/pci/msi/msi.c:755:20: note: Assuming pointer value is null
           if (!WARN_ON_ONCE(!desc))
                             ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/pci/msi/msi.c:755:2: note: Taking false branch
           if (!WARN_ON_ONCE(!desc))
           ^
   drivers/pci/msi/msi.c:759:13: note: Dereference of null pointer
           dev->irq =3D desc->pci.msi_attrib.default_irq;
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^

vim +759 drivers/pci/msi/msi.c

d1ac1d2622e8f0 drivers/pci/msi.c     Alexander Gordeev  2013-12-30  741  =

688769f643bfce drivers/pci/msi.c     Bjorn Helgaas      2017-03-09  742  st=
atic void pci_msi_shutdown(struct pci_dev *dev)
^1da177e4c3f41 drivers/pci/msi.c     Linus Torvalds     2005-04-16  743  {
f2440d9acbe866 drivers/pci/msi.c     Matthew Wilcox     2009-03-17  744  	s=
truct msi_desc *desc;
^1da177e4c3f41 drivers/pci/msi.c     Linus Torvalds     2005-04-16  745  =

128bc5fced2387 drivers/pci/msi.c     Michael Ellerman   2007-03-22  746  	i=
f (!pci_msi_enable || !dev || !dev->msi_enabled)
ded86d8d37736d drivers/pci/msi.c     Eric W. Biederman  2007-01-28  747  		=
return;
ded86d8d37736d drivers/pci/msi.c     Eric W. Biederman  2007-01-28  748  =

61b64abd399fa4 drivers/pci/msi.c     Michael S. Tsirkin 2015-05-07  749  	p=
ci_msi_set_enable(dev, 0);
ba698ad4b7e466 drivers/pci/msi.c     David Miller       2007-10-25  750  	p=
ci_intx_for_msi(dev, 1);
b1cbf4e4dddd70 drivers/pci/msi.c     Eric W. Biederman  2007-03-05  751  	d=
ev->msi_enabled =3D 0;
7bd007e480672c drivers/pci/msi.c     Eric W. Biederman  2006-10-04  752  =

12abb8ba8444f7 drivers/pci/msi.c     Hidetoshi Seto     2009-06-24  753  	/=
* Return the device with MSI unmasked as initial states */
ae24e28fef1468 drivers/pci/msi/msi.c Thomas Gleixner    2021-12-06  754  	d=
esc =3D msi_first_desc(&dev->dev, MSI_DESC_ALL);
ae24e28fef1468 drivers/pci/msi/msi.c Thomas Gleixner    2021-12-06  755  	i=
f (!WARN_ON_ONCE(!desc))
446a98b19fd6da drivers/pci/msi.c     Thomas Gleixner    2021-07-29  756  		=
pci_msi_unmask(desc, msi_multi_mask(desc));
d52877c7b1afb8 drivers/pci/msi.c     Yinghai Lu         2008-04-23  757  =

f6b6aefee70aa5 drivers/pci/msi.c     Bjorn Helgaas      2019-05-30  758  	/=
* Restore dev->irq to its default pin-assertion IRQ */
e58f2259b91c02 drivers/pci/msi.c     Thomas Gleixner    2021-12-06 @759  	d=
ev->irq =3D desc->pci.msi_attrib.default_irq;
5f2269916b0e50 drivers/pci/msi.c     Jiang Liu          2015-07-30  760  	p=
cibios_alloc_irq(dev);
^1da177e4c3f41 drivers/pci/msi.c     Linus Torvalds     2005-04-16  761  }
24d27553390c69 drivers/pci/msi.c     Matthew Wilcox     2009-03-17  762  =


:::::: The code at line 759 was first introduced by commit
:::::: e58f2259b91c02974c20db7b28d39d810a21249b genirq/msi, treewide: Use a=
 named struct for PCI/MSI attributes

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8415353742837121139==--

