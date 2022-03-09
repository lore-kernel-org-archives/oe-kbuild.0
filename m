Content-Type: multipart/mixed; boundary="===============7089258454811549803=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10 1384/9999] drivers/iio/adc/ti-ads8688.c:64:8: warning: Excessive padding in 'struct ads8688_state' (40 padding bytes, where 8 is optimal).
Date: Wed, 09 Mar 2022 18:57:49 +0800
Message-ID: <202203091824.I3mnikQE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7089258454811549803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Liangliang Li <liliangliang@vivo.com>
CC: Todd Kjos <tkjos@google.com>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android13-5.10
head:   5da5b1871950c71755fa5a0b88c78e2f2623da24
commit: 372b24bad2a8e7994d0360c870f6e981e3f4bb8f [1384/9999] ANDROID: GKI: =
Add OEM data to mutex/rwsem
:::::: branch date: 15 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220308 (https://download.01.org/0day-ci/archi=
ve/20220309/202203091824.I3mnikQE-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/372b24bad2a8e79=
94d0360c870f6e981e3f4bb8f
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android13-5.10
        git checkout 372b24bad2a8e7994d0360c870f6e981e3f4bb8f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (!(x & 0x80000000u)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:185:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:185:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/ufs/dir.c:102:2: warning: Value stored to 'err' is never read [clang-=
analyzer-deadcode.DeadStores]
           err =3D ufs_commit_chunk(page, pos, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ufs/dir.c:102:2: note: Value stored to 'err' is never read
           err =3D ufs_commit_chunk(page, pos, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ufs/dir.c:179:2: warning: Value stored to 'p' is never read [clang-an=
alyzer-deadcode.DeadStores]
           p =3D (struct ufs_dir_entry *)(kaddr + offs);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ufs/dir.c:179:2: note: Value stored to 'p' is never read
           p =3D (struct ufs_dir_entry *)(kaddr + offs);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings generated.
   fs/ufs/inode.c:78:9: warning: Excessive padding in 'Indirect' (8 padding=
 bytes, where 0 is optimal). =

   Optimal fields order: =

   , =

   p, =

   bh, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   typedef struct {
           ^~~~~~~~
   fs/ufs/inode.c:78:9: note: Excessive padding in 'Indirect' (8 padding by=
tes, where 0 is optimal). Optimal fields order: , p, bh, consider reorderin=
g the fields or adding explicit padding members
   typedef struct {
           ^~~~~~~~
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
   4 warnings generated.
>> drivers/iio/adc/ti-ads8688.c:64:8: warning: Excessive padding in 'struct=
 ads8688_state' (40 padding bytes, where 8 is optimal). =

   Optimal fields order: =

   data, =

   lock, =

   chip_info, =

   spi, =

   reg, =

   vref_mv, =

   range, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ads8688_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/adc/ti-ads8688.c:64:8: note: Excessive padding in 'struct ad=
s8688_state' (40 padding bytes, where 8 is optimal). Optimal fields order: =
data, lock, chip_info, spi, reg, vref_mv, range, consider reordering the fi=
elds or adding explicit padding members
   struct ads8688_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/adc/vf610_adc.c:188:28: warning: The result of the left shif=
t is undefined due to shifting by '32', which is greater or equal to the wi=
dth of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   adc_feature->clk_div =3D 1 << fls(divisor + 1);
                                            ^
   drivers/iio/adc/vf610_adc.c:804:6: note: Assuming 'indio_dev' is non-null
           if (!indio_dev) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/iio/adc/vf610_adc.c:804:2: note: '?' condition is false
           if (!indio_dev) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/iio/adc/vf610_adc.c:804:7: note: 'indio_dev' is non-null
           if (!indio_dev) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/iio/adc/vf610_adc.c:804:2: note: '?' condition is false
           if (!indio_dev) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/iio/adc/vf610_adc.c:804:2: note: Taking false branch
           if (!indio_dev) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/iio/adc/vf610_adc.c:813:2: note: '?' condition is false
           if (IS_ERR(info->regs))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/iio/adc/vf610_adc.c:813:2: note: '?' condition is false
           if (IS_ERR(info->regs))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/iio/adc/vf610_adc.c:813:2: note: Taking false branch
           if (IS_ERR(info->regs))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/iio/adc/vf610_adc.c:817:6: note: Assuming 'irq' is >=3D 0
           if (irq < 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +64 drivers/iio/adc/ti-ads8688.c

3e87e7838328311 Sean Nyekjaer 2015-11-09  63  =

3e87e7838328311 Sean Nyekjaer 2015-11-09 @64  struct ads8688_state {
3e87e7838328311 Sean Nyekjaer 2015-11-09  65  	struct mutex			lock;
3e87e7838328311 Sean Nyekjaer 2015-11-09  66  	const struct ads8688_chip_in=
fo	*chip_info;
3e87e7838328311 Sean Nyekjaer 2015-11-09  67  	struct spi_device		*spi;
3e87e7838328311 Sean Nyekjaer 2015-11-09  68  	struct regulator		*reg;
3e87e7838328311 Sean Nyekjaer 2015-11-09  69  	unsigned int			vref_mv;
3e87e7838328311 Sean Nyekjaer 2015-11-09  70  	enum ads8688_range		range[8];
3e87e7838328311 Sean Nyekjaer 2015-11-09  71  	union {
3e87e7838328311 Sean Nyekjaer 2015-11-09  72  		__be32 d32;
3e87e7838328311 Sean Nyekjaer 2015-11-09  73  		u8 d8[4];
3e87e7838328311 Sean Nyekjaer 2015-11-09  74  	} data[2] ____cacheline_alig=
ned;
3e87e7838328311 Sean Nyekjaer 2015-11-09  75  };
3e87e7838328311 Sean Nyekjaer 2015-11-09  76  =


:::::: The code@line 64 was first introduced by commit
:::::: 3e87e78383283119a7d41f8a4cab8ef0a5c9acab iio: adc: Add TI ADS8688

:::::: TO: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7089258454811549803==--

