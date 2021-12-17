Content-Type: multipart/mixed; boundary="===============0360376291473387614=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5811/7473] drivers/gpu/drm/sprd/sprd_dsi.c:338:10: warning: Although the value stored to 'video_size_step' is used in the enclosing expression, the value is never actually read from 'video_size_step' [clang-analyzer-deadcode.DeadStores]
Date: Fri, 17 Dec 2021 11:53:45 +0800
Message-ID: <202112171102.ATG0MUEe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0360376291473387614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kevin Tang <kevin3.tang@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   93bf6eee76c0e716f6b32de690b1c52991547bb4
commit: 1c66496b1391699040d0ddda21fe1979865f6eba [5811/7473] drm/sprd: add =
Unisoc's drm mipi dsi&dphy driver
:::::: branch date: 30 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20211214 (https://download.01.org/0day-ci/arc=
hive/20211217/202112171102.ATG0MUEe-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D1c66496b1391699040d0ddda21fe1979865f6eba
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1c66496b1391699040d0ddda21fe1979865f6eba
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   net/ipv4/fib_semantics.c:1456:10: note: Returning from 'fib_nh_init'
                           err =3D fib_nh_init(net, fi->fib_nh, cfg, 1, ext=
ack);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/ipv4/fib_semantics.c:1459:6: note: 'err' is equal to 0
           if (err !=3D 0)
               ^~~
   net/ipv4/fib_semantics.c:1459:2: note: Taking false branch
           if (err !=3D 0)
           ^
   net/ipv4/fib_semantics.c:1462:6: note: Assuming field 'error' is 0
           if (fib_props[cfg->fc_type].error) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1462:2: note: Taking false branch
           if (fib_props[cfg->fc_type].error) {
           ^
   net/ipv4/fib_semantics.c:1470:3: note: Control jumps to 'case RTN_MULTIC=
AST:'  at line 1475
                   switch (cfg->fc_type) {
                   ^
   net/ipv4/fib_semantics.c:1476:4: note:  Execution continues on line 1483
                           break;
                           ^
   net/ipv4/fib_semantics.c:1483:6: note: Assuming field 'fc_scope' is <=3D=
 RT_SCOPE_HOST
           if (cfg->fc_scope > RT_SCOPE_HOST) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1483:2: note: Taking false branch
           if (cfg->fc_scope > RT_SCOPE_HOST) {
           ^
   net/ipv4/fib_semantics.c:1488:6: note: Assuming field 'nh' is non-null
           if (fi->nh) {
               ^~~~~~
   net/ipv4/fib_semantics.c:1488:2: note: Taking true branch
           if (fi->nh) {
           ^
   net/ipv4/fib_semantics.c:1490:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   net/ipv4/fib_semantics.c:1490:3: note: Taking false branch
                   if (err)
                   ^
   net/ipv4/fib_semantics.c:1527:6: note: Assuming field 'fib_prefsrc' is 0
           if (fi->fib_prefsrc && !fib_valid_prefsrc(cfg, fi->fib_prefsrc))=
 {
               ^~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1527:22: note: Left side of '&&' is false
           if (fi->fib_prefsrc && !fib_valid_prefsrc(cfg, fi->fib_prefsrc))=
 {
                               ^
   net/ipv4/fib_semantics.c:1532:11: note: Field 'nh' is non-null
           if (!fi->nh) {
                    ^
   net/ipv4/fib_semantics.c:1532:2: note: Taking false branch
           if (!fi->nh) {
           ^
   net/ipv4/fib_semantics.c:1545:6: note: Assuming 'ofi' is null
           if (ofi) {
               ^~~
   net/ipv4/fib_semantics.c:1545:2: note: Taking false branch
           if (ofi) {
           ^
   net/ipv4/fib_semantics.c:1556:25: note: Calling 'fib_info_hashfn'
                          &fib_info_hash[fib_info_hashfn(fi)]);
                                         ^~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:353:6: note: Assuming field 'nh' is non-null
           if (fi->nh) {
               ^~~~~~
   net/ipv4/fib_semantics.c:353:2: note: Taking true branch
           if (fi->nh) {
           ^
   net/ipv4/fib_semantics.c:361:2: note: Returning without writing to 'fi->=
nh', which participates in a condition later
           return fib_info_hashfn_result(val);
           ^
   net/ipv4/fib_semantics.c:1556:25: note: Returning from 'fib_info_hashfn'
                          &fib_info_hash[fib_info_hashfn(fi)]);
                                         ^~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1557:6: note: Assuming field 'fib_prefsrc' is 0
           if (fi->fib_prefsrc) {
               ^~~~~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1557:2: note: Taking false branch
           if (fi->fib_prefsrc) {
           ^
   net/ipv4/fib_semantics.c:1563:6: note: Assuming field 'nh' is non-null
           if (fi->nh) {
               ^~~~~~
   net/ipv4/fib_semantics.c:1563:2: note: Taking true branch
           if (fi->nh) {
           ^
   net/ipv4/fib_semantics.c:1564:26: note: Passing null pointer value via 2=
nd parameter 'head'
                   list_add(&fi->nh_list, &nh->fi_list);
                                          ^~~~~~~~~~~~
   net/ipv4/fib_semantics.c:1564:3: note: Calling 'list_add'
                   list_add(&fi->nh_list, &nh->fi_list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:88:24: note: Access to field 'next' results in a de=
reference of a null pointer (loaded from variable 'head')
           __list_add(new, head, head->next);
                                 ^~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/gpu/drm/sprd/sprd_dsi.c:338:10: warning: Although the value stor=
ed to 'video_size_step' is used in the enclosing expression, the value is n=
ever actually read from 'video_size_step' [clang-analyzer-deadcode.DeadStor=
es]
                   return video_size_step =3D 1;
                          ^                 ~
   drivers/gpu/drm/sprd/sprd_dsi.c:338:10: note: Although the value stored =
to 'video_size_step' is used in the enclosing expression, the value is neve=
r actually read from 'video_size_step'
                   return video_size_step =3D 1;
                          ^                 ~
   drivers/gpu/drm/sprd/sprd_dsi.c:345:10: warning: Although the value stor=
ed to 'video_size_step' is used in the enclosing expression, the value is n=
ever actually read from 'video_size_step' [clang-analyzer-deadcode.DeadStor=
es]
                   return video_size_step =3D 2;
                          ^                 ~
   drivers/gpu/drm/sprd/sprd_dsi.c:345:10: note: Although the value stored =
to 'video_size_step' is used in the enclosing expression, the value is neve=
r actually read from 'video_size_step'
                   return video_size_step =3D 2;
                          ^                 ~
>> drivers/gpu/drm/sprd/sprd_dsi.c:641:15: warning: Although the value stor=
ed to 'j' is used in the enclosing expression, the value is never actually =
read from 'j' [clang-analyzer-deadcode.DeadStores]
                   for (i =3D 0, j =3D 0; i < len; i +=3D j) {
                               ^   ~
   drivers/gpu/drm/sprd/sprd_dsi.c:641:15: note: Although the value stored =
to 'j' is used in the enclosing expression, the value is never actually rea=
d from 'j'
                   for (i =3D 0, j =3D 0; i < len; i +=3D j) {
                               ^   ~
   Suppressed 5 warnings (5 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/extcon/extcon-rt8973a.c:25:8: warning: Excessive padding in 'str=
uct muic_irq' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   irq, =

   virq, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   drivers/extcon/extcon-rt8973a.c:25:8: note: Excessive padding in 'struct=
 muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: nam=
e, irq, virq, consider reordering the fields or adding explicit padding mem=
bers
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/extcon/extcon-sm5502.c:24:8: warning: Excessive padding in 'stru=
ct muic_irq' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   irq, =

   virq, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   drivers/extcon/extcon-sm5502.c:24:8: note: Excessive padding in 'struct =
muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: name=
, irq, virq, consider reordering the fields or adding explicit padding memb=
ers
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
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
   drivers/iio/accel/adxl313_core.c:46:8: warning: Excessive padding in 'st=
ruct adxl313_data' (110 padding bytes, where 46 is optimal). =

   Optimal fields order: =

   transf_buf, =

   regmap, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adxl313_data {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/accel/adxl313_core.c:46:8: note: Excessive padding in 'struc=
t adxl313_data' (110 padding bytes, where 46 is optimal). Optimal fields or=
der: transf_buf, regmap, lock, consider reordering the fields or adding exp=
licit padding members
   struct adxl313_data {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +338 drivers/gpu/drm/sprd/sprd_dsi.c

1c66496b139169 Kevin Tang 2021-12-07  325  =

1c66496b139169 Kevin Tang 2021-12-07  326  static u8 calc_video_size_step(i=
nt coding)
1c66496b139169 Kevin Tang 2021-12-07  327  {
1c66496b139169 Kevin Tang 2021-12-07  328  	u8 video_size_step;
1c66496b139169 Kevin Tang 2021-12-07  329  =

1c66496b139169 Kevin Tang 2021-12-07  330  	switch (coding) {
1c66496b139169 Kevin Tang 2021-12-07  331  	case COLOR_CODE_16BIT_CONFIG1:
1c66496b139169 Kevin Tang 2021-12-07  332  	case COLOR_CODE_16BIT_CONFIG2:
1c66496b139169 Kevin Tang 2021-12-07  333  	case COLOR_CODE_16BIT_CONFIG3:
1c66496b139169 Kevin Tang 2021-12-07  334  	case COLOR_CODE_18BIT_CONFIG1:
1c66496b139169 Kevin Tang 2021-12-07  335  	case COLOR_CODE_18BIT_CONFIG2:
1c66496b139169 Kevin Tang 2021-12-07  336  	case COLOR_CODE_24BIT:
1c66496b139169 Kevin Tang 2021-12-07  337  	case COLOR_CODE_COMPRESSTION:
1c66496b139169 Kevin Tang 2021-12-07 @338  		return video_size_step =3D 1;
1c66496b139169 Kevin Tang 2021-12-07  339  	case COLOR_CODE_20BIT_YCC422_LO=
OSELY:
1c66496b139169 Kevin Tang 2021-12-07  340  	case COLOR_CODE_24BIT_YCC422:
1c66496b139169 Kevin Tang 2021-12-07  341  	case COLOR_CODE_16BIT_YCC422:
1c66496b139169 Kevin Tang 2021-12-07  342  	case COLOR_CODE_30BIT:
1c66496b139169 Kevin Tang 2021-12-07  343  	case COLOR_CODE_36BIT:
1c66496b139169 Kevin Tang 2021-12-07  344  	case COLOR_CODE_12BIT_YCC420:
1c66496b139169 Kevin Tang 2021-12-07  345  		return video_size_step =3D 2;
1c66496b139169 Kevin Tang 2021-12-07  346  	default:
1c66496b139169 Kevin Tang 2021-12-07  347  		DRM_ERROR("invalid color codin=
g");
1c66496b139169 Kevin Tang 2021-12-07  348  		return 0;
1c66496b139169 Kevin Tang 2021-12-07  349  	}
1c66496b139169 Kevin Tang 2021-12-07  350  }
1c66496b139169 Kevin Tang 2021-12-07  351  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============0360376291473387614==--

