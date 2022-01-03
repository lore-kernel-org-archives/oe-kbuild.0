Content-Type: multipart/mixed; boundary="===============4606028260304067050=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [avpatel:riscv_kvm_aia_v1 30/42] drivers/irqchip/irq-riscv-imsic.c:148:2: warning: Value stored to 'global' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 03 Jan 2022 22:06:01 +0800
Message-ID: <202201032119.l8gVu4RU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4606028260304067050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anup Patel <anup.patel@wdc.com>

tree:   https://github.com/avpatel/linux.git riscv_kvm_aia_v1
head:   6fa93cde61f5f84422bd3f97b9db6e2406a344dd
commit: 608f1fa0b6d8185a467e90300c3279f63214e7b7 [30/42] irqchip: Add RISC-=
V incoming MSI controller driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-c006-20211231 (https://download.01.org/0day-ci/arc=
hive/20220103/202201032119.l8gVu4RU-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b50fea=
47b6c454581fce89af359f3afe5154986c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/608f1fa0b6d8185a467e90300=
c3279f63214e7b7
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_kvm_aia_v1
        git checkout 608f1fa0b6d8185a467e90300c3279f63214e7b7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                         ^
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                              ^
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/video/backlight/pwm_bl.c:206:12: note: Division by zero
                   min((int)DIV_ROUND_UP(period, fls(period)), 4096);
                            ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   include/linux/minmax.h:45:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/clk/clk-max9485.c:199:9: warning: Access to field 'out' results =
in a dereference of a null pointer (loaded from variable 'prev') [clang-ana=
lyzer-core.NullDereference]
           return prev->out;
                  ^~~~
   drivers/clk/clk-max9485.c:165:36: note: 'prev' initialized to a null poi=
nter value
           const struct max9485_rate *curr, *prev =3D NULL;
                                             ^~~~
   drivers/clk/clk-max9485.c:167:29: note: Assuming field 'out' is equal to=
 0
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
                                      ^~~~~~~~~~~~~~
   drivers/clk/clk-max9485.c:167:2: note: Loop condition is false. Executio=
n continues on line 199
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
           ^
   drivers/clk/clk-max9485.c:199:9: note: Access to field 'out' results in =
a dereference of a null pointer (loaded from variable 'prev')
           return prev->out;
                  ^~~~
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/irqchip/irq-riscv-imsic.c:148:2: warning: Value stored to 'globa=
l' is never read [clang-analyzer-deadcode.DeadStores]
           global =3D &handler->priv->global;
           ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:148:2: note: Value stored to 'global' =
is never read
           global =3D &handler->priv->global;
           ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:285:16: warning: The result of the lef=
t shift is undefined due to shifting by '32', which is greater or equal to =
the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOpera=
torResult]
               (max_id < BIT(order)))
                         ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^
   drivers/irqchip/irq-riscv-imsic.c:578:8: note: Calling 'imsic_get_cpu'
           err =3D imsic_get_cpu(priv, &priv->lmask, false, &cpu);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:162:6: note: 'force' is false
           if (force)
               ^~~~~
   drivers/irqchip/irq-riscv-imsic.c:162:2: note: Taking false branch
           if (force)
           ^
   drivers/irqchip/irq-riscv-imsic.c:167:6: note: Assuming 'cpu' is < 'nr_c=
pu_ids'
           if (cpu >=3D nr_cpu_ids)
               ^~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:167:2: note: Taking false branch
           if (cpu >=3D nr_cpu_ids)
           ^
   drivers/irqchip/irq-riscv-imsic.c:170:6: note: 'out_target_cpu' is non-n=
ull
           if (out_target_cpu)
               ^~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:170:2: note: Taking true branch
           if (out_target_cpu)
           ^
   drivers/irqchip/irq-riscv-imsic.c:173:2: note: Returning zero, which par=
ticipates in a condition later
           return 0;
           ^~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:578:8: note: Returning from 'imsic_get=
_cpu'
           err =3D imsic_get_cpu(priv, &priv->lmask, false, &cpu);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:579:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/irqchip/irq-riscv-imsic.c:579:2: note: Taking false branch
           if (err)
           ^
   drivers/irqchip/irq-riscv-imsic.c:582:8: note: Calling 'imsic_cpu_page_p=
hys'
           err =3D imsic_cpu_page_phys(cpu, 0, &msi_addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:119:34: note: Loop condition is false.=
  Exiting loop
           struct imsic_handler *handler =3D per_cpu_ptr(&imsic_handlers, c=
pu);
                                           ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   drivers/irqchip/irq-riscv-imsic.c:123:6: note: Assuming 'handler' is non=
-null
           if (!handler || !handler->priv)
               ^~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:123:6: note: Left side of '||' is false
   drivers/irqchip/irq-riscv-imsic.c:123:18: note: Assuming field 'priv' is=
 non-null
           if (!handler || !handler->priv)
                           ^~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:123:2: note: Taking false branch
           if (!handler || !handler->priv)
           ^
   drivers/irqchip/irq-riscv-imsic.c:128:6: note: Assuming the condition is=
 false
           if (BIT(global->guest_index_bits) <=3D guest_index)
               ^
   include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                   ^
   drivers/irqchip/irq-riscv-imsic.c:128:2: note: Taking false branch
           if (BIT(global->guest_index_bits) <=3D guest_index)
           ^
   drivers/irqchip/irq-riscv-imsic.c:131:6: note: 'out_msi_pa' is non-null
           if (out_msi_pa)
               ^~~~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:131:2: note: Taking true branch
           if (out_msi_pa)
           ^
   drivers/irqchip/irq-riscv-imsic.c:135:2: note: Returning zero, which par=
ticipates in a condition later
           return 0;
           ^~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:582:8: note: Returning from 'imsic_cpu=
_page_phys'
           err =3D imsic_cpu_page_phys(cpu, 0, &msi_addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-riscv-imsic.c:583:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/irqchip/irq-riscv-imsic.c:583:2: note: Taking false branch
           if (err)
           ^
   drivers/irqchip/irq-riscv-imsic.c:587:5: note: Calling 'get_count_order'
                                   get_count_order(nr_irqs));
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:195:6: note: Assuming 'count' is not equal to 0
           if (count =3D=3D 0)
               ^~~~~~~~~~
   include/linux/bitops.h:195:2: note: Taking false branch

vim +/global +148 drivers/irqchip/irq-riscv-imsic.c

608f1fa0b6d818 Anup Patel 2021-04-26  137  =

608f1fa0b6d818 Anup Patel 2021-04-26  138  static void __iomem *imsic_cpu_p=
age_virt(unsigned int cpu,
608f1fa0b6d818 Anup Patel 2021-04-26  139  					 unsigned int guest_index)
608f1fa0b6d818 Anup Patel 2021-04-26  140  {
608f1fa0b6d818 Anup Patel 2021-04-26  141  	struct imsic_handler *handler =
=3D per_cpu_ptr(&imsic_handlers, cpu);
608f1fa0b6d818 Anup Patel 2021-04-26  142  	struct imsic_global_config *glo=
bal;
608f1fa0b6d818 Anup Patel 2021-04-26  143  	struct imsic_local_config *loca=
l;
608f1fa0b6d818 Anup Patel 2021-04-26  144  =

608f1fa0b6d818 Anup Patel 2021-04-26  145  	if (!handler || !handler->priv)
608f1fa0b6d818 Anup Patel 2021-04-26  146  		return NULL;
608f1fa0b6d818 Anup Patel 2021-04-26  147  	local =3D &handler->local;
608f1fa0b6d818 Anup Patel 2021-04-26 @148  	global =3D &handler->priv->glob=
al;
608f1fa0b6d818 Anup Patel 2021-04-26  149  =

608f1fa0b6d818 Anup Patel 2021-04-26  150  	return local->msi_va + (guest_i=
ndex * IMSIC_MMIO_PAGE_SZ);
608f1fa0b6d818 Anup Patel 2021-04-26  151  }
608f1fa0b6d818 Anup Patel 2021-04-26  152  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4606028260304067050==--

