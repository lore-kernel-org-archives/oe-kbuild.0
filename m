Content-Type: multipart/mixed; boundary="===============8262488845654997135=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 3/9] mm: remove set_page_count() from page_frag_alloc_align
Date: Sun, 30 Jan 2022 16:53:47 +0800
Message-ID: <202201301621.jLLgh9Bo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8262488845654997135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220126183429.1840447-4-pasha.tatashin@soleen.com>
References: <20220126183429.1840447-4-pasha.tatashin@soleen.com>
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

[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on geert-m68k/for-next linux/master linus/master v=
5.17-rc1 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pasha-Tatashin/Hardening-p=
age-_refcount/20220127-023650
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace=
.git for-next
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20220124 (https://download.01.org/0day-ci/arc=
hive/20220130/202201301621.jLLgh9Bo-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7a=
a016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/d1a3062cc0aa8b2a7dbf01195=
e55f52d8d74c18d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Pasha-Tatashin/Hardening-page-_ref=
count/20220127-023650
        git checkout d1a3062cc0aa8b2a7dbf01195e55f52d8d74c18d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   mm/page_alloc.c:5277:9: note: 'nr_populated' is < 'nr_pages'
           while (nr_populated < nr_pages) {
                  ^~~~~~~~~~~~
   mm/page_alloc.c:5277:2: note: Loop condition is true.  Entering loop body
           while (nr_populated < nr_pages) {
           ^
   mm/page_alloc.c:5280:7: note: 'page_array' is null
                   if (page_array && page_array[nr_populated]) {
                       ^~~~~~~~~~
   mm/page_alloc.c:5280:18: note: Left side of '&&' is false
                   if (page_array && page_array[nr_populated]) {
                                  ^
   mm/page_alloc.c:5287:17: note: 'page' is non-null
                   if (unlikely(!page)) {
                                 ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
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
   include/linux/memcontrol.h:1773:2: note: Returning zero, which participa=
tes in a condition later
           return false;
           ^~~~~~~~~~~~
   mm/page_alloc.c:5217:6: note: Returning from 'memcg_kmem_enabled'
           if (memcg_kmem_enabled() && (gfp & __GFP_ACCOUNT))
               ^~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5217:27: note: Left side of '&&' is false
           if (memcg_kmem_enabled() && (gfp & __GFP_ACCOUNT))
                                    ^
   mm/page_alloc.c:5221:6: note: Assuming the condition is true
           if (nr_pages - nr_populated =3D=3D 1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5221:2: note: Taking true branch
           if (nr_pages - nr_populated =3D=3D 1)
           ^
   mm/page_alloc.c:5222:3: note: Control jumps to line 5315
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
   mm/page_alloc.c:7665:15: warning: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   mask =3D ~((1 << __ffs(start)) - 1);
                               ^  ~~~~~~~~~~~~
   mm/page_alloc.c:7653:25: note: Assuming 'i' is >=3D 0
           for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, &nid) {
                                  ^
   include/linux/memblock.h:286:7: note: expanded from macro 'for_each_mem_=
pfn_range'
                i >=3D 0; __next_mem_pfn_range(&i, nid, p_start, p_end, p_n=
id))
                ^~~~~~
   mm/page_alloc.c:7653:2: note: Loop condition is true.  Entering loop body
           for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, &nid) {
           ^
   include/linux/memblock.h:285:2: note: expanded from macro 'for_each_mem_=
pfn_range'
           for (i =3D -1, __next_mem_pfn_range(&i, nid, p_start, p_end, p_n=
id); \
           ^
   mm/page_alloc.c:7654:7: note: Assuming 'start' is 0
                   if (!start || last_nid < 0 || last_nid =3D=3D nid) {
                       ^~~~~~
   mm/page_alloc.c:7654:14: note: Left side of '||' is true
                   if (!start || last_nid < 0 || last_nid =3D=3D nid) {
                              ^
   mm/page_alloc.c:7657:4: note:  Execution continues on line 7653
                           continue;
                           ^
   mm/page_alloc.c:7653:25: note: Assuming 'i' is >=3D 0
           for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, &nid) {
                                  ^
   include/linux/memblock.h:286:7: note: expanded from macro 'for_each_mem_=
pfn_range'
                i >=3D 0; __next_mem_pfn_range(&i, nid, p_start, p_end, p_n=
id))
                ^~~~~~
   mm/page_alloc.c:7653:2: note: Loop condition is true.  Entering loop body
           for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, &nid) {
           ^
   include/linux/memblock.h:285:2: note: expanded from macro 'for_each_mem_=
pfn_range'
           for (i =3D -1, __next_mem_pfn_range(&i, nid, p_start, p_end, p_n=
id); \
           ^
   mm/page_alloc.c:7654:7: note: Assuming 'start' is not equal to 0
                   if (!start || last_nid < 0 || last_nid =3D=3D nid) {
                       ^~~~~~
   mm/page_alloc.c:7654:7: note: Left side of '||' is false
   mm/page_alloc.c:7654:17: note: Assuming 'last_nid' is >=3D 0
                   if (!start || last_nid < 0 || last_nid =3D=3D nid) {
                                 ^~~~~~~~~~~~
   mm/page_alloc.c:7654:7: note: Left side of '||' is false
                   if (!start || last_nid < 0 || last_nid =3D=3D nid) {
                       ^
   mm/page_alloc.c:7654:33: note: Assuming 'last_nid' is not equal to 'nid'
                   if (!start || last_nid < 0 || last_nid =3D=3D nid) {
                                                 ^~~~~~~~~~~~~~~
   mm/page_alloc.c:7654:3: note: Taking false branch
                   if (!start || last_nid < 0 || last_nid =3D=3D nid) {
                   ^
   mm/page_alloc.c:7665:18: note: Calling '__ffs'
                   mask =3D ~((1 << __ffs(start)) - 1);
                                  ^~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:6: note: Assuming the condition is=
 true
           if ((word & 0xffffffff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:18:2: note: Taking true branch
           if ((word & 0xffffffff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:19:3: note: The value 32 is assigned =
to 'num'
                   num +=3D 32;
                   ^~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:6: note: Assuming the condition is=
 false
           if ((word & 0xffff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:2: note: Taking false branch
           if ((word & 0xffff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:27:6: note: Assuming the condition is=
 false
           if ((word & 0xff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:27:2: note: Taking false branch
           if ((word & 0xff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:31:6: note: Assuming the condition is=
 false
           if ((word & 0xf) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:31:2: note: Taking false branch
           if ((word & 0xf) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:35:6: note: Assuming the condition is=
 false
           if ((word & 0x3) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:35:2: note: Taking false branch
           if ((word & 0x3) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:39:6: note: Assuming the condition is=
 false
           if ((word & 0x1) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:39:2: note: Taking false branch
           if ((word & 0x1) =3D=3D 0)
           ^
   include/asm-generic/bitops/__ffs.h:41:2: note: Returning the value 32 (l=
oaded from 'num')

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
d1a3062cc0aa8b Pasha Tatashin  2022-01-26  5519  	int refcnt;
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
d1a3062cc0aa8b Pasha Tatashin  2022-01-26  5558  		/* page count is 0, set =
it to PAGE_FRAG_CACHE_MAX_SIZE + 1 */
d1a3062cc0aa8b Pasha Tatashin  2022-01-26 @5559  		refcnt =3D page_ref_add_=
return(page, PAGE_FRAG_CACHE_MAX_SIZE + 1);
d1a3062cc0aa8b Pasha Tatashin  2022-01-26  5560  		VM_BUG_ON_PAGE(refcnt !=
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
--===============8262488845654997135==--

