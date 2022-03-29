Content-Type: multipart/mixed; boundary="===============5549835418182555487=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [topic/core-for-CI] dma-buf: Check for empty dma_fence_array
Date: Tue, 29 Mar 2022 08:03:23 +0800
Message-ID: <202203290823.r8fGtVdF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5549835418182555487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220328102144.1374607-1-tejaskumarx.surendrakumar.upadhyay(a=
)intel.com>
References: <20220328102144.1374607-1-tejaskumarx.surendrakumar.upadhyay@=
intel.com>
TO: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
TO: intel-gfx(a)lists.freedesktop.org
CC: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

Hi Tejas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220328]
[cannot apply to linus/master v5.17 v5.17-rc8 v5.17-rc7 v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tejas-Upadhyay/dma-b=
uf-Check-for-empty-dma_fence_array/20220328-183641
base:    8515d05bf6bcdc8873c576ae6a721985389a3bd1
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archi=
ve/20220329/202203290823.r8fGtVdF-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/2a2ee3b19ec028a0682=
7f5175120b326a466a822
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tejas-Upadhyay/dma-buf-Check-for-e=
mpty-dma_fence_array/20220328-183641
        git checkout 2a2ee3b19ec028a06827f5175120b326a466a822
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   44 warnings generated.
   drivers/gpu/drm/drm_mipi_dsi.c:536:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(packet, 0, sizeof(*packet));
           ^~~~~~
   drivers/gpu/drm/drm_mipi_dsi.c:536:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(packet, 0, sizeof(*packet));
           ^~~~~~
   drivers/gpu/drm/drm_mipi_dsi.c:846:3: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&tx[1], data, len);
                   ^~~~~~
   drivers/gpu/drm/drm_mipi_dsi.c:846:3: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&tx[1], data, len);
                   ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/leds/leds-88pm860x.c:167:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data->name, 0, MFD_NAME_SIZE);
           ^~~~~~
   drivers/leds/leds-88pm860x.c:167:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(data->name, 0, MFD_NAME_SIZE);
           ^~~~~~
   drivers/leds/leds-88pm860x.c:171:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(data->name, "led0-red");
                   ^~~~~~~
   drivers/leds/leds-88pm860x.c:171:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(data->name, "led0-red");
                   ^~~~~~~
   drivers/leds/leds-88pm860x.c:175:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(data->name, "led0-green");
                   ^~~~~~~
   drivers/leds/leds-88pm860x.c:175:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(data->name, "led0-green");
                   ^~~~~~~
   drivers/leds/leds-88pm860x.c:179:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(data->name, "led0-blue");
                   ^~~~~~~
   drivers/leds/leds-88pm860x.c:179:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(data->name, "led0-blue");
                   ^~~~~~~
   drivers/leds/leds-88pm860x.c:183:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(data->name, "led1-red");
                   ^~~~~~~
   drivers/leds/leds-88pm860x.c:183:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(data->name, "led1-red");
                   ^~~~~~~
   drivers/leds/leds-88pm860x.c:187:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(data->name, "led1-green");
                   ^~~~~~~
   drivers/leds/leds-88pm860x.c:187:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(data->name, "led1-green");
                   ^~~~~~~
   drivers/leds/leds-88pm860x.c:191:3: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(data->name, "led1-blue");
                   ^~~~~~~
   drivers/leds/leds-88pm860x.c:191:3: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(data->name, "led1-blue");
                   ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/gpu/drm/selftests/test-drm_buddy.c:523:7: warning: Value stored =
to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                                                   err =3D 0;
                                                   ^     ~
   drivers/gpu/drm/selftests/test-drm_buddy.c:523:7: note: Value stored to =
'err' is never read
                                                   err =3D 0;
                                                   ^     ~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/gpu/drm/drm_cache.c:219:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst->vaddr, src->vaddr, len);
                   ^~~~~~
   drivers/gpu/drm/drm_cache.c:219:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst->vaddr, src->vaddr, len);
                   ^~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
>> drivers/dma-buf/dma-fence-array.c:193:34: warning: Array access (from va=
riable 'fences') results in a null pointer dereference [clang-analyzer-core=
.NullDereference]
                   WARN_ON(dma_fence_is_container(fences[num_fences]));
                                                  ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/dma-buf/dma-fence-array.c:162:10: note: Assuming 'num_fences' is=
 not equal to 0
           WARN_ON(!num_fences || !fences);
                   ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/dma-buf/dma-fence-array.c:162:10: note: Left side of '||' is fal=
se
           WARN_ON(!num_fences || !fences);
                   ^
   drivers/dma-buf/dma-fence-array.c:162:25: note: Assuming 'fences' is null
           WARN_ON(!num_fences || !fences);
                                  ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/dma-buf/dma-fence-array.c:166:10: note: Calling 'kzalloc'
           array =3D kzalloc(size, GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:569:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:586:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:714:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-fence-array.c:166:10: note: Returning from 'kzalloc'
           array =3D kzalloc(size, GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-fence-array.c:167:6: note: Assuming 'array' is non-n=
ull
           if (!array)
               ^~~~~~
   drivers/dma-buf/dma-fence-array.c:167:2: note: Taking false branch
           if (!array)
           ^
   drivers/dma-buf/dma-fence-array.c:170:2: note: Loop condition is false. =
 Exiting loop
           spin_lock_init(&array->lock);
           ^
   include/linux/spinlock.h:344:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/dma-buf/dma-fence-array.c:176:34: note: Assuming 'signal_on_any'=
 is true
           atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
                                           ^~~~~~~~~~~~~
   drivers/dma-buf/dma-fence-array.c:176:34: note: '?' condition is true
   drivers/dma-buf/dma-fence-array.c:192:2: note: Loop condition is true.  =
Entering loop body
           while (num_fences--)
           ^
   drivers/dma-buf/dma-fence-array.c:193:34: note: Array access (from varia=
ble 'fences') results in a null pointer dereference
                   WARN_ON(dma_fence_is_container(fences[num_fences]));
                                                  ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   Suppressed 23 warnings (23 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   mm/slab_common.c:1062:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&sinfo, 0, sizeof(sinfo));
           ^~~~~~
   mm/slab_common.c:1062:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&sinfo, 0, sizeof(sinfo));
           ^~~~~~
   mm/slab_common.c:1188:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ret, kasan_reset_tag(p), ks);
                   ^~~~~~
   mm/slab_common.c:1188:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(ret, kasan_reset_tag(p), ks);
                   ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/mux/mmio.c:93:15: warning: 1st function call argument is an unin=
itialized value [clang-analyzer-core.CallAndMessage]
                   field.msb =3D fls(mask) - 1;
                               ^   ~~~~
   drivers/mux/mmio.c:47:6: note: Assuming the condition is true
           if (of_device_is_compatible(np, "mmio-mux"))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mux/mmio.c:47:2: note: Taking true branch

vim +/fences +193 drivers/dma-buf/dma-fence-array.c

b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  134  =

b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  135  /**
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25=
  136   * dma_fence_array_create - Create a custom fence array
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  137   * @num_fences:		[in]	number of fences to add in the array
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  138   * @fences:		[in]	array containing the fences
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  139   * @context:		[in]	fence context to use
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  140   * @seqno:		[in]	sequence number to use
68acb6afb6f56d drivers/dma-buf/fence-array.c     Randy Dunlap    2016-08-16=
  141   * @signal_on_any:	[in]	signal on any fence in the array
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  142   *
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25=
  143   * Allocate a dma_fence_array object and initialize the base fence w=
ith
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25=
  144   * dma_fence_init().
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  145   * In case of error it returns NULL.
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  146   *
68acb6afb6f56d drivers/dma-buf/fence-array.c     Randy Dunlap    2016-08-16=
  147   * The caller should allocate the fences array with num_fences size
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  148   * and fill it with the fences it wants to add to the object. Owners=
hip of this
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25=
  149   * array is taken and dma_fence_put() is used on each fence on relea=
se.
f71045689656e3 drivers/dma-buf/fence-array.c     Christian K=C3=B6nig 2016-=
06-01  150   *
f71045689656e3 drivers/dma-buf/fence-array.c     Christian K=C3=B6nig 2016-=
06-01  151   * If @signal_on_any is true the fence array signals if any fen=
ce in the array
f71045689656e3 drivers/dma-buf/fence-array.c     Christian K=C3=B6nig 2016-=
06-01  152   * signals, otherwise it signals when all fences in the array s=
ignal.
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  153   */
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25=
  154  struct dma_fence_array *dma_fence_array_create(int num_fences,
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25=
  155  					       struct dma_fence **fences,
f71045689656e3 drivers/dma-buf/fence-array.c     Christian K=C3=B6nig 2016-=
06-01  156  					       u64 context, unsigned seqno,
f71045689656e3 drivers/dma-buf/fence-array.c     Christian K=C3=B6nig 2016-=
06-01  157  					       bool signal_on_any)
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  158  {
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25=
  159  	struct dma_fence_array *array;
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  160  	size_t size =3D sizeof(*array);
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  161  =

2a2ee3b19ec028 drivers/dma-buf/dma-fence-array.c Tejas Upadhyay  2022-03-28=
  162  	WARN_ON(!num_fences || !fences);
2a2ee3b19ec028 drivers/dma-buf/dma-fence-array.c Tejas Upadhyay  2022-03-28=
  163  =

b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  164  	/* Allocate the callback structures behind the array. */
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25=
  165  	size +=3D num_fences * sizeof(struct dma_fence_array_cb);
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  166  	array =3D kzalloc(size, GFP_KERNEL);
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  167  	if (!array)
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  168  		return NULL;
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  169  =

b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  170  	spin_lock_init(&array->lock);
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25=
  171  	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  172  		       context, seqno);
03e4e0a9e02cf7 drivers/dma-buf/dma-fence-array.c Chris Wilson    2017-11-14=
  173  	init_irq_work(&array->work, irq_dma_fence_array_work);
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  174  =

b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  175  	array->num_fences =3D num_fences;
f71045689656e3 drivers/dma-buf/fence-array.c     Christian K=C3=B6nig 2016-=
06-01  176  	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences=
);
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  177  	array->fences =3D fences;
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  178  =

1f70b8b812f36c drivers/dma-buf/dma-fence-array.c Chris Wilson    2019-08-11=
  179  	array->base.error =3D PENDING_ERROR;
1f70b8b812f36c drivers/dma-buf/dma-fence-array.c Chris Wilson    2019-08-11=
  180  =

0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  181  	/*
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  182  	 * dma_fence_array objects should never contain any other fence
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  183  	 * containers or otherwise we run into recursion and potential=
 kernel
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  184  	 * stack overflow on operations on the dma_fence_array.
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  185  	 *
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  186  	 * The correct way of handling this is to flatten out the arra=
y by the
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  187  	 * caller instead.
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  188  	 *
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  189  	 * Enforce this here by checking that we don't create a dma_fe=
nce_array
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  190  	 * with any container inside.
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  191  	 */
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  192  	while (num_fences--)
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19 @193  		WARN_ON(dma_fence_is_container(fences[num_fences]));
0fd9803b985e5d drivers/dma-buf/dma-fence-array.c Christian K=C3=B6nig 2022-=
01-19  194  =

b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  195  	return array;
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01=
  196  }
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25=
  197  EXPORT_SYMBOL(dma_fence_array_create);
d5b72a2123dfaf drivers/dma-buf/dma-fence-array.c Philipp Zabel   2017-03-17=
  198  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5549835418182555487==--

