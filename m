Content-Type: multipart/mixed; boundary="===============1601841413058636425=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/mempolicy.c:1415:6: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 14 Apr 2022 00:25:26 +0800
Message-ID: <202204140012.kcVN18Hc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1601841413058636425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a19944809fe9942e6a96292490717904d0690c21
commit: e130242dc351f1cfa2bbeb6766a1486ce936ef88 mm: simplify compat numa s=
yscalls
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-c006-20220413 (https://download.01.org/0day-ci/arc=
hive/20220414/202204140012.kcVN18Hc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478=
d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De130242dc351f1cfa2bbeb6766a1486ce936ef88
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e130242dc351f1cfa2bbeb6766a1486ce936ef88
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   mm/mempolicy.c:246:26: warning: Dereference of null pointer (loaded from=
 variable 'nodes') [clang-analyzer-core.NullDereference]
                   pol->w.user_nodemask =3D *nodes;
                                          ^
   mm/mempolicy.c:2803:36: note: Passing null pointer value via 3rd paramet=
er 'nodes'
           do_set_mempolicy(MPOL_DEFAULT, 0, NULL);
                                             ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   mm/mempolicy.c:2803:2: note: Calling 'do_set_mempolicy'
           do_set_mempolicy(MPOL_DEFAULT, 0, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:850:7: note: 'scratch' is non-null
           if (!scratch)
                ^~~~~~~
   mm/mempolicy.c:850:2: note: Taking false branch
           if (!scratch)
           ^
   mm/mempolicy.c:854:2: note: Taking false branch
           if (IS_ERR(new)) {
           ^
   mm/mempolicy.c:859:2: note: Taking false branch
           if (flags & MPOL_F_NUMA_BALANCING) {
           ^
   mm/mempolicy.c:869:31: note: Passing null pointer value via 2nd paramete=
r 'nodes'
           ret =3D mpol_set_nodemask(new, nodes, scratch);
                                        ^~~~~
   mm/mempolicy.c:869:8: note: Calling 'mpol_set_nodemask'
           ret =3D mpol_set_nodemask(new, nodes, scratch);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:231:6: note: Assuming 'pol' is non-null
           if (!pol || pol->mode =3D=3D MPOL_LOCAL)
               ^~~~
   mm/mempolicy.c:231:6: note: Left side of '||' is false
   mm/mempolicy.c:231:14: note: Assuming field 'mode' is not equal to MPOL_=
LOCAL
           if (!pol || pol->mode =3D=3D MPOL_LOCAL)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:231:2: note: Taking false branch
           if (!pol || pol->mode =3D=3D MPOL_LOCAL)
           ^
   mm/mempolicy.c:240:6: note: Assuming the condition is false
           if (pol->flags & MPOL_F_RELATIVE_NODES)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:240:2: note: Taking false branch
           if (pol->flags & MPOL_F_RELATIVE_NODES)
           ^
   mm/mempolicy.c:245:6: note: Assuming the condition is true
           if (mpol_store_user_nodemask(pol))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:245:2: note: Taking true branch
           if (mpol_store_user_nodemask(pol))
           ^
   mm/mempolicy.c:246:26: note: Dereference of null pointer (loaded from va=
riable 'nodes')
                   pol->w.user_nodemask =3D *nodes;
                                          ^~~~~~
   mm/mempolicy.c:1221:10: warning: 3rd function call argument is an uninit=
ialized value [clang-analyzer-core.CallAndMessage]
                   return alloc_huge_page_vma(page_hstate(compound_head(pag=
e)),
                          ^
   mm/mempolicy.c:1210:2: note: 'address' declared without an initial value
           unsigned long address;
           ^~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:1213:2: note: Loop condition is false. Execution continue=
s on line 1220
           while (vma) {
           ^
   mm/mempolicy.c:1220:6: note: Assuming the condition is true
           if (PageHuge(page)) {
               ^~~~~~~~~~~~~~
   mm/mempolicy.c:1220:2: note: Taking true branch
           if (PageHuge(page)) {
           ^
   mm/mempolicy.c:1221:10: note: 3rd function call argument is an uninitial=
ized value
                   return alloc_huge_page_vma(page_hstate(compound_head(pag=
e)),
                          ^
   mm/mempolicy.c:1236:9: warning: 4th function call argument is an uniniti=
alized value [clang-analyzer-core.CallAndMessage]
           return alloc_page_vma(GFP_HIGHUSER_MOVABLE | __GFP_RETRY_MAYFAIL,
                  ^
   include/linux/gfp.h:606:2: note: expanded from macro 'alloc_page_vma'
           alloc_pages_vma(gfp_mask, 0, vma, addr, numa_node_id(), false)
           ^                                 ~~~~
   mm/mempolicy.c:1210:2: note: 'address' declared without an initial value
           unsigned long address;
           ^~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:1213:2: note: Loop condition is false. Execution continue=
s on line 1220
           while (vma) {
           ^
   mm/mempolicy.c:1220:6: note: Assuming the condition is false
           if (PageHuge(page)) {
               ^~~~~~~~~~~~~~
   mm/mempolicy.c:1220:2: note: Taking false branch
           if (PageHuge(page)) {
           ^
   mm/mempolicy.c:1223:9: note: Taking false branch
           } else if (PageTransHuge(page)) {
                  ^
   mm/mempolicy.c:1236:9: note: 4th function call argument is an uninitiali=
zed value
           return alloc_page_vma(GFP_HIGHUSER_MOVABLE | __GFP_RETRY_MAYFAIL,
                  ^
   include/linux/gfp.h:606:2: note: expanded from macro 'alloc_page_vma'
           alloc_pages_vma(gfp_mask, 0, vma, addr, numa_node_id(), false)
           ^                                 ~~~~
>> mm/mempolicy.c:1415:6: warning: The left expression of the compound assi=
gnment is an uninitialized value. The computed value will also be garbage [=
clang-analyzer-core.uninitialized.Assign]
                           t &=3D ~((1UL << (MAX_NUMNODES % BITS_PER_LONG))=
 - 1);
                             ^
   mm/mempolicy.c:1607:1: note: Calling '__do_sys_migrate_pages'
   SYSCALL_DEFINE4(migrate_pages, pid_t, pid, unsigned long, maxnode,
   ^
   include/linux/syscalls.h:219:36: note: expanded from macro 'SYSCALL_DEFI=
NE4'
   #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:248:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   mm/mempolicy.c:1611:9: note: Calling 'kernel_migrate_pages'
           return kernel_migrate_pages(pid, maxnode, old_nodes, new_nodes);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:1531:7: note: 'scratch' is non-null
           if (!scratch)
                ^~~~~~~
   mm/mempolicy.c:1531:2: note: Taking false branch
           if (!scratch)
           ^
   mm/mempolicy.c:1537:8: note: Calling 'get_nodes'
           err =3D get_nodes(old, old_nodes, maxnode);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:1394:6: note: Assuming 'maxnode' is not equal to 0
           if (maxnode =3D=3D 0 || !nmask)
               ^~~~~~~~~~~~
   mm/mempolicy.c:1394:6: note: Left side of '||' is false
   mm/mempolicy.c:1394:22: note: Assuming 'nmask' is non-null
           if (maxnode =3D=3D 0 || !nmask)
                               ^~~~~~
   mm/mempolicy.c:1394:2: note: Taking false branch
           if (maxnode =3D=3D 0 || !nmask)
           ^
   mm/mempolicy.c:1396:6: note: Assuming the condition is false
           if (maxnode > PAGE_SIZE*BITS_PER_BYTE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:1396:2: note: Taking false branch
           if (maxnode > PAGE_SIZE*BITS_PER_BYTE)
           ^
   mm/mempolicy.c:1404:9: note: Assuming the condition is true
           while (maxnode > MAX_NUMNODES) {
                  ^~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:1404:2: note: Loop condition is true.  Entering loop body
           while (maxnode > MAX_NUMNODES) {
           ^
   mm/mempolicy.c:1405:24: note: Assuming '__UNIQUE_ID___x318' is < '__UNIQ=
UE_ID___y319'
                   unsigned long bits =3D min_t(unsigned long, maxnode, BIT=
S_PER_LONG);
                                        ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   mm/mempolicy.c:1405:24: note: '?' condition is true
                   unsigned long bits =3D min_t(unsigned long, maxnode, BIT=
S_PER_LONG);
                                        ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
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
   mm/mempolicy.c:1406:3: note: 't' declared without an initial value
                   unsigned long t;
                   ^~~~~~~~~~~~~~~
   mm/mempolicy.c:1408:7: note: Calling 'get_bitmap'
                   if (get_bitmap(&t, &nmask[maxnode / BITS_PER_LONG], bits=
))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mempolicy.c:1371:2: note: Taking false branch
           if (in_compat_syscall())
           ^
   mm/mempolicy.c:1376:9: note: Calling 'copy_from_user'
                   ret =3D copy_from_user(mask, nmask,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:6: note: Assuming the condition is true
           if (likely(check_copy_size(to, n, false)))
               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^

vim +1415 mm/mempolicy.c

8bccd85ffbaf8f Christoph Lameter 2005-10-29  1387  =

8bccd85ffbaf8f Christoph Lameter 2005-10-29  1388  /* Copy a node mask from=
 user space. */
39743889aaf767 Christoph Lameter 2006-01-08  1389  static int get_nodes(nod=
emask_t *nodes, const unsigned long __user *nmask,
8bccd85ffbaf8f Christoph Lameter 2005-10-29  1390  		     unsigned long max=
node)
8bccd85ffbaf8f Christoph Lameter 2005-10-29  1391  {
8bccd85ffbaf8f Christoph Lameter 2005-10-29  1392  	--maxnode;
8bccd85ffbaf8f Christoph Lameter 2005-10-29  1393  	nodes_clear(*nodes);
8bccd85ffbaf8f Christoph Lameter 2005-10-29  1394  	if (maxnode =3D=3D 0 ||=
 !nmask)
8bccd85ffbaf8f Christoph Lameter 2005-10-29  1395  		return 0;
a9c930bac163c5 Andi Kleen        2006-02-20  1396  	if (maxnode > PAGE_SIZE=
*BITS_PER_BYTE)
636f13c174dd7c Chris Wright      2006-02-17  1397  		return -EINVAL;
8bccd85ffbaf8f Christoph Lameter 2005-10-29  1398  =

56521e7a02b7b8 Yisheng Xie       2018-01-31  1399  	/*
56521e7a02b7b8 Yisheng Xie       2018-01-31  1400  	 * When the user specif=
ied more nodes than supported just check
e130242dc351f1 Arnd Bergmann     2021-09-08  1401  	 * if the non supported=
 part is all zero, one word at a time,
e130242dc351f1 Arnd Bergmann     2021-09-08  1402  	 * starting at the end.
56521e7a02b7b8 Yisheng Xie       2018-01-31  1403  	 */
e130242dc351f1 Arnd Bergmann     2021-09-08  1404  	while (maxnode > MAX_NU=
MNODES) {
e130242dc351f1 Arnd Bergmann     2021-09-08  1405  		unsigned long bits =3D=
 min_t(unsigned long, maxnode, BITS_PER_LONG);
e130242dc351f1 Arnd Bergmann     2021-09-08  1406  		unsigned long t;
56521e7a02b7b8 Yisheng Xie       2018-01-31  1407  =

e130242dc351f1 Arnd Bergmann     2021-09-08  1408  		if (get_bitmap(&t, &nm=
ask[maxnode / BITS_PER_LONG], bits))
56521e7a02b7b8 Yisheng Xie       2018-01-31  1409  			return -EFAULT;
e130242dc351f1 Arnd Bergmann     2021-09-08  1410  =

e130242dc351f1 Arnd Bergmann     2021-09-08  1411  		if (maxnode - bits >=
=3D MAX_NUMNODES) {
e130242dc351f1 Arnd Bergmann     2021-09-08  1412  			maxnode -=3D bits;
e130242dc351f1 Arnd Bergmann     2021-09-08  1413  		} else {
e130242dc351f1 Arnd Bergmann     2021-09-08  1414  			maxnode =3D MAX_NUMNO=
DES;
e130242dc351f1 Arnd Bergmann     2021-09-08 @1415  			t &=3D ~((1UL << (MAX=
_NUMNODES % BITS_PER_LONG)) - 1);
e130242dc351f1 Arnd Bergmann     2021-09-08  1416  		}
e130242dc351f1 Arnd Bergmann     2021-09-08  1417  		if (t)
56521e7a02b7b8 Yisheng Xie       2018-01-31  1418  			return -EINVAL;
56521e7a02b7b8 Yisheng Xie       2018-01-31  1419  	}
56521e7a02b7b8 Yisheng Xie       2018-01-31  1420  =

e130242dc351f1 Arnd Bergmann     2021-09-08  1421  	return get_bitmap(nodes=
_addr(*nodes), nmask, maxnode);
8bccd85ffbaf8f Christoph Lameter 2005-10-29  1422  }
8bccd85ffbaf8f Christoph Lameter 2005-10-29  1423  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1601841413058636425==--

