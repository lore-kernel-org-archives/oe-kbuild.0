Content-Type: multipart/mixed; boundary="===============7107493666944003475=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/7] mm: page_isolation: check specified range for unmovable pages
Date: Sat, 22 Jan 2022 16:32:03 +0800
Message-ID: <202201221659.XbJv2v5A-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7107493666944003475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220119190623.1029355-4-zi.yan@sent.com>
References: <20220119190623.1029355-4-zi.yan@sent.com>
TO: Zi Yan <zi.yan@sent.com>

Hi Zi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master hnaz-mm/master v5.16 next-20220121]
[cannot apply to powerpc/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zi-Yan/Use-pageblock_order=
-for-cma-and-alloc_contig_range-alignment/20220120-032623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
99613159ad749543621da8238acf1a122880144e
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20122/202201221659.XbJv2v5A-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b713=
8a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/34f568f50dcc72fc76e85b137=
621abc7dedb1cc5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zi-Yan/Use-pageblock_order-for-cma=
-and-alloc_contig_range-alignment/20220120-032623
        git checkout 34f568f50dcc72fc76e85b137621abc7dedb1cc5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:655:6: note: Assuming 'new' is equal to fi=
eld 'leaf'
           if (cur->leaf !=3D new && cur->pos =3D=3D 0 && nr_entries > 0) {
               ^~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:655:23: note: Left side of '&&' is false
           if (cur->leaf !=3D new && cur->pos =3D=3D 0 && nr_entries > 0) {
                                ^
   fs/xfs/libxfs/xfs_iext_tree.c:660:23: note: Assuming 'i' is <=3D field '=
pos'
           for (i =3D nr_entries; i > cur->pos; i--)
                                ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:660:2: note: Loop condition is false. Exec=
ution continues on line 662
           for (i =3D nr_entries; i > cur->pos; i--)
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:667:6: note: Assuming 'new' is non-null
           if (new)
               ^~~
   fs/xfs/libxfs/xfs_iext_tree.c:667:2: note: Taking true branch
           if (new)
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:668:3: note: Calling 'xfs_iext_insert_node'
                   xfs_iext_insert_node(ifp, xfs_iext_leaf_key(new, 0), new=
, 2);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:503:6: note: Assuming 'level' is <=3D fiel=
d 'if_height'
           if (ifp->if_height < level)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:503:2: note: Taking false branch
           if (ifp->if_height < level)
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:507:2: note: Value assigned to 'node'
           node =3D xfs_iext_find_level(ifp, offset, level);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:511:9: note: Assuming 'pos' is >=3D 'nr_en=
tries'
           ASSERT(pos >=3D nr_entries || xfs_iext_key_cmp(node, pos, offset=
) !=3D 0);
                  ^
   fs/xfs/xfs_linux.h:208:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_iext_tree.c:511:27: note: Left side of '||' is true
           ASSERT(pos >=3D nr_entries || xfs_iext_key_cmp(node, pos, offset=
) !=3D 0);
                                    ^
   fs/xfs/libxfs/xfs_iext_tree.c:511:2: note: '?' condition is true
           ASSERT(pos >=3D nr_entries || xfs_iext_key_cmp(node, pos, offset=
) !=3D 0);
           ^
   fs/xfs/xfs_linux.h:208:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_iext_tree.c:512:9: note: Assuming 'nr_entries' is <=3D=
 KEYS_PER_NODE
           ASSERT(nr_entries <=3D KEYS_PER_NODE);
                  ^
   fs/xfs/xfs_linux.h:208:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_iext_tree.c:512:2: note: '?' condition is true
           ASSERT(nr_entries <=3D KEYS_PER_NODE);
           ^
   fs/xfs/xfs_linux.h:208:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_iext_tree.c:514:6: note: Assuming 'nr_entries' is not =
equal to KEYS_PER_NODE
           if (nr_entries =3D=3D KEYS_PER_NODE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:514:2: note: Taking false branch
           if (nr_entries =3D=3D KEYS_PER_NODE)
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:521:6: note: Assuming 'node' is equal to '=
new'
           if (node !=3D new && pos =3D=3D 0 && nr_entries > 0)
               ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:521:18: note: Left side of '&&' is false
           if (node !=3D new && pos =3D=3D 0 && nr_entries > 0)
                           ^
   fs/xfs/libxfs/xfs_iext_tree.c:524:23: note: 'i' is <=3D 'pos'
           for (i =3D nr_entries; i > pos; i--) {
                                ^
   fs/xfs/libxfs/xfs_iext_tree.c:524:2: note: Loop condition is false. Exec=
ution continues on line 528
           for (i =3D nr_entries; i > pos; i--) {
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:528:18: note: Array access (via field 'key=
s') results in a null pointer dereference
           node->keys[pos] =3D offset;
                 ~~~~      ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> mm/page_isolation.c:40:2: warning: Value stored to 'page' is never read =
[clang-analyzer-deadcode.DeadStores]
           page =3D pfn_to_page(pfn);
           ^
   mm/page_isolation.c:40:2: note: Value stored to 'page' is never read
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   include/linux/list.h:72:13: warning: Access to field 'prev' results in a=
 dereference of a null pointer (loaded from variable 'next') [clang-analyze=
r-core.NullDereference]
           next->prev =3D new;
                      ^
   mm/zsmalloc.c:2302:16: note: Calling 'zs_compact'
           pages_freed =3D zs_compact(pool);
                         ^~~~~~~~~~~~~~~~
   mm/zsmalloc.c:2270:11: note: '?' condition is false
           for (i =3D ZS_SIZE_CLASSES - 1; i >=3D 0; i--) {
                    ^
   mm/zsmalloc.c:150:59: note: expanded from macro 'ZS_SIZE_CLASSES'
   #define ZS_SIZE_CLASSES (DIV_ROUND_UP(ZS_MAX_ALLOC_SIZE - ZS_MIN_ALLOC_S=
IZE, \
                                                             ^
   mm/zsmalloc.c:132:52: note: expanded from macro 'ZS_MIN_ALLOC_SIZE'
           MAX(32, (ZS_MAX_PAGES_PER_ZSPAGE << PAGE_SHIFT >> OBJ_INDEX_BITS=
))
                                                             ^
   mm/zsmalloc.c:121:41: note: expanded from macro 'OBJ_INDEX_BITS'
   #define OBJ_INDEX_BITS  (BITS_PER_LONG - _PFN_BITS - OBJ_TAG_BITS)
                                            ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   mm/zsmalloc.c:91:35: note: expanded from macro 'MAX_POSSIBLE_PHYSMEM_BIT=
S'
   #define MAX_POSSIBLE_PHYSMEM_BITS MAX_PHYSMEM_BITS
                                     ^
   arch/x86/include/asm/sparsemem.h:27:28: note: expanded from macro 'MAX_P=
HYSMEM_BITS'
   # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
                                    ^
   arch/x86/include/asm/pgtable_64_types.h:40:30: note: expanded from macro=
 'pgtable_l5_enabled'
   #define pgtable_l5_enabled() 0
                                ^
   mm/zsmalloc.c:2270:11: note: '?' condition is true
           for (i =3D ZS_SIZE_CLASSES - 1; i >=3D 0; i--) {
                    ^
   mm/zsmalloc.c:150:59: note: expanded from macro 'ZS_SIZE_CLASSES'
   #define ZS_SIZE_CLASSES (DIV_ROUND_UP(ZS_MAX_ALLOC_SIZE - ZS_MIN_ALLOC_S=
IZE, \
                                                             ^
   mm/zsmalloc.c:132:2: note: expanded from macro 'ZS_MIN_ALLOC_SIZE'
           MAX(32, (ZS_MAX_PAGES_PER_ZSPAGE << PAGE_SHIFT >> OBJ_INDEX_BITS=
))
           ^
   mm/zsmalloc.c:129:20: note: expanded from macro 'MAX'
   #define MAX(a, b) ((a) >=3D (b) ? (a) : (b))
                      ^
   mm/zsmalloc.c:2270:2: note: Loop condition is true.  Entering loop body
           for (i =3D ZS_SIZE_CLASSES - 1; i >=3D 0; i--) {
           ^
   mm/zsmalloc.c:2272:7: note: Assuming 'class' is non-null
                   if (!class)
                       ^~~~~~
   mm/zsmalloc.c:2272:3: note: Taking false branch
                   if (!class)
                   ^
   mm/zsmalloc.c:2274:7: note: Assuming 'i' is equal to field 'index'
                   if (class->index !=3D i)
                       ^~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:2274:3: note: Taking false branch
                   if (class->index !=3D i)
                   ^
   mm/zsmalloc.c:2276:18: note: Calling '__zs_compact'
                   pages_freed +=3D __zs_compact(pool, class);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:2221:2: note: Calling 'spin_lock'
           spin_lock(&class->lock);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:349:2: note: Value assigned to field 'next'
           raw_spin_lock(&lock->rlock);
           ^
   include/linux/spinlock.h:215:29: note: expanded from macro 'raw_spin_loc=
k'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:2221:2: note: Returning from 'spin_lock'
           spin_lock(&class->lock);
           ^~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:2222:2: note: Loop condition is true.  Entering loop body
           while ((src_zspage =3D isolate_zspage(class, true))) {
           ^
   mm/zsmalloc.c:2224:7: note: Assuming the condition is true
                   if (!zs_can_compact(class))
                       ^~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:2224:3: note: Taking true branch
                   if (!zs_can_compact(class))
                   ^
   mm/zsmalloc.c:2225:4: note:  Execution continues on line 2256
                           break;
                           ^
   mm/zsmalloc.c:2256:6: note: 'src_zspage' is non-null
           if (src_zspage)
               ^~~~~~~~~~
   mm/zsmalloc.c:2256:2: note: Taking true branch
           if (src_zspage)
           ^

vim +/page +40 mm/page_isolation.c

0f0848e5118a4c Joonsoo Kim 2016-01-14   17  =

1edc0e02d51603 Zi Yan      2022-01-19   18  /*
34f568f50dcc72 Zi Yan      2022-01-19   19   * This function checks whether=
 pageblock within [start_pfn, end_pfn) includes
34f568f50dcc72 Zi Yan      2022-01-19   20   * unmovable pages or not.
1edc0e02d51603 Zi Yan      2022-01-19   21   *
1edc0e02d51603 Zi Yan      2022-01-19   22   * PageLRU check without isolat=
ion or lru_lock could race so that
1edc0e02d51603 Zi Yan      2022-01-19   23   * MIGRATE_MOVABLE block might =
include unmovable pages. And __PageMovable
1edc0e02d51603 Zi Yan      2022-01-19   24   * check without lock_page also=
 may miss some movable non-lru pages at
1edc0e02d51603 Zi Yan      2022-01-19   25   * race condition. So you can't=
 expect this function should be exact.
1edc0e02d51603 Zi Yan      2022-01-19   26   *
1edc0e02d51603 Zi Yan      2022-01-19   27   * Returns a page without holdi=
ng a reference. If the caller wants to
1edc0e02d51603 Zi Yan      2022-01-19   28   * dereference that page (e.g.,=
 dumping), it has to make sure that it
1edc0e02d51603 Zi Yan      2022-01-19   29   * cannot get removed (e.g., vi=
a memory unplug) concurrently.
1edc0e02d51603 Zi Yan      2022-01-19   30   *
1edc0e02d51603 Zi Yan      2022-01-19   31   */
1edc0e02d51603 Zi Yan      2022-01-19   32  static struct page *has_unmovab=
le_pages(struct zone *zone, struct page *page,
34f568f50dcc72 Zi Yan      2022-01-19   33  				 int migratetype, int flags,
34f568f50dcc72 Zi Yan      2022-01-19   34  				 unsigned long start_pfn, u=
nsigned long end_pfn)
1edc0e02d51603 Zi Yan      2022-01-19   35  {
34f568f50dcc72 Zi Yan      2022-01-19   36  	unsigned long first_pfn =3D ma=
x(page_to_pfn(page), start_pfn);
34f568f50dcc72 Zi Yan      2022-01-19   37  	unsigned long pfn =3D first_pf=
n;
34f568f50dcc72 Zi Yan      2022-01-19   38  	unsigned long last_pfn =3D min=
(ALIGN(pfn + 1, pageblock_nr_pages), end_pfn);
34f568f50dcc72 Zi Yan      2022-01-19   39  =

34f568f50dcc72 Zi Yan      2022-01-19  @40  	page =3D pfn_to_page(pfn);
1edc0e02d51603 Zi Yan      2022-01-19   41  =

1edc0e02d51603 Zi Yan      2022-01-19   42  	if (is_migrate_cma_page(page))=
 {
1edc0e02d51603 Zi Yan      2022-01-19   43  		/*
1edc0e02d51603 Zi Yan      2022-01-19   44  		 * CMA allocations (alloc_con=
tig_range) really need to mark
1edc0e02d51603 Zi Yan      2022-01-19   45  		 * isolate CMA pageblocks eve=
n when they are not movable in fact
1edc0e02d51603 Zi Yan      2022-01-19   46  		 * so consider them movable h=
ere.
1edc0e02d51603 Zi Yan      2022-01-19   47  		 */
1edc0e02d51603 Zi Yan      2022-01-19   48  		if (is_migrate_cma(migratetyp=
e))
1edc0e02d51603 Zi Yan      2022-01-19   49  			return NULL;
1edc0e02d51603 Zi Yan      2022-01-19   50  =

1edc0e02d51603 Zi Yan      2022-01-19   51  		return page;
1edc0e02d51603 Zi Yan      2022-01-19   52  	}
1edc0e02d51603 Zi Yan      2022-01-19   53  =

34f568f50dcc72 Zi Yan      2022-01-19   54  	for (pfn =3D first_pfn; pfn < =
last_pfn; pfn++) {
34f568f50dcc72 Zi Yan      2022-01-19   55  		page =3D pfn_to_page(pfn);
1edc0e02d51603 Zi Yan      2022-01-19   56  =

1edc0e02d51603 Zi Yan      2022-01-19   57  		/*
1edc0e02d51603 Zi Yan      2022-01-19   58  		 * Both, bootmem allocations =
and memory holes are marked
1edc0e02d51603 Zi Yan      2022-01-19   59  		 * PG_reserved and are unmova=
ble. We can even have unmovable
1edc0e02d51603 Zi Yan      2022-01-19   60  		 * allocations inside ZONE_MO=
VABLE, for example when
1edc0e02d51603 Zi Yan      2022-01-19   61  		 * specifying "movablecore".
1edc0e02d51603 Zi Yan      2022-01-19   62  		 */
1edc0e02d51603 Zi Yan      2022-01-19   63  		if (PageReserved(page))
1edc0e02d51603 Zi Yan      2022-01-19   64  			return page;
1edc0e02d51603 Zi Yan      2022-01-19   65  =

1edc0e02d51603 Zi Yan      2022-01-19   66  		/*
1edc0e02d51603 Zi Yan      2022-01-19   67  		 * If the zone is movable and=
 we have ruled out all reserved
1edc0e02d51603 Zi Yan      2022-01-19   68  		 * pages then it should be re=
asonably safe to assume the rest
1edc0e02d51603 Zi Yan      2022-01-19   69  		 * is movable.
1edc0e02d51603 Zi Yan      2022-01-19   70  		 */
1edc0e02d51603 Zi Yan      2022-01-19   71  		if (zone_idx(zone) =3D=3D ZON=
E_MOVABLE)
1edc0e02d51603 Zi Yan      2022-01-19   72  			continue;
1edc0e02d51603 Zi Yan      2022-01-19   73  =

1edc0e02d51603 Zi Yan      2022-01-19   74  		/*
1edc0e02d51603 Zi Yan      2022-01-19   75  		 * Hugepages are not in LRU l=
ists, but they're movable.
1edc0e02d51603 Zi Yan      2022-01-19   76  		 * THPs are on the LRU, but n=
eed to be counted as #small pages.
1edc0e02d51603 Zi Yan      2022-01-19   77  		 * We need not scan over tail=
 pages because we don't
1edc0e02d51603 Zi Yan      2022-01-19   78  		 * handle each tail page indi=
vidually in migration.
1edc0e02d51603 Zi Yan      2022-01-19   79  		 */
1edc0e02d51603 Zi Yan      2022-01-19   80  		if (PageHuge(page) || PageTra=
nsCompound(page)) {
1edc0e02d51603 Zi Yan      2022-01-19   81  			struct page *head =3D compou=
nd_head(page);
1edc0e02d51603 Zi Yan      2022-01-19   82  			unsigned int skip_pages;
1edc0e02d51603 Zi Yan      2022-01-19   83  =

1edc0e02d51603 Zi Yan      2022-01-19   84  			if (PageHuge(page)) {
1edc0e02d51603 Zi Yan      2022-01-19   85  				if (!hugepage_migration_sup=
ported(page_hstate(head)))
1edc0e02d51603 Zi Yan      2022-01-19   86  					return page;
1edc0e02d51603 Zi Yan      2022-01-19   87  			} else if (!PageLRU(head) &&=
 !__PageMovable(head)) {
1edc0e02d51603 Zi Yan      2022-01-19   88  				return page;
1edc0e02d51603 Zi Yan      2022-01-19   89  			}
1edc0e02d51603 Zi Yan      2022-01-19   90  =

1edc0e02d51603 Zi Yan      2022-01-19   91  			skip_pages =3D compound_nr(h=
ead) - (page - head);
34f568f50dcc72 Zi Yan      2022-01-19   92  			pfn +=3D skip_pages - 1;
1edc0e02d51603 Zi Yan      2022-01-19   93  			continue;
1edc0e02d51603 Zi Yan      2022-01-19   94  		}
1edc0e02d51603 Zi Yan      2022-01-19   95  =

1edc0e02d51603 Zi Yan      2022-01-19   96  		/*
1edc0e02d51603 Zi Yan      2022-01-19   97  		 * We can't use page_count wi=
thout pin a page
1edc0e02d51603 Zi Yan      2022-01-19   98  		 * because another CPU can fr=
ee compound page.
1edc0e02d51603 Zi Yan      2022-01-19   99  		 * This check already skips c=
ompound tails of THP
1edc0e02d51603 Zi Yan      2022-01-19  100  		 * because their page->_refco=
unt is zero at all time.
1edc0e02d51603 Zi Yan      2022-01-19  101  		 */
1edc0e02d51603 Zi Yan      2022-01-19  102  		if (!page_ref_count(page)) {
1edc0e02d51603 Zi Yan      2022-01-19  103  			if (PageBuddy(page))
34f568f50dcc72 Zi Yan      2022-01-19  104  				pfn +=3D (1 << buddy_order(=
page)) - 1;
1edc0e02d51603 Zi Yan      2022-01-19  105  			continue;
1edc0e02d51603 Zi Yan      2022-01-19  106  		}
1edc0e02d51603 Zi Yan      2022-01-19  107  =

1edc0e02d51603 Zi Yan      2022-01-19  108  		/*
1edc0e02d51603 Zi Yan      2022-01-19  109  		 * The HWPoisoned page may be=
 not in buddy system, and
1edc0e02d51603 Zi Yan      2022-01-19  110  		 * page_count() is not 0.
1edc0e02d51603 Zi Yan      2022-01-19  111  		 */
1edc0e02d51603 Zi Yan      2022-01-19  112  		if ((flags & MEMORY_OFFLINE) =
&& PageHWPoison(page))
1edc0e02d51603 Zi Yan      2022-01-19  113  			continue;
1edc0e02d51603 Zi Yan      2022-01-19  114  =

1edc0e02d51603 Zi Yan      2022-01-19  115  		/*
1edc0e02d51603 Zi Yan      2022-01-19  116  		 * We treat all PageOffline()=
 pages as movable when offlining
1edc0e02d51603 Zi Yan      2022-01-19  117  		 * to give drivers a chance t=
o decrement their reference count
1edc0e02d51603 Zi Yan      2022-01-19  118  		 * in MEM_GOING_OFFLINE in or=
der to indicate that these pages
1edc0e02d51603 Zi Yan      2022-01-19  119  		 * can be offlined as there a=
re no direct references anymore.
1edc0e02d51603 Zi Yan      2022-01-19  120  		 * For actually unmovable Pag=
eOffline() where the driver does
1edc0e02d51603 Zi Yan      2022-01-19  121  		 * not support this, we will =
fail later when trying to actually
1edc0e02d51603 Zi Yan      2022-01-19  122  		 * move these pages that stil=
l have a reference count > 0.
1edc0e02d51603 Zi Yan      2022-01-19  123  		 * (false negatives in this f=
unction only)
1edc0e02d51603 Zi Yan      2022-01-19  124  		 */
1edc0e02d51603 Zi Yan      2022-01-19  125  		if ((flags & MEMORY_OFFLINE) =
&& PageOffline(page))
1edc0e02d51603 Zi Yan      2022-01-19  126  			continue;
1edc0e02d51603 Zi Yan      2022-01-19  127  =

1edc0e02d51603 Zi Yan      2022-01-19  128  		if (__PageMovable(page) || Pa=
geLRU(page))
1edc0e02d51603 Zi Yan      2022-01-19  129  			continue;
1edc0e02d51603 Zi Yan      2022-01-19  130  =

1edc0e02d51603 Zi Yan      2022-01-19  131  		/*
1edc0e02d51603 Zi Yan      2022-01-19  132  		 * If there are RECLAIMABLE p=
ages, we need to check
1edc0e02d51603 Zi Yan      2022-01-19  133  		 * it.  But now, memory offli=
ne itself doesn't call
1edc0e02d51603 Zi Yan      2022-01-19  134  		 * shrink_node_slabs() and it=
 still to be fixed.
1edc0e02d51603 Zi Yan      2022-01-19  135  		 */
1edc0e02d51603 Zi Yan      2022-01-19  136  		return page;
1edc0e02d51603 Zi Yan      2022-01-19  137  	}
1edc0e02d51603 Zi Yan      2022-01-19  138  	return NULL;
1edc0e02d51603 Zi Yan      2022-01-19  139  }
1edc0e02d51603 Zi Yan      2022-01-19  140  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7107493666944003475==--

