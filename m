Content-Type: multipart/mixed; boundary="===============6607261053700781205=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.10-2021-12 1196/9999] fs/verity/read_metadata.c:70:28: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sun, 23 Jan 2022 06:22:32 +0800
Message-ID: <202201230638.Ezq7bcax-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6607261053700781205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: Jaegeuk Kim <jaegeuk@google.com>
CC: Victor Hsieh <victorhsieh@google.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android12-5.10-2021-12
head:   51e133b6e4eb00703d3b3fe71cc2447ebd9fb4a8
commit: 0b29c4caec92e23e3a9698f40b619f3ec71a13ab [1196/9999] fs-verity: sup=
port reading Merkle tree with ioctl
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: s390-randconfig-c005-20220121 (https://download.01.org/0day-ci/arch=
ive/20220123/202201230638.Ezq7bcax-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/0b29c4caec92e23=
e3a9698f40b619f3ec71a13ab
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android12-5.10-2021-12
        git checkout 0b29c4caec92e23e3a9698f40b619f3ec71a13ab
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           goto unwind;
                           ^
   kernel/locking/locktorture.c:1040:2: note: Calling 'lock_torture_cleanup'
           lock_torture_cleanup();
           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:784:6: note: Assuming the condition is false
           if (torture_cleanup_begin())
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:784:2: note: Taking false branch
           if (torture_cleanup_begin())
           ^
   kernel/locking/locktorture.c:793:6: note: Assuming field 'lwsa' is non-n=
ull
           if (!cxt.lwsa && !cxt.lrsa)
               ^~~~~~~~~
   kernel/locking/locktorture.c:793:16: note: Left side of '&&' is false
           if (!cxt.lwsa && !cxt.lrsa)
                         ^
   kernel/locking/locktorture.c:796:6: note: Assuming 'writer_tasks' is null
           if (writer_tasks) {
               ^~~~~~~~~~~~
   kernel/locking/locktorture.c:796:2: note: Taking false branch
           if (writer_tasks) {
           ^
   kernel/locking/locktorture.c:804:6: note: Assuming 'reader_tasks' is null
           if (reader_tasks) {
               ^~~~~~~~~~~~
   kernel/locking/locktorture.c:804:2: note: Taking false branch
           if (reader_tasks) {
           ^
   kernel/locking/locktorture.c:813:2: note: Calling 'lock_torture_stats_pr=
int'
           lock_torture_stats_print();  /* -After- the stats thread is stop=
ped! */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:721:6: note: Assuming field 'readlock' is n=
ull
           if (cxt.cur_ops->readlock)
               ^~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:721:2: note: Taking false branch
           if (cxt.cur_ops->readlock)
           ^
   kernel/locking/locktorture.c:724:8: note: Calling 'kmalloc'
           buf =3D kmalloc(size, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:540:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:557:9: note: Value assigned to 'cxt.lwsa'
           return __kmalloc(size, flags);
                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:557:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:724:8: note: Returning from 'kmalloc'
           buf =3D kmalloc(size, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:725:6: note: Assuming 'buf' is non-null
           if (!buf) {
               ^~~~
   kernel/locking/locktorture.c:725:2: note: Taking false branch
           if (!buf) {
           ^
   kernel/locking/locktorture.c:731:29: note: Passing value via 2nd paramet=
er 'statp'
           __torture_print_stats(buf, cxt.lwsa, true);
                                      ^~~~~~~~
   kernel/locking/locktorture.c:731:2: note: Calling '__torture_print_stats'
           __torture_print_stats(buf, cxt.lwsa, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:685:22: note: Assuming 'statp' is null
           long max =3D 0, min =3D statp ? statp[0].n_lock_acquired : 0;
                               ^~~~~
   kernel/locking/locktorture.c:685:22: note: '?' condition is false
   kernel/locking/locktorture.c:688:13: note: 'write' is true
           n_stress =3D write ? cxt.nrealwriters_stress : cxt.nrealreaders_=
stress;
                      ^~~~~
   kernel/locking/locktorture.c:688:13: note: '?' condition is true
   kernel/locking/locktorture.c:689:14: note: Assuming 'i' is < 'n_stress'
           for (i =3D 0; i < n_stress; i++) {
                       ^~~~~~~~~~~~
   kernel/locking/locktorture.c:689:2: note: Loop condition is true.  Enter=
ing loop body
           for (i =3D 0; i < n_stress; i++) {
           ^
   kernel/locking/locktorture.c:690:7: note: Dereference of null pointer
                   if (statp[i].n_lock_fail)
                       ^~~~~~~~~~~~~~~~~~~~
   kernel/locking/locktorture.c:698:2: warning: Value stored to 'page' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           page +=3D sprintf(page,
           ^       ~~~~~~~~~~~~~
   kernel/locking/locktorture.c:698:2: note: Value stored to 'page' is neve=
r read
           page +=3D sprintf(page,
           ^       ~~~~~~~~~~~~~
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
>> fs/verity/read_metadata.c:70:28: warning: Dereference of null pointer [c=
lang-analyzer-core.NullDereference]
                   if (fatal_signal_pending(current))  {
                                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:193:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/verity/read_metadata.c:95:6: note: Assuming 'vi' is non-null
           if (!vi)
               ^~~
   fs/verity/read_metadata.c:95:2: note: Taking false branch
           if (!vi)
           ^
   fs/verity/read_metadata.c:102:2: note: Taking false branch
           if (copy_from_user(&arg, uarg, sizeof(arg)))
           ^
   fs/verity/read_metadata.c:105:6: note: Assuming field '__reserved' is 0
           if (arg.__reserved)
               ^~~~~~~~~~~~~~
   fs/verity/read_metadata.c:105:2: note: Taking false branch
           if (arg.__reserved)
           ^
   fs/verity/read_metadata.c:109:6: note: Assuming the condition is false
           if (arg.offset + arg.length < arg.offset)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/read_metadata.c:109:2: note: Taking false branch
           if (arg.offset + arg.length < arg.offset)
           ^
   fs/verity/read_metadata.c:113:11: note: Assuming '__UNIQUE_ID___x287' is=
 < '__UNIQUE_ID___y288'
           length =3D min_t(u64, arg.length, INT_MAX);
                    ^
   include/linux/minmax.h:110:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/verity/read_metadata.c:113:11: note: '?' condition is true
           length =3D min_t(u64, arg.length, INT_MAX);
                    ^
   include/linux/minmax.h:110:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/verity/read_metadata.c:117:2: note: Control jumps to 'case 1:' @li=
ne 118
           switch (arg.metadata_type) {
           ^
   fs/verity/read_metadata.c:119:10: note: Calling 'fsverity_read_merkle_tr=
ee'
                   return fsverity_read_merkle_tree(inode, vi, buf, arg.off=
set,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/verity/read_metadata.c:26:15: note: Assuming '__UNIQUE_ID___x281' is =
>=3D '__UNIQUE_ID___y282'
           end_offset =3D min(offset + length, vi->tree_params.tree_size);
                        ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   fs/verity/read_metadata.c:26:15: note: '?' condition is false
           end_offset =3D min(offset + length, vi->tree_params.tree_size);
                        ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   fs/verity/read_metadata.c:27:6: note: Assuming 'offset' is < 'end_offset'
           if (offset >=3D end_offset)
               ^~~~~~~~~~~~~~~~~~~~
   fs/verity/read_metadata.c:27:2: note: Taking false branch
           if (offset >=3D end_offset)

vim +70 fs/verity/read_metadata.c

d758f506808823a Eric Biggers 2021-01-15  14  =

0b29c4caec92e23 Eric Biggers 2021-01-15  15  static int fsverity_read_merkl=
e_tree(struct inode *inode,
0b29c4caec92e23 Eric Biggers 2021-01-15  16  				     const struct fsverity=
_info *vi,
0b29c4caec92e23 Eric Biggers 2021-01-15  17  				     void __user *buf, u64=
 offset, int length)
0b29c4caec92e23 Eric Biggers 2021-01-15  18  {
0b29c4caec92e23 Eric Biggers 2021-01-15  19  	const struct fsverity_operati=
ons *vops =3D inode->i_sb->s_vop;
0b29c4caec92e23 Eric Biggers 2021-01-15  20  	u64 end_offset;
0b29c4caec92e23 Eric Biggers 2021-01-15  21  	unsigned int offs_in_page;
0b29c4caec92e23 Eric Biggers 2021-01-15  22  	pgoff_t index, last_index;
0b29c4caec92e23 Eric Biggers 2021-01-15  23  	int retval =3D 0;
0b29c4caec92e23 Eric Biggers 2021-01-15  24  	int err =3D 0;
0b29c4caec92e23 Eric Biggers 2021-01-15  25  =

0b29c4caec92e23 Eric Biggers 2021-01-15  26  	end_offset =3D min(offset + l=
ength, vi->tree_params.tree_size);
0b29c4caec92e23 Eric Biggers 2021-01-15  27  	if (offset >=3D end_offset)
0b29c4caec92e23 Eric Biggers 2021-01-15  28  		return 0;
0b29c4caec92e23 Eric Biggers 2021-01-15  29  	offs_in_page =3D offset_in_pa=
ge(offset);
0b29c4caec92e23 Eric Biggers 2021-01-15  30  	last_index =3D (end_offset - =
1) >> PAGE_SHIFT;
0b29c4caec92e23 Eric Biggers 2021-01-15  31  =

0b29c4caec92e23 Eric Biggers 2021-01-15  32  	/*
0b29c4caec92e23 Eric Biggers 2021-01-15  33  	 * Iterate through each Merkl=
e tree page in the requested range and copy
0b29c4caec92e23 Eric Biggers 2021-01-15  34  	 * the requested portion to u=
serspace.  Note that the Merkle tree block
0b29c4caec92e23 Eric Biggers 2021-01-15  35  	 * size isn't important here,=
 as we are returning a byte stream; i.e.,
0b29c4caec92e23 Eric Biggers 2021-01-15  36  	 * we can just work with page=
s even if the tree block size !=3D PAGE_SIZE.
0b29c4caec92e23 Eric Biggers 2021-01-15  37  	 */
0b29c4caec92e23 Eric Biggers 2021-01-15  38  	for (index =3D offset >> PAGE=
_SHIFT; index <=3D last_index; index++) {
0b29c4caec92e23 Eric Biggers 2021-01-15  39  		unsigned long num_ra_pages =
=3D
0b29c4caec92e23 Eric Biggers 2021-01-15  40  			min_t(unsigned long, last_i=
ndex - index + 1,
0b29c4caec92e23 Eric Biggers 2021-01-15  41  			      inode->i_sb->s_bdi->i=
o_pages);
0b29c4caec92e23 Eric Biggers 2021-01-15  42  		unsigned int bytes_to_copy =
=3D min_t(u64, end_offset - offset,
0b29c4caec92e23 Eric Biggers 2021-01-15  43  						   PAGE_SIZE - offs_in_p=
age);
0b29c4caec92e23 Eric Biggers 2021-01-15  44  		struct page *page;
0b29c4caec92e23 Eric Biggers 2021-01-15  45  		const void *virt;
0b29c4caec92e23 Eric Biggers 2021-01-15  46  =

0b29c4caec92e23 Eric Biggers 2021-01-15  47  		page =3D vops->read_merkle_t=
ree_page(inode, index, num_ra_pages);
0b29c4caec92e23 Eric Biggers 2021-01-15  48  		if (IS_ERR(page)) {
0b29c4caec92e23 Eric Biggers 2021-01-15  49  			err =3D PTR_ERR(page);
0b29c4caec92e23 Eric Biggers 2021-01-15  50  			fsverity_err(inode,
0b29c4caec92e23 Eric Biggers 2021-01-15  51  				     "Error %d reading Mer=
kle tree page %lu",
0b29c4caec92e23 Eric Biggers 2021-01-15  52  				     err, index);
0b29c4caec92e23 Eric Biggers 2021-01-15  53  			break;
0b29c4caec92e23 Eric Biggers 2021-01-15  54  		}
0b29c4caec92e23 Eric Biggers 2021-01-15  55  =

0b29c4caec92e23 Eric Biggers 2021-01-15  56  		virt =3D kmap(page);
0b29c4caec92e23 Eric Biggers 2021-01-15  57  		if (copy_to_user(buf, virt +=
 offs_in_page, bytes_to_copy)) {
0b29c4caec92e23 Eric Biggers 2021-01-15  58  			kunmap(page);
0b29c4caec92e23 Eric Biggers 2021-01-15  59  			put_page(page);
0b29c4caec92e23 Eric Biggers 2021-01-15  60  			err =3D -EFAULT;
0b29c4caec92e23 Eric Biggers 2021-01-15  61  			break;
0b29c4caec92e23 Eric Biggers 2021-01-15  62  		}
0b29c4caec92e23 Eric Biggers 2021-01-15  63  		kunmap(page);
0b29c4caec92e23 Eric Biggers 2021-01-15  64  		put_page(page);
0b29c4caec92e23 Eric Biggers 2021-01-15  65  =

0b29c4caec92e23 Eric Biggers 2021-01-15  66  		retval +=3D bytes_to_copy;
0b29c4caec92e23 Eric Biggers 2021-01-15  67  		buf +=3D bytes_to_copy;
0b29c4caec92e23 Eric Biggers 2021-01-15  68  		offset +=3D bytes_to_copy;
0b29c4caec92e23 Eric Biggers 2021-01-15  69  =

0b29c4caec92e23 Eric Biggers 2021-01-15 @70  		if (fatal_signal_pending(cur=
rent))  {

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6607261053700781205==--

