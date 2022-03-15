Content-Type: multipart/mixed; boundary="===============7022773103225196062=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/pcie-mediatek-gen3.c:239:4: warning: Value stored to 'range_type' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 15 Mar 2022 16:47:05 +0800
Message-ID: <202203151649.ilNVofK9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7022773103225196062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jianjun Wang <jianjun.wang@mediatek.com>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: d3bf75b579b980b9d83a76d3b4d8bfb9f55b24ca PCI: mediatek-gen3: Add Me=
diaTek Gen3 driver for MT8192
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20220307 (https://download.01.org/0day-ci/arc=
hive/20220315/202203151649.ilNVofK9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd3bf75b579b980b9d83a76d3b4d8bfb9f55b24ca
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d3bf75b579b980b9d83a76d3b4d8bfb9f55b24ca
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pci/controller/pcie-mediatek-gen3.c:229:2: note: Taking false br=
anch
           resource_list_for_each_entry(entry, &host->windows) {
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
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pci/controller/pcie-mediatek-gen3.c:229:2: note: Loop condition =
is false.  Exiting loop
           resource_list_for_each_entry(entry, &host->windows) {
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
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pci/controller/pcie-mediatek-gen3.c:229:2: note: Loop condition =
is true.  Entering loop body
           resource_list_for_each_entry(entry, &host->windows) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/pci/controller/pcie-mediatek-gen3.c:237:7: note: Assuming 'type'=
 is equal to IORESOURCE_IO
                   if (type =3D=3D IORESOURCE_IO) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:237:3: note: Taking true bra=
nch
                   if (type =3D=3D IORESOURCE_IO) {
                   ^
   drivers/pci/controller/pcie-mediatek-gen3.c:249:9: note: Calling 'mtk_pc=
ie_set_trans_table'
                   err =3D mtk_pcie_set_trans_table(port, cpu_addr, pci_add=
r, size,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:154:6: note: 'num' is < PCIE=
_MAX_TRANS_TABLES
           if (num >=3D PCIE_MAX_TRANS_TABLES) {
               ^~~
   drivers/pci/controller/pcie-mediatek-gen3.c:154:2: note: Taking false br=
anch
           if (num >=3D PCIE_MAX_TRANS_TABLES) {
           ^
   drivers/pci/controller/pcie-mediatek-gen3.c:163:2: note: Loop condition =
is false.  Exiting loop
           writel_relaxed(lower_32_bits(cpu_addr) | PCIE_ATR_SIZE(fls(size)=
 - 1),
           ^
   arch/riscv/include/asm/mmio.h:120:33: note: expanded from macro 'writel_=
relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __i=
o_raw(); })
                                      ^
   arch/riscv/include/asm/mmio.h:111:21: note: expanded from macro '__io_rb=
w'
   #define __io_rbw()              do {} while (0)
                                   ^
   drivers/pci/controller/pcie-mediatek-gen3.c:163:43: note: The result of =
the left shift is undefined because the left operand is negative
           writel_relaxed(lower_32_bits(cpu_addr) | PCIE_ATR_SIZE(fls(size)=
 - 1),
                                                    ^
   drivers/pci/controller/pcie-mediatek-gen3.c:58:18: note: expanded from m=
acro 'PCIE_ATR_SIZE'
           (((((size) - 1) << 1) & GENMASK(6, 1)) | PCIE_ATR_EN)
                           ^
   arch/riscv/include/asm/mmio.h:120:57: note: expanded from macro 'writel_=
relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __i=
o_raw(); })
                                                  ~~~~~~~~~~~~^~~~~~~~
   arch/riscv/include/asm/mmio.h:93:71: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                    ~~~~~~~=
~~~~~^~
   include/uapi/linux/byteorder/little_endian.h:33:51: note: expanded from =
macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                     ^
>> drivers/pci/controller/pcie-mediatek-gen3.c:239:4: warning: Value stored=
 to 'range_type' is never read [clang-analyzer-deadcode.DeadStores]
                           range_type =3D "IO";
                           ^            ~~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:239:4: note: Value stored to=
 'range_type' is never read
                           range_type =3D "IO";
                           ^            ~~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:242:4: warning: Value stored=
 to 'range_type' is never read [clang-analyzer-deadcode.DeadStores]
                           range_type =3D "MEM";
                           ^            ~~~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:242:4: note: Value stored to=
 'range_type' is never read
                           range_type =3D "MEM";
                           ^            ~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/pci/controller/dwc/pci-keystone.c:260:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:260:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:574:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:574:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:619:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:619:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/pci/controller/dwc/pcie-artpec6.c:243:18: warning: Value stored =
to 'pci' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct dw_pcie *pci =3D artpec6_pcie->pci;
                           ^~~   ~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-artpec6.c:243:18: note: Value stored to =
'pci' during its initialization is never read
           struct dw_pcie *pci =3D artpec6_pcie->pci;
                           ^~~   ~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   lib/radix-tree.c:1045:3: warning: 4th function call argument is an unini=
tialized value [clang-analyzer-core.CallAndMessage]
                   node_tag_clear(root, parent, tag, offset);
                   ^                                 ~~~~~~
   lib/radix-tree.c:1031:2: note: 'offset' declared without an initial value
           int offset;
           ^~~~~~~~~~
   lib/radix-tree.c:1034:6: note: Assuming 'index' is <=3D 'maxindex'
           if (index > maxindex)
               ^~~~~~~~~~~~~~~~
   lib/radix-tree.c:1034:2: note: Taking false branch
           if (index > maxindex)
           ^
   lib/radix-tree.c:1039:2: note: Loop condition is false. Execution contin=
ues on line 1044
           while (radix_tree_is_internal_node(node)) {
           ^
   lib/radix-tree.c:1044:6: note: Assuming 'node' is non-null
           if (node)
               ^~~~
   lib/radix-tree.c:1044:2: note: Taking true branch
           if (node)
           ^
   lib/radix-tree.c:1045:3: note: 4th function call argument is an uninitia=
lized value
                   node_tag_clear(root, parent, tag, offset);
                   ^                                 ~~~~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/range_type +239 drivers/pci/controller/pcie-mediatek-gen3.c

d3bf75b579b980 Jianjun Wang 2021-04-20  181  =

d3bf75b579b980 Jianjun Wang 2021-04-20  182  static int mtk_pcie_startup_po=
rt(struct mtk_pcie_port *port)
d3bf75b579b980 Jianjun Wang 2021-04-20  183  {
d3bf75b579b980 Jianjun Wang 2021-04-20  184  	struct resource_entry *entry;
d3bf75b579b980 Jianjun Wang 2021-04-20  185  	struct pci_host_bridge *host =
=3D pci_host_bridge_from_priv(port);
d3bf75b579b980 Jianjun Wang 2021-04-20  186  	unsigned int table_index =3D =
0;
d3bf75b579b980 Jianjun Wang 2021-04-20  187  	int err;
d3bf75b579b980 Jianjun Wang 2021-04-20  188  	u32 val;
d3bf75b579b980 Jianjun Wang 2021-04-20  189  =

d3bf75b579b980 Jianjun Wang 2021-04-20  190  	/* Set as RC mode */
d3bf75b579b980 Jianjun Wang 2021-04-20  191  	val =3D readl_relaxed(port->b=
ase + PCIE_SETTING_REG);
d3bf75b579b980 Jianjun Wang 2021-04-20  192  	val |=3D PCIE_RC_MODE;
d3bf75b579b980 Jianjun Wang 2021-04-20  193  	writel_relaxed(val, port->bas=
e + PCIE_SETTING_REG);
d3bf75b579b980 Jianjun Wang 2021-04-20  194  =

d3bf75b579b980 Jianjun Wang 2021-04-20  195  	/* Set class code */
d3bf75b579b980 Jianjun Wang 2021-04-20  196  	val =3D readl_relaxed(port->b=
ase + PCIE_PCI_IDS_1);
d3bf75b579b980 Jianjun Wang 2021-04-20  197  	val &=3D ~GENMASK(31, 8);
d3bf75b579b980 Jianjun Wang 2021-04-20  198  	val |=3D PCI_CLASS(PCI_CLASS_=
BRIDGE_PCI << 8);
d3bf75b579b980 Jianjun Wang 2021-04-20  199  	writel_relaxed(val, port->bas=
e + PCIE_PCI_IDS_1);
d3bf75b579b980 Jianjun Wang 2021-04-20  200  =

d3bf75b579b980 Jianjun Wang 2021-04-20  201  	/* Assert all reset signals */
d3bf75b579b980 Jianjun Wang 2021-04-20  202  	val =3D readl_relaxed(port->b=
ase + PCIE_RST_CTRL_REG);
d3bf75b579b980 Jianjun Wang 2021-04-20  203  	val |=3D PCIE_MAC_RSTB | PCIE=
_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
d3bf75b579b980 Jianjun Wang 2021-04-20  204  	writel_relaxed(val, port->bas=
e + PCIE_RST_CTRL_REG);
d3bf75b579b980 Jianjun Wang 2021-04-20  205  =

d3bf75b579b980 Jianjun Wang 2021-04-20  206  	/*
d3bf75b579b980 Jianjun Wang 2021-04-20  207  	 * Described in PCIe CEM spec=
ification setctions 2.2 (PERST# Signal)
d3bf75b579b980 Jianjun Wang 2021-04-20  208  	 * and 2.2.1 (Initial Power-U=
p (G3 to S0)).
d3bf75b579b980 Jianjun Wang 2021-04-20  209  	 * The deassertion of PERST# =
should be delayed 100ms (TPVPERL)
d3bf75b579b980 Jianjun Wang 2021-04-20  210  	 * for the power and clock to=
 become stable.
d3bf75b579b980 Jianjun Wang 2021-04-20  211  	 */
d3bf75b579b980 Jianjun Wang 2021-04-20  212  	msleep(100);
d3bf75b579b980 Jianjun Wang 2021-04-20  213  =

d3bf75b579b980 Jianjun Wang 2021-04-20  214  	/* De-assert reset signals */
d3bf75b579b980 Jianjun Wang 2021-04-20  215  	val &=3D ~(PCIE_MAC_RSTB | PC=
IE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
d3bf75b579b980 Jianjun Wang 2021-04-20  216  	writel_relaxed(val, port->bas=
e + PCIE_RST_CTRL_REG);
d3bf75b579b980 Jianjun Wang 2021-04-20  217  =

d3bf75b579b980 Jianjun Wang 2021-04-20  218  	/* Check if the link is up or=
 not */
d3bf75b579b980 Jianjun Wang 2021-04-20  219  	err =3D readl_poll_timeout(po=
rt->base + PCIE_LINK_STATUS_REG, val,
d3bf75b579b980 Jianjun Wang 2021-04-20  220  				 !!(val & PCIE_PORT_LINKUP=
), 20,
d3bf75b579b980 Jianjun Wang 2021-04-20  221  				 PCI_PM_D3COLD_WAIT * USEC=
_PER_MSEC);
d3bf75b579b980 Jianjun Wang 2021-04-20  222  	if (err) {
d3bf75b579b980 Jianjun Wang 2021-04-20  223  		val =3D readl_relaxed(port->=
base + PCIE_LTSSM_STATUS_REG);
d3bf75b579b980 Jianjun Wang 2021-04-20  224  		dev_err(port->dev, "PCIe lin=
k down, ltssm reg val: %#x\n", val);
d3bf75b579b980 Jianjun Wang 2021-04-20  225  		return err;
d3bf75b579b980 Jianjun Wang 2021-04-20  226  	}
d3bf75b579b980 Jianjun Wang 2021-04-20  227  =

d3bf75b579b980 Jianjun Wang 2021-04-20  228  	/* Set PCIe translation windo=
ws */
d3bf75b579b980 Jianjun Wang 2021-04-20  229  	resource_list_for_each_entry(=
entry, &host->windows) {
d3bf75b579b980 Jianjun Wang 2021-04-20  230  		struct resource *res =3D ent=
ry->res;
d3bf75b579b980 Jianjun Wang 2021-04-20  231  		unsigned long type =3D resou=
rce_type(res);
d3bf75b579b980 Jianjun Wang 2021-04-20  232  		resource_size_t cpu_addr;
d3bf75b579b980 Jianjun Wang 2021-04-20  233  		resource_size_t pci_addr;
d3bf75b579b980 Jianjun Wang 2021-04-20  234  		resource_size_t size;
d3bf75b579b980 Jianjun Wang 2021-04-20  235  		const char *range_type;
d3bf75b579b980 Jianjun Wang 2021-04-20  236  =

d3bf75b579b980 Jianjun Wang 2021-04-20  237  		if (type =3D=3D IORESOURCE_I=
O) {
d3bf75b579b980 Jianjun Wang 2021-04-20  238  			cpu_addr =3D pci_pio_to_add=
ress(res->start);
d3bf75b579b980 Jianjun Wang 2021-04-20 @239  			range_type =3D "IO";
d3bf75b579b980 Jianjun Wang 2021-04-20  240  		} else if (type =3D=3D IORES=
OURCE_MEM) {
d3bf75b579b980 Jianjun Wang 2021-04-20  241  			cpu_addr =3D res->start;
d3bf75b579b980 Jianjun Wang 2021-04-20  242  			range_type =3D "MEM";
d3bf75b579b980 Jianjun Wang 2021-04-20  243  		} else {
d3bf75b579b980 Jianjun Wang 2021-04-20  244  			continue;
d3bf75b579b980 Jianjun Wang 2021-04-20  245  		}
d3bf75b579b980 Jianjun Wang 2021-04-20  246  =

d3bf75b579b980 Jianjun Wang 2021-04-20  247  		pci_addr =3D res->start - en=
try->offset;
d3bf75b579b980 Jianjun Wang 2021-04-20  248  		size =3D resource_size(res);
d3bf75b579b980 Jianjun Wang 2021-04-20  249  		err =3D mtk_pcie_set_trans_t=
able(port, cpu_addr, pci_addr, size,
d3bf75b579b980 Jianjun Wang 2021-04-20  250  					       type, table_index);
d3bf75b579b980 Jianjun Wang 2021-04-20  251  		if (err)
d3bf75b579b980 Jianjun Wang 2021-04-20  252  			return err;
d3bf75b579b980 Jianjun Wang 2021-04-20  253  =

d3bf75b579b980 Jianjun Wang 2021-04-20  254  		dev_dbg(port->dev, "set %s t=
rans window[%d]: cpu_addr =3D %#llx, pci_addr =3D %#llx, size =3D %#llx\n",
d3bf75b579b980 Jianjun Wang 2021-04-20  255  			range_type, table_index, (u=
nsigned long long)cpu_addr,
d3bf75b579b980 Jianjun Wang 2021-04-20  256  			(unsigned long long)pci_add=
r, (unsigned long long)size);
d3bf75b579b980 Jianjun Wang 2021-04-20  257  =

d3bf75b579b980 Jianjun Wang 2021-04-20  258  		table_index++;
d3bf75b579b980 Jianjun Wang 2021-04-20  259  	}
d3bf75b579b980 Jianjun Wang 2021-04-20  260  =

d3bf75b579b980 Jianjun Wang 2021-04-20  261  	return 0;
d3bf75b579b980 Jianjun Wang 2021-04-20  262  }
d3bf75b579b980 Jianjun Wang 2021-04-20  263  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7022773103225196062==--

