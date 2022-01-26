Content-Type: multipart/mixed; boundary="===============6738804505810421922=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/pinctrl-starfive.c:640:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 27 Jan 2022 05:56:14 +0800
Message-ID: <202201270546.QG2iciS2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6738804505810421922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Emil Renner Berthing <kernel@esmil.dk>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Huan Feng <huan.feng@starfivetech.com>
CC: Drew Fustini <drew@beagleboard.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: ec648f6b7686b716424e8e73eebb4c11ae199187 pinctrl: starfive: Add pin=
ctrl driver for StarFive SoCs
date:   6 weeks ago
:::::: branch date: 28 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-c006-20220126 (https://download.01.org/0day-ci/arc=
hive/20220127/202201270546.QG2iciS2-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7a=
a016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dec648f6b7686b716424e8e73eebb4c11ae199187
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ec648f6b7686b716424e8e73eebb4c11ae199187
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/percpu-defs.h:421:34: note: expanded from macro 'raw_cpu_w=
rite'
   #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_,=
 pcp, val)
                                           ^
   include/linux/percpu-defs.h:379:42: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                                                          ^
   kernel/softirq.c:540:2: note: Loop condition is false.  Exiting loop
           set_softirq_pending(0);
           ^
   include/linux/interrupt.h:494:33: note: expanded from macro 'set_softirq=
_pending'
   #define set_softirq_pending(x)  (__this_cpu_write(local_softirq_pending_=
ref, (x)))
                                    ^
   include/linux/percpu-defs.h:452:2: note: expanded from macro '__this_cpu=
_write'
           raw_cpu_write(pcp, val);                                        \
           ^
   include/linux/percpu-defs.h:421:34: note: expanded from macro 'raw_cpu_w=
rite'
   #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_,=
 pcp, val)
                                           ^
   include/linux/percpu-defs.h:373:50: note: expanded from macro '__pcpu_si=
ze_call'
   #define __pcpu_size_call(stem, variable, ...)                           \
                                                                           ^
   kernel/softirq.c:542:2: note: Loop condition is false.  Exiting loop
           local_irq_enable();
           ^
   include/linux/irqflags.h:235:28: note: expanded from macro 'local_irq_en=
able'
   #define local_irq_enable()      do { raw_local_irq_enable(); } while (0)
                                   ^
   kernel/softirq.c:546:2: note: Loop condition is true.  Entering loop body
           while ((softirq_bit =3D ffs(pending))) {
           ^
   kernel/softirq.c:552:3: note: The value 16 is assigned to 'vec_nr'
                   vec_nr =3D h - softirq_vec;
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/softirq.c:560:16: note: Assuming the condition is true
                   if (unlikely(prev_count !=3D preempt_count())) {
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/softirq.c:560:3: note: Taking true branch
                   if (unlikely(prev_count !=3D preempt_count())) {
                   ^
   kernel/softirq.c:561:4: note: Loop condition is false.  Exiting loop
                           pr_err("huh, entered softirq %u %s %p with preem=
pt_count %08x, exited with %08x?\n",
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
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   kernel/softirq.c:561:4: note: 3rd function call argument is an uninitial=
ized value
                           pr_err("huh, entered softirq %u %s %p with preem=
pt_count %08x, exited with %08x?\n",
                           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^                              ~~~~~~~~~~~
   include/linux/printk.h:446:44: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                              ^               ~~~~~~~~~~~
   include/linux/printk.h:418:3: note: expanded from macro 'printk_index_wr=
ap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                   ^               ~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
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
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/pinctrl/pinctrl-starfive.c:640:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D sfp->gc.parent;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-starfive.c:640:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D sfp->gc.parent;
                          ^~~   ~~~~~~~~~~~~~~
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/ntfs/compress.c:164:6: warning: Value stored to 'cb_sb_start' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u8 *cb_sb_start =3D cb;   /* Beginning of the current sb in the =
cb. */
               ^~~~~~~~~~~   ~~
   fs/ntfs/compress.c:164:6: note: Value stored to 'cb_sb_start' during its=
 initialization is never read
           u8 *cb_sb_start =3D cb;   /* Beginning of the current sb in the =
cb. */
               ^~~~~~~~~~~   ~~
   fs/ntfs/compress.c:810:4: warning: Value stored to 'cb_pos' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           cb_pos +=3D cb_max_ofs - cur_ofs;
                           ^         ~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/compress.c:810:4: note: Value stored to 'cb_pos' is never read
                           cb_pos +=3D cb_max_ofs - cur_ofs;
                           ^         ~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/ntfs/dir.c:1107:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D err =3D 0;
           ^    ~~~~~~~
   fs/ntfs/dir.c:1107:2: note: Value stored to 'rc' is never read
           rc =3D err =3D 0;
           ^    ~~~~~~~
   fs/ntfs/dir.c:1306:36: warning: Access to field 'magic' results in a der=
eference of a null pointer (loaded from variable 'ia') [clang-analyzer-core=
.NullDereference]
           if (unlikely(!ntfs_is_indx_record(ia->magic))) {
                                             ^
   fs/ntfs/layout.h:139:50: note: expanded from macro 'ntfs_is_indx_record'
   #define ntfs_is_indx_record(x)          ( ntfs_is_magic (x, INDX) )
                                                            ^
   fs/ntfs/layout.h:124:45: note: expanded from macro 'ntfs_is_magic'
   #define ntfs_is_magic(x, m)     __ntfs_is_magic(x, magic_##m)
                                                   ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ntfs/dir.c:1105:2: note: Taking false branch
           ntfs_debug("Entering for inode 0x%lx, fpos 0x%llx.",
           ^
   fs/ntfs/debug.h:39:2: note: expanded from macro 'ntfs_debug'
           if (0)                                                          \
           ^
   fs/ntfs/dir.c:1105:2: note: Loop condition is false.  Exiting loop
           ntfs_debug("Entering for inode 0x%lx, fpos 0x%llx.",
           ^
   fs/ntfs/debug.h:37:35: note: expanded from macro 'ntfs_debug'
   #define ntfs_debug(fmt, ...)                                            \
                                                                           ^
   fs/ntfs/dir.c:1110:6: note: Assuming the condition is false
           if (actor->pos >=3D i_size + vol->mft_record_size)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/dir.c:1110:2: note: Taking false branch
           if (actor->pos >=3D i_size + vol->mft_record_size)
           ^
   fs/ntfs/dir.c:1113:7: note: Calling 'dir_emit_dots'
           if (!dir_emit_dots(file, actor))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:3653:6: note: Assuming field 'pos' is not equal to 0
           if (ctx->pos =3D=3D 0) {
               ^~~~~~~~~~~~~
   include/linux/fs.h:3653:2: note: Taking false branch
           if (ctx->pos =3D=3D 0) {
           ^
   include/linux/fs.h:3658:6: note: Assuming field 'pos' is not equal to 1
           if (ctx->pos =3D=3D 1) {
               ^~~~~~~~~~~~~
   include/linux/fs.h:3658:2: note: Taking false branch
           if (ctx->pos =3D=3D 1) {
           ^
   include/linux/fs.h:3663:2: note: Returning the value 1, which participat=
es in a condition later
           return true;

vim +/dev +640 drivers/pinctrl/pinctrl-starfive.c

ec648f6b7686b71 Emil Renner Berthing 2021-07-06  635  =

ec648f6b7686b71 Emil Renner Berthing 2021-07-06  636  static int starfive_s=
et_mux(struct pinctrl_dev *pctldev,
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  637  			    unsigned int f=
sel, unsigned int gsel)
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  638  {
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  639  	struct starfive_pinc=
trl *sfp =3D pinctrl_dev_get_drvdata(pctldev);
ec648f6b7686b71 Emil Renner Berthing 2021-07-06 @640  	struct device *dev =
=3D sfp->gc.parent;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  641  	const struct group_d=
esc *group;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  642  	const u32 *pinmux;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  643  	unsigned int i;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  644  =

ec648f6b7686b71 Emil Renner Berthing 2021-07-06  645  	group =3D pinctrl_ge=
neric_get_group(pctldev, gsel);
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  646  	if (!group)
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  647  		return -EINVAL;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  648  =

ec648f6b7686b71 Emil Renner Berthing 2021-07-06  649  	pinmux =3D group->da=
ta;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  650  	for (i =3D 0; i < gr=
oup->num_pins; i++) {
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  651  		u32 v =3D pinmux[i];
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  652  		unsigned int gpio =
=3D starfive_pinmux_to_gpio(v);
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  653  		u32 dout =3D starfi=
ve_pinmux_to_dout(v);
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  654  		u32 doen =3D starfi=
ve_pinmux_to_doen(v);
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  655  		u32 din =3D starfiv=
e_pinmux_to_din(v);
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  656  		void __iomem *reg_d=
out;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  657  		void __iomem *reg_d=
oen;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  658  		void __iomem *reg_d=
in;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  659  		unsigned long flags;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  660  =

ec648f6b7686b71 Emil Renner Berthing 2021-07-06  661  		dev_dbg(dev, "GPIO%=
u: dout=3D0x%x doen=3D0x%x din=3D0x%x\n",
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  662  			gpio, dout, doen, =
din);
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  663  =

ec648f6b7686b71 Emil Renner Berthing 2021-07-06  664  		reg_dout =3D sfp->b=
ase + GPON_DOUT_CFG + 8 * gpio;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  665  		reg_doen =3D sfp->b=
ase + GPON_DOEN_CFG + 8 * gpio;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  666  		if (din !=3D GPI_NO=
NE)
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  667  			reg_din =3D sfp->b=
ase + GPI_CFG_OFFSET + 4 * din;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  668  		else
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  669  			reg_din =3D NULL;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  670  =

ec648f6b7686b71 Emil Renner Berthing 2021-07-06  671  		raw_spin_lock_irqsa=
ve(&sfp->lock, flags);
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  672  		writel_relaxed(dout=
, reg_dout);
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  673  		writel_relaxed(doen=
, reg_doen);
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  674  		if (reg_din)
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  675  			writel_relaxed(gpi=
o + 2, reg_din);
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  676  		raw_spin_unlock_irq=
restore(&sfp->lock, flags);
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  677  	}
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  678  =

ec648f6b7686b71 Emil Renner Berthing 2021-07-06  679  	return 0;
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  680  }
ec648f6b7686b71 Emil Renner Berthing 2021-07-06  681  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6738804505810421922==--

