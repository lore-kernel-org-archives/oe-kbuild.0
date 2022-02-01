Content-Type: multipart/mixed; boundary="===============3188311929917669973=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/pcie-mediatek-gen3.c:399:24: warning: Value stored to 'pcie' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 02 Feb 2022 06:44:40 +0800
Message-ID: <202202020603.r9KPAO7o-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3188311929917669973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Fan Fei <ffclaire1224@gmail.com>
CC: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: d5a4835b5ed05b1f14a00e0db9f2c91ae7d1ede6 PCI: mediatek-gen3: Rename=
 mtk_pcie_port to mtk_gen3_pcie
date:   4 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20220131 (https://download.01.org/0day-ci/arc=
hive/20220202/202202020603.r9KPAO7o-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e84=
4b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd5a4835b5ed05b1f14a00e0db9f2c91ae7d1ede6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d5a4835b5ed05b1f14a00e0db9f2c91ae7d1ede6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:47:3: note: expanded from macro 'read_poll_timeou=
t'
                   if (cond) \
                   ^
   drivers/pci/controller/pcie-mediatek-gen3.c:318:8: note:  Execution cont=
inues on line 318
           err =3D readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, va=
l,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:48:4: note: expanded from macro 'read_poll_timeou=
t'
                           break; \
                           ^
   drivers/pci/controller/pcie-mediatek-gen3.c:318:8: note: '?' condition i=
s true
           err =3D readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, va=
l,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:57:2: note: expanded from macro 'read_poll_timeou=
t'
           (cond) ? 0 : -ETIMEDOUT; \
           ^
   drivers/pci/controller/pcie-mediatek-gen3.c:321:6: note: 'err' is 0
           if (err) {
               ^~~
   drivers/pci/controller/pcie-mediatek-gen3.c:321:2: note: Taking false br=
anch
           if (err) {
           ^
   drivers/pci/controller/pcie-mediatek-gen3.c:330:2: note: Loop condition =
is true.  Entering loop body
           resource_list_for_each_entry(entry, &host->windows) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/pci/controller/pcie-mediatek-gen3.c:338:7: note: Assuming 'type'=
 is equal to IORESOURCE_IO
                   if (type =3D=3D IORESOURCE_IO) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:338:3: note: Taking true bra=
nch
                   if (type =3D=3D IORESOURCE_IO) {
                   ^
   drivers/pci/controller/pcie-mediatek-gen3.c:350:9: note: Calling 'mtk_pc=
ie_set_trans_table'
                   err =3D mtk_pcie_set_trans_table(pcie, cpu_addr, pci_add=
r, size,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:219:6: note: 'num' is < PCIE=
_MAX_TRANS_TABLES
           if (num >=3D PCIE_MAX_TRANS_TABLES) {
               ^~~
   drivers/pci/controller/pcie-mediatek-gen3.c:219:2: note: Taking false br=
anch
           if (num >=3D PCIE_MAX_TRANS_TABLES) {
           ^
   drivers/pci/controller/pcie-mediatek-gen3.c:228:2: note: Loop condition =
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
   drivers/pci/controller/pcie-mediatek-gen3.c:228:43: note: The result of =
the left shift is undefined because the left operand is negative
           writel_relaxed(lower_32_bits(cpu_addr) | PCIE_ATR_SIZE(fls(size)=
 - 1),
                                                    ^
   drivers/pci/controller/pcie-mediatek-gen3.c:92:18: note: expanded from m=
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
   drivers/pci/controller/pcie-mediatek-gen3.c:340:4: warning: Value stored=
 to 'range_type' is never read [clang-analyzer-deadcode.DeadStores]
                           range_type =3D "IO";
                           ^            ~~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:340:4: note: Value stored to=
 'range_type' is never read
                           range_type =3D "IO";
                           ^            ~~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:343:4: warning: Value stored=
 to 'range_type' is never read [clang-analyzer-deadcode.DeadStores]
                           range_type =3D "MEM";
                           ^            ~~~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:343:4: note: Value stored to=
 'range_type' is never read
                           range_type =3D "MEM";
                           ^            ~~~~~
>> drivers/pci/controller/pcie-mediatek-gen3.c:399:24: warning: Value store=
d to 'pcie' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct mtk_gen3_pcie *pcie =3D data->domain->host_data;
                                 ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:399:24: note: Value stored t=
o 'pcie' during its initialization is never read
           struct mtk_gen3_pcie *pcie =3D data->domain->host_data;
                                 ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/regulator/rk808-regulator.c:255:10: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           old_sel >>=3D ffs(mask) - 1;
                   ^
   drivers/regulator/rk808-regulator.c:302:6: note: Assuming 'gpio' is null
           if (!gpio)
               ^~~~~
   drivers/regulator/rk808-regulator.c:302:2: note: Taking true branch
           if (!gpio)
           ^
   drivers/regulator/rk808-regulator.c:303:10: note: Calling 'rk808_buck1_2=
_i2c_set_voltage_sel'
                   return rk808_buck1_2_i2c_set_voltage_sel(rdev, sel);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rk808-regulator.c:250:6: note: Assuming 'ret' is equal=
 to 0
           if (ret !=3D 0)
               ^~~~~~~~
   drivers/regulator/rk808-regulator.c:250:2: note: Taking false branch
           if (ret !=3D 0)
           ^
   drivers/regulator/rk808-regulator.c:255:10: note: Assigned value is garb=
age or undefined
           old_sel >>=3D ffs(mask) - 1;
                   ^   ~~~~~~~~~~~~~
   drivers/regulator/rk808-regulator.c:274:3: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_write(rdev->regmap, rdev->desc->vsel_reg,=
 val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/regulator/rk808-regulator.c:274:3: note: Value stored to 'ret' i=
s never read
                   ret =3D regmap_write(rdev->regmap, rdev->desc->vsel_reg,=
 val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/regulator/rohm-regulator.c:48:6: warning: Assigned value is garb=
age or undefined [clang-analyzer-core.uninitialized.Assign]
                           i <<=3D ffs(desc->vsel_mask) - 1;
                             ^
   drivers/regulator/rohm-regulator.c:68:14: note: 'i' is < ROHM_DVS_LEVEL_=
VALID_AMOUNT
           for (i =3D 0; i < ROHM_DVS_LEVEL_VALID_AMOUNT && !ret; i++) {
                       ^
   drivers/regulator/rohm-regulator.c:68:14: note: Left side of '&&' is true
   drivers/regulator/rohm-regulator.c:68:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < ROHM_DVS_LEVEL_VALID_AMOUNT && !ret; i++) {
           ^
   drivers/regulator/rohm-regulator.c:72:7: note: Assuming the condition is=
 true
                   if (dvs->level_map & bit) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rohm-regulator.c:72:3: note: Taking true branch
                   if (dvs->level_map & bit) {
                   ^
   drivers/regulator/rohm-regulator.c:73:4: note: Control jumps to 'case 1:=
'  at line 74
                           switch (bit) {
                           ^
   drivers/regulator/rohm-regulator.c:79:5: note:  Execution continues on l=
ine 107
                                   break;
                                   ^
   drivers/regulator/rohm-regulator.c:107:10: note: Calling 'set_dvs_level'
                           ret =3D set_dvs_level(desc, np, regmap, prop, re=
g, mask,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/regulator/rohm-regulator.c:19:8: note: Calling 'of_property_read=
_u32'
           ret =3D of_property_read_u32(np, prop, &uv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1257:9: note: Calling 'of_property_read_u32_array'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:507:6: note: Assuming 'ret' is >=3D 0
           if (ret >=3D 0)
               ^~~~~~~~
   include/linux/of.h:507:2: note: Taking true branch
           if (ret >=3D 0)
           ^
   include/linux/of.h:508:3: note: Returning zero, which participates in a =
condition later
                   return 0;
                   ^~~~~~~~
   include/linux/of.h:1257:9: note: Returning from 'of_property_read_u32_ar=
ray'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1257:2: note: Returning zero, which participates in a=
 condition later
           return of_property_read_u32_array(np, propname, out_value, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rohm-regulator.c:19:8: note: Returning from 'of_proper=
ty_read_u32'
           ret =3D of_property_read_u32(np, prop, &uv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rohm-regulator.c:20:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/regulator/rohm-regulator.c:20:2: note: Taking false branch
           if (ret) {
           ^
   drivers/regulator/rohm-regulator.c:26:6: note: Assuming 'uv' is not equa=
l to 0
           if (uv =3D=3D 0) {
               ^~~~~~~
   drivers/regulator/rohm-regulator.c:26:2: note: Taking false branch
           if (uv =3D=3D 0) {
           ^
   drivers/regulator/rohm-regulator.c:31:6: note: Assuming 'mask' is not eq=
ual to 0

vim +/pcie +399 drivers/pci/controller/pcie-mediatek-gen3.c

1bdafba538be70 Jianjun Wang 2021-04-20  395  =

1bdafba538be70 Jianjun Wang 2021-04-20  396  static void mtk_compose_msi_ms=
g(struct irq_data *data, struct msi_msg *msg)
1bdafba538be70 Jianjun Wang 2021-04-20  397  {
1bdafba538be70 Jianjun Wang 2021-04-20  398  	struct mtk_msi_set *msi_set =
=3D irq_data_get_irq_chip_data(data);
d5a4835b5ed05b Fan Fei      2021-12-22 @399  	struct mtk_gen3_pcie *pcie =
=3D data->domain->host_data;
1bdafba538be70 Jianjun Wang 2021-04-20  400  	unsigned long hwirq;
1bdafba538be70 Jianjun Wang 2021-04-20  401  =

1bdafba538be70 Jianjun Wang 2021-04-20  402  	hwirq =3D	data->hwirq % PCIE_=
MSI_IRQS_PER_SET;
1bdafba538be70 Jianjun Wang 2021-04-20  403  =

1bdafba538be70 Jianjun Wang 2021-04-20  404  	msg->address_hi =3D upper_32_=
bits(msi_set->msg_addr);
1bdafba538be70 Jianjun Wang 2021-04-20  405  	msg->address_lo =3D lower_32_=
bits(msi_set->msg_addr);
1bdafba538be70 Jianjun Wang 2021-04-20  406  	msg->data =3D hwirq;
d5a4835b5ed05b Fan Fei      2021-12-22  407  	dev_dbg(pcie->dev, "msi#%#lx =
address_hi %#x address_lo %#x data %d\n",
1bdafba538be70 Jianjun Wang 2021-04-20  408  		hwirq, msg->address_hi, msg-=
>address_lo, msg->data);
1bdafba538be70 Jianjun Wang 2021-04-20  409  }
1bdafba538be70 Jianjun Wang 2021-04-20  410  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3188311929917669973==--

