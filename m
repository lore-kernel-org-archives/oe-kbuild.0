Content-Type: multipart/mixed; boundary="===============8879005648867448244=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4074/4957] include/linux/mm_inline.h:126:26: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Thu, 21 Apr 2022 14:45:00 +0800
Message-ID: <202204211142.GQLKLSCH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8879005648867448244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Yu Zhao <yuzhao@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f1244c81da13009dbf61cb807f45881501c44789
commit: c81723809cc65cac8155686768dcf75db38f3b57 [4074/4957] mm: multi-gen =
LRU: groundwork
:::::: branch date: 20 hours ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20220420 (https://download.01.org/0day-ci/arc=
hive/20220421/202204211142.GQLKLSCH-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd=
5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dc81723809cc65cac8155686768dcf75db38f3b57
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c81723809cc65cac8155686768dcf75db38f3b57
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   mm/compaction.c:1480:15: note: Assuming '__UNIQUE_ID___x346' is <=3D '__=
UNIQUE_ID___y347'
                                   highest =3D max(pageblock_start_pfn(pfn),
                                             ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   mm/compaction.c:1480:15: note: '?' condition is false
                                   highest =3D max(pageblock_start_pfn(pfn),
                                             ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
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
   mm/compaction.c:1483:8: note: Assuming 'pfn' is >=3D 'low_pfn'
                           if (pfn >=3D low_pfn) {
                               ^~~~~~~~~~~~~~
   mm/compaction.c:1483:4: note: Taking true branch
                           if (pfn >=3D low_pfn) {
                           ^
   mm/compaction.c:1487:5: note:  Execution continues on line 1502
                                   break;
                                   ^
   mm/compaction.c:1502:7: note: Assuming pointer value is null
                   if (!page && high_pfn) {
                       ^~~~~
   mm/compaction.c:1502:7: note: Assuming 'page' is null
                   if (!page && high_pfn) {
                       ^~~~~
   mm/compaction.c:1502:7: note: Left side of '&&' is true
   mm/compaction.c:1502:16: note: 'high_pfn' is 0
                   if (!page && high_pfn) {
                                ^~~~~~~~
   mm/compaction.c:1502:3: note: Taking false branch
                   if (!page && high_pfn) {
                   ^
   mm/compaction.c:1510:3: note: Calling 'move_freelist_head'
                   move_freelist_head(freelist, freepage);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:1335:6: note: Assuming the condition is true
           if (!list_is_last(freelist, &freepage->lru)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:1335:2: note: Taking true branch
           if (!list_is_last(freelist, &freepage->lru)) {
           ^
   mm/compaction.c:1336:3: note: Calling 'list_cut_before'
                   list_cut_before(&sublist, freelist, &freepage->lru);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:430:6: note: Assuming 'entry' is equal to field 'ne=
xt'
           if (head->next =3D=3D entry) {
               ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:430:2: note: Taking true branch
           if (head->next =3D=3D entry) {
           ^
   include/linux/list.h:432:3: note: Returning without writing to 'head->pr=
ev'
                   return;
                   ^
   mm/compaction.c:1336:3: note: Returning from 'list_cut_before'
                   list_cut_before(&sublist, freelist, &freepage->lru);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:1337:3: note: Calling 'list_splice_tail'
                   list_splice_tail(&sublist, freelist);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:476:2: note: Taking true branch
           if (!list_empty(list))
           ^
   include/linux/list.h:477:23: note: Passing null pointer value via 2nd pa=
rameter 'prev'
                   __list_splice(list, head->prev, head);
                                       ^~~~~~~~~~
   include/linux/list.h:477:3: note: Calling '__list_splice'
                   __list_splice(list, head->prev, head);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:450:13: note: Access to field 'next' results in a d=
ereference of a null pointer (loaded from variable 'prev')
           prev->next =3D first;
           ~~~~       ^
>> include/linux/mm_inline.h:126:26: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
           unsigned long max_seq =3D lruvec->lrugen.max_seq;
                                   ^
   mm/compaction.c:823:2: note: Loop condition is false. Execution continue=
s on line 838
           while (unlikely(too_many_isolated(pgdat))) {
           ^
   mm/compaction.c:840:6: note: Assuming field 'direct_compaction' is false
           if (cc->direct_compaction && (cc->mode =3D=3D MIGRATE_ASYNC)) {
               ^~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:840:28: note: Left side of '&&' is false
           if (cc->direct_compaction && (cc->mode =3D=3D MIGRATE_ASYNC)) {
                                     ^
   mm/compaction.c:846:9: note: Assuming 'low_pfn' is < 'end_pfn'
           for (; low_pfn < end_pfn; low_pfn++) {
                  ^~~~~~~~~~~~~~~~~
   mm/compaction.c:846:2: note: Loop condition is true.  Entering loop body
           for (; low_pfn < end_pfn; low_pfn++) {
           ^
   mm/compaction.c:848:7: note: 'skip_on_failure' is false
                   if (skip_on_failure && low_pfn >=3D next_skip_pfn) {
                       ^~~~~~~~~~~~~~~
   mm/compaction.c:848:23: note: Left side of '&&' is false
                   if (skip_on_failure && low_pfn >=3D next_skip_pfn) {
                                       ^
   mm/compaction.c:875:7: note: Assuming the condition is false
                   if (!(low_pfn % SWAP_CLUSTER_MAX)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:875:3: note: Taking false branch
                   if (!(low_pfn % SWAP_CLUSTER_MAX)) {
                   ^
   mm/compaction.c:901:8: note: 'valid_page' is null
                   if (!valid_page && IS_ALIGNED(low_pfn, pageblock_nr_page=
s)) {
                        ^~~~~~~~~~
   mm/compaction.c:901:7: note: Left side of '&&' is true
                   if (!valid_page && IS_ALIGNED(low_pfn, pageblock_nr_page=
s)) {
                       ^
   mm/compaction.c:901:42: note: '?' condition is false
                   if (!valid_page && IS_ALIGNED(low_pfn, pageblock_nr_page=
s)) {
                                                          ^
   include/linux/pageblock-flags.h:55:36: note: expanded from macro 'pagebl=
ock_nr_pages'
   #define pageblock_nr_pages      (1UL << pageblock_order)
                                           ^
   include/linux/pageblock-flags.h:44:26: note: expanded from macro 'pagebl=
ock_order'
   #define pageblock_order         min_t(unsigned int, HUGETLB_PAGE_ORDER, =
MAX_ORDER - 1)
                                   ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   mm/compaction.c:901:22: note: Assuming the condition is false
                   if (!valid_page && IS_ALIGNED(low_pfn, pageblock_nr_page=
s)) {
                                      ^
   include/linux/align.h:13:28: note: expanded from macro 'IS_ALIGNED'
   #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))@ - 1)) =
=3D=3D 0)
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   mm/compaction.c:901:3: note: Taking false branch
                   if (!valid_page && IS_ALIGNED(low_pfn, pageblock_nr_page=
s)) {
                   ^
   mm/compaction.c:910:7: note: Assuming the condition is false
                   if (PageHuge(page) && cc->alloc_contig) {
                       ^~~~~~~~~~~~~~
   mm/compaction.c:910:22: note: Left side of '&&' is false
                   if (PageHuge(page) && cc->alloc_contig) {
                                      ^
   mm/compaction.c:948:3: note: Taking false branch
                   if (PageBuddy(page)) {
                   ^
   mm/compaction.c:969:7: note: Assuming the condition is false
                   if (PageCompound(page) && !cc->alloc_contig) {
                       ^~~~~~~~~~~~~~~~~~
   mm/compaction.c:969:26: note: Left side of '&&' is false
                   if (PageCompound(page) && !cc->alloc_contig) {
                                          ^
   mm/compaction.c:982:7: note: Assuming the condition is false
                   if (!PageLRU(page)) {
                       ^~~~~~~~~~~~~~
   mm/compaction.c:982:3: note: Taking false branch
                   if (!PageLRU(page)) {
                   ^
   mm/compaction.c:1007:7: note: Assuming 'mapping' is non-null
                   if (!mapping && page_count(page) > page_mapcount(page))
                       ^~~~~~~~
   mm/compaction.c:1007:16: note: Left side of '&&' is false
                   if (!mapping && page_count(page) > page_mapcount(page))
                                ^
   mm/compaction.c:1014:7: note: Assuming the condition is false
                   if (!(cc->gfp_mask & __GFP_FS) && mapping)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:1014:34: note: Left side of '&&' is false
                   if (!(cc->gfp_mask & __GFP_FS) && mapping)
                                                  ^
   mm/compaction.c:1022:16: note: Assuming the condition is false
                   if (unlikely(!get_page_unless_zero(page)))
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)

vim +126 include/linux/mm_inline.h

c81723809cc65c Yu Zhao 2022-04-13  123  =

c81723809cc65c Yu Zhao 2022-04-13  124  static inline bool lru_gen_is_activ=
e(struct lruvec *lruvec, int gen)
c81723809cc65c Yu Zhao 2022-04-13  125  {
c81723809cc65c Yu Zhao 2022-04-13 @126  	unsigned long max_seq =3D lruvec->=
lrugen.max_seq;
c81723809cc65c Yu Zhao 2022-04-13  127  =

c81723809cc65c Yu Zhao 2022-04-13  128  	VM_BUG_ON(gen >=3D MAX_NR_GENS);
c81723809cc65c Yu Zhao 2022-04-13  129  =

c81723809cc65c Yu Zhao 2022-04-13  130  	/* see the comment on MIN_NR_GENS =
*/
c81723809cc65c Yu Zhao 2022-04-13  131  	return gen =3D=3D lru_gen_from_seq=
(max_seq) || gen =3D=3D lru_gen_from_seq(max_seq - 1);
c81723809cc65c Yu Zhao 2022-04-13  132  }
c81723809cc65c Yu Zhao 2022-04-13  133  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8879005648867448244==--

