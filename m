Content-Type: multipart/mixed; boundary="===============1791790560063819852=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/dwc/pcie-qcom-ep.c:371:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 27 Jan 2022 17:44:17 +0800
Message-ID: <202201271758.nOQfKu7w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1791790560063819852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Siddartha Mohanadoss <smohanad@codeaurora.org>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: f55fee56a631032969480e4b0ee5d79734fe3c69 PCI: qcom-ep: Add Qualcomm=
 PCIe Endpoint controller driver
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: riscv-randconfig-c006-20220125 (https://download.01.org/0day-ci/arc=
hive/20220127/202201271758.nOQfKu7w-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e12=
8e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df55fee56a631032969480e4b0ee5d79734fe3c69
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f55fee56a631032969480e4b0ee5d79734fe3c69
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   kernel/time/posix-cpu-timers.c:1324:2: note: Loop condition is false.  E=
xiting loop
           list_for_each_entry_safe(timer, next, &firing, it.cpu.elist) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/time/posix-cpu-timers.c:1324:2: note: Assigned value is garbage o=
r undefined
           list_for_each_entry_safe(timer, next, &firing, it.cpu.elist) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/btrfs/extent_map.c:615:3: warning: Value stored to 'ret' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   fs/btrfs/extent_map.c:615:3: note: Value stored to 'ret' is never read
                   ret =3D 0;
                   ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/btrfs/sysfs.c:627:8: warning: Dereference of null pointer (loaded fro=
m variable 'value_ptr') [clang-analyzer-core.NullDereference]
           val =3D *value_ptr;
                 ^
   fs/btrfs/sysfs.c:645:34: note: Calling 'to_fs_info'
           struct btrfs_fs_info *fs_info =3D to_fs_info(kobj->parent);
                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:1101:6: note: Assuming the condition is false
           if (kobj->ktype !=3D &btrfs_ktype)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:1101:2: note: Taking false branch
           if (kobj->ktype !=3D &btrfs_ktype)
           ^
   fs/btrfs/sysfs.c:1103:2: note: Returning pointer
           return to_fs_devs(kobj)->fs_info;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:645:34: note: Returning from 'to_fs_info'
           struct btrfs_fs_info *fs_info =3D to_fs_info(kobj->parent);
                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:645:2: note: 'fs_info' initialized here
           struct btrfs_fs_info *fs_info =3D to_fs_info(kobj->parent);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:646:2: note: 'block_rsv' initialized here
           struct btrfs_block_rsv *block_rsv =3D &fs_info->global_block_rsv;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:647:24: note: Passing value via 1st parameter 'value_pt=
r'
           return btrfs_show_u64(&block_rsv->reserved, &block_rsv->lock, bu=
f);
                                 ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:647:9: note: Calling 'btrfs_show_u64'
           return btrfs_show_u64(&block_rsv->reserved, &block_rsv->lock, bu=
f);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/sysfs.c:625:6: note: Assuming 'lock' is null
           if (lock)
               ^~~~
   fs/btrfs/sysfs.c:625:2: note: Taking false branch
           if (lock)
           ^
   fs/btrfs/sysfs.c:627:8: note: Dereference of null pointer (loaded from v=
ariable 'value_ptr')
           val =3D *value_ptr;
                 ^~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/pci/controller/dwc/pcie-qcom-ep.c:371:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pcie-qcom-ep.c:371:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pcie-qcom-ep.c:488:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pcie-qcom-ep.c:488:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pcie-qcom-ep.c:531:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pcie-qcom-ep.c:531:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/pci/controller/dwc/pcie-artpec6.c:243:18: warning: Value stored =
to 'pci' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct dw_pcie *pci =3D artpec6_pcie->pci;
                           ^~~   ~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-artpec6.c:243:18: note: Value stored to =
'pci' during its initialization is never read
           struct dw_pcie *pci =3D artpec6_pcie->pci;
                           ^~~   ~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/vdpa/vdpa_user/iova_domain.c:364:20: note: Calling 'vduse_domain=
_alloc_iova'
           dma_addr_t iova =3D vduse_domain_alloc_iova(iovad, size, limit);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa_user/iova_domain.c:301:6: note: Assuming the condition=
 is true
           if (iova_len < (1 << (IOVA_RANGE_CACHE_MAX_SIZE - 1)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/vdpa_user/iova_domain.c:301:2: note: Taking true branch
           if (iova_len < (1 << (IOVA_RANGE_CACHE_MAX_SIZE - 1)))
           ^
   drivers/vdpa/vdpa_user/iova_domain.c:302:14: note: '?' condition is false
                   iova_len =3D roundup_pow_of_two(iova_len);
                              ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/vdpa/vdpa_user/iova_domain.c:302:14: note: Calling '__roundup_po=
w_of_two'
                   iova_len =3D roundup_pow_of_two(iova_len);
                              ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:188:2: note: Taking true branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:189:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {

vim +/dev +371 drivers/pci/controller/dwc/pcie-qcom-ep.c

f55fee56a63103 Manivannan Sadhasivam 2021-09-20  367  =

f55fee56a63103 Manivannan Sadhasivam 2021-09-20  368  static void qcom_pcie=
_perst_assert(struct dw_pcie *pci)
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  369  {
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  370  	struct qcom_pcie_ep =
*pcie_ep =3D to_pcie_ep(pci);
f55fee56a63103 Manivannan Sadhasivam 2021-09-20 @371  	struct device *dev =
=3D pci->dev;
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  372  =

f55fee56a63103 Manivannan Sadhasivam 2021-09-20  373  	if (pcie_ep->link_st=
atus =3D=3D QCOM_PCIE_EP_LINK_DISABLED) {
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  374  		dev_dbg(dev, "Link =
is already disabled\n");
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  375  		return;
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  376  	}
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  377  =

f55fee56a63103 Manivannan Sadhasivam 2021-09-20  378  	phy_power_off(pcie_e=
p->phy);
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  379  	phy_exit(pcie_ep->ph=
y);
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  380  	clk_bulk_disable_unp=
repare(ARRAY_SIZE(qcom_pcie_ep_clks),
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  381  				   qcom_pcie_ep_c=
lks);
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  382  	pcie_ep->link_status=
 =3D QCOM_PCIE_EP_LINK_DISABLED;
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  383  }
f55fee56a63103 Manivannan Sadhasivam 2021-09-20  384  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1791790560063819852==--

