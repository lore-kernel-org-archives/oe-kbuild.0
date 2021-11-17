Content-Type: multipart/mixed; boundary="===============9187981808363335030=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hid/hid-nintendo.c:616:16: warning: Value stored to 'msecs' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 17 Nov 2021 09:14:37 +0800
Message-ID: <202111170931.dfCeaRsD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9187981808363335030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Daniel J. Ogorchock" <djogorchock@gmail.com>
CC: Jiri Kosina <jkosina@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ab774587903771821b59471cc723bba6d893942
commit: c4eae84feff3e68c2f385aa10faea4a96791e7ad HID: nintendo: add rumble =
support
date:   3 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20211104 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 847a68=
07332b13f43704327c2d30103ec0347c77)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc4eae84feff3e68c2f385aa10faea4a96791e7ad
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c4eae84feff3e68c2f385aa10faea4a96791e7ad
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                    ^
   kernel/torture.c:342:2: note: Assuming 'cpu' is >=3D 'nr_cpu_ids'
           for_each_online_cpu(cpu)
           ^
   include/linux/cpumask.h:789:36: note: expanded from macro 'for_each_onli=
ne_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:3: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   kernel/torture.c:342:2: note: Loop condition is false. Execution continu=
es on line 344
           for_each_online_cpu(cpu)
           ^
   include/linux/cpumask.h:789:36: note: expanded from macro 'for_each_onli=
ne_cpu'
   #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_online_mask)
                                      ^
   include/linux/cpumask.h:241:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D -1;                                \
           ^
   kernel/torture.c:344:2: note: Taking true branch
           WARN_ON(maxcpu < 0);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   kernel/torture.c:344:2: note: Loop condition is false.  Exiting loop
           WARN_ON(maxcpu < 0);
           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/riscv/include/asm/bug.h:79:29: note: expanded from macro '__WARN_FL=
AGS'
   #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
                               ^
   arch/riscv/include/asm/bug.h:53:32: note: expanded from macro '__BUG_FLA=
GS'
   #define __BUG_FLAGS(flags)                                      \
                                                                   ^
   kernel/torture.c:346:6: note: 'maxcpu' is not equal to 0
           if (maxcpu =3D=3D 0) {
               ^~~~~~
   kernel/torture.c:346:2: note: Taking false branch
           if (maxcpu =3D=3D 0) {
           ^
   kernel/torture.c:351:6: note: Assuming 'onoff_holdoff' is <=3D 0
           if (onoff_holdoff > 0) {
               ^~~~~~~~~~~~~~~~~
   kernel/torture.c:351:2: note: Taking false branch
           if (onoff_holdoff > 0) {
           ^
   kernel/torture.c:356:10: note: Calling 'torture_must_stop'
           while (!torture_must_stop()) {
                   ^~~~~~~~~~~~~~~~~~~
   kernel/torture.c:889:9: note: Left side of '||' is false
           return torture_must_stop_irq() || kthread_should_stop();
                  ^
   kernel/torture.c:889:36: note: Value assigned to 'disable_onoff_at_boot'=
, which participates in a condition later
           return torture_must_stop_irq() || kthread_should_stop();
                                             ^~~~~~~~~~~~~~~~~~~~~
   kernel/torture.c:889:2: note: Returning value, which participates in a c=
ondition later
           return torture_must_stop_irq() || kthread_should_stop();
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/torture.c:356:10: note: Returning from 'torture_must_stop'
           while (!torture_must_stop()) {
                   ^~~~~~~~~~~~~~~~~~~
   kernel/torture.c:356:9: note: Assuming the condition is true
           while (!torture_must_stop()) {
                  ^~~~~~~~~~~~~~~~~~~~
   kernel/torture.c:356:2: note: Loop condition is true.  Entering loop body
           while (!torture_must_stop()) {
           ^
   kernel/torture.c:357:7: note: Assuming 'disable_onoff_at_boot' is false
                   if (disable_onoff_at_boot && !rcu_inkernel_boot_has_ende=
d()) {
                       ^~~~~~~~~~~~~~~~~~~~~
   kernel/torture.c:357:29: note: Left side of '&&' is false
                   if (disable_onoff_at_boot && !rcu_inkernel_boot_has_ende=
d()) {
                                             ^
   kernel/torture.c:361:38: note: Division by zero
                   cpu =3D (torture_random(&rand) >> 4) % (maxcpu + 1);
                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
>> drivers/hid/hid-nintendo.c:616:16: warning: Value stored to 'msecs' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long msecs =3D jiffies_to_msecs(jiffies);
                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-nintendo.c:616:16: note: Value stored to 'msecs' during =
its initialization is never read
           unsigned long msecs =3D jiffies_to_msecs(jiffies);
                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 45 warnings (7 in non-user code, 38 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   include/linux/hid.h:1007:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-petalynx.c:41:6: note: Assuming the condition is true
           if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_LOGIVENDOR) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-petalynx.c:41:2: note: Taking true branch
           if ((usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_LOGIVENDOR) {
           ^
   drivers/hid/hid-petalynx.c:42:3: note: Control jumps to 'case 90:'  at l=
ine 43
                   switch (usage->hid & HID_USAGE) {
                   ^
   drivers/hid/hid-petalynx.c:43:15: note: Calling 'hid_map_usage_clear'
                   case 0x05a: pl_map_key_clear(KEY_TEXT);         break;
                               ^
   drivers/hid/hid-petalynx.c:35:29: note: expanded from macro 'pl_map_key_=
clear'
   #define pl_map_key_clear(c)     hid_map_usage_clear(hi, usage, bit, max,=
 \
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/hid.h:1035:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:982:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:986:2: note: Control jumps to 'case 1:'  at line 995
           switch (type) {
           ^
   include/linux/hid.h:998:3: note:  Execution continues on line 1005
                   break;
                   ^
   include/linux/hid.h:1005:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1005:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1005:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1006:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:639:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1006:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:639:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1006:3: note: Left side of '&&' is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)

vim +/msecs +616 drivers/hid/hid-nintendo.c

2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  607  =

2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  608  static void joycon_pars=
e_report(struct joycon_ctlr *ctlr,
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  609  				struct joycon_input=
_report *rep)
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  610  {
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  611  	struct input_dev *dev =
=3D ctlr->input;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  612  	unsigned long flags;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  613  	u8 tmp;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  614  	u32 btns;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  615  	u32 id =3D ctlr->hdev-=
>product;
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11 @616  	unsigned long msecs =
=3D jiffies_to_msecs(jiffies);
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  617  =

c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  618  	spin_lock_irqsave(&ctl=
r->lock, flags);
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  619  	if (IS_ENABLED(CONFIG_=
NINTENDO_FF) && rep->vibrator_report &&
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  620  	    (msecs - ctlr->rum=
ble_msecs) >=3D JC_RUMBLE_PERIOD_MS)
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  621  		queue_work(ctlr->rumb=
le_queue, &ctlr->rumble_worker);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  622  =

08ebba5c270350 Daniel J. Ogorchock 2021-09-11  623  	/* Parse the battery s=
tatus */
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  624  	tmp =3D rep->bat_con;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  625  	ctlr->host_powered =3D=
 tmp & BIT(0);
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  626  	ctlr->battery_charging=
 =3D tmp & BIT(4);
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  627  	tmp =3D tmp >> 5;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  628  	switch (tmp) {
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  629  	case 0: /* empty */
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  630  		ctlr->battery_capacit=
y =3D POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  631  		break;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  632  	case 1: /* low */
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  633  		ctlr->battery_capacit=
y =3D POWER_SUPPLY_CAPACITY_LEVEL_LOW;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  634  		break;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  635  	case 2: /* medium */
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  636  		ctlr->battery_capacit=
y =3D POWER_SUPPLY_CAPACITY_LEVEL_NORMAL;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  637  		break;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  638  	case 3: /* high */
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  639  		ctlr->battery_capacit=
y =3D POWER_SUPPLY_CAPACITY_LEVEL_HIGH;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  640  		break;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  641  	case 4: /* full */
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  642  		ctlr->battery_capacit=
y =3D POWER_SUPPLY_CAPACITY_LEVEL_FULL;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  643  		break;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  644  	default:
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  645  		ctlr->battery_capacit=
y =3D POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  646  		hid_warn(ctlr->hdev, =
"Invalid battery status\n");
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  647  		break;
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  648  	}
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  649  	spin_unlock_irqrestore=
(&ctlr->lock, flags);
08ebba5c270350 Daniel J. Ogorchock 2021-09-11  650  =

08ebba5c270350 Daniel J. Ogorchock 2021-09-11  651  	/* Parse the buttons a=
nd sticks */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  652  	btns =3D hid_field_ext=
ract(ctlr->hdev, rep->button_status, 0, 24);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  653  =

2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  654  	if (id !=3D USB_DEVICE=
_ID_NINTENDO_JOYCONR) {
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  655  		u16 raw_x;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  656  		u16 raw_y;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  657  		s32 x;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  658  		s32 y;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  659  =

2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  660  		/* get raw stick valu=
es */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  661  		raw_x =3D hid_field_e=
xtract(ctlr->hdev, rep->left_stick, 0, 12);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  662  		raw_y =3D hid_field_e=
xtract(ctlr->hdev,
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  663  					  rep->left_stick =
+ 1, 4, 12);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  664  		/* map the stick valu=
es */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  665  		x =3D joycon_map_stic=
k_val(&ctlr->left_stick_cal_x, raw_x);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  666  		y =3D -joycon_map_sti=
ck_val(&ctlr->left_stick_cal_y, raw_y);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  667  		/* report sticks */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  668  		input_report_abs(dev,=
 ABS_X, x);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  669  		input_report_abs(dev,=
 ABS_Y, y);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  670  =

2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  671  		/* report buttons */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  672  		input_report_key(dev,=
 BTN_TL, btns & JC_BTN_L);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  673  		input_report_key(dev,=
 BTN_TL2, btns & JC_BTN_ZL);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  674  		input_report_key(dev,=
 BTN_SELECT, btns & JC_BTN_MINUS);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  675  		input_report_key(dev,=
 BTN_THUMBL, btns & JC_BTN_LSTICK);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  676  		input_report_key(dev,=
 BTN_Z, btns & JC_BTN_CAP);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  677  =

2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  678  		if (id !=3D USB_DEVIC=
E_ID_NINTENDO_PROCON) {
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  679  			/* Report the S butt=
ons as the non-existent triggers */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  680  			input_report_key(dev=
, BTN_TR, btns & JC_BTN_SL_L);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  681  			input_report_key(dev=
, BTN_TR2, btns & JC_BTN_SR_L);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  682  =

2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  683  			/* Report d-pad as d=
igital buttons for the joy-cons */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  684  			input_report_key(dev=
, BTN_DPAD_DOWN,
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  685  					 btns & JC_BTN_DOW=
N);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  686  			input_report_key(dev=
, BTN_DPAD_UP, btns & JC_BTN_UP);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  687  			input_report_key(dev=
, BTN_DPAD_RIGHT,
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  688  					 btns & JC_BTN_RIG=
HT);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  689  			input_report_key(dev=
, BTN_DPAD_LEFT,
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  690  					 btns & JC_BTN_LEF=
T);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  691  		} else {
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  692  			int hatx =3D 0;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  693  			int haty =3D 0;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  694  =

2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  695  			/* d-pad x */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  696  			if (btns & JC_BTN_LE=
FT)
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  697  				hatx =3D -1;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  698  			else if (btns & JC_B=
TN_RIGHT)
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  699  				hatx =3D 1;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  700  			input_report_abs(dev=
, ABS_HAT0X, hatx);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  701  =

2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  702  			/* d-pad y */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  703  			if (btns & JC_BTN_UP)
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  704  				haty =3D -1;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  705  			else if (btns & JC_B=
TN_DOWN)
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  706  				haty =3D 1;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  707  			input_report_abs(dev=
, ABS_HAT0Y, haty);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  708  		}
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  709  	}
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  710  	if (id !=3D USB_DEVICE=
_ID_NINTENDO_JOYCONL) {
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  711  		u16 raw_x;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  712  		u16 raw_y;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  713  		s32 x;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  714  		s32 y;
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  715  =

2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  716  		/* get raw stick valu=
es */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  717  		raw_x =3D hid_field_e=
xtract(ctlr->hdev, rep->right_stick, 0, 12);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  718  		raw_y =3D hid_field_e=
xtract(ctlr->hdev,
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  719  					  rep->right_stick=
 + 1, 4, 12);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  720  		/* map stick values */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  721  		x =3D joycon_map_stic=
k_val(&ctlr->right_stick_cal_x, raw_x);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  722  		y =3D -joycon_map_sti=
ck_val(&ctlr->right_stick_cal_y, raw_y);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  723  		/* report sticks */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  724  		input_report_abs(dev,=
 ABS_RX, x);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  725  		input_report_abs(dev,=
 ABS_RY, y);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  726  =

2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  727  		/* report buttons */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  728  		input_report_key(dev,=
 BTN_TR, btns & JC_BTN_R);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  729  		input_report_key(dev,=
 BTN_TR2, btns & JC_BTN_ZR);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  730  		if (id !=3D USB_DEVIC=
E_ID_NINTENDO_PROCON) {
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  731  			/* Report the S butt=
ons as the non-existent triggers */
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  732  			input_report_key(dev=
, BTN_TL, btns & JC_BTN_SL_R);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  733  			input_report_key(dev=
, BTN_TL2, btns & JC_BTN_SR_R);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  734  		}
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  735  		input_report_key(dev,=
 BTN_START, btns & JC_BTN_PLUS);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  736  		input_report_key(dev,=
 BTN_THUMBR, btns & JC_BTN_RSTICK);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  737  		input_report_key(dev,=
 BTN_MODE, btns & JC_BTN_HOME);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  738  		input_report_key(dev,=
 BTN_WEST, btns & JC_BTN_Y);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  739  		input_report_key(dev,=
 BTN_NORTH, btns & JC_BTN_X);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  740  		input_report_key(dev,=
 BTN_EAST, btns & JC_BTN_A);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  741  		input_report_key(dev,=
 BTN_SOUTH, btns & JC_BTN_B);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  742  	}
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  743  =

2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  744  	input_sync(dev);
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  745  }
2af16c1f846bd6 Daniel J. Ogorchock 2021-09-11  746  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9187981808363335030==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============9187981808363335030==--

