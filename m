Content-Type: multipart/mixed; boundary="===============1898369690636326955=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/nommu.c:1010:12: warning: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Mon, 08 Nov 2021 22:00:42 +0800
Message-ID: <202111082226.T4frnUNL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1898369690636326955==
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
head:   6b75d88fa81b122cce37ebf17428a849ccd3d0f1
commit: 2f78788b55baa3410b1ec91a576286abe1ad4d6a ilog2: improve ilog2 for c=
onstant arguments
date:   11 months ago
:::::: branch date: 19 hours ago
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
           if (unlikely(!bh))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/nilfs2/mdt.c:122:2: note: Taking false branch
           if (unlikely(!bh))
           ^
   fs/nilfs2/mdt.c:126:6: note: Assuming the condition is false
           if (buffer_uptodate(bh))
               ^~~~~~~~~~~~~~~~~~~
   fs/nilfs2/mdt.c:126:2: note: Taking false branch
           if (buffer_uptodate(bh))
           ^
   fs/nilfs2/mdt.c:129:2: note: Taking false branch
           if (mode_flags & REQ_RAHEAD) {
           ^
   fs/nilfs2/mdt.c:137:6: note: Assuming the condition is false
           if (buffer_uptodate(bh)) {
               ^~~~~~~~~~~~~~~~~~~
   fs/nilfs2/mdt.c:137:2: note: Taking false branch
           if (buffer_uptodate(bh)) {
           ^
   fs/nilfs2/mdt.c:143:6: note: Assuming 'ret' is not equal to 0
           if (unlikely(ret)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/nilfs2/mdt.c:143:2: note: Taking true branch
           if (unlikely(ret)) {
           ^
   fs/nilfs2/mdt.c:145:3: note: Control jumps to line 160
                   goto failed_bh;
                   ^
   fs/nilfs2/mdt.c:164:2: note: Returning without writing to '*out_bh'
           return ret;
           ^
   fs/nilfs2/mdt.c:175:8: note: Returning from 'nilfs_mdt_submit_block'
           err =3D nilfs_mdt_submit_block(inode, block, REQ_OP_READ, 0, &fi=
rst_bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/nilfs2/mdt.c:176:6: note: Assuming the condition is true
           if (err =3D=3D -EEXIST) /* internal code */
               ^~~~~~~~~~~~~~
   fs/nilfs2/mdt.c:176:2: note: Taking true branch
           if (err =3D=3D -EEXIST) /* internal code */
           ^
   fs/nilfs2/mdt.c:177:3: note: Control jumps to line 208
                   goto out;
                   ^
   fs/nilfs2/mdt.c:208:10: note: Assigned value is garbage or undefined
           *out_bh =3D first_bh;
                   ^ ~~~~~~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   mm/workingset.c:206:2: warning: Value stored to 'nid' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           nid =3D entry & ((1UL << NODES_SHIFT) - 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/workingset.c:206:2: note: Value stored to 'nid' is never read
           nid =3D entry & ((1UL << NODES_SHIFT) - 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (3 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (3 in non-user code, 10 with check filters).
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

--===============1898369690636326955==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1898369690636326955==--

