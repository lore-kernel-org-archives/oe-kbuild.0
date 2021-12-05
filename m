Content-Type: multipart/mixed; boundary="===============0932138719882895134=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:129:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 05 Dec 2021 23:46:57 +0800
Message-ID: <202112052344.ekxjMEt6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0932138719882895134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Miguel Ojeda <ojeda@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79a72162048e42a677bc7336a9f5d86fc3ff9558
commit: c80d92fbb67b2c80b8eeb8759ee79d676eb33520 compiler_types.h: Remove _=
_compiletime_object_size()
date:   2 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 2 months ago
config: riscv-randconfig-c006-20211202 (https://download.01.org/0day-ci/arc=
hive/20211205/202112052344.ekxjMEt6-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc80d92fbb67b2c80b8eeb8759ee79d676eb33520
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c80d92fbb67b2c80b8eeb8759ee79d676eb33520
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/iio/adc/vf610_adc.c:868:2: note: Taking false branch
           if (ret) {
           ^
   drivers/iio/adc/vf610_adc.c:874:2: note: Calling 'vf610_adc_cfg_init'
           vf610_adc_cfg_init(info);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/vf610_adc.c:246:2: note: Calling 'vf610_adc_calculate_ra=
tes'
           vf610_adc_calculate_rates(info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/vf610_adc.c:189:6: note: Assuming 'adck_rate' is not equ=
al to 0
           if (adck_rate) {
               ^~~~~~~~~
   drivers/iio/adc/vf610_adc.c:189:2: note: Taking true branch
           if (adck_rate) {
           ^
   drivers/iio/adc/vf610_adc.c:192:31: note: Calling 'fls'
                   adc_feature->clk_div =3D 1 << fls(divisor + 1);
                                               ^~~~~~~~~~~~~~~~
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
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   drivers/iio/adc/vf610_adc.c:192:31: note: Returning from 'fls'
                   adc_feature->clk_div =3D 1 << fls(divisor + 1);
                                               ^~~~~~~~~~~~~~~~
   drivers/iio/adc/vf610_adc.c:192:28: note: The result of the left shift i=
s undefined due to shifting by '32', which is greater or equal to the width=
 of type 'int'
                   adc_feature->clk_div =3D 1 << fls(divisor + 1);
                                            ^  ~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/staging/greybus/uart.c:273:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D kfifo_out(&gb_tty->write_fifo, &request->data[0],
                   ^
   drivers/staging/greybus/uart.c:273:3: note: Value stored to 'ret' is nev=
er read
   drivers/staging/greybus/uart.c:571:3: warning: Value stored to 'retval' =
is never read [clang-analyzer-deadcode.DeadStores]
                   retval =3D send_control(gb_tty, gb_tty->ctrlout);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/uart.c:571:3: note: Value stored to 'retval' is =
never read
                   retval =3D send_control(gb_tty, gb_tty->ctrlout);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/uart.c:590:3: warning: Value stored to 'retval' =
is never read [clang-analyzer-deadcode.DeadStores]
                   retval =3D send_control(gb_tty, gb_tty->ctrlout);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/uart.c:590:3: note: Value stored to 'retval' is =
never read
                   retval =3D send_control(gb_tty, gb_tty->ctrlout);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:129:7: war=
ning: Branch condition evaluates to a garbage value [clang-analyzer-core.un=
initialized.Branch]
                   if (!elements[i].data && elements[i].size !=3D 0)
                       ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:601:18: no=
te: Assuming 'vchiq_arm_log_level' is < 7
           vchiq_log_trace(vchiq_arm_log_level,
                           ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h:60:11: no=
te: expanded from macro 'vchiq_log_trace'
           do { if (cat >=3D VCHIQ_LOG_TRACE) \
                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:601:2: not=
e: Taking false branch
           vchiq_log_trace(vchiq_arm_log_level,
           ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h:60:7: not=
e: expanded from macro 'vchiq_log_trace'
           do { if (cat >=3D VCHIQ_LOG_TRACE) \
                ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:601:2: not=
e: Loop condition is false.  Exiting loop
           vchiq_log_trace(vchiq_arm_log_level,
           ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h:60:2: not=
e: expanded from macro 'vchiq_log_trace'
           do { if (cat >=3D VCHIQ_LOG_TRACE) \
           ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:608:2: not=
e: Control jumps to 'case 1074578436:'  at line 738
           switch (cmd) {
           ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:741:7: not=
e: Assuming the condition is false
                   if (copy_from_user(&args, (const void __user *)arg,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:741:3: not=
e: Taking false branch
                   if (copy_from_user(&args, (const void __user *)arg,
                   ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:749:7: not=
e: Assuming 'service' is non-null
                   if (service && (args.count <=3D MAX_ELEMENTS)) {
                       ^~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:749:7: not=
e: Left side of '&&' is true
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:749:19: no=
te: Assuming field 'count' is <=3D MAX_ELEMENTS
                   if (service && (args.count <=3D MAX_ELEMENTS)) {
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:749:3: not=
e: Taking true branch
                   if (service && (args.count <=3D MAX_ELEMENTS)) {
                   ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:753:8: not=
e: Calling 'copy_from_user'
                           if (copy_from_user(elements, args.elements,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->d=
ata', which participates in a condition later
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->d=
ata'
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:753:8: not=
e: Returning from 'copy_from_user'
                           if (copy_from_user(elements, args.elements,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:753:8: not=
e: Assuming the condition is true
                           if (copy_from_user(elements, args.elements,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:753:4: not=
e: Taking true branch
                           if (copy_from_user(elements, args.elements,
                           ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:755:11: no=
te: Calling 'vchiq_ioc_queue_message'
                                   ret =3D vchiq_ioc_queue_message(args.han=
dle, elements,
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:128:14: no=
te: Assuming 'i' is < 'count'
           for (i =3D 0; i < count; i++) {
                       ^~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:128:2: not=
e: Loop condition is true.  Entering loop body
           for (i =3D 0; i < count; i++) {
           ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:129:7: not=
e: Branch condition evaluates to a garbage value
                   if (!elements[i].data && elements[i].size !=3D 0)
                       ^~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/mmc/host/sdhci.c:896:26: warning: Access to field 'data' results=
 in a dereference of a null pointer (loaded from variable 'cmd') [clang-ana=
lyzer-core.NullDereference]
           struct mmc_data *data =3D cmd->data;
                                   ^
   drivers/mmc/host/sdhci.c:3804:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&host->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:254:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/mmc/host/sdhci.c:3804:2: note: Loop condition is false.  Exiting=
 loop
           spin_lock_irqsave(&host->lock, flags);
           ^
   include/linux/spinlock.h:391:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/mmc/host/sdhci.c:3813:6: note: Assuming field 'v4_mode' is false
           if (host->v4_mode && (host->caps1 & SDHCI_CAN_DO_ADMA3))
               ^~~~~~~~~~~~~
   drivers/mmc/host/sdhci.c:3813:20: note: Left side of '&&' is false
           if (host->v4_mode && (host->caps1 & SDHCI_CAN_DO_ADMA3))
                             ^

vim +129 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c

f05916281fd75d Ojaswin Mujoo 2021-07-21  114  =

f05916281fd75d Ojaswin Mujoo 2021-07-21  115  static int
f05916281fd75d Ojaswin Mujoo 2021-07-21  116  vchiq_ioc_queue_message(unsig=
ned int handle, struct vchiq_element *elements,
f05916281fd75d Ojaswin Mujoo 2021-07-21  117  			unsigned long count)
f05916281fd75d Ojaswin Mujoo 2021-07-21  118  {
f05916281fd75d Ojaswin Mujoo 2021-07-21  119  	struct vchiq_io_copy_callbac=
k_context context;
f05916281fd75d Ojaswin Mujoo 2021-07-21  120  	enum vchiq_status status =3D=
 VCHIQ_SUCCESS;
f05916281fd75d Ojaswin Mujoo 2021-07-21  121  	unsigned long i;
f05916281fd75d Ojaswin Mujoo 2021-07-21  122  	size_t total_size =3D 0;
f05916281fd75d Ojaswin Mujoo 2021-07-21  123  =

f05916281fd75d Ojaswin Mujoo 2021-07-21  124  	context.element =3D elements;
f05916281fd75d Ojaswin Mujoo 2021-07-21  125  	context.element_offset =3D 0;
f05916281fd75d Ojaswin Mujoo 2021-07-21  126  	context.elements_to_go =3D c=
ount;
f05916281fd75d Ojaswin Mujoo 2021-07-21  127  =

f05916281fd75d Ojaswin Mujoo 2021-07-21  128  	for (i =3D 0; i < count; i++=
) {
f05916281fd75d Ojaswin Mujoo 2021-07-21 @129  		if (!elements[i].data && el=
ements[i].size !=3D 0)
f05916281fd75d Ojaswin Mujoo 2021-07-21  130  			return -EFAULT;
f05916281fd75d Ojaswin Mujoo 2021-07-21  131  =

f05916281fd75d Ojaswin Mujoo 2021-07-21  132  		total_size +=3D elements[i]=
.size;
f05916281fd75d Ojaswin Mujoo 2021-07-21  133  	}
f05916281fd75d Ojaswin Mujoo 2021-07-21  134  =

f05916281fd75d Ojaswin Mujoo 2021-07-21  135  	status =3D vchiq_queue_messa=
ge(handle, vchiq_ioc_copy_element_data,
f05916281fd75d Ojaswin Mujoo 2021-07-21  136  				     &context, total_size=
);
f05916281fd75d Ojaswin Mujoo 2021-07-21  137  =

f05916281fd75d Ojaswin Mujoo 2021-07-21  138  	if (status =3D=3D VCHIQ_ERRO=
R)
f05916281fd75d Ojaswin Mujoo 2021-07-21  139  		return -EIO;
f05916281fd75d Ojaswin Mujoo 2021-07-21  140  	else if (status =3D=3D VCHIQ=
_RETRY)
f05916281fd75d Ojaswin Mujoo 2021-07-21  141  		return -EINTR;
f05916281fd75d Ojaswin Mujoo 2021-07-21  142  	return 0;
f05916281fd75d Ojaswin Mujoo 2021-07-21  143  }
f05916281fd75d Ojaswin Mujoo 2021-07-21  144  =


:::::: The code@line 129 was first introduced by commit
:::::: f05916281fd75db2fe32294e26c04d666c762370 staging: vchiq: Move vchiq =
char driver to its own file

:::::: TO: Ojaswin Mujoo <ojaswin98@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0932138719882895134==--

