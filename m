Content-Type: multipart/mixed; boundary="===============5165072395078798736=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/xilinx/zynqmp_dma.c:359:2: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 13 Dec 2021 04:56:32 +0800
Message-ID: <202112130410.SA6DfvDP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5165072395078798736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Michael Tretter <m.tretter@pengutronix.de>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 7073b5a8bd6ea641b41568e2899b0977f79134e3 dmaengine: zynqmp_dma: ena=
ble COMPILE_TEST
date:   2 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 2 months ago
config: riscv-randconfig-c006-20211210 (https://download.01.org/0day-ci/arc=
hive/20211213/202112130410.SA6DfvDP-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7073b5a8bd6ea641b41568e2899b0977f79134e3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7073b5a8bd6ea641b41568e2899b0977f79134e3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/regulator/rohm-regulator.c:31:6: note: Assuming 'mask' is not eq=
ual to 0
           if (!mask) {
               ^~~~~
   drivers/regulator/rohm-regulator.c:31:2: note: Taking false branch
           if (!mask) {
           ^
   drivers/regulator/rohm-regulator.c:37:14: note: Assuming 'i' is < field =
'n_voltages'
           for (i =3D 0; i < desc->n_voltages; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rohm-regulator.c:37:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < desc->n_voltages; i++) {
           ^
   drivers/regulator/rohm-regulator.c:39:7: note: Assuming field 'linear_ra=
nge_selectors' is null
                   if (desc->linear_range_selectors)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rohm-regulator.c:39:3: note: Taking false branch
                   if (desc->linear_range_selectors)
                   ^
   drivers/regulator/rohm-regulator.c:41:7: note: Assuming field 'n_linear_=
ranges' is 0
                   if (desc->n_linear_ranges)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/rohm-regulator.c:41:3: note: Taking false branch
                   if (desc->n_linear_ranges)
                   ^
   drivers/regulator/rohm-regulator.c:45:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/regulator/rohm-regulator.c:45:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/regulator/rohm-regulator.c:47:7: note: Assuming 'ret' is equal t=
o 'uv'
                   if (ret =3D=3D uv) {
                       ^~~~~~~~~
   drivers/regulator/rohm-regulator.c:47:3: note: Taking true branch
                   if (ret =3D=3D uv) {
                   ^
   drivers/regulator/rohm-regulator.c:48:6: note: Assigned value is garbage=
 or undefined
                           i <<=3D ffs(desc->vsel_mask) - 1;
                             ^   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/mfd/sm501.c:513:16: warning: Value stored to 'mode' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long mode =3D smc501_readl(sm->regs + SM501_POWER_MODE_=
CONTROL);
                         ^~~~
   drivers/mfd/sm501.c:513:16: note: Value stored to 'mode' during its init=
ialization is never read
           unsigned long mode =3D smc501_readl(sm->regs + SM501_POWER_MODE_=
CONTROL);
                         ^~~~
   drivers/mfd/sm501.c:514:16: warning: Value stored to 'gate' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long gate =3D smc501_readl(sm->regs + SM501_CURRENT_GAT=
E);
                         ^~~~
   drivers/mfd/sm501.c:514:16: note: Value stored to 'gate' during its init=
ialization is never read
           unsigned long gate =3D smc501_readl(sm->regs + SM501_CURRENT_GAT=
E);
                         ^~~~
   drivers/mfd/sm501.c:515:16: warning: Value stored to 'clock' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long clock =3D smc501_readl(sm->regs + SM501_CURRENT_CL=
OCK);
                         ^~~~~
   drivers/mfd/sm501.c:515:16: note: Value stored to 'clock' during its ini=
tialization is never read
           unsigned long clock =3D smc501_readl(sm->regs + SM501_CURRENT_CL=
OCK);
                         ^~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/dma/xilinx/zynqmp_dma.c:359:2: warning: Value stored to 'val' is=
 never read [clang-analyzer-deadcode.DeadStores]
           val =3D readl(chan->regs + ZYNQMP_DMA_IRQ_SRC_ACCT);
           ^
   drivers/dma/xilinx/zynqmp_dma.c:359:2: note: Value stored to 'val' is ne=
ver read
   drivers/dma/xilinx/zynqmp_dma.c:360:2: warning: Value stored to 'val' is=
 never read [clang-analyzer-deadcode.DeadStores]
           val =3D readl(chan->regs + ZYNQMP_DMA_IRQ_DST_ACCT);
           ^
   drivers/dma/xilinx/zynqmp_dma.c:360:2: note: Value stored to 'val' is ne=
ver read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/nvme/host/ioctl.c:230:7: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   if (put_user(result, &ucmd->result))
                       ^
   arch/riscv/include/asm/uaccess.h:354:3: note: expanded from macro 'put_u=
ser'
                   __put_user((x), __p) :                          \
                   ^
   arch/riscv/include/asm/uaccess.h:321:2: note: expanded from macro '__put=
_user'
           __typeof__(*__gu_ptr) __val =3D (x);                      \
           ^
   drivers/nvme/host/ioctl.c:479:2: note: Control jumps to 'case 3225964097=
:'  at line 480
           switch (cmd) {
           ^
   drivers/nvme/host/ioctl.c:481:10: note: Calling 'nvme_user_cmd'
                   return nvme_user_cmd(ctrl, NULL, argp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:196:2: note: 'result' declared without an init=
ial value
           u64 result;
           ^~~~~~~~~~
   drivers/nvme/host/ioctl.c:199:6: note: Assuming the condition is false
           if (!capable(CAP_SYS_ADMIN))
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:199:2: note: Taking false branch
           if (!capable(CAP_SYS_ADMIN))
           ^
   drivers/nvme/host/ioctl.c:201:6: note: Calling 'copy_from_user'
           if (copy_from_user(&cmd, ucmd, sizeof(cmd)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Value assigned to 'cmd.flags', whic=
h participates in a condition later
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   drivers/nvme/host/ioctl.c:201:6: note: Returning from 'copy_from_user'
           if (copy_from_user(&cmd, ucmd, sizeof(cmd)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:201:6: note: Assuming the condition is false
           if (copy_from_user(&cmd, ucmd, sizeof(cmd)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:201:2: note: Taking false branch
           if (copy_from_user(&cmd, ucmd, sizeof(cmd)))
           ^
   drivers/nvme/host/ioctl.c:203:6: note: Assuming field 'flags' is 0
           if (cmd.flags)
               ^~~~~~~~~
   drivers/nvme/host/ioctl.c:203:2: note: Taking false branch
           if (cmd.flags)
           ^

vim +/val +359 drivers/dma/xilinx/zynqmp_dma.c

b0cc417c163719 Kedareswara rao Appana 2016-07-01  329  =

b0cc417c163719 Kedareswara rao Appana 2016-07-01  330  /**
b0cc417c163719 Kedareswara rao Appana 2016-07-01  331   * zynqmp_dma_init -=
 Initialize the channel
b0cc417c163719 Kedareswara rao Appana 2016-07-01  332   * @chan: ZynqMP DMA=
 channel pointer
b0cc417c163719 Kedareswara rao Appana 2016-07-01  333   */
b0cc417c163719 Kedareswara rao Appana 2016-07-01  334  static void zynqmp_d=
ma_init(struct zynqmp_dma_chan *chan)
b0cc417c163719 Kedareswara rao Appana 2016-07-01  335  {
b0cc417c163719 Kedareswara rao Appana 2016-07-01  336  	u32 val;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  337  =

b0cc417c163719 Kedareswara rao Appana 2016-07-01  338  	writel(ZYNQMP_DMA_I=
DS_DEFAULT_MASK, chan->regs + ZYNQMP_DMA_IDS);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  339  	val =3D readl(chan-=
>regs + ZYNQMP_DMA_ISR);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  340  	writel(val, chan->r=
egs + ZYNQMP_DMA_ISR);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  341  =

b0cc417c163719 Kedareswara rao Appana 2016-07-01  342  	if (chan->is_dmacoh=
erent) {
b0cc417c163719 Kedareswara rao Appana 2016-07-01  343  		val =3D ZYNQMP_DMA=
_AXCOHRNT;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  344  		val =3D (val & ~ZY=
NQMP_DMA_AXCACHE) |
b0cc417c163719 Kedareswara rao Appana 2016-07-01  345  			(ZYNQMP_DMA_AXCAC=
HE_VAL << ZYNQMP_DMA_AXCACHE_OFST);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  346  		writel(val, chan->=
regs + ZYNQMP_DMA_DSCR_ATTR);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  347  	}
b0cc417c163719 Kedareswara rao Appana 2016-07-01  348  =

b0cc417c163719 Kedareswara rao Appana 2016-07-01  349  	val =3D readl(chan-=
>regs + ZYNQMP_DMA_DATA_ATTR);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  350  	if (chan->is_dmacoh=
erent) {
b0cc417c163719 Kedareswara rao Appana 2016-07-01  351  		val =3D (val & ~ZY=
NQMP_DMA_ARCACHE) |
b0cc417c163719 Kedareswara rao Appana 2016-07-01  352  			(ZYNQMP_DMA_AXCAC=
HE_VAL << ZYNQMP_DMA_ARCACHE_OFST);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  353  		val =3D (val & ~ZY=
NQMP_DMA_AWCACHE) |
b0cc417c163719 Kedareswara rao Appana 2016-07-01  354  			(ZYNQMP_DMA_AXCAC=
HE_VAL << ZYNQMP_DMA_AWCACHE_OFST);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  355  	}
b0cc417c163719 Kedareswara rao Appana 2016-07-01  356  	writel(val, chan->r=
egs + ZYNQMP_DMA_DATA_ATTR);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  357  =

b0cc417c163719 Kedareswara rao Appana 2016-07-01  358  	/* Clearing the int=
errupt account rgisters */
b0cc417c163719 Kedareswara rao Appana 2016-07-01 @359  	val =3D readl(chan-=
>regs + ZYNQMP_DMA_IRQ_SRC_ACCT);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  360  	val =3D readl(chan-=
>regs + ZYNQMP_DMA_IRQ_DST_ACCT);
b0cc417c163719 Kedareswara rao Appana 2016-07-01  361  =

b0cc417c163719 Kedareswara rao Appana 2016-07-01  362  	chan->idle =3D true;
b0cc417c163719 Kedareswara rao Appana 2016-07-01  363  }
b0cc417c163719 Kedareswara rao Appana 2016-07-01  364  =


:::::: The code at line 359 was first introduced by commit
:::::: b0cc417c1637192be658e68a74c8d1568e3d35f6 dmaengine: Add Xilinx zynqm=
p dma engine driver support

:::::: TO: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5165072395078798736==--

