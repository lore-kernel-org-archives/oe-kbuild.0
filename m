Content-Type: multipart/mixed; boundary="===============4191563714259385129=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/9] mm: remove set_page_count() from page_frag_alloc_align
Date: Sun, 02 Jan 2022 20:18:02 +0800
Message-ID: <202201022054.ufnNk7Fu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4191563714259385129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211221150140.988298-4-pasha.tatashin@soleen.com>
References: <20211221150140.988298-4-pasha.tatashin@soleen.com>
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
TO: pasha.tatashin(a)soleen.com
TO: linux-kernel(a)vger.kernel.org
TO: linux-mm(a)kvack.org
TO: linux-m68k(a)lists.linux-m68k.org
TO: anshuman.khandual(a)arm.com
TO: willy(a)infradead.org
TO: akpm(a)linux-foundation.org
TO: william.kucharski(a)oracle.com
TO: mike.kravetz(a)oracle.com
TO: vbabka(a)suse.cz

Hi Pasha,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on hnaz-mm/master]
[also build test WARNING on rostedt-trace/for-next geert-m68k/for-next linu=
x/master linus/master v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pasha-Tatashin/Hardening-p=
age-_refcount/20211221-230439
base:   https://github.com/hnaz/linux-mm master
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-c007-20211231 (https://download.01.org/0day-ci/ar=
chive/20220102/202201022054.ufnNk7Fu-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7cd109=
b92c72855937273a6c8ab19016fbe27d33)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2add304c6e5eb6206507d871c=
cfd11349cc32586
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Pasha-Tatashin/Hardening-page-_ref=
count/20211221-230439
        git checkout 2add304c6e5eb6206507d871ccfd11349cc32586
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   mm/page_alloc.c:5287:3: note: Taking false branch
                   if (unlikely(!page)) {
                   ^
   mm/page_alloc.c:5296:7: note: Assuming 'page_list' is null
                   if (page_list)
                       ^~~~~~~~~
   mm/page_alloc.c:5296:3: note: Taking false branch
                   if (page_list)
                   ^
   mm/page_alloc.c:5299:29: note: Array access (from variable 'page_array')=
 results in a null pointer dereference
                           page_array[nr_populated] =3D page;
                           ~~~~~~~~~~               ^
   mm/page_alloc.c:5320:29: warning: Array access (from variable 'page_arra=
y') results in a null pointer dereference [clang-analyzer-core.NullDerefere=
nce]
                           page_array[nr_populated] =3D page;
                           ~~~~~~~~~~               ^
   mm/page_alloc.c:5205:9: note: Assuming 'page_array' is null
           while (page_array && nr_populated < nr_pages && page_array[nr_po=
pulated])
                  ^~~~~~~~~~
   mm/page_alloc.c:5205:20: note: Left side of '&&' is false
           while (page_array && nr_populated < nr_pages && page_array[nr_po=
pulated])
                             ^
   mm/page_alloc.c:5209:15: note: Assuming 'nr_pages' is > 0
           if (unlikely(nr_pages <=3D 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/page_alloc.c:5209:2: note: Taking false branch
           if (unlikely(nr_pages <=3D 0))
           ^
   mm/page_alloc.c:5213:15: note: 'page_array' is null
           if (unlikely(page_array && nr_pages - nr_populated =3D=3D 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/page_alloc.c:5213:26: note: Left side of '&&' is false
           if (unlikely(page_array && nr_pages - nr_populated =3D=3D 0))
                                   ^
   mm/page_alloc.c:5213:2: note: Taking false branch
           if (unlikely(page_array && nr_pages - nr_populated =3D=3D 0))
           ^
   mm/page_alloc.c:5217:6: note: Calling 'memcg_kmem_enabled'
           if (memcg_kmem_enabled() && (gfp & __GFP_ACCOUNT))
               ^~~~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h:1714:9: note: Left side of '&&' is false
           return static_branch_likely(&memcg_kmem_enabled_key);
                  ^
   include/linux/jump_label.h:507:49: note: expanded from macro 'static_bra=
nch_likely'
   #define static_branch_likely(x)         likely_notrace(static_key_enable=
d(&(x)->key))
                                                          ^
   include/linux/jump_label.h:416:67: note: expanded from macro 'static_key=
_enabled'
           if (!__builtin_types_compatible_p(typeof(*x), struct static_key)=
 &&     \
                                                                           =
 ^
   include/linux/memcontrol.h:1714:9: note: Assuming the condition is true
           return static_branch_likely(&memcg_kmem_enabled_key);
                  ^
   include/linux/jump_label.h:507:49: note: expanded from macro 'static_bra=
nch_likely'
   #define static_branch_likely(x)         likely_notrace(static_key_enable=
d(&(x)->key))
                                           ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   include/linux/jump_label.h:420:2: note: expanded from macro 'static_key_=
enabled'
           static_key_count((struct static_key *)x) > 0;                   =
        \
           ^
   include/linux/compiler.h:79:35: note: expanded from macro 'likely_notrac=
e'
   # define likely_notrace(x)      likely(x)
                                   ~~~~~~~^~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/memcontrol.h:1714:2: note: Returning the value 1, which pa=
rticipates in a condition later
           return static_branch_likely(&memcg_kmem_enabled_key);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5217:6: note: Returning from 'memcg_kmem_enabled'
           if (memcg_kmem_enabled() && (gfp & __GFP_ACCOUNT))
               ^~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5217:6: note: Left side of '&&' is true
   mm/page_alloc.c:5217:31: note: Assuming the condition is true
           if (memcg_kmem_enabled() && (gfp & __GFP_ACCOUNT))
                                        ^~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5217:2: note: Taking true branch
           if (memcg_kmem_enabled() && (gfp & __GFP_ACCOUNT))
           ^
   mm/page_alloc.c:5218:3: note: Control jumps to line 5315
                   goto failed;
                   ^
   mm/page_alloc.c:5316:6: note: Assuming 'page' is non-null
           if (page) {
               ^~~~
   mm/page_alloc.c:5316:2: note: Taking true branch
           if (page) {
           ^
   mm/page_alloc.c:5317:7: note: Assuming 'page_list' is null
                   if (page_list)
                       ^~~~~~~~~
   mm/page_alloc.c:5317:3: note: Taking false branch
                   if (page_list)
                   ^
   mm/page_alloc.c:5320:29: note: Array access (from variable 'page_array')=
 results in a null pointer dereference
                           page_array[nr_populated] =3D page;
                           ~~~~~~~~~~               ^
>> mm/page_alloc.c:5559:3: warning: Value stored to 'refcnt' is never read =
[clang-analyzer-deadcode.DeadStores]
                   refcnt =3D page_ref_add_return(page, PAGE_FRAG_CACHE_MAX=
_SIZE + 1);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   mm/page_alloc.c:5559:3: note: Value stored to 'refcnt' is never read
                   refcnt =3D page_ref_add_return(page, PAGE_FRAG_CACHE_MAX=
_SIZE + 1);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   mm/page_alloc.c:8380:3: warning: Division by zero [clang-analyzer-core.D=
ivideZero]
                   do_div(tmp, lowmem_pages);
                   ^
   include/asm-generic/div64.h:48:26: note: expanded from macro 'do_div'
           __rem =3D ((uint64_t)(n)) % __base;                       \
                                   ^
   mm/page_alloc.c:8533:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   mm/page_alloc.c:8533:2: note: Taking false branch
           if (rc)
           ^
   mm/page_alloc.c:8536:6: note: Assuming 'write' is not equal to 0
           if (write)
               ^~~~~
   mm/page_alloc.c:8536:2: note: Taking true branch
           if (write)
           ^
   mm/page_alloc.c:8537:3: note: Calling 'setup_per_zone_wmarks'
                   setup_per_zone_wmarks();
                   ^~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:8437:2: note: Calling '__setup_per_zone_wmarks'
           __setup_per_zone_wmarks();
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:8365:2: note: 'lowmem_pages' initialized to 0
           unsigned long lowmem_pages =3D 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:8370:2: note: Loop condition is false. Execution continu=
es on line 8375
           for_each_zone(zone) {
           ^
   include/linux/mmzone.h:1122:2: note: expanded from macro 'for_each_zone'
           for (zone =3D (first_online_pgdat())->node_zones; \
           ^
   mm/page_alloc.c:8375:2: note: Loop condition is true.  Entering loop body
           for_each_zone(zone) {
           ^
   include/linux/mmzone.h:1122:2: note: expanded from macro 'for_each_zone'
           for (zone =3D (first_online_pgdat())->node_zones; \
           ^
   mm/page_alloc.c:8378:3: note: Loop condition is false.  Exiting loop
                   spin_lock_irqsave(&zone->lock, flags);
                   ^
   include/linux/spinlock.h:397:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:253:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   mm/page_alloc.c:8378:3: note: Loop condition is false.  Exiting loop
                   spin_lock_irqsave(&zone->lock, flags);
                   ^
   include/linux/spinlock.h:395:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   mm/page_alloc.c:8380:3: note: '__base' initialized to 0
                   do_div(tmp, lowmem_pages);
                   ^
   include/asm-generic/div64.h:46:2: note: expanded from macro 'do_div'
           uint32_t __base =3D (base);                               \
           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:8380:3: note: Division by zero
                   do_div(tmp, lowmem_pages);
                   ^
   include/asm-generic/div64.h:48:26: note: expanded from macro 'do_div'
           __rem =3D ((uint64_t)(n)) % __base;                       \
                   ~~~~~~~~~~~~~~~~^~~~~~~~
   Suppressed 12 warnings (11 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:1489:2: warning: Value stored to '=
r' is never read [clang-analyzer-deadcode.DeadStores]
           r =3D amdgpu_atomfirmware_get_vram_info(adev,
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:1489:2: note: Value stored to 'r' =
is never read
           r =3D amdgpu_atomfirmware_get_vram_info(adev,
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:852:3: warning: Value stored to '=
r' is never read [clang-analyzer-deadcode.DeadStores]
                   r =3D amdgpu_atomfirmware_get_vram_info(adev,
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:852:3: note: Value stored to 'r' =
is never read
                   r =3D amdgpu_atomfirmware_get_vram_info(adev,

vim +/refcnt +5559 mm/page_alloc.c

44fdffd70504c1 Alexander Duyck 2016-12-14  5511  =

b358e2122b9d7a Kevin Hao       2021-02-04  5512  void *page_frag_alloc_alig=
n(struct page_frag_cache *nc,
b358e2122b9d7a Kevin Hao       2021-02-04  5513  		      unsigned int frags=
z, gfp_t gfp_mask,
b358e2122b9d7a Kevin Hao       2021-02-04  5514  		      unsigned int align=
_mask)
b63ae8ca096dfd Alexander Duyck 2015-05-06  5515  {
b63ae8ca096dfd Alexander Duyck 2015-05-06  5516  	unsigned int size =3D PAG=
E_SIZE;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5517  	struct page *page;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5518  	int offset;
2add304c6e5eb6 Pasha Tatashin  2021-12-21  5519  	int refcnt;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5520  =

b63ae8ca096dfd Alexander Duyck 2015-05-06  5521  	if (unlikely(!nc->va)) {
b63ae8ca096dfd Alexander Duyck 2015-05-06  5522  refill:
2976db8018532b Alexander Duyck 2017-01-10  5523  		page =3D __page_frag_cac=
he_refill(nc, gfp_mask);
b63ae8ca096dfd Alexander Duyck 2015-05-06  5524  		if (!page)
b63ae8ca096dfd Alexander Duyck 2015-05-06  5525  			return NULL;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5526  =

b63ae8ca096dfd Alexander Duyck 2015-05-06  5527  #if (PAGE_SIZE < PAGE_FRAG=
_CACHE_MAX_SIZE)
b63ae8ca096dfd Alexander Duyck 2015-05-06  5528  		/* if size can vary use =
size else just use PAGE_SIZE */
b63ae8ca096dfd Alexander Duyck 2015-05-06  5529  		size =3D nc->size;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5530  #endif
b63ae8ca096dfd Alexander Duyck 2015-05-06  5531  		/* Even if we own the pa=
ge, we do not use atomic_set().
b63ae8ca096dfd Alexander Duyck 2015-05-06  5532  		 * This would break get_=
page_unless_zero() users.
b63ae8ca096dfd Alexander Duyck 2015-05-06  5533  		 */
8644772637deb1 Alexander Duyck 2019-02-15  5534  		page_ref_add(page, PAGE_=
FRAG_CACHE_MAX_SIZE);
b63ae8ca096dfd Alexander Duyck 2015-05-06  5535  =

b63ae8ca096dfd Alexander Duyck 2015-05-06  5536  		/* reset page count bias=
 and offset to start of new frag */
2f064f3485cd29 Michal Hocko    2015-08-21  5537  		nc->pfmemalloc =3D page_=
is_pfmemalloc(page);
8644772637deb1 Alexander Duyck 2019-02-15  5538  		nc->pagecnt_bias =3D PAG=
E_FRAG_CACHE_MAX_SIZE + 1;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5539  		nc->offset =3D size;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5540  	}
b63ae8ca096dfd Alexander Duyck 2015-05-06  5541  =

b63ae8ca096dfd Alexander Duyck 2015-05-06  5542  	offset =3D nc->offset - f=
ragsz;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5543  	if (unlikely(offset < 0))=
 {
b63ae8ca096dfd Alexander Duyck 2015-05-06  5544  		page =3D virt_to_page(nc=
->va);
b63ae8ca096dfd Alexander Duyck 2015-05-06  5545  =

fe896d1878949e Joonsoo Kim     2016-03-17  5546  		if (!page_ref_sub_and_te=
st(page, nc->pagecnt_bias))
b63ae8ca096dfd Alexander Duyck 2015-05-06  5547  			goto refill;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5548  =

d8c19014bba8f5 Dongli Zhang    2020-11-15  5549  		if (unlikely(nc->pfmemal=
loc)) {
d8c19014bba8f5 Dongli Zhang    2020-11-15  5550  			free_the_page(page, com=
pound_order(page));
d8c19014bba8f5 Dongli Zhang    2020-11-15  5551  			goto refill;
d8c19014bba8f5 Dongli Zhang    2020-11-15  5552  		}
d8c19014bba8f5 Dongli Zhang    2020-11-15  5553  =

b63ae8ca096dfd Alexander Duyck 2015-05-06  5554  #if (PAGE_SIZE < PAGE_FRAG=
_CACHE_MAX_SIZE)
b63ae8ca096dfd Alexander Duyck 2015-05-06  5555  		/* if size can vary use =
size else just use PAGE_SIZE */
b63ae8ca096dfd Alexander Duyck 2015-05-06  5556  		size =3D nc->size;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5557  #endif
2add304c6e5eb6 Pasha Tatashin  2021-12-21  5558  		/* page count is 0, set =
it to PAGE_FRAG_CACHE_MAX_SIZE + 1 */
2add304c6e5eb6 Pasha Tatashin  2021-12-21 @5559  		refcnt =3D page_ref_add_=
return(page, PAGE_FRAG_CACHE_MAX_SIZE + 1);
2add304c6e5eb6 Pasha Tatashin  2021-12-21  5560  		VM_BUG_ON_PAGE(refcnt !=
=3D PAGE_FRAG_CACHE_MAX_SIZE + 1, page);
b63ae8ca096dfd Alexander Duyck 2015-05-06  5561  =

b63ae8ca096dfd Alexander Duyck 2015-05-06  5562  		/* reset page count bias=
 and offset to start of new frag */
8644772637deb1 Alexander Duyck 2019-02-15  5563  		nc->pagecnt_bias =3D PAG=
E_FRAG_CACHE_MAX_SIZE + 1;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5564  		offset =3D size - fragsz;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5565  	}
b63ae8ca096dfd Alexander Duyck 2015-05-06  5566  =

b63ae8ca096dfd Alexander Duyck 2015-05-06  5567  	nc->pagecnt_bias--;
b358e2122b9d7a Kevin Hao       2021-02-04  5568  	offset &=3D align_mask;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5569  	nc->offset =3D offset;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5570  =

b63ae8ca096dfd Alexander Duyck 2015-05-06  5571  	return nc->va + offset;
b63ae8ca096dfd Alexander Duyck 2015-05-06  5572  }
b358e2122b9d7a Kevin Hao       2021-02-04  5573  EXPORT_SYMBOL(page_frag_al=
loc_align);
b63ae8ca096dfd Alexander Duyck 2015-05-06  5574  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4191563714259385129==--

