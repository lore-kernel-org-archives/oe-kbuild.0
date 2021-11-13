Content-Type: multipart/mixed; boundary="===============1415639372143088940=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/nommu.c:1010:12: warning: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Sat, 13 Nov 2021 21:49:09 +0800
Message-ID: <202111132149.EphgbyPT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1415639372143088940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jakub Jelinek <jakub@redhat.com>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   66f4beaa6c1d28161f534471484b2daa2de1dce0
commit: 2f78788b55baa3410b1ec91a576286abe1ad4d6a ilog2: improve ilog2 for c=
onstant arguments
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20211003 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 962e50=
3cc8bc411f7523cc393acae8aae425b1c4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2f78788b55baa3410b1ec91a576286abe1ad4d6a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2f78788b55baa3410b1ec91a576286abe1ad4d6a
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   #define ASSERTCMP(X, OP, Y)                                             \
                                                                           ^
   fs/fscache/operation.c:597:7: note: Assuming field 'n_ops' is not equal =
to 0
                   if (object->n_ops =3D=3D 0)
                       ^~~~~~~~~~~~~~~~~~
   fs/fscache/operation.c:597:3: note: Taking false branch
                   if (object->n_ops =3D=3D 0)
                   ^
   fs/fscache/operation.c:601:3: note: Memory is released
                   kfree(op);
                   ^~~~~~~~~
   fs/fscache/operation.c:571:2: note: Loop condition is true. Execution co=
ntinues on line 572
           do {
           ^
   fs/fscache/operation.c:573:7: note: Assuming the condition is false
                   if (list_empty(&cache->op_gc_list)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fscache/operation.c:573:3: note: Taking false branch
                   if (list_empty(&cache->op_gc_list)) {
                   ^
   fs/fscache/operation.c:578:8: note: Left side of '&&' is false
                   op =3D list_entry(cache->op_gc_list.next,
                        ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/fscache/operation.c:578:8: note: Taking false branch
                   op =3D list_entry(cache->op_gc_list.next,
                        ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/fscache/operation.c:578:8: note: Loop condition is false.  Exiting lo=
op
                   op =3D list_entry(cache->op_gc_list.next,
                        ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/fscache/operation.c:580:3: note: Calling 'list_del'
                   list_del(&op->pend_link);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 10 warnings (2 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   mm/nommu.c:423:2: warning: Value stored to 'ret' is never read [clang-an=
alyzer-deadcode.DeadStores]
           ret =3D percpu_counter_init(&vm_committed_as, 0, GFP_KERNEL);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/nommu.c:423:2: note: Value stored to 'ret' is never read
           ret =3D percpu_counter_init(&vm_committed_as, 0, GFP_KERNEL);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/nommu.c:881:6: warning: Value stored to 'prot' is never read [clang-a=
nalyzer-deadcode.DeadStores]
                                           prot |=3D PROT_EXEC;
                                           ^
   mm/nommu.c:881:6: note: Value stored to 'prot' is never read
   mm/nommu.c:899:4: warning: Value stored to 'prot' is never read [clang-a=
nalyzer-deadcode.DeadStores]
                           prot |=3D PROT_EXEC;
                           ^
   mm/nommu.c:899:4: note: Value stored to 'prot' is never read
>> mm/nommu.c:1010:12: warning: The result of the left shift is undefined d=
ue to shifting by '32', which is greater or equal to the width of type 'int=
' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           total =3D 1 << order;
                     ^
   mm/nommu.c:1091:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   mm/nommu.c:1091:2: note: Taking false branch
           if (ret < 0)
           ^
   mm/nommu.c:1104:6: note: Assuming 'region' is non-null
           if (!region)
               ^~~~~~~
   mm/nommu.c:1104:2: note: Taking false branch
           if (!region)
           ^
   mm/nommu.c:1108:6: note: Assuming 'vma' is non-null
           if (!vma)
               ^~~~
   mm/nommu.c:1108:2: note: Taking false branch
           if (!vma)
           ^
   mm/nommu.c:1118:6: note: 'file' is null
           if (file) {
               ^~~~
   mm/nommu.c:1118:2: note: Taking false branch
           if (file) {
           ^
   mm/nommu.c:1133:6: note: Assuming the condition is false
           if (vm_flags & VM_MAYSHARE) {
               ^~~~~~~~~~~~~~~~~~~~~~
   mm/nommu.c:1133:2: note: Taking false branch
           if (vm_flags & VM_MAYSHARE) {
           ^
   mm/nommu.c:1230:6: note: 'file' is null
           if (file && vma->vm_flags & VM_SHARED)
               ^~~~
   mm/nommu.c:1230:11: note: Left side of '&&' is false
           if (file && vma->vm_flags & VM_SHARED)
                    ^
   mm/nommu.c:1233:9: note: Calling 'do_mmap_private'
                   ret =3D do_mmap_private(vma, region, len, capabilities);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/nommu.c:988:2: note: Taking false branch
           if (capabilities & NOMMU_MAP_DIRECT) {
           ^
   mm/nommu.c:1009:10: note: Calling 'get_order'
           order =3D get_order(len);
                   ^~~~~~~~~~~~~~
   include/asm-generic/getorder.h:31:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/asm-generic/getorder.h:46:9: note: Calling 'fls64'
           return fls64(size);
                  ^~~~~~~~~~~
   include/asm-generic/bitops/fls64.h:29:6: note: Assuming 'x' is not equal=
 to 0
           if (x =3D=3D 0)
               ^~~~~~
   include/asm-generic/bitops/fls64.h:29:2: note: Taking false branch
           if (x =3D=3D 0)
           ^
   include/asm-generic/bitops/fls64.h:31:2: note: Returning the value 32
           return __fls(x) + 1;
           ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/getorder.h:46:9: note: Returning from 'fls64'
           return fls64(size);
                  ^~~~~~~~~~~
   include/asm-generic/getorder.h:46:2: note: Returning the value 32
           return fls64(size);
           ^~~~~~~~~~~~~~~~~~
   mm/nommu.c:1009:10: note: Returning from 'get_order'
           order =3D get_order(len);
                   ^~~~~~~~~~~~~~
   mm/nommu.c:1009:2: note: The value 32 is assigned to 'order'
           order =3D get_order(len);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/nommu.c:1010:12: note: The result of the left shift is undefined due =
to shifting by '32', which is greater or equal to the width of type 'int'
           total =3D 1 << order;
                     ^  ~~~~~
   mm/nommu.c:1010:12: warning: The result of the left shift is undefined d=
ue to shifting by '33', which is greater or equal to the width of type 'int=
' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           total =3D 1 << order;
                     ^
   mm/nommu.c:1091:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   mm/nommu.c:1091:2: note: Taking false branch
           if (ret < 0)
           ^
   mm/nommu.c:1104:6: note: Assuming 'region' is non-null
           if (!region)
               ^~~~~~~
   mm/nommu.c:1104:2: note: Taking false branch
           if (!region)
           ^
   mm/nommu.c:1108:6: note: Assuming 'vma' is non-null
           if (!vma)
               ^~~~
   mm/nommu.c:1108:2: note: Taking false branch
           if (!vma)
           ^
   mm/nommu.c:1118:6: note: 'file' is null
           if (file) {

vim +1010 mm/nommu.c

^1da177e4c3f41 Linus Torvalds     2005-04-16   750  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   751  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16   752   * determine whether a =
mapping should be permitted and, if so, what sort of
^1da177e4c3f41 Linus Torvalds     2005-04-16   753   * mapping we're capabl=
e of supporting
^1da177e4c3f41 Linus Torvalds     2005-04-16   754   */
^1da177e4c3f41 Linus Torvalds     2005-04-16   755  static int validate_mma=
p_request(struct file *file,
^1da177e4c3f41 Linus Torvalds     2005-04-16   756  				 unsigned long addr,
^1da177e4c3f41 Linus Torvalds     2005-04-16   757  				 unsigned long len,
^1da177e4c3f41 Linus Torvalds     2005-04-16   758  				 unsigned long prot,
^1da177e4c3f41 Linus Torvalds     2005-04-16   759  				 unsigned long flag=
s,
^1da177e4c3f41 Linus Torvalds     2005-04-16   760  				 unsigned long pgof=
f,
^1da177e4c3f41 Linus Torvalds     2005-04-16   761  				 unsigned long *_ca=
pabilities)
^1da177e4c3f41 Linus Torvalds     2005-04-16   762  {
8feae13110d60c David Howells      2009-01-08   763  	unsigned long capabili=
ties, rlen;
^1da177e4c3f41 Linus Torvalds     2005-04-16   764  	int ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16   765  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   766  	/* do the simple check=
s first */
22cc877b32202b Leon Romanovsky    2015-06-24   767  	if (flags & MAP_FIXED)
^1da177e4c3f41 Linus Torvalds     2005-04-16   768  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16   769  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   770  	if ((flags & MAP_TYPE)=
 !=3D MAP_PRIVATE &&
^1da177e4c3f41 Linus Torvalds     2005-04-16   771  	    (flags & MAP_TYPE)=
 !=3D MAP_SHARED)
^1da177e4c3f41 Linus Torvalds     2005-04-16   772  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16   773  =

f81cff0d4067e4 Mike Frysinger     2006-12-06   774  	if (!len)
^1da177e4c3f41 Linus Torvalds     2005-04-16   775  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16   776  =

f81cff0d4067e4 Mike Frysinger     2006-12-06   777  	/* Careful about overf=
lows.. */
8feae13110d60c David Howells      2009-01-08   778  	rlen =3D PAGE_ALIGN(le=
n);
8feae13110d60c David Howells      2009-01-08   779  	if (!rlen || rlen > TA=
SK_SIZE)
f81cff0d4067e4 Mike Frysinger     2006-12-06   780  		return -ENOMEM;
f81cff0d4067e4 Mike Frysinger     2006-12-06   781  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   782  	/* offset overflow? */
8feae13110d60c David Howells      2009-01-08   783  	if ((pgoff + (rlen >> =
PAGE_SHIFT)) < pgoff)
f81cff0d4067e4 Mike Frysinger     2006-12-06   784  		return -EOVERFLOW;
^1da177e4c3f41 Linus Torvalds     2005-04-16   785  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   786  	if (file) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   787  		/* files must support=
 mmap */
72c2d531920048 Al Viro            2013-09-22   788  		if (!file->f_op->mmap)
^1da177e4c3f41 Linus Torvalds     2005-04-16   789  			return -ENODEV;
^1da177e4c3f41 Linus Torvalds     2005-04-16   790  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   791  		/* work out if what w=
e've got could possibly be shared
^1da177e4c3f41 Linus Torvalds     2005-04-16   792  		 * - we support chard=
evs that provide their own "memory"
^1da177e4c3f41 Linus Torvalds     2005-04-16   793  		 * - we support files=
/blockdevs that are memory backed
^1da177e4c3f41 Linus Torvalds     2005-04-16   794  		 */
b4caecd48005fb Christoph Hellwig  2015-01-14   795  		if (file->f_op->mmap_=
capabilities) {
b4caecd48005fb Christoph Hellwig  2015-01-14   796  			capabilities =3D fil=
e->f_op->mmap_capabilities(file);
b4caecd48005fb Christoph Hellwig  2015-01-14   797  		} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16   798  			/* no explicit capab=
ilities set, so assume some
^1da177e4c3f41 Linus Torvalds     2005-04-16   799  			 * defaults */
496ad9aa8ef448 Al Viro            2013-01-23   800  			switch (file_inode(f=
ile)->i_mode & S_IFMT) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   801  			case S_IFREG:
^1da177e4c3f41 Linus Torvalds     2005-04-16   802  			case S_IFBLK:
b4caecd48005fb Christoph Hellwig  2015-01-14   803  				capabilities =3D NO=
MMU_MAP_COPY;
^1da177e4c3f41 Linus Torvalds     2005-04-16   804  				break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   805  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   806  			case S_IFCHR:
^1da177e4c3f41 Linus Torvalds     2005-04-16   807  				capabilities =3D
b4caecd48005fb Christoph Hellwig  2015-01-14   808  					NOMMU_MAP_DIRECT |
b4caecd48005fb Christoph Hellwig  2015-01-14   809  					NOMMU_MAP_READ |
b4caecd48005fb Christoph Hellwig  2015-01-14   810  					NOMMU_MAP_WRITE;
^1da177e4c3f41 Linus Torvalds     2005-04-16   811  				break;
^1da177e4c3f41 Linus Torvalds     2005-04-16   812  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   813  			default:
^1da177e4c3f41 Linus Torvalds     2005-04-16   814  				return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16   815  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16   816  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16   817  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   818  		/* eliminate any capa=
bilities that we can't support on this
^1da177e4c3f41 Linus Torvalds     2005-04-16   819  		 * device */
^1da177e4c3f41 Linus Torvalds     2005-04-16   820  		if (!file->f_op->get_=
unmapped_area)
b4caecd48005fb Christoph Hellwig  2015-01-14   821  			capabilities &=3D ~N=
OMMU_MAP_DIRECT;
6e242a1ceeb1bc Al Viro            2015-03-31   822  		if (!(file->f_mode & =
FMODE_CAN_READ))
b4caecd48005fb Christoph Hellwig  2015-01-14   823  			capabilities &=3D ~N=
OMMU_MAP_COPY;
^1da177e4c3f41 Linus Torvalds     2005-04-16   824  =

28d7a6ae92c099 Graff Yang         2009-08-18   825  		/* The file shall hav=
e been opened with read permission. */
28d7a6ae92c099 Graff Yang         2009-08-18   826  		if (!(file->f_mode & =
FMODE_READ))
28d7a6ae92c099 Graff Yang         2009-08-18   827  			return -EACCES;
28d7a6ae92c099 Graff Yang         2009-08-18   828  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   829  		if (flags & MAP_SHARE=
D) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   830  			/* do checks for wri=
ting, appending and locking */
^1da177e4c3f41 Linus Torvalds     2005-04-16   831  			if ((prot & PROT_WRI=
TE) &&
^1da177e4c3f41 Linus Torvalds     2005-04-16   832  			    !(file->f_mode &=
 FMODE_WRITE))
^1da177e4c3f41 Linus Torvalds     2005-04-16   833  				return -EACCES;
^1da177e4c3f41 Linus Torvalds     2005-04-16   834  =

496ad9aa8ef448 Al Viro            2013-01-23   835  			if (IS_APPEND(file_i=
node(file)) &&
^1da177e4c3f41 Linus Torvalds     2005-04-16   836  			    (file->f_mode & =
FMODE_WRITE))
^1da177e4c3f41 Linus Torvalds     2005-04-16   837  				return -EACCES;
^1da177e4c3f41 Linus Torvalds     2005-04-16   838  =

d7a06983a01a33 Jeff Layton        2014-03-10   839  			if (locks_verify_loc=
ked(file))
^1da177e4c3f41 Linus Torvalds     2005-04-16   840  				return -EAGAIN;
^1da177e4c3f41 Linus Torvalds     2005-04-16   841  =

b4caecd48005fb Christoph Hellwig  2015-01-14   842  			if (!(capabilities &=
 NOMMU_MAP_DIRECT))
^1da177e4c3f41 Linus Torvalds     2005-04-16   843  				return -ENODEV;
^1da177e4c3f41 Linus Torvalds     2005-04-16   844  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   845  			/* we mustn't privat=
ise shared mappings */
b4caecd48005fb Christoph Hellwig  2015-01-14   846  			capabilities &=3D ~N=
OMMU_MAP_COPY;
ac7149045d9fcc Choi Gi-yong       2014-04-07   847  		} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16   848  			/* we're going to re=
ad the file into private memory we
^1da177e4c3f41 Linus Torvalds     2005-04-16   849  			 * allocate */
b4caecd48005fb Christoph Hellwig  2015-01-14   850  			if (!(capabilities &=
 NOMMU_MAP_COPY))
^1da177e4c3f41 Linus Torvalds     2005-04-16   851  				return -ENODEV;
^1da177e4c3f41 Linus Torvalds     2005-04-16   852  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   853  			/* we don't permit a=
 private writable mapping to be
^1da177e4c3f41 Linus Torvalds     2005-04-16   854  			 * shared with the b=
acking device */
^1da177e4c3f41 Linus Torvalds     2005-04-16   855  			if (prot & PROT_WRIT=
E)
b4caecd48005fb Christoph Hellwig  2015-01-14   856  				capabilities &=3D ~=
NOMMU_MAP_DIRECT;
^1da177e4c3f41 Linus Torvalds     2005-04-16   857  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16   858  =

b4caecd48005fb Christoph Hellwig  2015-01-14   859  		if (capabilities & NO=
MMU_MAP_DIRECT) {
b4caecd48005fb Christoph Hellwig  2015-01-14   860  			if (((prot & PROT_RE=
AD)  && !(capabilities & NOMMU_MAP_READ))  ||
b4caecd48005fb Christoph Hellwig  2015-01-14   861  			    ((prot & PROT_WR=
ITE) && !(capabilities & NOMMU_MAP_WRITE)) ||
b4caecd48005fb Christoph Hellwig  2015-01-14   862  			    ((prot & PROT_EX=
EC)  && !(capabilities & NOMMU_MAP_EXEC))
3c7b204547bc3d Bernd Schmidt      2010-05-25   863  			    ) {
b4caecd48005fb Christoph Hellwig  2015-01-14   864  				capabilities &=3D ~=
NOMMU_MAP_DIRECT;
3c7b204547bc3d Bernd Schmidt      2010-05-25   865  				if (flags & MAP_SHA=
RED) {
22cc877b32202b Leon Romanovsky    2015-06-24   866  					pr_warn("MAP_SHARE=
D not completely supported on !MMU\n");
3c7b204547bc3d Bernd Schmidt      2010-05-25   867  					return -EINVAL;
3c7b204547bc3d Bernd Schmidt      2010-05-25   868  				}
3c7b204547bc3d Bernd Schmidt      2010-05-25   869  			}
3c7b204547bc3d Bernd Schmidt      2010-05-25   870  		}
3c7b204547bc3d Bernd Schmidt      2010-05-25   871  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   872  		/* handle executable =
mappings and implied executable
^1da177e4c3f41 Linus Torvalds     2005-04-16   873  		 * mappings */
90f8572b0f021f Eric W. Biederman  2015-06-29   874  		if (path_noexec(&file=
->f_path)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   875  			if (prot & PROT_EXEC)
^1da177e4c3f41 Linus Torvalds     2005-04-16   876  				return -EPERM;
ac7149045d9fcc Choi Gi-yong       2014-04-07   877  		} else if ((prot & PR=
OT_READ) && !(prot & PROT_EXEC)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   878  			/* handle implicatio=
n of PROT_EXEC by PROT_READ */
^1da177e4c3f41 Linus Torvalds     2005-04-16   879  			if (current->persona=
lity & READ_IMPLIES_EXEC) {
b4caecd48005fb Christoph Hellwig  2015-01-14   880  				if (capabilities & =
NOMMU_MAP_EXEC)
^1da177e4c3f41 Linus Torvalds     2005-04-16  @881  					prot |=3D PROT_EXE=
C;
^1da177e4c3f41 Linus Torvalds     2005-04-16   882  			}
ac7149045d9fcc Choi Gi-yong       2014-04-07   883  		} else if ((prot & PR=
OT_READ) &&
^1da177e4c3f41 Linus Torvalds     2005-04-16   884  			 (prot & PROT_EXEC) =
&&
b4caecd48005fb Christoph Hellwig  2015-01-14   885  			 !(capabilities & NO=
MMU_MAP_EXEC)
^1da177e4c3f41 Linus Torvalds     2005-04-16   886  			 ) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   887  			/* backing file is n=
ot executable, try to copy */
b4caecd48005fb Christoph Hellwig  2015-01-14   888  			capabilities &=3D ~N=
OMMU_MAP_DIRECT;
^1da177e4c3f41 Linus Torvalds     2005-04-16   889  		}
ac7149045d9fcc Choi Gi-yong       2014-04-07   890  	} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16   891  		/* anonymous mappings=
 are always memory backed and can be
^1da177e4c3f41 Linus Torvalds     2005-04-16   892  		 * privately mapped
^1da177e4c3f41 Linus Torvalds     2005-04-16   893  		 */
b4caecd48005fb Christoph Hellwig  2015-01-14   894  		capabilities =3D NOMM=
U_MAP_COPY;
^1da177e4c3f41 Linus Torvalds     2005-04-16   895  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   896  		/* handle PROT_EXEC i=
mplication by PROT_READ */
^1da177e4c3f41 Linus Torvalds     2005-04-16   897  		if ((prot & PROT_READ=
) &&
^1da177e4c3f41 Linus Torvalds     2005-04-16   898  		    (current->persona=
lity & READ_IMPLIES_EXEC))
^1da177e4c3f41 Linus Torvalds     2005-04-16   899  			prot |=3D PROT_EXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16   900  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   901  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   902  	/* allow the security =
API to have its say */
e5467859f7f79b Al Viro            2012-05-30   903  	ret =3D security_mmap_=
addr(addr);
^1da177e4c3f41 Linus Torvalds     2005-04-16   904  	if (ret < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16   905  		return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16   906  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   907  	/* looks okay */
^1da177e4c3f41 Linus Torvalds     2005-04-16   908  	*_capabilities =3D cap=
abilities;
^1da177e4c3f41 Linus Torvalds     2005-04-16   909  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16   910  }
^1da177e4c3f41 Linus Torvalds     2005-04-16   911  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   912  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16   913   * we've determined tha=
t we can make the mapping, now translate what we
^1da177e4c3f41 Linus Torvalds     2005-04-16   914   * now know into VMA fl=
ags
^1da177e4c3f41 Linus Torvalds     2005-04-16   915   */
^1da177e4c3f41 Linus Torvalds     2005-04-16   916  static unsigned long de=
termine_vm_flags(struct file *file,
^1da177e4c3f41 Linus Torvalds     2005-04-16   917  					unsigned long prot,
^1da177e4c3f41 Linus Torvalds     2005-04-16   918  					unsigned long flag=
s,
^1da177e4c3f41 Linus Torvalds     2005-04-16   919  					unsigned long capa=
bilities)
^1da177e4c3f41 Linus Torvalds     2005-04-16   920  {
^1da177e4c3f41 Linus Torvalds     2005-04-16   921  	unsigned long vm_flags;
^1da177e4c3f41 Linus Torvalds     2005-04-16   922  =

e6bfb70959a0ca Dave Hansen        2016-02-12   923  	vm_flags =3D calc_vm_p=
rot_bits(prot, 0) | calc_vm_flag_bits(flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16   924  	/* vm_flags |=3D mm->d=
ef_flags; */
^1da177e4c3f41 Linus Torvalds     2005-04-16   925  =

b4caecd48005fb Christoph Hellwig  2015-01-14   926  	if (!(capabilities & N=
OMMU_MAP_DIRECT)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   927  		/* attempt to share r=
ead-only copies of mapped file chunks */
3c7b204547bc3d Bernd Schmidt      2010-05-25   928  		vm_flags |=3D VM_MAYR=
EAD | VM_MAYWRITE | VM_MAYEXEC;
^1da177e4c3f41 Linus Torvalds     2005-04-16   929  		if (file && !(prot & =
PROT_WRITE))
^1da177e4c3f41 Linus Torvalds     2005-04-16   930  			vm_flags |=3D VM_MAY=
SHARE;
3c7b204547bc3d Bernd Schmidt      2010-05-25   931  	} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16   932  		/* overlay a shareabl=
e mapping on the backing device or inode
^1da177e4c3f41 Linus Torvalds     2005-04-16   933  		 * if possible - used=
 for chardevs, ramfs/tmpfs/shmfs and
^1da177e4c3f41 Linus Torvalds     2005-04-16   934  		 * romfs/cramfs */
b4caecd48005fb Christoph Hellwig  2015-01-14   935  		vm_flags |=3D VM_MAYS=
HARE | (capabilities & NOMMU_VMFLAGS);
^1da177e4c3f41 Linus Torvalds     2005-04-16   936  		if (flags & MAP_SHARE=
D)
3c7b204547bc3d Bernd Schmidt      2010-05-25   937  			vm_flags |=3D VM_SHA=
RED;
^1da177e4c3f41 Linus Torvalds     2005-04-16   938  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   939  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   940  	/* refuse to let anyon=
e share private mappings with this process if
^1da177e4c3f41 Linus Torvalds     2005-04-16   941  	 * it's being traced -=
 otherwise breakpoints set in it may interfere
^1da177e4c3f41 Linus Torvalds     2005-04-16   942  	 * with another untrac=
ed process
^1da177e4c3f41 Linus Torvalds     2005-04-16   943  	 */
a288eecce5253c Tejun Heo          2011-06-17   944  	if ((flags & MAP_PRIVA=
TE) && current->ptrace)
^1da177e4c3f41 Linus Torvalds     2005-04-16   945  		vm_flags &=3D ~VM_MAY=
SHARE;
^1da177e4c3f41 Linus Torvalds     2005-04-16   946  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   947  	return vm_flags;
^1da177e4c3f41 Linus Torvalds     2005-04-16   948  }
^1da177e4c3f41 Linus Torvalds     2005-04-16   949  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   950  /*
8feae13110d60c David Howells      2009-01-08   951   * set up a shared mapp=
ing on a file (the driver or filesystem provides and
8feae13110d60c David Howells      2009-01-08   952   * pins the storage)
^1da177e4c3f41 Linus Torvalds     2005-04-16   953   */
8feae13110d60c David Howells      2009-01-08   954  static int do_mmap_shar=
ed_file(struct vm_area_struct *vma)
^1da177e4c3f41 Linus Torvalds     2005-04-16   955  {
^1da177e4c3f41 Linus Torvalds     2005-04-16   956  	int ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16   957  =

f74ac01520c9f6 Miklos Szeredi     2017-02-20   958  	ret =3D call_mmap(vma-=
>vm_file, vma);
dd8632a12e500a Paul Mundt         2009-01-08   959  	if (ret =3D=3D 0) {
dd8632a12e500a Paul Mundt         2009-01-08   960  		vma->vm_region->vm_to=
p =3D vma->vm_region->vm_end;
645d83c5db970a David Howells      2009-09-24   961  		return 0;
dd8632a12e500a Paul Mundt         2009-01-08   962  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16   963  	if (ret !=3D -ENOSYS)
^1da177e4c3f41 Linus Torvalds     2005-04-16   964  		return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16   965  =

3fa30460ea5021 David Howells      2010-03-23   966  	/* getting -ENOSYS ind=
icates that direct mmap isn't possible (as
3fa30460ea5021 David Howells      2010-03-23   967  	 * opposed to tried bu=
t failed) so we can only give a suitable error as
3fa30460ea5021 David Howells      2010-03-23   968  	 * it's not possible t=
o make a private copy if MAP_SHARED was given */
^1da177e4c3f41 Linus Torvalds     2005-04-16   969  	return -ENODEV;
^1da177e4c3f41 Linus Torvalds     2005-04-16   970  }
^1da177e4c3f41 Linus Torvalds     2005-04-16   971  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   972  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16   973   * set up a private map=
ping or an anonymous shared mapping
^1da177e4c3f41 Linus Torvalds     2005-04-16   974   */
8feae13110d60c David Howells      2009-01-08   975  static int do_mmap_priv=
ate(struct vm_area_struct *vma,
8feae13110d60c David Howells      2009-01-08   976  			   struct vm_region =
*region,
645d83c5db970a David Howells      2009-09-24   977  			   unsigned long len,
645d83c5db970a David Howells      2009-09-24   978  			   unsigned long cap=
abilities)
^1da177e4c3f41 Linus Torvalds     2005-04-16   979  {
dbc8358c72373d Joonsoo Kim        2014-12-12   980  	unsigned long total, p=
oint;
^1da177e4c3f41 Linus Torvalds     2005-04-16   981  	void *base;
8feae13110d60c David Howells      2009-01-08   982  	int ret, order;
^1da177e4c3f41 Linus Torvalds     2005-04-16   983  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   984  	/* invoke the file's m=
apping function so that it can keep track of
^1da177e4c3f41 Linus Torvalds     2005-04-16   985  	 * shared mappings on =
devices or memory
^1da177e4c3f41 Linus Torvalds     2005-04-16   986  	 * - VM_MAYSHARE will =
be set if it may attempt to share
^1da177e4c3f41 Linus Torvalds     2005-04-16   987  	 */
b4caecd48005fb Christoph Hellwig  2015-01-14   988  	if (capabilities & NOM=
MU_MAP_DIRECT) {
f74ac01520c9f6 Miklos Szeredi     2017-02-20   989  		ret =3D call_mmap(vma=
->vm_file, vma);
dd8632a12e500a Paul Mundt         2009-01-08   990  		if (ret =3D=3D 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16   991  			/* shouldn't return =
success if we're not sharing */
dd8632a12e500a Paul Mundt         2009-01-08   992  			BUG_ON(!(vma->vm_fla=
gs & VM_MAYSHARE));
dd8632a12e500a Paul Mundt         2009-01-08   993  			vma->vm_region->vm_t=
op =3D vma->vm_region->vm_end;
645d83c5db970a David Howells      2009-09-24   994  			return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16   995  		}
dd8632a12e500a Paul Mundt         2009-01-08   996  		if (ret !=3D -ENOSYS)
dd8632a12e500a Paul Mundt         2009-01-08   997  			return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16   998  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   999  		/* getting an ENOSYS =
error indicates that direct mmap isn't
^1da177e4c3f41 Linus Torvalds     2005-04-16  1000  		 * possible (as oppos=
ed to tried but failed) so we'll try to
^1da177e4c3f41 Linus Torvalds     2005-04-16  1001  		 * make a private cop=
y of the data and map that instead */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1002  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1003  =

8feae13110d60c David Howells      2009-01-08  1004  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1005  	/* allocate some memor=
y to hold the mapping
^1da177e4c3f41 Linus Torvalds     2005-04-16  1006  	 * - note that this ma=
y not return a page-aligned address if the object
^1da177e4c3f41 Linus Torvalds     2005-04-16  1007  	 *   we're allocating =
is smaller than a page
^1da177e4c3f41 Linus Torvalds     2005-04-16  1008  	 */
f67d9b1576c1c6 Bob Liu            2011-05-24  1009  	order =3D get_order(le=
n);
8feae13110d60c David Howells      2009-01-08 @1010  	total =3D 1 << order;
f67d9b1576c1c6 Bob Liu            2011-05-24  1011  	point =3D len >> PAGE_=
SHIFT;
dd8632a12e500a Paul Mundt         2009-01-08  1012  =

dbc8358c72373d Joonsoo Kim        2014-12-12  1013  	/* we don't want to al=
locate a power-of-2 sized page set */
22cc877b32202b Leon Romanovsky    2015-06-24  1014  	if (sysctl_nr_trim_pag=
es && total - point >=3D sysctl_nr_trim_pages)
dbc8358c72373d Joonsoo Kim        2014-12-12  1015  		total =3D point;
8feae13110d60c David Howells      2009-01-08  1016  =

da616534ed7f6e Joonsoo Kim        2015-02-27  1017  	base =3D alloc_pages_e=
xact(total << PAGE_SHIFT, GFP_KERNEL);
dbc8358c72373d Joonsoo Kim        2014-12-12  1018  	if (!base)
dbc8358c72373d Joonsoo Kim        2014-12-12  1019  		goto enomem;
dbc8358c72373d Joonsoo Kim        2014-12-12  1020  =

dbc8358c72373d Joonsoo Kim        2014-12-12  1021  	atomic_long_add(total,=
 &mmap_pages_allocated);
8feae13110d60c David Howells      2009-01-08  1022  =

8feae13110d60c David Howells      2009-01-08  1023  	region->vm_flags =3D v=
ma->vm_flags |=3D VM_MAPPED_COPY;
8feae13110d60c David Howells      2009-01-08  1024  	region->vm_start =3D (=
unsigned long) base;
f67d9b1576c1c6 Bob Liu            2011-05-24  1025  	region->vm_end   =3D r=
egion->vm_start + len;
dd8632a12e500a Paul Mundt         2009-01-08  1026  	region->vm_top   =3D r=
egion->vm_start + (total << PAGE_SHIFT);
8feae13110d60c David Howells      2009-01-08  1027  =

8feae13110d60c David Howells      2009-01-08  1028  	vma->vm_start =3D regi=
on->vm_start;
8feae13110d60c David Howells      2009-01-08  1029  	vma->vm_end   =3D regi=
on->vm_start + len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1030  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1031  	if (vma->vm_file) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1032  		/* read the contents =
of a file into the copy */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1033  		loff_t fpos;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1034  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1035  		fpos =3D vma->vm_pgof=
f;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1036  		fpos <<=3D PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1037  =

b4bf802a5a6563 Christoph Hellwig  2017-09-01  1038  		ret =3D kernel_read(v=
ma->vm_file, base, len, &fpos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1039  		if (ret < 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1040  			goto error_free;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1041  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1042  		/* clear the last lit=
tle bit */
f67d9b1576c1c6 Bob Liu            2011-05-24  1043  		if (ret < len)
f67d9b1576c1c6 Bob Liu            2011-05-24  1044  			memset(base + ret, 0=
, len - ret);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1045  =

bfd40eaff5abb9 Kirill A. Shutemov 2018-07-26  1046  	} else {
bfd40eaff5abb9 Kirill A. Shutemov 2018-07-26  1047  		vma_set_anonymous(vma=
);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1048  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1049  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1050  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1051  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1052  error_free:
7223bb4a829628 Namhyung Kim       2011-05-24  1053  	free_page_series(regio=
n->vm_start, region->vm_top);
8feae13110d60c David Howells      2009-01-08  1054  	region->vm_start =3D v=
ma->vm_start =3D 0;
8feae13110d60c David Howells      2009-01-08  1055  	region->vm_end   =3D v=
ma->vm_end =3D 0;
dd8632a12e500a Paul Mundt         2009-01-08  1056  	region->vm_top   =3D 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1057  	return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1058  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1059  enomem:
b1de0d139c97a6 Mitchel Humpherys  2014-06-06  1060  	pr_err("Allocation of =
length %lu from process %d (%s) failed\n",
05ae6fa31874ed Greg Ungerer       2009-01-13  1061  	       len, current->p=
id, current->comm);
9af744d743170b Michal Hocko       2017-02-22  1062  	show_free_areas(0, NUL=
L);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1063  	return -ENOMEM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1064  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1065  =


:::::: The code at line 1010 was first introduced by commit
:::::: 8feae13110d60cc6287afabc2887366b0eb226c2 NOMMU: Make VMAs per MM as =
for MMU-mode linux

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1415639372143088940==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1415639372143088940==--

