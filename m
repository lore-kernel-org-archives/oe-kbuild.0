Content-Type: multipart/mixed; boundary="===============5966206092612741067=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/rmap.c:1107:16: warning: Value stored to 'folio' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 26 Mar 2022 22:28:17 +0800
Message-ID: <202203262243.bkTpfimh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5966206092612741067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   52d543b5497cf31d6baeb0bcfe5a5474c3238578
commit: e05b34539d008ab819388f699b25eae962ba24ac mm: Turn page_anon_vma() i=
nto folio_anon_vma()
date:   5 days ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20326/202203262243.bkTpfimh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De05b34539d008ab819388f699b25eae962ba24ac
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e05b34539d008ab819388f699b25eae962ba24ac
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                            ^
   include/uapi/linux/swab.h:115:21: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                       ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1259:3: note: Taking false branch
                   if (be32_to_cpu(lep->address) =3D=3D XFS_DIR2_NULL_DATAP=
TR)
                   ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1270:7: note: Assuming 'newdb' is equal to=
 'curdb'
                   if (newdb !=3D curdb) {
                       ^~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_dir2_leaf.c:1270:3: note: Taking false branch
                   if (newdb !=3D curdb) {
                   ^
   fs/xfs/libxfs/xfs_dir2_leaf.c:1285:43: note: Access to field 'b_addr' re=
sults in a dereference of a null pointer (loaded from variable 'dbp')
                   dep =3D (xfs_dir2_data_entry_t *)((char *)dbp->b_addr +
                                                           ^~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   net/netfilter/nf_conntrack_proto_tcp.c:784:32: warning: Value stored to =
'sender' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           const struct ip_ct_tcp_state *sender =3D &ct->proto.tcp.seen[0];
                                         ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_conntrack_proto_tcp.c:784:32: note: Value stored to 'se=
nder' during its initialization is never read
           const struct ip_ct_tcp_state *sender =3D &ct->proto.tcp.seen[0];
                                         ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_conntrack_proto_tcp.c:785:32: warning: Value stored to =
'receiver' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           const struct ip_ct_tcp_state *receiver =3D &ct->proto.tcp.seen[1=
];
                                         ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_conntrack_proto_tcp.c:785:32: note: Value stored to 're=
ceiver' during its initialization is never read
           const struct ip_ct_tcp_state *receiver =3D &ct->proto.tcp.seen[1=
];
                                         ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   mm/mmu_gather.c:86:3: warning: Value stored to 'batch' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   batch =3D tlb->active;
                   ^       ~~~~~~~~~~~
   mm/mmu_gather.c:86:3: note: Value stored to 'batch' is never read
                   batch =3D tlb->active;
                   ^       ~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> mm/rmap.c:1107:16: warning: Value stored to 'folio' during its initializ=
ation is never read [clang-analyzer-deadcode.DeadStores]
           struct folio *folio =3D page_folio(page);
                         ^~~~~
   mm/rmap.c:1107:16: note: Value stored to 'folio' during its initializati=
on is never read
           struct folio *folio =3D page_folio(page);
                         ^~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   mm/vmalloc.c:300:2: warning: Value stored to 'start' is never read [clan=
g-analyzer-deadcode.DeadStores]
           start =3D addr;
           ^       ~~~~
   mm/vmalloc.c:300:2: note: Value stored to 'start' is never read
           start =3D addr;
           ^       ~~~~
   mm/vmalloc.c:582:18: warning: Value stored to 'nr' during its initializa=
tion is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int i, nr =3D (end - addr) >> PAGE_SHIFT;
                           ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:582:18: note: Value stored to 'nr' during its initializatio=
n is never read
           unsigned int i, nr =3D (end - addr) >> PAGE_SHIFT;
                           ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   mm/page_alloc.c:1150:13: warning: 2nd function call argument is an unini=
tialized value [clang-analyzer-core.CallAndMessage]
                   to_tail =3D buddy_merge_likely(pfn, buddy_pfn, page, ord=
er);
                             ^
   mm/page_alloc.c:8286:2: note: Calling 'drain_pages'
           drain_pages(cpu);
           ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:3125:2: note: Loop condition is true.  Entering loop body
           for_each_populated_zone(zone) {
           ^
   include/linux/mmzone.h:1137:2: note: expanded from macro 'for_each_popul=
ated_zone'
           for (zone =3D (first_online_pgdat())->node_zones; \
           ^
   mm/page_alloc.c:3125:2: note: Assuming the condition is false
           for_each_populated_zone(zone) {
           ^
   include/linux/mmzone.h:1140:7: note: expanded from macro 'for_each_popul=
ated_zone'
                   if (!populated_zone(zone))              \
                       ^~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:3125:2: note: Taking false branch
           for_each_populated_zone(zone) {
           ^
   include/linux/mmzone.h:1140:3: note: expanded from macro 'for_each_popul=
ated_zone'
                   if (!populated_zone(zone))              \
                   ^
   mm/page_alloc.c:3126:3: note: Calling 'drain_pages_zone'
                   drain_pages_zone(cpu, zone);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:3105:2: note: Loop condition is false.  Exiting loop
           local_lock_irqsave(&pagesets.lock, flags);
           ^
   include/linux/local_lock.h:31:2: note: expanded from macro 'local_lock_i=
rqsave'
           __local_lock_irqsave(lock, flags)
           ^
   include/linux/local_lock_internal.h:79:3: note: expanded from macro '__l=
ocal_lock_irqsave'
                   local_irq_save(flags);                          \
                   ^
   include/linux/irqflags.h:221:3: note: expanded from macro 'local_irq_sav=
e'
                   raw_local_irq_save(flags);              \
                   ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   mm/page_alloc.c:3105:2: note: Taking true branch
           local_lock_irqsave(&pagesets.lock, flags);
           ^
   include/linux/local_lock.h:31:2: note: expanded from macro 'local_lock_i=
rqsave'
           __local_lock_irqsave(lock, flags)
           ^
   include/linux/local_lock_internal.h:79:3: note: expanded from macro '__l=
ocal_lock_irqsave'
                   local_irq_save(flags);                          \
                   ^
   include/linux/irqflags.h:222:3: note: expanded from macro 'local_irq_sav=
e'
                   if (!raw_irqs_disabled_flags(flags))    \
                   ^
   mm/page_alloc.c:3105:2: note: Loop condition is false.  Exiting loop
           local_lock_irqsave(&pagesets.lock, flags);
           ^
   include/linux/local_lock.h:31:2: note: expanded from macro 'local_lock_i=
rqsave'
           __local_lock_irqsave(lock, flags)
           ^
   include/linux/local_lock_internal.h:79:3: note: expanded from macro '__l=
ocal_lock_irqsave'
                   local_irq_save(flags);                          \
                   ^
   include/linux/irqflags.h:220:2: note: expanded from macro 'local_irq_sav=
e'
           do {                                            \
           ^
   mm/page_alloc.c:3105:2: note: Loop condition is false.  Exiting loop
           local_lock_irqsave(&pagesets.lock, flags);
           ^
   include/linux/local_lock.h:31:2: note: expanded from macro 'local_lock_i=
rqsave'
           __local_lock_irqsave(lock, flags)
           ^
   include/linux/local_lock_internal.h:80:22: note: expanded from macro '__=
local_lock_irqsave'
                   local_lock_acquire(this_cpu_ptr(lock));         \

vim +/folio +1107 mm/rmap.c

9617d95e6e9ffd Nicholas Piggin         2006-01-06  1097  =

c97a9e10eaee32 Nicholas Piggin         2007-05-16  1098  /**
43d8eac44f28d3 Randy Dunlap            2008-03-19  1099   * __page_check_an=
on_rmap - sanity check anonymous rmap addition
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1100   * @page:	the page=
 to add the mapping to
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1101   * @vma:	the vm ar=
ea in which the mapping is added
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1102   * @address:	the u=
ser virtual address mapped
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1103   */
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1104  static void __page=
_check_anon_rmap(struct page *page,
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1105  	struct vm_area_st=
ruct *vma, unsigned long address)
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1106  {
e05b34539d008a Matthew Wilcox (Oracle  2022-01-29 @1107) 	struct folio *fol=
io =3D page_folio(page);
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1108  	/*
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1109  	 * The page's ano=
n-rmap details (mapping and index) are guaranteed to
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1110  	 * be set up corr=
ectly at this point.
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1111  	 *
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1112  	 * We have exclus=
ion against page_add_anon_rmap because the caller
90aaca852ca13a Miaohe Lin              2021-02-25  1113  	 * always holds t=
he page locked.
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1114  	 *
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1115  	 * We have exclus=
ion against page_add_new_anon_rmap because those pages
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1116  	 * are initially =
only visible via the pagetables, and the pte is locked
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1117  	 * over the call =
to page_add_new_anon_rmap.
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1118  	 */
e05b34539d008a Matthew Wilcox (Oracle  2022-01-29  1119) 	VM_BUG_ON_FOLIO(f=
olio_anon_vma(folio)->root !=3D vma->anon_vma->root,
e05b34539d008a Matthew Wilcox (Oracle  2022-01-29  1120) 			folio);
30c46382855e0e Yang Shi                2019-11-30  1121  	VM_BUG_ON_PAGE(pa=
ge_to_pgoff(page) !=3D linear_page_index(vma, address),
30c46382855e0e Yang Shi                2019-11-30  1122  		       page);
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1123  }
c97a9e10eaee32 Nicholas Piggin         2007-05-16  1124  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5966206092612741067==--

