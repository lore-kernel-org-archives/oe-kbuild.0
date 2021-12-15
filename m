Content-Type: multipart/mixed; boundary="===============5377415432766979690=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [palmer:riscv-pmu 8/10] drivers/perf/riscv_pmu_sbi.c:627:8: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Wed, 15 Dec 2021 12:47:10 +0800
Message-ID: <202112151246.KPvcvopj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5377415432766979690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Atish Patra <atish.patra@wdc.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git ri=
scv-pmu
head:   7a94c6fb363cfe62906cb0503d763204b0fe32b8
commit: e4dfe5f987b44eb72dac27ead70b8fd722fdae63 [8/10] RISC-V: Add interru=
pt support for perf
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: riscv-randconfig-c006-20211214 (https://download.01.org/0day-ci/arc=
hive/20211215/202112151246.KPvcvopj-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/=
commit/?id=3De4dfe5f987b44eb72dac27ead70b8fd722fdae63
        git remote add palmer https://git.kernel.org/pub/scm/linux/kernel/g=
it/palmer/linux.git
        git fetch --no-tags palmer riscv-pmu
        git checkout e4dfe5f987b44eb72dac27ead70b8fd722fdae63
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/asc7621.c:422:11: note: '?' condition is true
           reqval =3D clamp_val(reqval, -32000, 31750);
                    ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/hwmon/asc7621.c:423:2: note: The value -32 is assigned to 'i'
           i =3D reqval / 1000;
           ^~~~~~~~~~~~~~~~~
   drivers/hwmon/asc7621.c:425:11: note: The result of the left shift is un=
defined because the left operand is negative
           temp =3D i << 2;
                  ~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   block/partitions/atari.c:143:5: warning: Value stored to 'part_fmt' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   part_fmt =3D 2;
                                   ^          ~
   block/partitions/atari.c:143:5: note: Value stored to 'part_fmt' is neve=
r read
                                   part_fmt =3D 2;
                                   ^          ~
   Suppressed 2 warnings (2 in non-user code).
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
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   block/partitions/ldm.c:739:3: warning: Value stored to 'r_cols' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   r_cols   =3D 0;
                   ^          ~
   block/partitions/ldm.c:739:3: note: Value stored to 'r_cols' is never re=
ad
                   r_cols   =3D 0;
                   ^          ~
   block/partitions/ldm.c:787:3: warning: Value stored to 'r_id1' is never =
read [clang-analyzer-deadcode.DeadStores]
                   r_id1 =3D 0;
                   ^       ~
   block/partitions/ldm.c:787:3: note: Value stored to 'r_id1' is never read
                   r_id1 =3D 0;
                   ^       ~
   block/partitions/ldm.c:788:3: warning: Value stored to 'r_id2' is never =
read [clang-analyzer-deadcode.DeadStores]
                   r_id2 =3D 0;
                   ^       ~
   block/partitions/ldm.c:788:3: note: Value stored to 'r_id2' is never read
                   r_id2 =3D 0;
                   ^       ~
   block/partitions/ldm.c:830:3: warning: Value stored to 'r_id1' is never =
read [clang-analyzer-deadcode.DeadStores]
                   r_id1 =3D 0;
                   ^       ~
   block/partitions/ldm.c:830:3: note: Value stored to 'r_id1' is never read
                   r_id1 =3D 0;
                   ^       ~
   block/partitions/ldm.c:831:3: warning: Value stored to 'r_id2' is never =
read [clang-analyzer-deadcode.DeadStores]
                   r_id2 =3D 0;
                   ^       ~
   block/partitions/ldm.c:831:3: note: Value stored to 'r_id2' is never read
                   r_id2 =3D 0;
                   ^       ~
   block/partitions/ldm.c:967:3: warning: Value stored to 'r_index' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   r_index =3D 0;
                   ^         ~
   block/partitions/ldm.c:967:3: note: Value stored to 'r_index' is never r=
ead
                   r_index =3D 0;
                   ^         ~
   Suppressed 2 warnings (2 in non-user code).
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
   4 warnings generated.
>> drivers/perf/riscv_pmu_sbi.c:627:8: warning: Branch condition evaluates =
to a garbage value [clang-analyzer-core.uninitialized.Branch]
                           if (ret) {
                               ^~~
   drivers/perf/riscv_pmu_sbi.c:583:23: note: 'ret' declared without an ini=
tial value
           int i =3D 0, num_irqs, ret;
                                ^~~
   drivers/perf/riscv_pmu_sbi.c:590:6: note: Assuming 'num_irqs' is > 0
           if (num_irqs <=3D 0) {
               ^~~~~~~~~~~~~
   drivers/perf/riscv_pmu_sbi.c:590:2: note: Taking false branch
           if (num_irqs <=3D 0) {
           ^
   drivers/perf/riscv_pmu_sbi.c:595:14: note: 'i' is < 'num_irqs'
           for (i =3D 0; i < num_irqs; i++) {
                       ^
   drivers/perf/riscv_pmu_sbi.c:595:2: note: Loop condition is true.  Enter=
ing loop body
           for (i =3D 0; i < num_irqs; i++) {
           ^
   drivers/perf/riscv_pmu_sbi.c:600:7: note: Assuming the condition is false
                   if (of_irq_parse_one(node, i, &parent)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/riscv_pmu_sbi.c:600:3: note: Taking false branch
                   if (of_irq_parse_one(node, i, &parent)) {
                   ^
   drivers/perf/riscv_pmu_sbi.c:605:7: note: Assuming the condition is false
                   if (parent.args[0] !=3D RV_IRQ_PMU) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/riscv_pmu_sbi.c:605:3: note: Taking false branch
                   if (parent.args[0] !=3D RV_IRQ_PMU) {
                   ^
   drivers/perf/riscv_pmu_sbi.c:611:7: note: Assuming 'hartid' is >=3D 0
                   if (hartid < 0) {
                       ^~~~~~~~~~
   drivers/perf/riscv_pmu_sbi.c:611:3: note: Taking false branch
                   if (hartid < 0) {
                   ^
   drivers/perf/riscv_pmu_sbi.c:617:7: note: 'cpu' is >=3D 0
                   if (cpu < 0) {
                       ^~~
   drivers/perf/riscv_pmu_sbi.c:617:3: note: Taking false branch
                   if (cpu < 0) {
                   ^
   drivers/perf/riscv_pmu_sbi.c:621:8: note: 'pmu_irq' is 0
                   if (!pmu_irq && irq_find_host(parent.np)) {
                        ^~~~~~~
   drivers/perf/riscv_pmu_sbi.c:621:7: note: Left side of '&&' is true
                   if (!pmu_irq && irq_find_host(parent.np)) {
                       ^
   drivers/perf/riscv_pmu_sbi.c:621:19: note: Calling 'irq_find_host'
                   if (!pmu_irq && irq_find_host(parent.np)) {
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqdomain.h:325:6: note: Assuming 'd' is non-null, which p=
articipates in a condition later
           if (!d)
               ^~
   include/linux/irqdomain.h:325:2: note: Taking false branch
           if (!d)
           ^
   include/linux/irqdomain.h:328:2: note: Returning pointer (loaded from 'd=
'), which participates in a condition later
           return d;
           ^~~~~~~~
   drivers/perf/riscv_pmu_sbi.c:621:19: note: Returning from 'irq_find_host'
                   if (!pmu_irq && irq_find_host(parent.np)) {
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/riscv_pmu_sbi.c:621:3: note: Taking true branch
                   if (!pmu_irq && irq_find_host(parent.np)) {
                   ^
   drivers/perf/riscv_pmu_sbi.c:623:4: note: Left side of '&&' is true
                           pr_err("%s: found irq %lu\n", __func__, pmu_irq);
                           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   drivers/perf/riscv_pmu_sbi.c:623:4: note: Taking true branch
                           pr_err("%s: found irq %lu\n", __func__, pmu_irq);
                           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   drivers/perf/riscv_pmu_sbi.c:623:4: note: '?' condition is true
                           pr_err("%s: found irq %lu\n", __func__, pmu_irq);
                           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)

vim +627 drivers/perf/riscv_pmu_sbi.c

5e8bc35a23314c Atish Patra 2021-10-25  580  =

e4dfe5f987b44e Atish Patra 2021-10-25  581  static int pmu_sbi_setup_irqs(s=
truct riscv_pmu *pmu, struct platform_device *pdev)
e4dfe5f987b44e Atish Patra 2021-10-25  582  {
e4dfe5f987b44e Atish Patra 2021-10-25  583  	int i =3D 0, num_irqs, ret;
e4dfe5f987b44e Atish Patra 2021-10-25  584  	struct cpu_hw_events __percpu =
*hw_events =3D pmu->hw_events;
e4dfe5f987b44e Atish Patra 2021-10-25  585  	struct device *dev =3D &pdev->=
dev;
e4dfe5f987b44e Atish Patra 2021-10-25  586  	struct device_node *node =3D d=
ev->of_node;
e4dfe5f987b44e Atish Patra 2021-10-25  587  =

e4dfe5f987b44e Atish Patra 2021-10-25  588  	num_irqs =3D of_irq_count(node=
);
e4dfe5f987b44e Atish Patra 2021-10-25  589  =

e4dfe5f987b44e Atish Patra 2021-10-25  590  	if (num_irqs <=3D 0) {
e4dfe5f987b44e Atish Patra 2021-10-25  591  		dev_warn(dev, "no irqs for PM=
U, sampling events not supported\n");
e4dfe5f987b44e Atish Patra 2021-10-25  592  		return -EPERM;
e4dfe5f987b44e Atish Patra 2021-10-25  593  	}
e4dfe5f987b44e Atish Patra 2021-10-25  594  =

e4dfe5f987b44e Atish Patra 2021-10-25  595  	for (i =3D 0; i < num_irqs; i+=
+) {
e4dfe5f987b44e Atish Patra 2021-10-25  596  		struct of_phandle_args parent;
e4dfe5f987b44e Atish Patra 2021-10-25  597  		irq_hw_number_t pmu_irq =3D 0;
e4dfe5f987b44e Atish Patra 2021-10-25  598  		int cpu, hartid;
e4dfe5f987b44e Atish Patra 2021-10-25  599  =

e4dfe5f987b44e Atish Patra 2021-10-25  600  		if (of_irq_parse_one(node, i,=
 &parent)) {
e4dfe5f987b44e Atish Patra 2021-10-25  601  			pr_err("%pOFP: failed to par=
se parent for irq %d.\n", node, i);
e4dfe5f987b44e Atish Patra 2021-10-25  602  			continue;
e4dfe5f987b44e Atish Patra 2021-10-25  603  		}
e4dfe5f987b44e Atish Patra 2021-10-25  604  =

e4dfe5f987b44e Atish Patra 2021-10-25  605  		if (parent.args[0] !=3D RV_IR=
Q_PMU) {
e4dfe5f987b44e Atish Patra 2021-10-25  606  			pr_err("%pOFP: invalid irq %=
d for hwirq %d.\n", node, i, parent.args[0]);
e4dfe5f987b44e Atish Patra 2021-10-25  607  			continue;
e4dfe5f987b44e Atish Patra 2021-10-25  608  		}
e4dfe5f987b44e Atish Patra 2021-10-25  609  =

e4dfe5f987b44e Atish Patra 2021-10-25  610  		hartid =3D riscv_of_parent_ha=
rtid(parent.np);
e4dfe5f987b44e Atish Patra 2021-10-25  611  		if (hartid < 0) {
e4dfe5f987b44e Atish Patra 2021-10-25  612  			pr_warn("failed to parse har=
t ID for irq %d.\n", i);
e4dfe5f987b44e Atish Patra 2021-10-25  613  			continue;
e4dfe5f987b44e Atish Patra 2021-10-25  614  		}
e4dfe5f987b44e Atish Patra 2021-10-25  615  =

e4dfe5f987b44e Atish Patra 2021-10-25  616  		cpu =3D riscv_hartid_to_cpuid=
(hartid);
e4dfe5f987b44e Atish Patra 2021-10-25  617  		if (cpu < 0) {
e4dfe5f987b44e Atish Patra 2021-10-25  618  			pr_warn("Invalid cpuid for i=
rq %d\n", i);
e4dfe5f987b44e Atish Patra 2021-10-25  619  			continue;
e4dfe5f987b44e Atish Patra 2021-10-25  620  		}
e4dfe5f987b44e Atish Patra 2021-10-25  621  		if (!pmu_irq && irq_find_host=
(parent.np)) {
e4dfe5f987b44e Atish Patra 2021-10-25  622  			pmu_irq =3D irq_of_parse_and=
_map(node, i);
e4dfe5f987b44e Atish Patra 2021-10-25  623  			pr_err("%s: found irq %lu\n"=
, __func__, pmu_irq);
e4dfe5f987b44e Atish Patra 2021-10-25  624  			if (pmu_irq)
e4dfe5f987b44e Atish Patra 2021-10-25  625  				ret =3D request_percpu_irq(=
pmu_irq, pmu_sbi_ovf_handler,
e4dfe5f987b44e Atish Patra 2021-10-25  626  							 "riscv-pmu", hw_events);
e4dfe5f987b44e Atish Patra 2021-10-25 @627  			if (ret) {
e4dfe5f987b44e Atish Patra 2021-10-25  628  				pr_err("registering percpu =
irq failed [%d]\n", ret);
e4dfe5f987b44e Atish Patra 2021-10-25  629  				return ret;
e4dfe5f987b44e Atish Patra 2021-10-25  630  			}
e4dfe5f987b44e Atish Patra 2021-10-25  631  			if (per_cpu(hw_events->irq, =
cpu)) {
e4dfe5f987b44e Atish Patra 2021-10-25  632  				pr_warn("PMU irq already se=
t!!");
e4dfe5f987b44e Atish Patra 2021-10-25  633  				return -EINVAL;
e4dfe5f987b44e Atish Patra 2021-10-25  634  			}
e4dfe5f987b44e Atish Patra 2021-10-25  635  			per_cpu(hw_events->irq, cpu)=
 =3D pmu_irq;
e4dfe5f987b44e Atish Patra 2021-10-25  636  			per_cpu(hw_events->sscof_ext=
_present, cpu) =3D true;
e4dfe5f987b44e Atish Patra 2021-10-25  637  		}
e4dfe5f987b44e Atish Patra 2021-10-25  638  	}
e4dfe5f987b44e Atish Patra 2021-10-25  639  =

e4dfe5f987b44e Atish Patra 2021-10-25  640  	return 0;
e4dfe5f987b44e Atish Patra 2021-10-25  641  }
e4dfe5f987b44e Atish Patra 2021-10-25  642  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5377415432766979690==--

