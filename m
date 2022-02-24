Content-Type: multipart/mixed; boundary="===============1685910624314447148=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 6/7] drm/selftests: add drm buddy smoke testcase
Date: Thu, 24 Feb 2022 15:29:43 +0800
Message-ID: <202202241557.OlRdm0XW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1685910624314447148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220222174845.2175-6-Arunpravin.PaneerSelvam@amd.com>
References: <20220222174845.2175-6-Arunpravin.PaneerSelvam@amd.com>
TO: Arunpravin <Arunpravin.PaneerSelvam@amd.com>

Hi Arunpravin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 95ee2a8b4b3cd1fb25f7e14e2202da4045030173]

url:    https://github.com/0day-ci/linux/commits/Arunpravin/drm-selftests-M=
ove-i915-buddy-selftests-into-drm/20220223-015043
base:   95ee2a8b4b3cd1fb25f7e14e2202da4045030173
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220221 (https://download.01.org/0day-ci/arc=
hive/20220224/202202241557.OlRdm0XW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/271cd8b85cae0e00ce0fa9c54=
a02455f17ba611b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Arunpravin/drm-selftests-Move-i915=
-buddy-selftests-into-drm/20220223-015043
        git checkout 271cd8b85cae0e00ce0fa9c54a02455f17ba611b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   net/core/sock_map.c:1071:6: note: Assuming field 'max_entries' is not eq=
ual to 0
           if (attr->max_entries =3D=3D 0 ||
               ^~~~~~~~~~~~~~~~~~~~~~
   net/core/sock_map.c:1071:6: note: Left side of '||' is false
   net/core/sock_map.c:1072:6: note: Assuming field 'key_size' is not equal=
 to 0
               attr->key_size    =3D=3D 0 ||
               ^~~~~~~~~~~~~~~~~~~~~~
   net/core/sock_map.c:1071:6: note: Left side of '||' is false
           if (attr->max_entries =3D=3D 0 ||
               ^
   net/core/sock_map.c:1073:7: note: Assuming the condition is false
               (attr->value_size !=3D sizeof(u32) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/sock_map.c:1073:39: note: Left side of '&&' is false
               (attr->value_size !=3D sizeof(u32) &&
                                                ^
   net/core/sock_map.c:1075:6: note: Assuming the condition is false
               attr->map_flags & ~SOCK_CREATE_FLAG_MASK)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/sock_map.c:1071:2: note: Taking false branch
           if (attr->max_entries =3D=3D 0 ||
           ^
   net/core/sock_map.c:1077:6: note: Assuming field 'key_size' is <=3D MAX_=
BPF_STACK
           if (attr->key_size > MAX_BPF_STACK)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/sock_map.c:1077:2: note: Taking false branch
           if (attr->key_size > MAX_BPF_STACK)
           ^
   net/core/sock_map.c:1081:6: note: Assuming 'htab' is non-null
           if (!htab)
               ^~~~~
   net/core/sock_map.c:1081:2: note: Taking false branch
           if (!htab)
           ^
   net/core/sock_map.c:1086:22: note: '?' condition is false
           htab->buckets_num =3D roundup_pow_of_two(htab->map.max_entries);
                               ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   net/core/sock_map.c:1086:22: note: Calling '__roundup_pow_of_two'
           htab->buckets_num =3D roundup_pow_of_two(htab->map.max_entries);
                               ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:154:2: note: Taking false branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:156:9: note: Calling 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/asm-generic/bitops/fls64.h:29:6: note: Assuming 'x' is not equal=
 to 0
           if (x =3D=3D 0)
               ^~~~~~
   include/asm-generic/bitops/fls64.h:29:2: note: Taking false branch
           if (x =3D=3D 0)
           ^
   include/asm-generic/bitops/fls64.h:31:2: note: Returning the value 64
           return __fls(x) + 1;
           ^~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:156:9: note: Returning from 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/linux/bitops.h:156:2: note: Returning the value 64
           return fls64(l);
           ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '64', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
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
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/gpu/drm/selftests/test-drm_buddy.c:393:7: warning: Value stored =
to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                                                   err =3D 0;
                                                   ^     ~
   drivers/gpu/drm/selftests/test-drm_buddy.c:393:7: note: Value stored to =
'err' is never read
                                                   err =3D 0;
                                                   ^     ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/gpu/drm/drm_mode_config.c:443:4: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D drm_modeset_backoff(&modeset_ctx);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mode_config.c:443:4: note: Value stored to 'ret' is =
never read
                           ret =3D drm_modeset_backoff(&modeset_ctx);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/gpu/drm/drm_syncobj.c:568:2: warning: Use of memory after it is =
freed [clang-analyzer-unix.Malloc]
           drm_syncobj_put(syncobj);
           ^
   drivers/gpu/drm/drm_syncobj.c:781:2: note: Taking false branch
           if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
           ^
   drivers/gpu/drm/drm_syncobj.c:785:6: note: Assuming the condition is fal=
se
           if (args->flags & ~DRM_SYNCOBJ_CREATE_SIGNALED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:785:2: note: Taking false branch
           if (args->flags & ~DRM_SYNCOBJ_CREATE_SIGNALED)
           ^
   drivers/gpu/drm/drm_syncobj.c:788:9: note: Calling 'drm_syncobj_create_a=
s_handle'
           return drm_syncobj_create_as_handle(file_private,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:563:8: note: Calling 'drm_syncobj_create'
           ret =3D drm_syncobj_create(&syncobj, flags, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:498:6: note: Assuming 'syncobj' is non-null
           if (!syncobj)
               ^~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:498:2: note: Taking false branch
           if (!syncobj)
           ^
   drivers/gpu/drm/drm_syncobj.c:503:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_init(&syncobj->lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/gpu/drm/drm_syncobj.c:505:6: note: Assuming the condition is fal=
se
           if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:505:2: note: Taking false branch
           if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
           ^
   drivers/gpu/drm/drm_syncobj.c:513:6: note: 'fence' is null
           if (fence)
               ^~~~~
   drivers/gpu/drm/drm_syncobj.c:513:2: note: Taking false branch
           if (fence)
           ^
   drivers/gpu/drm/drm_syncobj.c:563:8: note: Returning from 'drm_syncobj_c=
reate'
           ret =3D drm_syncobj_create(&syncobj, flags, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:564:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/drm_syncobj.c:564:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/drm_syncobj.c:567:8: note: Calling 'drm_syncobj_get_hand=
le'
           ret =3D drm_syncobj_get_handle(file_private, syncobj, handle);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:547:6: note: Assuming 'ret' is < 0
           if (ret < 0) {
               ^~~~~~~
   drivers/gpu/drm/drm_syncobj.c:547:2: note: Taking true branch
           if (ret < 0) {
           ^
   drivers/gpu/drm/drm_syncobj.c:548:3: note: Calling 'drm_syncobj_put'
                   drm_syncobj_put(syncobj);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_syncobj.h:88:2: note: Calling 'kref_put'
           kref_put(&obj->refcount, drm_syncobj_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'drm_syncobj_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:475:2: note: Memory is released
           kfree(syncobj);
           ^~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);

vim +/err +393 drivers/gpu/drm/selftests/test-drm_buddy.c

02a2580d672ea3 Arunpravin 2022-02-22  340  =

271cd8b85cae0e Arunpravin 2022-02-22  341  static int igt_buddy_alloc_smoke=
(void *arg)
271cd8b85cae0e Arunpravin 2022-02-22  342  {
271cd8b85cae0e Arunpravin 2022-02-22  343  	u64 mm_size, min_page_size, chu=
nk_size, start =3D 0;
271cd8b85cae0e Arunpravin 2022-02-22  344  	unsigned long flags =3D 0;
271cd8b85cae0e Arunpravin 2022-02-22  345  	struct drm_buddy mm;
271cd8b85cae0e Arunpravin 2022-02-22  346  	int *order;
271cd8b85cae0e Arunpravin 2022-02-22  347  	int err, i;
271cd8b85cae0e Arunpravin 2022-02-22  348  =

271cd8b85cae0e Arunpravin 2022-02-22  349  	DRM_RND_STATE(prng, random_seed=
);
271cd8b85cae0e Arunpravin 2022-02-22  350  	IGT_TIMEOUT(end_time);
271cd8b85cae0e Arunpravin 2022-02-22  351  =

271cd8b85cae0e Arunpravin 2022-02-22  352  	igt_mm_config(&mm_size, &chunk_=
size);
271cd8b85cae0e Arunpravin 2022-02-22  353  =

271cd8b85cae0e Arunpravin 2022-02-22  354  	err =3D drm_buddy_init(&mm, mm_=
size, chunk_size);
271cd8b85cae0e Arunpravin 2022-02-22  355  	if (err) {
271cd8b85cae0e Arunpravin 2022-02-22  356  		pr_err("buddy_init failed(%d)\=
n", err);
271cd8b85cae0e Arunpravin 2022-02-22  357  		return err;
271cd8b85cae0e Arunpravin 2022-02-22  358  	}
271cd8b85cae0e Arunpravin 2022-02-22  359  =

271cd8b85cae0e Arunpravin 2022-02-22  360  	order =3D drm_random_order(mm.m=
ax_order + 1, &prng);
271cd8b85cae0e Arunpravin 2022-02-22  361  	if (!order)
271cd8b85cae0e Arunpravin 2022-02-22  362  		goto out_fini;
271cd8b85cae0e Arunpravin 2022-02-22  363  =

271cd8b85cae0e Arunpravin 2022-02-22  364  	for (i =3D 0; i <=3D mm.max_ord=
er; ++i) {
271cd8b85cae0e Arunpravin 2022-02-22  365  		struct drm_buddy_block *block;
271cd8b85cae0e Arunpravin 2022-02-22  366  		int max_order =3D order[i];
271cd8b85cae0e Arunpravin 2022-02-22  367  		bool timeout =3D false;
271cd8b85cae0e Arunpravin 2022-02-22  368  		LIST_HEAD(blocks);
271cd8b85cae0e Arunpravin 2022-02-22  369  		u64 total, size;
271cd8b85cae0e Arunpravin 2022-02-22  370  		LIST_HEAD(tmp);
271cd8b85cae0e Arunpravin 2022-02-22  371  		int order;
271cd8b85cae0e Arunpravin 2022-02-22  372  =

271cd8b85cae0e Arunpravin 2022-02-22  373  		err =3D igt_check_mm(&mm);
271cd8b85cae0e Arunpravin 2022-02-22  374  		if (err) {
271cd8b85cae0e Arunpravin 2022-02-22  375  			pr_err("pre-mm check failed, =
abort\n");
271cd8b85cae0e Arunpravin 2022-02-22  376  			break;
271cd8b85cae0e Arunpravin 2022-02-22  377  		}
271cd8b85cae0e Arunpravin 2022-02-22  378  =

271cd8b85cae0e Arunpravin 2022-02-22  379  		order =3D max_order;
271cd8b85cae0e Arunpravin 2022-02-22  380  		total =3D 0;
271cd8b85cae0e Arunpravin 2022-02-22  381  =

271cd8b85cae0e Arunpravin 2022-02-22  382  		do {
271cd8b85cae0e Arunpravin 2022-02-22  383  retry:
271cd8b85cae0e Arunpravin 2022-02-22  384  			size =3D min_page_size =3D ge=
t_size(order, chunk_size);
271cd8b85cae0e Arunpravin 2022-02-22  385  			err =3D drm_buddy_alloc_block=
s(&mm, start, mm_size, size,
271cd8b85cae0e Arunpravin 2022-02-22  386  						     min_page_size, &tmp, =
flags);
271cd8b85cae0e Arunpravin 2022-02-22  387  			if (err) {
271cd8b85cae0e Arunpravin 2022-02-22  388  				if (err =3D=3D -ENOMEM) {
271cd8b85cae0e Arunpravin 2022-02-22  389  					pr_info("buddy_alloc hit -E=
NOMEM with order=3D%d\n",
271cd8b85cae0e Arunpravin 2022-02-22  390  						order);
271cd8b85cae0e Arunpravin 2022-02-22  391  				} else {
271cd8b85cae0e Arunpravin 2022-02-22  392  					if (order--) {
271cd8b85cae0e Arunpravin 2022-02-22 @393  						err =3D 0;
271cd8b85cae0e Arunpravin 2022-02-22  394  						goto retry;
271cd8b85cae0e Arunpravin 2022-02-22  395  					}
271cd8b85cae0e Arunpravin 2022-02-22  396  =

271cd8b85cae0e Arunpravin 2022-02-22  397  					pr_err("buddy_alloc with or=
der=3D%d failed(%d)\n",
271cd8b85cae0e Arunpravin 2022-02-22  398  					       order, err);
271cd8b85cae0e Arunpravin 2022-02-22  399  				}
271cd8b85cae0e Arunpravin 2022-02-22  400  =

271cd8b85cae0e Arunpravin 2022-02-22  401  				break;
271cd8b85cae0e Arunpravin 2022-02-22  402  			}
271cd8b85cae0e Arunpravin 2022-02-22  403  =

271cd8b85cae0e Arunpravin 2022-02-22  404  			block =3D list_first_entry_or=
_null(&tmp,
271cd8b85cae0e Arunpravin 2022-02-22  405  							 struct drm_buddy_block,
271cd8b85cae0e Arunpravin 2022-02-22  406  							 link);
271cd8b85cae0e Arunpravin 2022-02-22  407  			if (!block) {
271cd8b85cae0e Arunpravin 2022-02-22  408  				pr_err("alloc_blocks has no =
blocks\n");
271cd8b85cae0e Arunpravin 2022-02-22  409  				err =3D -EINVAL;
271cd8b85cae0e Arunpravin 2022-02-22  410  				break;
271cd8b85cae0e Arunpravin 2022-02-22  411  			}
271cd8b85cae0e Arunpravin 2022-02-22  412  =

271cd8b85cae0e Arunpravin 2022-02-22  413  			list_move_tail(&block->link, =
&blocks);
271cd8b85cae0e Arunpravin 2022-02-22  414  =

271cd8b85cae0e Arunpravin 2022-02-22  415  			if (drm_buddy_block_order(blo=
ck) !=3D order) {
271cd8b85cae0e Arunpravin 2022-02-22  416  				pr_err("buddy_alloc order mi=
smatch\n");
271cd8b85cae0e Arunpravin 2022-02-22  417  				err =3D -EINVAL;
271cd8b85cae0e Arunpravin 2022-02-22  418  				break;
271cd8b85cae0e Arunpravin 2022-02-22  419  			}
271cd8b85cae0e Arunpravin 2022-02-22  420  =

271cd8b85cae0e Arunpravin 2022-02-22  421  			total +=3D drm_buddy_block_si=
ze(&mm, block);
271cd8b85cae0e Arunpravin 2022-02-22  422  =

271cd8b85cae0e Arunpravin 2022-02-22  423  			if (__igt_timeout(end_time, N=
ULL)) {
271cd8b85cae0e Arunpravin 2022-02-22  424  				timeout =3D true;
271cd8b85cae0e Arunpravin 2022-02-22  425  				break;
271cd8b85cae0e Arunpravin 2022-02-22  426  			}
271cd8b85cae0e Arunpravin 2022-02-22  427  		} while (total < mm.size);
271cd8b85cae0e Arunpravin 2022-02-22  428  =

271cd8b85cae0e Arunpravin 2022-02-22  429  		if (!err)
271cd8b85cae0e Arunpravin 2022-02-22  430  			err =3D igt_check_blocks(&mm,=
 &blocks, total, false);
271cd8b85cae0e Arunpravin 2022-02-22  431  =

271cd8b85cae0e Arunpravin 2022-02-22  432  		drm_buddy_free_list(&mm, &bloc=
ks);
271cd8b85cae0e Arunpravin 2022-02-22  433  =

271cd8b85cae0e Arunpravin 2022-02-22  434  		if (!err) {
271cd8b85cae0e Arunpravin 2022-02-22  435  			err =3D igt_check_mm(&mm);
271cd8b85cae0e Arunpravin 2022-02-22  436  			if (err)
271cd8b85cae0e Arunpravin 2022-02-22  437  				pr_err("post-mm check failed=
\n");
271cd8b85cae0e Arunpravin 2022-02-22  438  		}
271cd8b85cae0e Arunpravin 2022-02-22  439  =

271cd8b85cae0e Arunpravin 2022-02-22  440  		if (err || timeout)
271cd8b85cae0e Arunpravin 2022-02-22  441  			break;
271cd8b85cae0e Arunpravin 2022-02-22  442  =

271cd8b85cae0e Arunpravin 2022-02-22  443  		cond_resched();
271cd8b85cae0e Arunpravin 2022-02-22  444  	}
271cd8b85cae0e Arunpravin 2022-02-22  445  =

271cd8b85cae0e Arunpravin 2022-02-22  446  	if (err =3D=3D -ENOMEM)
271cd8b85cae0e Arunpravin 2022-02-22  447  		err =3D 0;
271cd8b85cae0e Arunpravin 2022-02-22  448  =

271cd8b85cae0e Arunpravin 2022-02-22  449  	kfree(order);
271cd8b85cae0e Arunpravin 2022-02-22  450  out_fini:
271cd8b85cae0e Arunpravin 2022-02-22  451  	drm_buddy_fini(&mm);
271cd8b85cae0e Arunpravin 2022-02-22  452  =

271cd8b85cae0e Arunpravin 2022-02-22  453  	return err;
271cd8b85cae0e Arunpravin 2022-02-22  454  }
271cd8b85cae0e Arunpravin 2022-02-22  455  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1685910624314447148==--

