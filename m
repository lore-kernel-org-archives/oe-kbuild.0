Content-Type: multipart/mixed; boundary="===============5597331472150941940=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] kunit: split resource API impl from test.c into new resource.c
Date: Sun, 27 Mar 2022 00:31:00 +0800
Message-ID: <202203270042.5RTZ2j0a-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5597331472150941940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220326002013.483394-2-dlatypov@google.com>
References: <20220326002013.483394-2-dlatypov@google.com>
TO: Daniel Latypov <dlatypov@google.com>
TO: brendanhiggins(a)google.com
TO: davidgow(a)google.com
CC: linux-kernel(a)vger.kernel.org
CC: kunit-dev(a)googlegroups.com
CC: linux-kselftest(a)vger.kernel.org
CC: skhan(a)linuxfoundation.org
CC: Daniel Latypov <dlatypov@google.com>

Hi Daniel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on b14ffae378aa1db993e62b01392e70d1e585fb23]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Latypov/kunit=
-split-resource-API-from-test-h-into-new-resource-h/20220326-082202
base:   b14ffae378aa1db993e62b01392e70d1e585fb23
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-c006-20220324 (https://download.01.org/0day-ci/arc=
hive/20220327/202203270042.5RTZ2j0a-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/38eca10f33d99e00e81=
b999ebeff960bb7f2e77b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Latypov/kunit-split-resourc=
e-API-from-test-h-into-new-resource-h/20220326-082202
        git checkout 38eca10f33d99e00e81b999ebeff960bb7f2e77b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                            ^~~
   crypto/drbg.c:1858:18: note: '?' condition is true
                   u32 cryptlen =3D min3(inlen, outlen, (u32)DRBG_OUTSCRATC=
HLEN);
                                  ^
   include/linux/minmax.h:60:23: note: expanded from macro 'min3'
   #define min3(x, y, z) min((typeof(x))min(x, y), z)
                         ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   crypto/drbg.c:1863:9: note: Calling 'crypto_wait_req'
                   ret =3D crypto_wait_req(crypto_skcipher_encrypt(drbg->ct=
r_req),
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/crypto.h:602:2: note: 'Default' branch taken. Execution co=
ntinues on line 611
           switch (err) {
           ^
   include/linux/crypto.h:611:2: note: Returning value (loaded from 'err'),=
 which participates in a condition later
           return err;
           ^~~~~~~~~~
   crypto/drbg.c:1863:9: note: Returning from 'crypto_wait_req'
                   ret =3D crypto_wait_req(crypto_skcipher_encrypt(drbg->ct=
r_req),
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   crypto/drbg.c:1865:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   crypto/drbg.c:1865:3: note: Taking false branch
                   if (ret)
                   ^
   crypto/drbg.c:1870:3: note: Null pointer passed as 1st argument to memor=
y copy function
                   memcpy(outbuf, drbg->outscratchpad, cryptlen);
                   ^      ~~~~~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   include/linux/scatterlist.h:76:9: warning: Access to field 'page_link' r=
esults in a dereference of a null pointer (loaded from variable 'sg') [clan=
g-analyzer-core.NullDereference]
           return sg->page_link & SG_PAGE_LINK_MASK;
                  ^
   lib/scatterlist.c:103:27: note: 'ret' initialized to a null pointer value
           struct scatterlist *sg, *ret =3D NULL;
                                    ^~~
   lib/scatterlist.c:106:30: note: Assuming 'i' is >=3D 'nents'
           for_each_sg(sgl, sg, nents, i)
                                       ^
   include/linux/scatterlist.h:169:31: note: expanded from macro 'for_each_=
sg'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
                                        ^~~~~~~~~~
   lib/scatterlist.c:106:2: note: Loop condition is false. Execution contin=
ues on line 109
           for_each_sg(sgl, sg, nents, i)
           ^
   include/linux/scatterlist.h:169:2: note: expanded from macro 'for_each_s=
g'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
           ^
   lib/scatterlist.c:109:21: note: Passing null pointer value via 1st param=
eter 'sg'
           BUG_ON(!sg_is_last(ret));
                              ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/scatterlist.c:109:10: note: Calling 'sg_is_last'
           BUG_ON(!sg_is_last(ret));
                   ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/scatterlist.h:91:20: note: Passing null pointer value via =
1st parameter 'sg'
           return __sg_flags(sg) & SG_END;
                             ^~
   include/linux/scatterlist.h:91:9: note: Calling '__sg_flags'
           return __sg_flags(sg) & SG_END;
                  ^~~~~~~~~~~~~~
   include/linux/scatterlist.h:76:9: note: Access to field 'page_link' resu=
lts in a dereference of a null pointer (loaded from variable 'sg')
           return sg->page_link & SG_PAGE_LINK_MASK;
                  ^~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> lib/kunit/resource.c:121:2: warning: Use of memory after it is freed [cl=
ang-analyzer-unix.Malloc]
           kunit_put_resource(res);
           ^                  ~~~
   lib/kunit/resource.c:115:6: note: Assuming 'res' is non-null
           if (!res)
               ^~~~
   lib/kunit/resource.c:115:2: note: Taking false branch
           if (!res)
           ^
   lib/kunit/resource.c:118:2: note: Calling 'kunit_remove_resource'
           kunit_remove_resource(test, res);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/resource.c:102:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&test->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   lib/kunit/resource.c:102:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&test->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   lib/kunit/resource.c:105:2: note: Calling 'kunit_put_resource'
           kunit_put_resource(res);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/resource.h:142:2: note: Calling 'kref_put'
           kref_put(&res->refcount, kunit_release_resource);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'kunit_release_resource'
                   release(kref);
                   ^~~~~~~~~~~~~
   include/kunit/resource.h:122:6: note: Assuming field 'free' is non-null
           if (res->free) {
               ^~~~~~~~~
   include/kunit/resource.h:122:2: note: Taking true branch
           if (res->free) {
           ^
   include/kunit/resource.h:124:3: note: Memory is released
                   kfree(res);
                   ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   include/kunit/resource.h:142:2: note: Returning; memory was released
           kref_put(&res->refcount, kunit_release_resource);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/resource.c:105:2: note: Returning; memory was released via 1st=
 parameter
           kunit_put_resource(res);
           ^~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/resource.c:118:2: note: Returning; memory was released via 2nd=
 parameter
           kunit_remove_resource(test, res);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/resource.c:121:2: note: Use of memory after it is freed
           kunit_put_resource(res);
           ^                  ~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   include/linux/mmzone.h:982:9: warning: Access to field 'pgdat' results i=
n a dereference of a null pointer (loaded from variable 'lruvec') [clang-an=
alyzer-core.NullDereference]
           return lruvec->pgdat;
                  ^
   mm/swap.c:741:2: note: Calling 'lru_add_and_bh_lrus_drain'
           lru_add_and_bh_lrus_drain();
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap.c:721:2: note: Loop condition is false.  Exiting loop
           local_lock(&lru_pvecs.lock);
           ^
   include/linux/local_lock.h:16:27: note: expanded from macro 'local_lock'
   #define local_lock(lock)                __local_lock(lock)
                                           ^
   include/linux/local_lock_internal.h:67:3: note: expanded from macro '__l=
ocal_lock'
                   preempt_disable();                              \
                   ^
   include/linux/preempt.h:201:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   mm/swap.c:721:2: note: Loop condition is false.  Exiting loop
           local_lock(&lru_pvecs.lock);
           ^
   include/linux/local_lock.h:16:27: note: expanded from macro 'local_lock'
   #define local_lock(lock)                __local_lock(lock)
                                           ^
   include/linux/local_lock_internal.h:68:22: note: expanded from macro '__=
local_lock'
                   local_lock_acquire(this_cpu_ptr(lock));         \
                                      ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)

vim +121 lib/kunit/resource.c

38eca10f33d99e0 Daniel Latypov 2022-03-25  108  =

38eca10f33d99e0 Daniel Latypov 2022-03-25  109  int kunit_destroy_resource(=
struct kunit *test, kunit_resource_match_t match,
38eca10f33d99e0 Daniel Latypov 2022-03-25  110  			   void *match_data)
38eca10f33d99e0 Daniel Latypov 2022-03-25  111  {
38eca10f33d99e0 Daniel Latypov 2022-03-25  112  	struct kunit_resource *res=
 =3D kunit_find_resource(test, match,
38eca10f33d99e0 Daniel Latypov 2022-03-25  113  							 match_data);
38eca10f33d99e0 Daniel Latypov 2022-03-25  114  =

38eca10f33d99e0 Daniel Latypov 2022-03-25  115  	if (!res)
38eca10f33d99e0 Daniel Latypov 2022-03-25  116  		return -ENOENT;
38eca10f33d99e0 Daniel Latypov 2022-03-25  117  =

38eca10f33d99e0 Daniel Latypov 2022-03-25  118  	kunit_remove_resource(test=
, res);
38eca10f33d99e0 Daniel Latypov 2022-03-25  119  =

38eca10f33d99e0 Daniel Latypov 2022-03-25  120  	/* We have a reference als=
o via _find(); drop it. */
38eca10f33d99e0 Daniel Latypov 2022-03-25 @121  	kunit_put_resource(res);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5597331472150941940==--

