Content-Type: multipart/mixed; boundary="===============6272516465834756041=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/intel/pinctrl-baytrail.c:1483:2: warning: Value stored to 'direct_irq' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 03 Apr 2022 10:26:10 +0800
Message-ID: <202204031048.X4kpy9wQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6272516465834756041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: 689e008877402564ce8a7884f21c9d2ed3ecb2dc pinctrl: baytrail: Clear d=
irect_irq_en flag on broken configs
date:   10 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 weeks ago
config: x86_64-randconfig-c007-20220328 (https://download.01.org/0day-ci/ar=
chive/20220403/202204031048.X4kpy9wQ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D689e008877402564ce8a7884f21c9d2ed3ecb2dc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 689e008877402564ce8a7884f21c9d2ed3ecb2dc
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/list.h:37:2: note: Loop condition is false.  Exiting loop
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/list.h:37:2: note: Use of memory after it is freed
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   fs/btrfs/block-group.c:3895:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(&info->caching_block_groups)) {
           ^
   fs/btrfs/block-group.c:3899:3: note: Calling 'btrfs_put_caching_control'
                   btrfs_put_caching_control(caching_ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-group.c:382:2: note: Taking true branch
           if (refcount_dec_and_test(&ctl->count))
           ^
   fs/btrfs/block-group.c:383:3: note: Memory is released
                   kfree(ctl);
                   ^~~~~~~~~~
   fs/btrfs/block-group.c:3899:3: note: Returning; memory was released via =
1st parameter
                   btrfs_put_caching_control(caching_ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-group.c:3895:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(&info->caching_block_groups)) {
           ^
   fs/btrfs/block-group.c:3898:3: note: Calling 'list_del'
                   list_del(&caching_ctl->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   fs/btrfs/block-group.c:3895:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(&info->caching_block_groups)) {
           ^
   fs/btrfs/block-group.c:3899:3: note: Calling 'btrfs_put_caching_control'
                   btrfs_put_caching_control(caching_ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-group.c:382:2: note: Taking true branch
           if (refcount_dec_and_test(&ctl->count))
           ^
   fs/btrfs/block-group.c:383:3: note: Memory is released
                   kfree(ctl);
                   ^~~~~~~~~~
   fs/btrfs/block-group.c:3899:3: note: Returning; memory was released via =
1st parameter
                   btrfs_put_caching_control(caching_ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-group.c:3895:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(&info->caching_block_groups)) {
           ^
   fs/btrfs/block-group.c:3898:3: note: Calling 'list_del'
                   list_del(&caching_ctl->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/pinctrl/intel/pinctrl-baytrail.c:1483:2: warning: Value stored t=
o 'direct_irq' is never read [clang-analyzer-deadcode.DeadStores]
           direct_irq =3D match - direct_irq_mux;
           ^            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-baytrail.c:1483:2: note: Value stored to '=
direct_irq' is never read
           direct_irq =3D match - direct_irq_mux;
           ^            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/intel/pinctrl-baytrail.c:1485:2: warning: Value stored t=
o 'ioapic_direct_irq_base' is never read [clang-analyzer-deadcode.DeadStore=
s]
           ioapic_direct_irq_base =3D (vg->communities->npins =3D=3D BYT_NG=
PIO_SCORE) ? 51 : 67;
           ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-baytrail.c:1485:2: note: Value stored to '=
ioapic_direct_irq_base' is never read
           ioapic_direct_irq_base =3D (vg->communities->npins =3D=3D BYT_NG=
PIO_SCORE) ? 51 : 67;
           ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/pinctrl/intel/pinctrl-cherryview.c:1063:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D pctrl->dev;
                          ^~~   ~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-cherryview.c:1063:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D pctrl->dev;
                          ^~~   ~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-cherryview.c:1307:18: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
                   struct device *dev =3D pctrl->dev;
                                  ^~~   ~~~~~~~~~~
   drivers/pinctrl/intel/pinctrl-cherryview.c:1307:18: note: Value stored t=
o 'dev' during its initialization is never read
                   struct device *dev =3D pctrl->dev;
                                  ^~~   ~~~~~~~~~~
   2 warnings generated.
   arch/x86/kernel/kvm.c:339:7: warning: Value stored to 'pa' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
                   u64 pa =3D slow_virt_to_phys(this_cpu_ptr(&apf_reason));
                       ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/kvm.c:339:7: note: Value stored to 'pa' during its initi=
alization is never read
                   u64 pa =3D slow_virt_to_phys(this_cpu_ptr(&apf_reason));
                       ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/regulator/ltc3676.c:76:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ltc3676->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:76:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D ltc3676->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:77:6: warning: Value stored to 'dcdc' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int dcdc =3D rdev_get_id(rdev);
               ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:77:6: note: Value stored to 'dcdc' during it=
s initialization is never read
           int dcdc =3D rdev_get_id(rdev);
               ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:94:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ltc3676->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:94:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D ltc3676->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:96:6: warning: Value stored to 'dcdc' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int dcdc =3D rdev_get_id(rdev);
               ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:96:6: note: Value stored to 'dcdc' during it=
s initialization is never read
           int dcdc =3D rdev_get_id(rdev);
               ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:121:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ltc3676->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:121:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D ltc3676->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:122:11: warning: Value stored to 'dcdc' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int ret, dcdc =3D rdev_get_id(rdev);
                    ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/ltc3676.c:122:11: note: Value stored to 'dcdc' during =
its initialization is never read
           int ret, dcdc =3D rdev_get_id(rdev);
                    ^~~~   ~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/mfd/twl-core.c:1205:8: warning: The left expression of the compo=
und assignment is an uninitialized value. The computed value will also be g=
arbage [clang-analyzer-core.uninitialized.Assign]
                   temp &=3D ~(SR_I2C_SDA_CTRL_PU | SR_I2C_SCL_CTRL_PU | \
                   ~~~~ ^
   drivers/mfd/twl-core.c:1078:6: note: Assuming 'node' is non-null
           if (!node && !pdata) {
               ^~~~~
   drivers/mfd/twl-core.c:1078:12: note: Left side of '&&' is false
           if (!node && !pdata) {
                     ^
   drivers/mfd/twl-core.c:1083:6: note: Assuming 'twl_priv' is null
           if (twl_priv) {
               ^~~~~~~~
   drivers/mfd/twl-core.c:1083:2: note: Taking false branch
           if (twl_priv) {
           ^
   drivers/mfd/twl-core.c:1090:6: note: Assuming 'pdev' is non-null
           if (!pdev) {
               ^~~~~
   drivers/mfd/twl-core.c:1090:2: note: Taking false branch
           if (!pdev) {
           ^
   drivers/mfd/twl-core.c:1096:6: note: Assuming 'status' is 0
           if (status) {
               ^~~~~~
   drivers/mfd/twl-core.c:1096:2: note: Taking false branch
           if (status) {
           ^
   drivers/mfd/twl-core.c:1101:2: note: Taking false branch
           if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C) =3D=
=3D 0) {

vim +/direct_irq +1483 drivers/pinctrl/intel/pinctrl-baytrail.c

71e6ca61e82667 Cristina Ciocan 2016-04-01  1468  =

689e0088774025 Hans de Goede   2022-01-12  1469  static bool byt_direct_irq=
_sanity_check(struct intel_pinctrl *vg, int pin, u32 conf0)
689e0088774025 Hans de Goede   2022-01-12  1470  {
689e0088774025 Hans de Goede   2022-01-12  1471  	int direct_irq, ioapic_di=
rect_irq_base;
689e0088774025 Hans de Goede   2022-01-12  1472  	u8 *match, direct_irq_mux=
[16];
689e0088774025 Hans de Goede   2022-01-12  1473  	u32 trig;
689e0088774025 Hans de Goede   2022-01-12  1474  =

689e0088774025 Hans de Goede   2022-01-12  1475  	memcpy_fromio(direct_irq_=
mux, vg->communities->pad_regs + BYT_DIRECT_IRQ_REG,
689e0088774025 Hans de Goede   2022-01-12  1476  		      sizeof(direct_irq_=
mux));
689e0088774025 Hans de Goede   2022-01-12  1477  	match =3D memchr(direct_i=
rq_mux, pin, sizeof(direct_irq_mux));
689e0088774025 Hans de Goede   2022-01-12  1478  	if (!match) {
689e0088774025 Hans de Goede   2022-01-12  1479  		dev_warn(vg->dev, FW_BUG=
 "pin %i: direct_irq_en set but no IRQ assigned, clearing\n", pin);
689e0088774025 Hans de Goede   2022-01-12  1480  		return false;
689e0088774025 Hans de Goede   2022-01-12  1481  	}
689e0088774025 Hans de Goede   2022-01-12  1482  =

689e0088774025 Hans de Goede   2022-01-12 @1483  	direct_irq =3D match - di=
rect_irq_mux;
689e0088774025 Hans de Goede   2022-01-12  1484  	/* Base IO-APIC pin numbe=
rs come from atom-e3800-family-datasheet.pdf */
689e0088774025 Hans de Goede   2022-01-12 @1485  	ioapic_direct_irq_base =
=3D (vg->communities->npins =3D=3D BYT_NGPIO_SCORE) ? 51 : 67;
689e0088774025 Hans de Goede   2022-01-12  1486  	dev_dbg(vg->dev, "Pin %i:=
 uses direct IRQ %d (IO-APIC %d)\n", pin,
689e0088774025 Hans de Goede   2022-01-12  1487  		direct_irq, direct_irq +=
 ioapic_direct_irq_base);
689e0088774025 Hans de Goede   2022-01-12  1488  =

689e0088774025 Hans de Goede   2022-01-12  1489  	/*
689e0088774025 Hans de Goede   2022-01-12  1490  	 * Testing has shown that=
 the way direct IRQs work is that the combination of the
689e0088774025 Hans de Goede   2022-01-12  1491  	 * direct-irq-en flag and=
 the direct IRQ mux connect the output of the GPIO's IRQ
689e0088774025 Hans de Goede   2022-01-12  1492  	 * trigger block, which n=
ormally sets the status flag in the IRQ status reg at
689e0088774025 Hans de Goede   2022-01-12  1493  	 * 0x800, to one of the I=
O-APIC pins according to the mux registers.
689e0088774025 Hans de Goede   2022-01-12  1494  	 *
689e0088774025 Hans de Goede   2022-01-12  1495  	 * This means that:
689e0088774025 Hans de Goede   2022-01-12  1496  	 * 1. The TRIG_MASK bits =
must be set to configure the GPIO's IRQ trigger block
689e0088774025 Hans de Goede   2022-01-12  1497  	 * 2. The TRIG_LVL bit *m=
ust* be set, so that the GPIO's input value is directly
689e0088774025 Hans de Goede   2022-01-12  1498  	 *    passed (1:1 or inve=
rted) to the IO-APIC pin, if TRIG_LVL is not set,
689e0088774025 Hans de Goede   2022-01-12  1499  	 *    selecting edge mode=
 operation then on the first edge the IO-APIC pin goes
689e0088774025 Hans de Goede   2022-01-12  1500  	 *    high, but since no =
write-to-clear write will be done to the IRQ status reg
689e0088774025 Hans de Goede   2022-01-12  1501  	 *    at 0x800, the detec=
ted edge condition will never get cleared.
689e0088774025 Hans de Goede   2022-01-12  1502  	 */
689e0088774025 Hans de Goede   2022-01-12  1503  	trig =3D conf0 & BYT_TRIG=
_MASK;
689e0088774025 Hans de Goede   2022-01-12  1504  	if (trig !=3D (BYT_TRIG_P=
OS | BYT_TRIG_LVL) &&
689e0088774025 Hans de Goede   2022-01-12  1505  	    trig !=3D (BYT_TRIG_N=
EG | BYT_TRIG_LVL)) {
689e0088774025 Hans de Goede   2022-01-12  1506  		dev_warn(vg->dev, FW_BUG=
 "pin %i: direct_irq_en set without trigger (conf0: %xh), clearing\n",
689e0088774025 Hans de Goede   2022-01-12  1507  			 pin, conf0);
689e0088774025 Hans de Goede   2022-01-12  1508  		return false;
689e0088774025 Hans de Goede   2022-01-12  1509  	}
689e0088774025 Hans de Goede   2022-01-12  1510  =

689e0088774025 Hans de Goede   2022-01-12  1511  	return true;
689e0088774025 Hans de Goede   2022-01-12  1512  }
689e0088774025 Hans de Goede   2022-01-12  1513  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6272516465834756041==--

