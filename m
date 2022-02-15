Content-Type: multipart/mixed; boundary="===============5610406158417413161=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/test_kasan.c:203:9: warning: Value stored to 'size' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 16 Feb 2022 07:49:01 +0800
Message-ID: <202202160750.leiLH0af-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5610406158417413161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andrey Konovalov <andreyknvl@google.com>
CC: Marco Elver <elver@google.com>
CC: Alexander Potapenko <glider@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   705d84a366cfccda1e7aec1113a5399cd2ffee7d
commit: 858bdeb046f6dc7a79039d577d03e4d2b39272b7 kasan: add proper page all=
ocator tests
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-c006-20220213 (https://download.01.org/0day-ci/arc=
hive/20220216/202202160750.leiLH0af-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c7eb84=
634519e6497be42f5fe323f9a04ed67127)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D858bdeb046f6dc7a79039d577d03e4d2b39272b7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 858bdeb046f6dc7a79039d577d03e4d2b39272b7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/fuse/dev.c:1671:7: note: Calling 'kzalloc'
           ra =3D kzalloc(args_size, GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:9: note: Uninitialized value stored to field 'n=
um_pages'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:1671:7: note: Returning from 'kzalloc'
           ra =3D kzalloc(args_size, GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:1672:6: note: Assuming 'ra' is non-null
           if (!ra)
               ^~~
   fs/fuse/dev.c:1672:2: note: Taking false branch
           if (!ra)
           ^
   fs/fuse/dev.c:1688:9: note: Assuming 'num' is not equal to 0
           while (num && ap->num_pages < num_pages) {
                  ^~~
   fs/fuse/dev.c:1688:9: note: Left side of '&&' is true
   fs/fuse/dev.c:1688:30: note: The left operand of '<' is a garbage value
           while (num && ap->num_pages < num_pages) {
                         ~~~~~~~~~~~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   lib/string_helpers.c:111:12: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
           remainder +=3D rounding[j];
                     ^  ~~~~~~~~~~~
   lib/string_helpers.c:59:6: note: Assuming 'blk_size' is not equal to 0
           if (blk_size =3D=3D 0)
               ^~~~~~~~~~~~~
   lib/string_helpers.c:59:2: note: Taking false branch
           if (blk_size =3D=3D 0)
           ^
   lib/string_helpers.c:61:6: note: Assuming 'size' is not equal to 0
           if (size =3D=3D 0)
               ^~~~~~~~~
   lib/string_helpers.c:61:2: note: Taking false branch
           if (size =3D=3D 0)
           ^
   lib/string_helpers.c:75:2: note: Loop condition is false. Execution cont=
inues on line 80
           while (blk_size >> 32) {
           ^
   lib/string_helpers.c:80:2: note: Loop condition is false. Execution cont=
inues on line 87
           while (size >> 32) {
           ^
   lib/string_helpers.c:90:2: note: Loop condition is false. Execution cont=
inues on line 97
           while (size >=3D divisor[units]) {
           ^
   lib/string_helpers.c:98:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:98:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:98:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:98:32: note: The value 3 is assigned to 'j'
           for (j =3D 0; sf_cap*10 < 1000; j++)
                                         ^~~
   lib/string_helpers.c:98:14: note: Assuming the condition is false
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is false. Execution cont=
inues on line 101
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:101:6: note: Assuming 'units' is not equal to STRIN=
G_UNITS_2
           if (units =3D=3D STRING_UNITS_2) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   lib/string_helpers.c:101:2: note: Taking false branch
           if (units =3D=3D STRING_UNITS_2) {
           ^
   lib/string_helpers.c:111:12: note: Assigned value is garbage or undefined
           remainder +=3D rounding[j];
                     ^  ~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> lib/test_kasan.c:203:9: warning: Value stored to 'size' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
           size_t size =3D (1UL << (PAGE_SHIFT + order));
                  ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan.c:203:9: note: Value stored to 'size' during its initiali=
zation is never read
           size_t size =3D (1UL << (PAGE_SHIFT + order));
                  ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan.c:315:40: warning: Use of memory after it is freed [clang=
-analyzer-unix.Malloc]
           KUNIT_EXPECT_KASAN_FAIL(test, *ptr1 =3D *ptr2);
                                                 ^
   lib/test_kasan.c:88:2: note: expanded from macro 'KUNIT_EXPECT_KASAN_FAI=
L'
           expression;                                             \
           ^~~~~~~~~~
   lib/test_kasan.c:309:2: note: Loop condition is false.  Exiting loop
           KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
           ^
   include/kunit/test.h:1766:2: note: expanded from macro 'KUNIT_ASSERT_NOT=
_ERR_OR_NULL'
           KUNIT_PTR_NOT_ERR_OR_NULL_ASSERTION(test, KUNIT_ASSERTION, ptr)
           ^
   include/kunit/test.h:1207:2: note: expanded from macro 'KUNIT_PTR_NOT_ER=
R_OR_NULL_ASSERTION'
           KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,                   =
       \
           ^
   include/kunit/test.h:1195:2: note: expanded from macro 'KUNIT_PTR_NOT_ER=
R_OR_NULL_MSG_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   lib/test_kasan.c:309:2: note: Loop condition is false.  Exiting loop
           KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
           ^
   include/kunit/test.h:1766:2: note: expanded from macro 'KUNIT_ASSERT_NOT=
_ERR_OR_NULL'
           KUNIT_PTR_NOT_ERR_OR_NULL_ASSERTION(test, KUNIT_ASSERTION, ptr)
           ^
   include/kunit/test.h:1207:2: note: expanded from macro 'KUNIT_PTR_NOT_ER=
R_OR_NULL_ASSERTION'
           KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,                   =
       \
           ^
   include/kunit/test.h:1191:21: note: expanded from macro 'KUNIT_PTR_NOT_E=
RR_OR_NULL_MSG_ASSERTION'
                                                   ...)                    =
       \
                                                                           =
       ^
   lib/test_kasan.c:312:2: note: Calling 'IS_ERR_OR_NULL'
           KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr2);
           ^
   include/kunit/test.h:1766:2: note: expanded from macro 'KUNIT_ASSERT_NOT=
_ERR_OR_NULL'
           KUNIT_PTR_NOT_ERR_OR_NULL_ASSERTION(test, KUNIT_ASSERTION, ptr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1207:2: note: expanded from macro 'KUNIT_PTR_NOT_ER=
R_OR_NULL_ASSERTION'
           KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,                   =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:1196:5: note: expanded from macro 'KUNIT_PTR_NOT_ER=
R_OR_NULL_MSG_ASSERTION'
                           !IS_ERR_OR_NULL(__ptr),                         =
       \
                            ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   include/linux/err.h:41:18: note: Assuming 'ptr' is non-null
           return unlikely(!ptr) || IS_ERR_VALUE((unsigned long)ptr);
                           ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:41:9: note: Left side of '||' is false
           return unlikely(!ptr) || IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^
   include/linux/err.h:41:27: note: Assuming the condition is false
           return unlikely(!ptr) || IS_ERR_VALUE((unsigned long)ptr);
                                    ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/test_kasan.c:312:2: note: Returning from 'IS_ERR_OR_NULL'
           KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr2);
           ^
   include/kunit/test.h:1766:2: note: expanded from macro 'KUNIT_ASSERT_NOT=
_ERR_OR_NULL'
           KUNIT_PTR_NOT_ERR_OR_NULL_ASSERTION(test, KUNIT_ASSERTION, ptr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1207:2: note: expanded from macro 'KUNIT_PTR_NOT_ER=
R_OR_NULL_ASSERTION'
           KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,                   =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:1196:5: note: expanded from macro 'KUNIT_PTR_NOT_ER=
R_OR_NULL_MSG_ASSERTION'
                           !IS_ERR_OR_NULL(__ptr),                         =
       \
                            ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   lib/test_kasan.c:312:2: note: Loop condition is false.  Exiting loop
           KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr2);
           ^
   include/kunit/test.h:1766:2: note: expanded from macro 'KUNIT_ASSERT_NOT=
_ERR_OR_NULL'
           KUNIT_PTR_NOT_ERR_OR_NULL_ASSERTION(test, KUNIT_ASSERTION, ptr)
           ^
   include/kunit/test.h:1207:2: note: expanded from macro 'KUNIT_PTR_NOT_ER=
R_OR_NULL_ASSERTION'
           KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,                   =
       \
           ^
   include/kunit/test.h:1195:2: note: expanded from macro 'KUNIT_PTR_NOT_ER=
R_OR_NULL_MSG_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \

vim +/size +203 lib/test_kasan.c

e6e8379c876de1 Alexander Potapenko 2016-03-25  197  =

858bdeb046f6dc Andrey Konovalov    2021-02-24  198  static void pagealloc_o=
ob_right(struct kunit *test)
858bdeb046f6dc Andrey Konovalov    2021-02-24  199  {
858bdeb046f6dc Andrey Konovalov    2021-02-24  200  	char *ptr;
858bdeb046f6dc Andrey Konovalov    2021-02-24  201  	struct page *pages;
858bdeb046f6dc Andrey Konovalov    2021-02-24  202  	size_t order =3D 4;
858bdeb046f6dc Andrey Konovalov    2021-02-24 @203  	size_t size =3D (1UL <=
< (PAGE_SHIFT + order));
858bdeb046f6dc Andrey Konovalov    2021-02-24  204  =

858bdeb046f6dc Andrey Konovalov    2021-02-24  205  	/*
858bdeb046f6dc Andrey Konovalov    2021-02-24  206  	 * With generic KASAN =
page allocations have no redzones, thus
858bdeb046f6dc Andrey Konovalov    2021-02-24  207  	 * out-of-bounds detec=
tion is not guaranteed.
858bdeb046f6dc Andrey Konovalov    2021-02-24  208  	 * See https://bugzill=
a.kernel.org/show_bug.cgi?id=3D210503.
858bdeb046f6dc Andrey Konovalov    2021-02-24  209  	 */
858bdeb046f6dc Andrey Konovalov    2021-02-24  210  	KASAN_TEST_NEEDS_CONFI=
G_OFF(test, CONFIG_KASAN_GENERIC);
858bdeb046f6dc Andrey Konovalov    2021-02-24  211  =

858bdeb046f6dc Andrey Konovalov    2021-02-24  212  	pages =3D alloc_pages(=
GFP_KERNEL, order);
858bdeb046f6dc Andrey Konovalov    2021-02-24  213  	ptr =3D page_address(p=
ages);
858bdeb046f6dc Andrey Konovalov    2021-02-24  214  	KUNIT_ASSERT_NOT_ERR_O=
R_NULL(test, ptr);
858bdeb046f6dc Andrey Konovalov    2021-02-24  215  =

858bdeb046f6dc Andrey Konovalov    2021-02-24  216  	KUNIT_EXPECT_KASAN_FAI=
L(test, ptr[size] =3D 0);
858bdeb046f6dc Andrey Konovalov    2021-02-24  217  	free_pages((unsigned l=
ong)ptr, order);
858bdeb046f6dc Andrey Konovalov    2021-02-24  218  }
858bdeb046f6dc Andrey Konovalov    2021-02-24  219  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============5610406158417413161==--

