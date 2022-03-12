Content-Type: multipart/mixed; boundary="===============5535547264834796116=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:clk/linux/clk-range 11/11] drivers/clk/bcm/clk-raspberrypi.c:76:8: warning: Excessive padding in 'struct raspberrypi_clk_variant' (6 padding bytes, where 2 is optimal).
Date: Sat, 12 Mar 2022 23:40:02 +0800
Message-ID: <202203122312.hsebeY5K-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5535547264834796116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Maxime Ripard <maxime@cerno.tech>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block clk/linux/clk-range
head:   e9d6cea2af1cf8d84287ff2287b6cd776f7475d2
commit: e9d6cea2af1cf8d84287ff2287b6cd776f7475d2 [11/11] clk: bcm: rpi: Run=
 some clocks at the minimum rate allowed
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-c006-20220312 (https://download.01.org/0day-ci/arc=
hive/20220312/202203122312.hsebeY5K-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 43f668=
b98e8d87290fc6bbf5ed13c3ab542e3497)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/e9d6cea2af1cf8d=
84287ff2287b6cd776f7475d2
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block clk/linux/clk-range
        git checkout e9d6cea2af1cf8d84287ff2287b6cd776f7475d2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/scsi/ufs/ufshpb.c:1446:2: note: Calling 'list_splice'
           list_splice(&pending_list, &hpb->lh_inact_rgn);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:464:7: note: Calling 'list_empty'
           if (!list_empty(list))
                ^~~~~~~~~~~~~~~~
   include/linux/list.h:292:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:292:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:292:9: note: Left side of '||' is true
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   include/linux/list.h:292:9: note: Taking false branch
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
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
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/list.h:292:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
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
   include/linux/list.h:292:2: note: Returning zero, which participates in =
a condition later
           return READ_ONCE(head->next) =3D=3D head;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:464:7: note: Returning from 'list_empty'
           if (!list_empty(list))
                ^~~~~~~~~~~~~~~~
   include/linux/list.h:464:2: note: Taking true branch
           if (!list_empty(list))
           ^
   include/linux/list.h:465:29: note: Passing null pointer value via 3rd pa=
rameter 'next'
                   __list_splice(list, head, head->next);
                                             ^~~~~~~~~~
   include/linux/list.h:465:3: note: Calling '__list_splice'
                   __list_splice(list, head, head->next);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:453:13: note: Access to field 'prev' results in a d=
ereference of a null pointer (loaded from variable 'next')
           next->prev =3D last;
           ~~~~       ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/clk/bcm/clk-raspberrypi.c:76:8: warning: Excessive padding in 's=
truct raspberrypi_clk_variant' (6 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   clkdev, =

   min_rate, =

   export, =

   minimize, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct raspberrypi_clk_variant {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/bcm/clk-raspberrypi.c:76:8: note: Excessive padding in 'stru=
ct raspberrypi_clk_variant' (6 padding bytes, where 2 is optimal). Optimal =
fields order: clkdev, min_rate, export, minimize, consider reordering the f=
ields or adding explicit padding members
   struct raspberrypi_clk_variant {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
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
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   4 warnings generated.
   drivers/regulator/ti-abb-regulator.c:754:3: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/regulator/ti-abb-regulator.c:754:3: note: Value stored to 'ret' =
is never read
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/regulator/ti-abb-regulator.c:773:3: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/regulator/ti-abb-regulator.c:773:3: note: Value stored to 'ret' =
is never read
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
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

vim +76 drivers/clk/bcm/clk-raspberrypi.c

4e85e535e6cc6e Nicolas Saenz Julienne 2019-06-12  75  =

12c90f3f27bb3a Maxime Ripard          2022-02-25 @76  struct raspberrypi_cl=
k_variant {
12c90f3f27bb3a Maxime Ripard          2022-02-25  77  	bool		export;
12c90f3f27bb3a Maxime Ripard          2022-02-25  78  	char		*clkdev;
542acfec4e313c Maxime Ripard          2022-02-25  79  	unsigned long	min_ra=
te;
e9d6cea2af1cf8 Maxime Ripard          2022-02-25  80  	bool		minimize;
12c90f3f27bb3a Maxime Ripard          2022-02-25  81  };
12c90f3f27bb3a Maxime Ripard          2022-02-25  82  =


:::::: The code at line 76 was first introduced by commit
:::::: 12c90f3f27bb3ad0dd3fad1550fec87091aa3329 clk: bcm: rpi: Add variant =
structure

:::::: TO: Maxime Ripard <maxime@cerno.tech>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5535547264834796116==--

