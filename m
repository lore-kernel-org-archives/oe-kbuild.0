Content-Type: multipart/mixed; boundary="===============3609708291802161633=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.10 694/9999] lib/test_kasan_module.c:41:2: warning: Value stored to 'unused' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 09 Jan 2022 02:33:47 +0800
Message-ID: <202201090208.xvEQ2UIW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3609708291802161633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andrey Konovalov <andreyknvl@google.com>
CC: Alistair Delva <adelva@google.com>
CC: Marco Elver <elver@google.com>
CC: Alexander Potapenko <glider@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android12-5.10
head:   05c23b7a503851e3be7e68453899e0ed922016f7
commit: 916518ead7a5c918acbd0bdb48e8e5dd10e62bd8 [694/9999] FROMGIT: kasan:=
 rename CONFIG_TEST_KASAN_MODULE
:::::: branch date: 26 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-c007-20220107 (https://download.01.org/0day-ci/ar=
chive/20220109/202201090208.xvEQ2UIW-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/916518ead7a5c91=
8acbd0bdb48e8e5dd10e62bd8
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android12-5.10
        git checkout 916518ead7a5c918acbd0bdb48e8e5dd10e62bd8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/nfs/direct.c:704:19: warning: Value stored to 'req' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct nfs_page *req =3D nfs_list_entry(hdr->pages.next);
                            ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/direct.c:704:19: note: Value stored to 'req' during its initializ=
ation is never read
           struct nfs_page *req =3D nfs_list_entry(hdr->pages.next);
                            ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/dvb-frontends/stv090x.c:2289:23: warning: The result of th=
e '/' expression is undefined [clang-analyzer-core.UndefinedBinaryOperatorR=
esult]
           steps_max =3D (car_max / inc) + 1; /* min steps =3D 3 */
                                ^
   drivers/media/dvb-frontends/stv090x.c:2405:2: note: Calling 'stv090x_get=
_loop_params'
           stv090x_get_loop_params(state, &inc, &timeout_step, &steps_max);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2251:6: note: Assuming 'car_max' i=
s <=3D 16384
           if (car_max > 0x4000)
               ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2251:2: note: Taking false branch
           if (car_max > 0x4000)
           ^
   drivers/media/dvb-frontends/stv090x.c:2260:2: note: Control jumps to 'ca=
se STV090x_SEARCH_DVBS2:'  at line 2267
           switch (state->search_mode) {
           ^
   drivers/media/dvb-frontends/stv090x.c:2270:3: note:  Execution continues=
 on line 2278
                   break;
                   ^
   drivers/media/dvb-frontends/stv090x.c:2279:7: note: Assuming 'inc' is <=
=3D 'car_max'
           if ((inc > car_max) || (inc < 0))
                ^~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2279:6: note: Left side of '||' is=
 false
           if ((inc > car_max) || (inc < 0))
               ^
   drivers/media/dvb-frontends/stv090x.c:2279:26: note: Assuming 'inc' is >=
=3D 0
           if ((inc > car_max) || (inc < 0))
                                   ^~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2279:2: note: Taking false branch
           if ((inc > car_max) || (inc < 0))
           ^
   drivers/media/dvb-frontends/stv090x.c:2283:6: note: Assuming 'srate' is =
<=3D 0
           if (srate > 0)
               ^~~~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2283:2: note: Taking false branch
           if (srate > 0)
           ^
   drivers/media/dvb-frontends/stv090x.c:2286:7: note: 'timeout' is > 100
           if ((timeout > 100) || (timeout < 0))
                ^~~~~~~
   drivers/media/dvb-frontends/stv090x.c:2286:22: note: Left side of '||' i=
s true
           if ((timeout > 100) || (timeout < 0))
                               ^
   drivers/media/dvb-frontends/stv090x.c:2289:23: note: The result of the '=
/' expression is undefined
           steps_max =3D (car_max / inc) + 1; /* min steps =3D 3 */
                        ~~~~~~~~^~~~~
   drivers/media/dvb-frontends/stv090x.c:2960:2: warning: Value stored to '=
reg' is never read [clang-analyzer-deadcode.DeadStores]
           reg =3D STV090x_READ_DEMOD(state, TMGOBS);
           ^
   drivers/media/dvb-frontends/stv090x.c:2960:2: note: Value stored to 'reg=
' is never read
   Suppressed 4 warnings (4 in non-user code).
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
   13 warnings generated.
>> lib/test_kasan_module.c:41:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D copy_from_user(kmem, usermem, size + 1 + OOB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:41:2: note: Value stored to 'unused' is never re=
ad
           unused =3D copy_from_user(kmem, usermem, size + 1 + OOB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:44:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D copy_to_user(usermem, kmem, size + 1 + OOB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:44:2: note: Value stored to 'unused' is never re=
ad
           unused =3D copy_to_user(usermem, kmem, size + 1 + OOB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:47:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D __copy_from_user(kmem, usermem, size + 1 + OOB_TAG_OF=
F);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:47:2: note: Value stored to 'unused' is never re=
ad
           unused =3D __copy_from_user(kmem, usermem, size + 1 + OOB_TAG_OF=
F);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:50:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D __copy_to_user(usermem, kmem, size + 1 + OOB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:50:2: note: Value stored to 'unused' is never re=
ad
           unused =3D __copy_to_user(usermem, kmem, size + 1 + OOB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:53:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D __copy_from_user_inatomic(kmem, usermem, size + 1 + O=
OB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   lib/test_kasan_module.c:53:2: note: Value stored to 'unused' is never re=
ad
           unused =3D __copy_from_user_inatomic(kmem, usermem, size + 1 + O=
OB_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   lib/test_kasan_module.c:56:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D __copy_to_user_inatomic(usermem, kmem, size + 1 + OOB=
_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   lib/test_kasan_module.c:56:2: note: Value stored to 'unused' is never re=
ad
           unused =3D __copy_to_user_inatomic(usermem, kmem, size + 1 + OOB=
_TAG_OFF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   lib/test_kasan_module.c:59:2: warning: Value stored to 'unused' is never=
 read [clang-analyzer-deadcode.DeadStores]
           unused =3D strncpy_from_user(kmem, usermem, size + 1 + OOB_TAG_O=
FF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:59:2: note: Value stored to 'unused' is never re=
ad
           unused =3D strncpy_from_user(kmem, usermem, size + 1 + OOB_TAG_O=
FF);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/test_kasan_module.c:76:8: warning: Use of memory after it is freed [=
clang-analyzer-unix.Malloc]
           fp->i =3D 1;
           ~~~~~ ^
   lib/test_kasan_module.c:72:30: note: Left side of '&&' is false
           struct kasan_rcu_info *fp =3D container_of(rp,
                                       ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   lib/test_kasan_module.c:72:30: note: Taking false branch
           struct kasan_rcu_info *fp =3D container_of(rp,
                                       ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:323:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:311:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:303:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   lib/test_kasan_module.c:72:30: note: Loop condition is false.  Exiting l=
oop
           struct kasan_rcu_info *fp =3D container_of(rp,
                                       ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:323:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:311:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:301:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   lib/test_kasan_module.c:75:2: note: Memory is released
           kfree(fp);
           ^~~~~~~~~
   lib/test_kasan_module.c:76:8: note: Use of memory after it is freed
           fp->i =3D 1;
           ~~~~~ ^
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/iio/potentiometer/mcp41010.c:58:8: warning: Excessive padding in=
 'struct mcp41010_data' (86 padding bytes, where 22 is optimal). =

   Optimal fields order: =

   buf, =

   value, =

   spi, =


vim +/unused +41 lib/test_kasan_module.c

73228c7ecc5e40 Patricia Alfonso 2020-10-13  19  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  20  static noinline void __init=
 copy_user_test(void)
73228c7ecc5e40 Patricia Alfonso 2020-10-13  21  {
73228c7ecc5e40 Patricia Alfonso 2020-10-13  22  	char *kmem;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  23  	char __user *usermem;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  24  	size_t size =3D 10;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  25  	int unused;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  26  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  27  	kmem =3D kmalloc(size, GFP=
_KERNEL);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  28  	if (!kmem)
73228c7ecc5e40 Patricia Alfonso 2020-10-13  29  		return;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  30  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  31  	usermem =3D (char __user *=
)vm_mmap(NULL, 0, PAGE_SIZE,
73228c7ecc5e40 Patricia Alfonso 2020-10-13  32  			    PROT_READ | PROT_WRI=
TE | PROT_EXEC,
73228c7ecc5e40 Patricia Alfonso 2020-10-13  33  			    MAP_ANONYMOUS | MAP_=
PRIVATE, 0);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  34  	if (IS_ERR(usermem)) {
73228c7ecc5e40 Patricia Alfonso 2020-10-13  35  		pr_err("Failed to allocat=
e user memory\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  36  		kfree(kmem);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  37  		return;
73228c7ecc5e40 Patricia Alfonso 2020-10-13  38  	}
73228c7ecc5e40 Patricia Alfonso 2020-10-13  39  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  40  	pr_info("out-of-bounds in =
copy_from_user()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13 @41  	unused =3D copy_from_user(=
kmem, usermem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  42  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  43  	pr_info("out-of-bounds in =
copy_to_user()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  44  	unused =3D copy_to_user(us=
ermem, kmem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  45  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  46  	pr_info("out-of-bounds in =
__copy_from_user()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  47  	unused =3D __copy_from_use=
r(kmem, usermem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  48  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  49  	pr_info("out-of-bounds in =
__copy_to_user()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  50  	unused =3D __copy_to_user(=
usermem, kmem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  51  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  52  	pr_info("out-of-bounds in =
__copy_from_user_inatomic()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  53  	unused =3D __copy_from_use=
r_inatomic(kmem, usermem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  54  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  55  	pr_info("out-of-bounds in =
__copy_to_user_inatomic()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  56  	unused =3D __copy_to_user_=
inatomic(usermem, kmem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  57  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  58  	pr_info("out-of-bounds in =
strncpy_from_user()\n");
73228c7ecc5e40 Patricia Alfonso 2020-10-13  59  	unused =3D strncpy_from_us=
er(kmem, usermem, size + 1 + OOB_TAG_OFF);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  60  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  61  	vm_munmap((unsigned long)u=
sermem, PAGE_SIZE);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  62  	kfree(kmem);
73228c7ecc5e40 Patricia Alfonso 2020-10-13  63  }
73228c7ecc5e40 Patricia Alfonso 2020-10-13  64  =


:::::: The code at line 41 was first introduced by commit
:::::: 73228c7ecc5e40c0851c4703c5ec6ed38123e989 KASAN: port KASAN Tests to =
KUnit

:::::: TO: Patricia Alfonso <trishalfonso@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3609708291802161633==--

