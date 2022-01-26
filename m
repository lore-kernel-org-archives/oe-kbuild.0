Content-Type: multipart/mixed; boundary="===============8584930061745019802=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:129:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Thu, 27 Jan 2022 02:21:38 +0800
Message-ID: <202201270239.Y4uWKZBp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8584930061745019802==
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
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: c80d92fbb67b2c80b8eeb8759ee79d676eb33520 compiler_types.h: Remove _=
_compiletime_object_size()
date:   4 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-c006-20220125 (https://download.01.org/0day-ci/arc=
hive/20220127/202201270239.Y4uWKZBp-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e12=
8e2a78f5a5434fc75997441ae1ee76f8a4)
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
   5 warnings generated.
   drivers/iio/dac/ad5755.c:88:8: warning: Excessive padding in 'struct ad5=
755_state' (100 padding bytes, where 36 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   chip_info, =

   pwr_down, =

   ctrl, =

   lock, =

   channels, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5755_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5755.c:88:8: note: Excessive padding in 'struct ad5755=
_state' (100 padding bytes, where 36 is optimal). Optimal fields order: dat=
a, spi, chip_info, pwr_down, ctrl, lock, channels, consider reordering the =
fields or adding explicit padding members
   struct ad5755_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5755.c:729:37: warning: Value stored to 'pdata' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct ad5755_platform_data *pdata =3D dev_get_platdata(&s=
pi->dev);
                                              ^~~~~   ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/iio/dac/ad5755.c:729:37: note: Value stored to 'pdata' during it=
s initialization is never read
           const struct ad5755_platform_data *pdata =3D dev_get_platdata(&s=
pi->dev);
                                              ^~~~~   ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/dac/ad5761.c:63:8: warning: Excessive padding in 'struct ad5=
761_state' (75 padding bytes, where 11 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   vref_reg, =

   vref, =

   range, =

   lock, =

   use_intref, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5761_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5761.c:63:8: note: Excessive padding in 'struct ad5761=
_state' (75 padding bytes, where 11 is optimal). Optimal fields order: data=
, spi, vref_reg, vref, range, lock, use_intref, consider reordering the fie=
lds or adding explicit padding members
   struct ad5761_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/input/keyboard/lm8323.c:333:3: warning: Value stored to 'active'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   active =3D debounce + 3;
                   ^        ~~~~~~~~~~~~
   drivers/input/keyboard/lm8323.c:333:3: note: Value stored to 'active' is=
 never read
                   active =3D debounce + 3;
                   ^        ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   2 warnings generated.
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
   2 warnings generated.
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
   2 warnings generated.
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/spi/spi-tegra20-slink.c:952:3: warning: Value stored to 'err' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   err =3D tegra_slink_start_dma_based_transfer(tspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra20-slink.c:952:3: note: Value stored to 'err' is ne=
ver read
                   err =3D tegra_slink_start_dma_based_transfer(tspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra20-slink.c:954:3: warning: Value stored to 'err' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   err =3D tegra_slink_start_cpu_based_transfer(tspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-tegra20-slink.c:954:3: note: Value stored to 'err' is ne=
ver read
                   err =3D tegra_slink_start_cpu_based_transfer(tspi, t);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   2 warnings generated.

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
--===============8584930061745019802==--

