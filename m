Content-Type: multipart/mixed; boundary="===============4837951059948693411=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/atomic/atomic-instrumented.h:28:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Fri, 26 Nov 2021 18:46:35 +0800
Message-ID: <202111261836.16mpGE90-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4837951059948693411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: e3d18cee258b898017b298b5b93f8134dd62aee3 locking/atomic: centralize=
 generated headers
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20211001 (https://download.01.org/0day-ci/archi=
ve/20211126/202111261836.16mpGE90-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 962e50=
3cc8bc411f7523cc393acae8aae425b1c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De3d18cee258b898017b298b5b93f8134dd62aee3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e3d18cee258b898017b298b5b93f8134dd62aee3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/btrfs/ordered-data.c:583:13: note: Left side of '&&' is false
                   ordered =3D list_first_entry(&splice, struct btrfs_order=
ed_extent,
                             ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/btrfs/ordered-data.c:583:13: note: '?' condition is true
                   ordered =3D list_first_entry(&splice, struct btrfs_order=
ed_extent,
                             ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/btrfs/ordered-data.c:583:13: note: Left side of '&&' is false
                   ordered =3D list_first_entry(&splice, struct btrfs_order=
ed_extent,
                             ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/btrfs/ordered-data.c:583:13: note: Taking false branch
                   ordered =3D list_first_entry(&splice, struct btrfs_order=
ed_extent,
                             ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/btrfs/ordered-data.c:583:13: note: Loop condition is false.  Exiting =
loop
                   ordered =3D list_first_entry(&splice, struct btrfs_order=
ed_extent,
                             ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/btrfs/ordered-data.c:586:17: note: The right operand of '<=3D' is a g=
arbage value
                   if (range_end <=3D ordered->disk_bytenr ||
                                 ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> include/linux/atomic/atomic-instrumented.h:28:2: warning: Undefined or g=
arbage value returned to caller [clang-analyzer-core.uninitialized.UndefRet=
urn]
           return arch_atomic_read(v);
           ^
   fs/btrfs/ordered-data.c:636:9: note: Assuming the condition is true
           while (!list_empty(&splice) && nr) {
                  ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ordered-data.c:636:9: note: Left side of '&&' is true
   fs/btrfs/ordered-data.c:636:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(&splice) && nr) {
           ^
   fs/btrfs/ordered-data.c:637:10: note: Left side of '&&' is false
                   root =3D list_first_entry(&splice, struct btrfs_root,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/btrfs/ordered-data.c:637:10: note: '?' condition is true
                   root =3D list_first_entry(&splice, struct btrfs_root,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/btrfs/ordered-data.c:637:10: note: Left side of '&&' is false
                   root =3D list_first_entry(&splice, struct btrfs_root,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/btrfs/ordered-data.c:637:10: note: Taking false branch
                   root =3D list_first_entry(&splice, struct btrfs_root,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/btrfs/ordered-data.c:637:10: note: Loop condition is false.  Exiting =
loop
                   root =3D list_first_entry(&splice, struct btrfs_root,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:704:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/btrfs/ordered-data.c:639:10: note: Calling 'btrfs_grab_root'

vim +28 include/linux/atomic/atomic-instrumented.h

aa525d063851a98 include/asm-generic/atomic-instrumented.h Mark Rutland 2018=
-09-04  23  =

c020395b6634b7a include/asm-generic/atomic-instrumented.h Marco Elver  2019=
-11-26  24  static __always_inline int
aa525d063851a98 include/asm-generic/atomic-instrumented.h Mark Rutland 2018=
-09-04  25  atomic_read(const atomic_t *v)
aa525d063851a98 include/asm-generic/atomic-instrumented.h Mark Rutland 2018=
-09-04  26  {
ed8af2e4d2a71bd include/asm-generic/atomic-instrumented.h Marco Elver  2020=
-01-21  27  	instrument_atomic_read(v, sizeof(*v));
aa525d063851a98 include/asm-generic/atomic-instrumented.h Mark Rutland 2018=
-09-04 @28  	return arch_atomic_read(v);
aa525d063851a98 include/asm-generic/atomic-instrumented.h Mark Rutland 2018=
-09-04  29  }
aa525d063851a98 include/asm-generic/atomic-instrumented.h Mark Rutland 2018=
-09-04  30  =


:::::: The code at line 28 was first introduced by commit
:::::: aa525d063851a98e020b827fdd1d7776ae652301 locking/atomics: Switch to =
generated instrumentation

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4837951059948693411==--

