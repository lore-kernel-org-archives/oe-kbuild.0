Content-Type: multipart/mixed; boundary="===============7242340676531756025=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-rt-linux-5.10.y 3870/10213] drivers/pci/endpoint/pci-epf-core.c:84:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 16 Dec 2021 08:39:44 +0800
Message-ID: <202112160806.KGtGhr3C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7242340676531756025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: vigneshr(a)ti.com
CC: nm(a)ti.com
TO: Kishon Vijay Abraham I <kishon@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
10.y
head:   541ec9a6995c3dd881d6f0b63cc714a08ded457d
commit: 5fe4c2dfaa4e6413f98aedd00c8b2b372e5b0103 [3870/10213] PCI: endpoint=
: Add support to associate secondary EPC with EPF
:::::: branch date: 12 days ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c007-20211209 (https://download.01.org/0day-ci/ar=
chive/20211216/202112160806.KGtGhr3C-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.=
git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout 5fe4c2dfaa4e6413f98aedd00c8b2b372e5b0103
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                ^~
   crypto/ecc.c:1401:2: note: Taking false branch
           if (!pk) {
           ^
   crypto/ecc.c:1406:2: note: Calling 'ecc_point_mult'
           ecc_point_mult(pk, &curve->g, priv, NULL, curve, ndigits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1168:25: note: Assuming 'i' is <=3D 0
           for (i =3D num_bits - 2; i > 0; i--) {
                                  ^~~~~
   crypto/ecc.c:1168:2: note: Loop condition is false. Execution continues =
on line 1176
           for (i =3D num_bits - 2; i > 0; i--) {
           ^
   crypto/ecc.c:1176:7: note: Assuming the condition is true
           nb =3D !vli_test_bit(scalar, 0);
                ^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1189:2: note: Calling 'vli_mod_inv'
           vli_mod_inv(z, z, curve_prime, point->ndigits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:866:6: note: Assuming the condition is false
           if (vli_is_zero(input, ndigits)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:866:2: note: Taking false branch
           if (vli_is_zero(input, ndigits)) {
           ^
   crypto/ecc.c:871:2: note: Calling 'vli_set'
           vli_set(a, input, ndigits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:199:14: note: Assuming 'i' is >=3D 'ndigits'
           for (i =3D 0; i < ndigits; i++)
                       ^~~~~~~~~~~
   crypto/ecc.c:199:2: note: Loop condition is false. Execution continues o=
n line 199
           for (i =3D 0; i < ndigits; i++)
           ^
   crypto/ecc.c:201:1: note: Returning without writing to '*dest'
   }
   ^
   crypto/ecc.c:871:2: note: Returning from 'vli_set'
           vli_set(a, input, ndigits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:877:9: note: Assuming the condition is true
           while ((cmp_result =3D vli_cmp(a, b, ndigits)) !=3D 0) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:877:2: note: Loop condition is true.  Entering loop body
           while ((cmp_result =3D vli_cmp(a, b, ndigits)) !=3D 0) {
           ^
   crypto/ecc.c:880:7: note: The left operand of '&' is a garbage value
                   if (EVEN@) {
                       ^
   crypto/ecc.c:853:29: note: expanded from macro 'EVEN'
   #define EVEN(vli) (!(vli[0] & 1))
                        ~~~~~~ ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/xfs/libxfs/xfs_refcount.c:111:19: warning: Value stored to 'agno' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           xfs_agnumber_t                  agno =3D cur->bc_ag.agno;
                                           ^~~~   ~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_refcount.c:111:19: note: Value stored to 'agno' during=
 its initialization is never read
           xfs_agnumber_t                  agno =3D cur->bc_ag.agno;
                                           ^~~~   ~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/pci/endpoint/pci-epf-core.c:84:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D epf->epc->dev.parent;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/pci-epf-core.c:84:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D epf->epc->dev.parent;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/pci/controller/dwc/pcie-designware-host.c:105:18: warning: Value=
 stored to 'pci' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
                           ^~~
   drivers/pci/controller/dwc/pcie-designware-host.c:105:18: note: Value st=
ored to 'pci' during its initialization is never read
           struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
                           ^~~
   drivers/pci/controller/dwc/pcie-designware-host.c:597:27: warning: Acces=
s to field 'res' results in a dereference of a null pointer (loaded from va=
riable 'entry') [clang-analyzer-core.NullDereference]
                                             PCIE_ATU_TYPE_MEM, entry->res-=
>start,
                                                                ^~~~~
   drivers/pci/controller/dwc/pcie-designware-host.c:535:24: note: Left sid=
e of '&&' is false
           struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
                                 ^
   drivers/pci/controller/dwc/pcie-designware.h:279:34: note: expanded from=
 macro 'to_dw_pcie_from_pp'
   #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
                                    ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pci/controller/dwc/pcie-designware-host.c:535:24: note: Taking f=
alse branch
           struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
                                 ^
   drivers/pci/controller/dwc/pcie-designware.h:279:34: note: expanded from=
 macro 'to_dw_pcie_from_pp'
   #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
                                    ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pci/controller/dwc/pcie-designware-host.c:535:24: note: Loop con=
dition is false.  Exiting loop
           struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
                                 ^
   drivers/pci/controller/dwc/pcie-designware.h:279:34: note: expanded from=
 macro 'to_dw_pcie_from_pp'
   #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
                                    ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pci/controller/dwc/pcie-designware-host.c:545:6: note: Assuming =
the condition is false
           if (pci_msi_enabled() && !pp->ops->msi_host_init) {
               ^~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-designware-host.c:545:24: note: Left sid=
e of '&&' is false
           if (pci_msi_enabled() && !pp->ops->msi_host_init) {
                                 ^
   drivers/pci/controller/dwc/pcie-designware-host.c:588:6: note: Assuming =
the condition is true
           if (pp->bridge->child_ops =3D=3D &dw_child_pcie_ops) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-designware-host.c:588:2: note: Taking tr=
ue branch
           if (pp->bridge->child_ops =3D=3D &dw_child_pcie_ops) {
           ^
   drivers/pci/controller/dwc/pcie-designware-host.c:589:32: note: 'entry' =
initialized to a null pointer value
                   struct resource_entry *tmp, *entry =3D NULL;
                                                ^~~~~
   drivers/pci/controller/dwc/pcie-designware-host.c:592:3: note: Left side=
 of '&&' is false
                   resource_list_for_each_entry(tmp, &pp->bridge->windows)
                   ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)

vim +/dev +84 drivers/pci/endpoint/pci-epf-core.c

5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   71  =

5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   72  /**
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   73   * pci_epf_free_spac=
e() - free the allocated PCI EPF register space
9b41d19aff4090 Krzysztof Kozlowski    2020-07-29   74   * @epf: the EPF dev=
ice from whom to free the memory
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   75   * @addr: the virtua=
l address of the PCI EPF register space
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   76   * @bar: the BAR num=
ber corresponding to the register space
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   77   * @type: Identifies=
 if the allocated space is for primary EPC or secondary EPC
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   78   *
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   79   * Invoke to free th=
e allocated PCI EPF register space.
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   80   */
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   81  void pci_epf_free_sp=
ace(struct pci_epf *epf, void *addr, enum pci_barno bar,
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   82  			enum pci_epc_inte=
rface_type type)
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   83  {
b330104fa76df3 Kishon Vijay Abraham I 2018-01-11  @84  	struct device *dev =
=3D epf->epc->dev.parent;
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   85  	struct pci_epf_bar =
*epf_bar;
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   86  	struct pci_epc *epc;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   87  =

5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   88  	if (!addr)
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   89  		return;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10   90  =

5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   91  	if (type =3D=3D PRI=
MARY_INTERFACE) {
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   92  		epc =3D epf->epc;
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   93  		epf_bar =3D epf->b=
ar;
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   94  	} else {
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   95  		epc =3D epf->sec_e=
pc;
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   96  		epf_bar =3D epf->s=
ec_epc_bar;
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   97  	}
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   98  =

5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19   99  	dev =3D epc->dev.pa=
rent;
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19  100  	dma_free_coherent(d=
ev, epf_bar[bar].size, addr,
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19  101  			  epf_bar[bar].ph=
ys_addr);
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  102  =

5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19  103  	epf_bar[bar].phys_a=
ddr =3D 0;
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19  104  	epf_bar[bar].addr =
=3D NULL;
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19  105  	epf_bar[bar].size =
=3D 0;
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19  106  	epf_bar[bar].barno =
=3D 0;
5fe4c2dfaa4e64 Kishon Vijay Abraham I 2021-03-19  107  	epf_bar[bar].flags =
=3D 0;
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  108  }
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  109  EXPORT_SYMBOL_GPL(pc=
i_epf_free_space);
5e8cb4033807e3 Kishon Vijay Abraham I 2017-04-10  110  =


:::::: The code at line 84 was first introduced by commit
:::::: b330104fa76df3eae6e199a23791fed5d35f06b4 PCI: endpoint: Use EPC's de=
vice in dma_alloc_coherent()/dma_free_coherent()

:::::: TO: Kishon Vijay Abraham I <kishon@ti.com>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7242340676531756025==--

