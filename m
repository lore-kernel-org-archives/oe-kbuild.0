Content-Type: multipart/mixed; boundary="===============2231866143802659633=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v3 4/8] mm: make alloc_contig_range work at pageblock granularity
Date: Sat, 08 Jan 2022 09:52:44 +0800
Message-ID: <202201080952.Mmr9o4cS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2231866143802659633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220105214756.91065-5-zi.yan@sent.com>
References: <20220105214756.91065-5-zi.yan@sent.com>
TO: Zi Yan <zi.yan@sent.com>

Hi Zi,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on powerpc/next]
[also build test WARNING on linux/master linus/master hnaz-mm/master v5.16-=
rc8 next-20220107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zi-Yan/Use-pageblock_order=
-for-cma-and-alloc_contig_range-alignment/20220106-054920
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220106 (https://download.01.org/0day-ci/archi=
ve/20220108/202201080952.Mmr9o4cS-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe=
09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/3408839ed9f635baea8e62c6f=
441fc589d82f926
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zi-Yan/Use-pageblock_order-for-cma=
-and-alloc_contig_range-alignment/20220106-054920
        git checkout 3408839ed9f635baea8e62c6f441fc589d82f926
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                    ^~~~~~
   mm/page_alloc.c:8794:18: note: Left side of '&&' is false
           } while (!table && size > PAGE_SIZE && --log2qty);
                           ^
   mm/page_alloc.c:8771:2: note: Loop condition is false.  Exiting loop
           do {
           ^
   mm/page_alloc.c:8796:7: note: 'table' is non-null
           if (!table)
                ^~~~~
   mm/page_alloc.c:8796:2: note: Taking false branch
           if (!table)
           ^
   mm/page_alloc.c:8799:2: note: Left side of '&&' is true
           pr_info("%s hash table entries: %ld (order: %d, %lu bytes, %s)\n=
",
           ^
   include/linux/printk.h:523:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:374:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   mm/page_alloc.c:8799:2: note: Taking true branch
           pr_info("%s hash table entries: %ld (order: %d, %lu bytes, %s)\n=
",
           ^
   include/linux/printk.h:523:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:374:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   mm/page_alloc.c:8799:2: note: '?' condition is true
           pr_info("%s hash table entries: %ld (order: %d, %lu bytes, %s)\n=
",
           ^
   include/linux/printk.h:523:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   mm/page_alloc.c:8799:2: note: '?' condition is true
           pr_info("%s hash table entries: %ld (order: %d, %lu bytes, %s)\n=
",
           ^
   include/linux/printk.h:523:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:387:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   mm/page_alloc.c:8799:2: note: Loop condition is false.  Exiting loop
           pr_info("%s hash table entries: %ld (order: %d, %lu bytes, %s)\n=
",
           ^
   include/linux/printk.h:523:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:373:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   mm/page_alloc.c:8800:18: note: The result of the left shift is undefined=
 due to shifting by '4294967295', which is greater or equal to the width of=
 type 'unsigned long'
                   tablename, 1UL << log2qty, ilog2(size) - PAGE_SHIFT, siz=
e,
                                  ^
   include/linux/printk.h:523:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
>> mm/page_alloc.c:9133:2: warning: Value stored to 'num' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           num =3D save_migratetypes(&saved_mt[num], alloc_end, isolate_end=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:9133:2: note: Value stored to 'num' is never read
           num =3D save_migratetypes(&saved_mt[num], alloc_end, isolate_end=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:9218:2: warning: Value stored to 'num' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           num =3D restore_migratetypes(&saved_mt[num], alloc_end, isolate_=
end);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   mm/page_alloc.c:9218:2: note: Value stored to 'num' is never read
           num =3D restore_migratetypes(&saved_mt[num], alloc_end, isolate_=
end);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   kernel/events/core.c:10222:13: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
                      ^
   kernel/events/core.c:10237:39: note: Calling 'perf_event_addr_filters'
           struct perf_addr_filters_head *ifh =3D perf_event_addr_filters(e=
vent);
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/perf_event.h:1397:6: note: Assuming field 'parent' is null
           if (event->parent)
               ^~~~~~~~~~~~~
   include/linux/perf_event.h:1397:2: note: Taking false branch
           if (event->parent)
           ^
   include/linux/perf_event.h:1400:2: note: Returning without writing to 'e=
vent->addr_filters.nr_file_filters', which participates in a condition later
           return ifh;
           ^
   kernel/events/core.c:10237:39: note: Returning from 'perf_event_addr_fil=
ters'
           struct perf_addr_filters_head *ifh =3D perf_event_addr_filters(e=
vent);
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   kernel/events/core.c:10238:29: note: Left side of '||' is false
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
                                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/events/core.c:10238:29: note: Left side of '||' is false
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
                                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/events/core.c:10238:29: note: Left side of '||' is true
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
                                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:303:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   kernel/events/core.c:10238:29: note: Taking false branch
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
                                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   kernel/events/core.c:10238:29: note: Loop condition is false.  Exiting l=
oop
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
                                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \

vim +/num +9133 mm/page_alloc.c

3408839ed9f635b Zi Yan                  2022-01-05  9068  =

041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9069  /**
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9070   * alloc_contig_r=
ange() -- tries to allocate given range of pages
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9071   * @start:	start =
PFN to allocate
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9072   * @end:	one-past=
-the-last PFN to allocate
f0953a1bbaca71e Ingo Molnar             2021-05-06  9073   * @migratetype:	=
migratetype of the underlying pageblocks (either
0815f3d81d76dfb Michal Nazarewicz       2012-04-03  9074   *			#MIGRATE_MOV=
ABLE or #MIGRATE_CMA).  All pageblocks
0815f3d81d76dfb Michal Nazarewicz       2012-04-03  9075   *			in range mus=
t have the same migratetype and it must
0815f3d81d76dfb Michal Nazarewicz       2012-04-03  9076   *			be either of=
 the two.
ca96b625341027f Lucas Stach             2017-02-24  9077   * @gfp_mask:	GFP=
 mask to use during compaction
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9078   *
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9079   * The PFN range =
does not have to be pageblock or MAX_ORDER_NR_PAGES
2c7452a075d4db2 Mike Kravetz            2018-04-05  9080   * aligned.  The =
PFN range must belong to a single zone.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9081   *
2c7452a075d4db2 Mike Kravetz            2018-04-05  9082   * The first thin=
g this routine does is attempt to MIGRATE_ISOLATE all
2c7452a075d4db2 Mike Kravetz            2018-04-05  9083   * pageblocks in =
the range.  Once isolated, the pageblocks should not
2c7452a075d4db2 Mike Kravetz            2018-04-05  9084   * be modified by=
 others.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9085   *
a862f68a8b36008 Mike Rapoport           2019-03-05  9086   * Return: zero o=
n success or negative error code.  On success all
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9087   * pages which PF=
N is in [start, end) are allocated for the caller and
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9088   * need to be fre=
ed with free_contig_range().
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9089   */
0815f3d81d76dfb Michal Nazarewicz       2012-04-03  9090  int alloc_contig_=
range(unsigned long start, unsigned long end,
ca96b625341027f Lucas Stach             2017-02-24  9091  		       unsigned=
 migratetype, gfp_t gfp_mask)
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9092  {
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9093  	unsigned long ou=
ter_start, outer_end;
3408839ed9f635b Zi Yan                  2022-01-05  9094  	unsigned long is=
olate_start =3D pfn_max_align_down(start);
3408839ed9f635b Zi Yan                  2022-01-05  9095  	unsigned long is=
olate_end =3D pfn_max_align_up(end);
3408839ed9f635b Zi Yan                  2022-01-05  9096  	unsigned long al=
loc_start =3D ALIGN_DOWN(start, pageblock_nr_pages);
3408839ed9f635b Zi Yan                  2022-01-05  9097  	unsigned long al=
loc_end =3D ALIGN(end, pageblock_nr_pages);
3408839ed9f635b Zi Yan                  2022-01-05  9098  	unsigned long nu=
m_pageblock_to_save;
d00181b96eb86c9 Kirill A. Shutemov      2015-11-06  9099  	unsigned int ord=
er;
d00181b96eb86c9 Kirill A. Shutemov      2015-11-06  9100  	int ret =3D 0;
3408839ed9f635b Zi Yan                  2022-01-05  9101  	unsigned char *s=
aved_mt;
3408839ed9f635b Zi Yan                  2022-01-05  9102  	int num;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9103  =

bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9104  	struct compact_c=
ontrol cc =3D {
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9105  		.nr_migratepage=
s =3D 0,
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9106  		.order =3D -1,
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9107  		.zone =3D page_=
zone(pfn_to_page(start)),
e0b9daeb453e602 David Rientjes          2014-06-04  9108  		.mode =3D MIGRA=
TE_SYNC,
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9109  		.ignore_skip_hi=
nt =3D true,
2583d6713267a4c Vlastimil Babka         2017-11-17  9110  		.no_set_skip_hi=
nt =3D true,
7dea19f9ee636cb Michal Hocko            2017-05-03  9111  		.gfp_mask =3D c=
urrent_gfp_context(gfp_mask),
b06eda091e5d65b Rik van Riel            2020-04-01  9112  		.alloc_contig =
=3D true,
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9113  	};
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9114  	INIT_LIST_HEAD(&=
cc.migratepages);
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9115  =

3408839ed9f635b Zi Yan                  2022-01-05  9116  	/*
3408839ed9f635b Zi Yan                  2022-01-05  9117  	 * TODO: make MI=
GRATE_ISOLATE a standalone bit to avoid overwriting
3408839ed9f635b Zi Yan                  2022-01-05  9118  	 * the exiting m=
igratetype. Then, we will not need the save and restore
3408839ed9f635b Zi Yan                  2022-01-05  9119  	 * process here.
3408839ed9f635b Zi Yan                  2022-01-05  9120  	 */
3408839ed9f635b Zi Yan                  2022-01-05  9121  =

3408839ed9f635b Zi Yan                  2022-01-05  9122  	/* Save the migr=
atepages of the pageblocks before start and after end */
3408839ed9f635b Zi Yan                  2022-01-05  9123  	num_pageblock_to=
_save =3D (alloc_start - isolate_start) / pageblock_nr_pages
3408839ed9f635b Zi Yan                  2022-01-05  9124  				+ (isolate_en=
d - alloc_end) / pageblock_nr_pages;
3408839ed9f635b Zi Yan                  2022-01-05  9125  	saved_mt =3D
3408839ed9f635b Zi Yan                  2022-01-05  9126  		kmalloc_array(n=
um_pageblock_to_save,
3408839ed9f635b Zi Yan                  2022-01-05  9127  			      sizeof(u=
nsigned char), GFP_KERNEL);
3408839ed9f635b Zi Yan                  2022-01-05  9128  	if (!saved_mt)
3408839ed9f635b Zi Yan                  2022-01-05  9129  		return -ENOMEM;
3408839ed9f635b Zi Yan                  2022-01-05  9130  =

3408839ed9f635b Zi Yan                  2022-01-05  9131  	num =3D save_mig=
ratetypes(saved_mt, isolate_start, alloc_start);
3408839ed9f635b Zi Yan                  2022-01-05  9132  =

3408839ed9f635b Zi Yan                  2022-01-05 @9133  	num =3D save_mig=
ratetypes(&saved_mt[num], alloc_end, isolate_end);
3408839ed9f635b Zi Yan                  2022-01-05  9134  =

041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9135  	/*
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9136  	 * What we do he=
re is we mark all pageblocks in range as
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9137  	 * MIGRATE_ISOLA=
TE.  Because pageblock and max order pages may
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9138  	 * have differen=
t sizes, and due to the way page allocator
3408839ed9f635b Zi Yan                  2022-01-05  9139  	 * work, we alig=
n the isolation range to biggest of the two so
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9140  	 * that page all=
ocator won't try to merge buddies from
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9141  	 * different pag=
eblocks and change MIGRATE_ISOLATE to some
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9142  	 * other migrati=
on type.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9143  	 *
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9144  	 * Once the page=
blocks are marked as MIGRATE_ISOLATE, we
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9145  	 * migrate the p=
ages from an unaligned range (ie. pages that
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9146  	 * we are intere=
sted in).  This will put all the pages in
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9147  	 * range back to=
 page allocator as MIGRATE_ISOLATE.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9148  	 *
3408839ed9f635b Zi Yan                  2022-01-05  9149  	 * Afterwards, w=
e restore the migratetypes of the pageblocks not
3408839ed9f635b Zi Yan                  2022-01-05  9150  	 * in range, spl=
it free pages spanning outside the range,
3408839ed9f635b Zi Yan                  2022-01-05  9151  	 * and put split=
 free pages (at pageblock_order) to the right
3408839ed9f635b Zi Yan                  2022-01-05  9152  	 * migratetype l=
ist.
3408839ed9f635b Zi Yan                  2022-01-05  9153  	 *
3408839ed9f635b Zi Yan                  2022-01-05  9154  	 * NOTE: the abo=
ve approach is used because it can cause free
3408839ed9f635b Zi Yan                  2022-01-05  9155  	 * page accounti=
ng issues during isolation, if a page, either
3408839ed9f635b Zi Yan                  2022-01-05  9156  	 * free or in-us=
e, contains multiple pageblocks and we only
3408839ed9f635b Zi Yan                  2022-01-05  9157  	 * isolate a sub=
set of them. For example, if only the second
3408839ed9f635b Zi Yan                  2022-01-05  9158  	 * pageblock is =
isolated from a page with 2 pageblocks, after
3408839ed9f635b Zi Yan                  2022-01-05  9159  	 * the page is f=
ree, it will be put in the first pageblock
3408839ed9f635b Zi Yan                  2022-01-05  9160  	 * migratetype l=
ist instead of having 2 pageblocks in two
3408839ed9f635b Zi Yan                  2022-01-05  9161  	 * separate migr=
atetype lists.
3408839ed9f635b Zi Yan                  2022-01-05  9162  	 *
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9163  	 * When this is =
done, we take the pages in range from page
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9164  	 * allocator rem=
oving them from the buddy system.  This way
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9165  	 * page allocato=
r will never consider using them.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9166  	 *
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9167  	 * This lets us =
mark the pageblocks back as
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9168  	 * MIGRATE_CMA/M=
IGRATE_MOVABLE so that free pages in the
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9169  	 * aligned range=
 but not in the unaligned, original range are
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9170  	 * put back to p=
age allocator so that buddy can use them.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9171  	 */
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9172  =

3408839ed9f635b Zi Yan                  2022-01-05  9173  	ret =3D start_is=
olate_page_range(isolate_start, isolate_end, migratetype, 0);
3fa0c7c79d2499a David Hildenbrand       2020-10-15  9174  	if (ret)
3408839ed9f635b Zi Yan                  2022-01-05  9175  		goto done;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9176  =

7612921f2376d51 Vlastimil Babka         2020-12-14  9177  	drain_all_pages(=
cc.zone);
7612921f2376d51 Vlastimil Babka         2020-12-14  9178  =

8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9179  	/*
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9180  	 * In case of -E=
BUSY, we'd like to know which page causes problem.
63cd448908b5eb5 Mike Kravetz            2017-11-29  9181  	 * So, just fall=
 through. test_pages_isolated() has a tracepoint
63cd448908b5eb5 Mike Kravetz            2017-11-29  9182  	 * which will re=
port the busy page.
63cd448908b5eb5 Mike Kravetz            2017-11-29  9183  	 *
63cd448908b5eb5 Mike Kravetz            2017-11-29  9184  	 * It is possibl=
e that busy pages could become available before
63cd448908b5eb5 Mike Kravetz            2017-11-29  9185  	 * the call to t=
est_pages_isolated, and the range will actually be
63cd448908b5eb5 Mike Kravetz            2017-11-29  9186  	 * allocated.  S=
o, if we fall through be sure to clear ret so that
63cd448908b5eb5 Mike Kravetz            2017-11-29  9187  	 * -EBUSY is not=
 accidentally used or returned to caller.
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9188  	 */
bb13ffeb9f6bfeb Mel Gorman              2012-10-08  9189  	ret =3D __alloc_=
contig_migrate_range(&cc, start, end);
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9190  	if (ret && ret !=
=3D -EBUSY)
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9191  		goto done;
63cd448908b5eb5 Mike Kravetz            2017-11-29  9192  	ret =3D 0;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9193  =

041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9194  	/*
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9195  	 * Pages from [s=
tart, end) are within a MAX_ORDER_NR_PAGES
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9196  	 * aligned block=
s that are marked as MIGRATE_ISOLATE.  What's
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9197  	 * more, all pag=
es in [start, end) are free in page allocator.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9198  	 * What we are g=
oing to do is to allocate all pages from
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9199  	 * [start, end) =
(that is remove them from page allocator).
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9200  	 *
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9201  	 * The only prob=
lem is that pages at the beginning and at the
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9202  	 * end of intere=
sting range may be not aligned with pages that
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9203  	 * page allocato=
r holds, ie. they can be part of higher order
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9204  	 * pages.  Becau=
se of this, we reserve the bigger range and
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9205  	 * once this is =
done free the pages we are not interested in.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9206  	 *
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9207  	 * We don't have=
 to hold zone->lock here because the pages are
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9208  	 * isolated thus=
 they won't get removed from buddy.
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9209  	 */
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9210  =

3408839ed9f635b Zi Yan                  2022-01-05  9211  	/*
3408839ed9f635b Zi Yan                  2022-01-05  9212  	 * Restore migra=
tetypes of pageblocks outside [start, end)
3408839ed9f635b Zi Yan                  2022-01-05  9213  	 * TODO: remove =
it when MIGRATE_ISOLATE becomes a standalone bit
3408839ed9f635b Zi Yan                  2022-01-05  9214  	 */
3408839ed9f635b Zi Yan                  2022-01-05  9215  =

3408839ed9f635b Zi Yan                  2022-01-05  9216  	num =3D restore_=
migratetypes(saved_mt, isolate_start, alloc_start);
3408839ed9f635b Zi Yan                  2022-01-05  9217  =

3408839ed9f635b Zi Yan                  2022-01-05  9218  	num =3D restore_=
migratetypes(&saved_mt[num], alloc_end, isolate_end);
3408839ed9f635b Zi Yan                  2022-01-05  9219  =

3408839ed9f635b Zi Yan                  2022-01-05  9220  	/*
3408839ed9f635b Zi Yan                  2022-01-05  9221  	 * Split free pa=
ge spanning [isolate_start, alloc_start) and put the
3408839ed9f635b Zi Yan                  2022-01-05  9222  	 * pageblocks in=
 the right migratetype lists.
3408839ed9f635b Zi Yan                  2022-01-05  9223  	 */
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9224  	order =3D 0;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9225  	outer_start =3D =
start;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9226  	while (!PageBudd=
y(pfn_to_page(outer_start))) {
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9227  		if (++order >=
=3D MAX_ORDER) {
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9228  			outer_start =
=3D start;
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9229  			break;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9230  		}
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9231  		outer_start &=
=3D ~0UL << order;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9232  	}
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9233  =

8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9234  	if (outer_start =
!=3D start) {
ab130f9108dcf20 Matthew Wilcox (Oracle  2020-10-15  9235) 		order =3D buddy=
_order(pfn_to_page(outer_start));
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9236  =

8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9237  		/*
3408839ed9f635b Zi Yan                  2022-01-05  9238  		 * split the fr=
ee page has start page and put the pageblocks
3408839ed9f635b Zi Yan                  2022-01-05  9239  		 * in the right=
 migratetype list
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9240  		 */
3408839ed9f635b Zi Yan                  2022-01-05  9241  		if (outer_start=
 + (1UL << order) > start) {
3408839ed9f635b Zi Yan                  2022-01-05  9242  			struct page *f=
ree_page =3D pfn_to_page(outer_start);
3408839ed9f635b Zi Yan                  2022-01-05  9243  =

3408839ed9f635b Zi Yan                  2022-01-05  9244  			split_free_pag=
e_into_pageblocks(free_page, order, cc.zone);
3408839ed9f635b Zi Yan                  2022-01-05  9245  		}
3408839ed9f635b Zi Yan                  2022-01-05  9246  	}
3408839ed9f635b Zi Yan                  2022-01-05  9247  =

3408839ed9f635b Zi Yan                  2022-01-05  9248  	/*
3408839ed9f635b Zi Yan                  2022-01-05  9249  	 * Split free pa=
ge spanning [alloc_end, isolate_end) and put the
3408839ed9f635b Zi Yan                  2022-01-05  9250  	 * pageblocks in=
 the right migratetype list
3408839ed9f635b Zi Yan                  2022-01-05  9251  	 */
3408839ed9f635b Zi Yan                  2022-01-05  9252  	for (outer_end =
=3D alloc_end; outer_end < isolate_end;) {
3408839ed9f635b Zi Yan                  2022-01-05  9253  		unsigned long b=
egin_pfn =3D outer_end;
3408839ed9f635b Zi Yan                  2022-01-05  9254  =

3408839ed9f635b Zi Yan                  2022-01-05  9255  		order =3D 0;
3408839ed9f635b Zi Yan                  2022-01-05  9256  		while (!PageBud=
dy(pfn_to_page(outer_end))) {
3408839ed9f635b Zi Yan                  2022-01-05  9257  			if (++order >=
=3D MAX_ORDER) {
3408839ed9f635b Zi Yan                  2022-01-05  9258  				outer_end =3D=
 begin_pfn;
3408839ed9f635b Zi Yan                  2022-01-05  9259  				break;
3408839ed9f635b Zi Yan                  2022-01-05  9260  			}
3408839ed9f635b Zi Yan                  2022-01-05  9261  			outer_end &=3D=
 ~0UL << order;
3408839ed9f635b Zi Yan                  2022-01-05  9262  		}
3408839ed9f635b Zi Yan                  2022-01-05  9263  =

3408839ed9f635b Zi Yan                  2022-01-05  9264  		if (outer_end !=
=3D begin_pfn) {
3408839ed9f635b Zi Yan                  2022-01-05  9265  			order =3D budd=
y_order(pfn_to_page(outer_end));
3408839ed9f635b Zi Yan                  2022-01-05  9266  =

3408839ed9f635b Zi Yan                  2022-01-05  9267  			/*
3408839ed9f635b Zi Yan                  2022-01-05  9268  			 * split the f=
ree page has start page and put the pageblocks
3408839ed9f635b Zi Yan                  2022-01-05  9269  			 * in the righ=
t migratetype list
3408839ed9f635b Zi Yan                  2022-01-05  9270  			 */
3408839ed9f635b Zi Yan                  2022-01-05  9271  			VM_BUG_ON(oute=
r_end + (1UL << order) <=3D begin_pfn);
3408839ed9f635b Zi Yan                  2022-01-05  9272  			{
3408839ed9f635b Zi Yan                  2022-01-05  9273  				struct page *=
free_page =3D pfn_to_page(outer_end);
3408839ed9f635b Zi Yan                  2022-01-05  9274  =

3408839ed9f635b Zi Yan                  2022-01-05  9275  				split_free_pa=
ge_into_pageblocks(free_page, order, cc.zone);
3408839ed9f635b Zi Yan                  2022-01-05  9276  			}
3408839ed9f635b Zi Yan                  2022-01-05  9277  			outer_end +=3D=
 1UL << order;
3408839ed9f635b Zi Yan                  2022-01-05  9278  		} else
3408839ed9f635b Zi Yan                  2022-01-05  9279  			outer_end =3D =
begin_pfn + 1;
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9280  	}
8ef5849fa8a2c78 Joonsoo Kim             2016-01-14  9281  =

041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9282  	/* Make sure the=
 range is really isolated. */
3408839ed9f635b Zi Yan                  2022-01-05  9283  	if (test_pages_i=
solated(alloc_start, alloc_end, 0)) {
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9284  		ret =3D -EBUSY;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9285  		goto done;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9286  	}
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9287  =

49f223a9cd96c72 Marek Szyprowski        2012-01-25  9288  	/* Grab isolated=
 pages from freelists. */
3408839ed9f635b Zi Yan                  2022-01-05  9289  	outer_end =3D is=
olate_freepages_range(&cc, alloc_start, alloc_end);
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9290  	if (!outer_end) {
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9291  		ret =3D -EBUSY;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9292  		goto done;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9293  	}
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9294  =

041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9295  	/* Free head and=
 tail (if any) */
3408839ed9f635b Zi Yan                  2022-01-05  9296  	if (start !=3D a=
lloc_start)
3408839ed9f635b Zi Yan                  2022-01-05  9297  		free_contig_ran=
ge(alloc_start, start - alloc_start);
3408839ed9f635b Zi Yan                  2022-01-05  9298  	if (end !=3D all=
oc_end)
3408839ed9f635b Zi Yan                  2022-01-05  9299  		free_contig_ran=
ge(end, alloc_end - end);
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9300  =

041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9301  done:
3408839ed9f635b Zi Yan                  2022-01-05  9302  	kfree(saved_mt);
3408839ed9f635b Zi Yan                  2022-01-05  9303  	undo_isolate_pag=
e_range(alloc_start,
3408839ed9f635b Zi Yan                  2022-01-05  9304  				alloc_end, mi=
gratetype);
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9305  	return ret;
041d3a8cdc18dc3 Michal Nazarewicz       2011-12-29  9306  }
255f59850708390 David Hildenbrand       2020-05-07  9307  EXPORT_SYMBOL(all=
oc_contig_range);
5e27a2df03b8933 Anshuman Khandual       2019-11-30  9308  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2231866143802659633==--

