Content-Type: multipart/mixed; boundary="===============4716062603850248410=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ocfs2/suballoc.c:2222:21: warning: The left operand of '!=' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
Date: Sun, 29 Aug 2021 04:05:42 +0800
Message-ID: <202108290434.xbU13spO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4716062603850248410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Kees Cook <keescook@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   64b4fc45bea6f4faa843d2f97ff51665280efee1
commit: 97e4910232fa1f81e806aa60c25a0450276d99a2 linux/compiler-clang.h: de=
fine HAVE_BUILTIN_BSWAP*
date:   6 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 months ago
config: powerpc-randconfig-c003-20210826 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ea08c4=
cd1c0869ec5024a8bb3f5cdf06ab03ae83)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D97e4910232fa1f81e806aa60c25a0450276d99a2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 97e4910232fa1f81e806aa60c25a0450276d99a2
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~
   fs/ocfs2/suballoc.c:303:2: note: Taking true branch
           if (rc)
           ^
   fs/ocfs2/suballoc.c:304:3: note: Control jumps to line 317
                   goto out;
                   ^
   fs/ocfs2/suballoc.c:317:2: note: Returning without writing to '*bh'
           return rc;
           ^
   fs/ocfs2/suballoc.c:1758:11: note: Returning from 'ocfs2_read_group_desc=
riptor'
           status =3D ocfs2_read_group_descriptor(alloc_inode, fe,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/suballoc.c:1761:6: note: Assuming 'status' is >=3D 0
           if (status < 0) {
               ^~~~~~~~~~
   fs/ocfs2/suballoc.c:1761:2: note: Taking false branch
           if (status < 0) {
           ^
   fs/ocfs2/suballoc.c:1765:35: note: Access to field 'b_data' results in a=
 dereference of a null pointer (loaded from variable 'group_bh')
           bg =3D (struct ocfs2_group_desc *) group_bh->b_data;
                                            ^~~~~~~~
   fs/ocfs2/suballoc.c:1767:2: warning: Value stored to 'status' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           status =3D -ENOSPC;
           ^        ~~~~~~~
   fs/ocfs2/suballoc.c:1767:2: note: Value stored to 'status' is never read
           status =3D -ENOSPC;
           ^        ~~~~~~~
   fs/ocfs2/suballoc.c:1789:36: warning: Access to field 'b_data' results i=
n a dereference of a null pointer (loaded from variable 'group_bh') [clang-=
analyzer-core.NullDereference]
                   bg =3D (struct ocfs2_group_desc *) group_bh->b_data;
                                                    ^~~~~~~~
   fs/ocfs2/suballoc.c:1758:11: note: Calling 'ocfs2_read_group_descriptor'
           status =3D ocfs2_read_group_descriptor(alloc_inode, fe,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/suballoc.c:303:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   fs/ocfs2/suballoc.c:303:2: note: Taking false branch
           if (rc)
           ^
   fs/ocfs2/suballoc.c:307:6: note: Assuming 'rc' is 0
           if (rc) {
               ^~
   fs/ocfs2/suballoc.c:307:2: note: Taking false branch
           if (rc) {
           ^
   fs/ocfs2/suballoc.c:313:2: note: Taking true branch
           if (!*bh)
           ^
   fs/ocfs2/suballoc.c:1758:11: note: Returning from 'ocfs2_read_group_desc=
riptor'
           status =3D ocfs2_read_group_descriptor(alloc_inode, fe,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/suballoc.c:1761:6: note: 'status' is >=3D 0
           if (status < 0) {
               ^~~~~~
   fs/ocfs2/suballoc.c:1761:2: note: Taking false branch
           if (status < 0) {
           ^
   fs/ocfs2/suballoc.c:1770:9: note: Assuming the condition is true
           while ((status =3D ac->ac_group_search(alloc_inode, group_bh,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/suballoc.c:1770:2: note: Loop condition is true.  Entering loop=
 body
           while ((status =3D ac->ac_group_search(alloc_inode, group_bh,
           ^
   fs/ocfs2/suballoc.c:1774:7: note: Assuming field 'bg_next_group' is not =
equal to 0
                   if (!bg->bg_next_group)
                       ^~~~~~~~~~~~~~~~~~
   fs/ocfs2/suballoc.c:1774:3: note: Taking false branch
                   if (!bg->bg_next_group)
                   ^
   fs/ocfs2/suballoc.c:1782:3: note: Null pointer value stored to 'group_bh'
                   group_bh =3D NULL;
                   ^~~~~~~~~~~~~~~
   fs/ocfs2/suballoc.c:1783:12: note: Calling 'ocfs2_read_group_descriptor'
                   status =3D ocfs2_read_group_descriptor(alloc_inode, fe,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/suballoc.c:303:6: note: Assuming 'rc' is not equal to 0
           if (rc)
               ^~
   fs/ocfs2/suballoc.c:303:2: note: Taking true branch
           if (rc)
           ^
   fs/ocfs2/suballoc.c:304:3: note: Control jumps to line 317
                   goto out;
                   ^
   fs/ocfs2/suballoc.c:317:2: note: Returning without writing to '*bh'
           return rc;
           ^
   fs/ocfs2/suballoc.c:1783:12: note: Returning from 'ocfs2_read_group_desc=
riptor'
                   status =3D ocfs2_read_group_descriptor(alloc_inode, fe,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/suballoc.c:1785:7: note: Assuming 'status' is >=3D 0
                   if (status < 0) {
                       ^~~~~~~~~~
   fs/ocfs2/suballoc.c:1785:3: note: Taking false branch
                   if (status < 0) {
                   ^
   fs/ocfs2/suballoc.c:1789:36: note: Access to field 'b_data' results in a=
 dereference of a null pointer (loaded from variable 'group_bh')
                   bg =3D (struct ocfs2_group_desc *) group_bh->b_data;
                                                    ^~~~~~~~
>> fs/ocfs2/suballoc.c:2222:21: warning: The left operand of '!=3D' is a ga=
rbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           BUG_ON(res.sr_bits !=3D 1);
                              ^
   include/asm-generic/bug.h:183:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ocfs2/suballoc.c:2204:9: note: Assuming 'ac' is non-null
           BUG_ON(!ac);
                  ^
   include/asm-generic/bug.h:183:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ocfs2/suballoc.c:2204:2: note: Taking false branch
           BUG_ON(!ac);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ocfs2/suballoc.c:2204:2: note: Loop condition is false.  Exiting loop
           BUG_ON(!ac);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ocfs2/suballoc.c:2205:9: note: Assuming field 'ac_bits_given' is equa=
l to 0
           BUG_ON(ac->ac_bits_given !=3D 0);
                  ^
   include/asm-generic/bug.h:183:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ocfs2/suballoc.c:2205:2: note: Taking false branch
           BUG_ON(ac->ac_bits_given !=3D 0);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ocfs2/suballoc.c:2205:2: note: Loop condition is false.  Exiting loop
           BUG_ON(ac->ac_bits_given !=3D 0);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ocfs2/suballoc.c:2206:9: note: Assuming field 'ac_bits_wanted' is equ=
al to 1
           BUG_ON(ac->ac_bits_wanted !=3D 1);
                  ^
   include/asm-generic/bug.h:183:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ocfs2/suballoc.c:2206:2: note: Taking false branch
           BUG_ON(ac->ac_bits_wanted !=3D 1);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ocfs2/suballoc.c:2206:2: note: Loop condition is false.  Exiting loop
           BUG_ON(ac->ac_bits_wanted !=3D 1);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ocfs2/suballoc.c:2207:9: note: Assuming field 'ac_which' is equal to 3
           BUG_ON(ac->ac_which !=3D OCFS2_AC_USE_INODE);
                  ^
   include/asm-generic/bug.h:183:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ocfs2/suballoc.c:2207:2: note: Taking false branch
           BUG_ON(ac->ac_which !=3D OCFS2_AC_USE_INODE);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ocfs2/suballoc.c:2207:2: note: Loop condition is false.  Exiting loop
           BUG_ON(ac->ac_which !=3D OCFS2_AC_USE_INODE);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ocfs2/suballoc.c:2211:11: note: Calling 'ocfs2_claim_suballoc_bits'
           status =3D ocfs2_claim_suballoc_bits(ac,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/suballoc.c:1890:2: note: Taking false branch
           BUG_ON(ac->ac_bits_given >=3D ac->ac_bits_wanted);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
--
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:489:2: note: Taking false branch
           if (tree->rf_generation !=3D le32_to_cpu(rb->rf_generation)) {
           ^
   fs/ocfs2/refcounttree.c:509:6: note: 'ref_bh' is non-null
           if (ref_bh) {
               ^~~~~~
   fs/ocfs2/refcounttree.c:509:2: note: Taking true branch
           if (ref_bh) {
           ^
   fs/ocfs2/refcounttree.c:515:2: note: Returning zero (loaded from 'ret'),=
 which participates in a condition later
           return ret;
           ^~~~~~~~~~
   fs/ocfs2/refcounttree.c:4561:9: note: Returning from 'ocfs2_lock_refcoun=
t_tree'
                   ret =3D ocfs2_lock_refcount_tree(osb,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:4564:7: note: 'ret' is 0
                   if (ret) {
                       ^~~
   fs/ocfs2/refcounttree.c:4564:3: note: Taking false branch
                   if (ret) {
                   ^
   fs/ocfs2/refcounttree.c:4570:7: note: Assuming the condition is true
                   if (!(ext_flags & OCFS2_EXT_REFCOUNTED)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:4570:3: note: Taking true branch
                   if (!(ext_flags & OCFS2_EXT_REFCOUNTED)) {
                   ^
   fs/ocfs2/refcounttree.c:4571:10: note: Calling 'ocfs2_add_refcount_flag'
                           ret =3D ocfs2_add_refcount_flag(s_inode, &s_et,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:3700:8: note: Calling 'ocfs2_calc_refcount_meta_=
credits'
           ret =3D ocfs2_calc_refcount_meta_credits(inode->i_sb,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2385:2: note: Loop condition is true.  Entering =
loop body
           while (clusters) {
           ^
   fs/ocfs2/refcounttree.c:2386:9: note: Calling 'ocfs2_get_refcount_rec'
                   ret =3D ocfs2_get_refcount_rec(ci, ref_root_bh,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:1075:6: note: Assuming the condition is false
           if (!(le32_to_cpu(rb->rf_flags) & OCFS2_REFCOUNT_TREE_FL)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:1075:2: note: Taking false branch
           if (!(le32_to_cpu(rb->rf_flags) & OCFS2_REFCOUNT_TREE_FL)) {
           ^
   fs/ocfs2/refcounttree.c:1086:6: note: Assuming field 'l_tree_depth' is n=
ot equal to 0
           if (el->l_tree_depth) {
               ^~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:1086:2: note: Taking true branch
           if (el->l_tree_depth) {
           ^
   fs/ocfs2/refcounttree.c:1088:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   fs/ocfs2/refcounttree.c:1088:3: note: Taking false branch
                   if (ret) {
                   ^
   fs/ocfs2/refcounttree.c:1096:7: note: Assuming field 'l_tree_depth' is n=
ot equal to 0
                   if (el->l_tree_depth) {
                       ^~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:1096:3: note: Taking true branch
                   if (el->l_tree_depth) {
                   ^
   fs/ocfs2/refcounttree.c:1101:4: note: Control jumps to line 1138
                           goto out;
                           ^
   fs/ocfs2/refcounttree.c:1139:2: note: Returning without writing to 'ret_=
rec->r_cpos'
           return ret;
           ^
   fs/ocfs2/refcounttree.c:1139:2: note: Returning value (loaded from 'ret'=
), which participates in a condition later
           return ret;
           ^~~~~~~~~~
   fs/ocfs2/refcounttree.c:2386:9: note: Returning from 'ocfs2_get_refcount=
_rec'
                   ret =3D ocfs2_get_refcount_rec(ci, ref_root_bh,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2389:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   fs/ocfs2/refcounttree.c:2389:3: note: Taking false branch
                   if (ret) {
                   ^
   fs/ocfs2/refcounttree.c:2394:7: note: 'ref_leaf_bh' is equal to 'prev_bh'
                   if (ref_leaf_bh !=3D prev_bh) {
                       ^~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2394:3: note: Taking false branch
                   if (ref_leaf_bh !=3D prev_bh) {
                   ^
   fs/ocfs2/refcounttree.c:2418:25: note: 1st function call argument is an =
uninitialized value
                                   (unsigned long long)le64_to_cpu(rec.r_cp=
os),
                                                       ^
   include/linux/byteorder/generic.h:87:21: note: expanded from macro 'le64=
_to_cpu'
   #define le64_to_cpu __le64_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:32:26: note: expanded from mac=
ro '__le64_to_cpu'
   #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:128:28: note: expanded from macro '__swab64'
   #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
                              ^                 ~~~~~~~~~~
>> fs/ocfs2/refcounttree.c:3644:17: warning: The left operand of '=3D=3D' i=
s a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           BUG_ON(cow_len =3D=3D 0);
                          ^
   include/asm-generic/bug.h:183:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ocfs2/refcounttree.c:3632:17: note: 'cow_len' declared without an ini=
tial value
           u32 cow_start, cow_len;
                          ^~~~~~~
   fs/ocfs2/refcounttree.c:3634:9: note: Assuming the condition is false
           BUG_ON(!ocfs2_is_refcount_inode(inode));
                  ^
   include/asm-generic/bug.h:183:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/ocfs2/refcounttree.c:3634:2: note: Taking false branch
           BUG_ON(!ocfs2_is_refcount_inode(inode));
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ocfs2/refcounttree.c:3634:2: note: Loop condition is false.  Exiting =
loop
           BUG_ON(!ocfs2_is_refcount_inode(inode));
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ocfs2/refcounttree.c:3636:8: note: Calling 'ocfs2_refcount_cal_cow_cl=
usters'
           ret =3D ocfs2_refcount_cal_cow_clusters(inode, &xv->xr_list,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2646:2: note: Taking false branch
           BUG_ON(cpos + write_len > max_cpos);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/ocfs2/refcounttree.c:2646:2: note: Loop condition is false.  Exiting =
loop
           BUG_ON(cpos + write_len > max_cpos);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ocfs2/refcounttree.c:2648:6: note: Assuming 'tree_height' is > 0
           if (tree_height > 0) {
               ^~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2648:2: note: Taking true branch
           if (tree_height > 0) {
           ^
   fs/ocfs2/refcounttree.c:2650:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   fs/ocfs2/refcounttree.c:2650:3: note: Taking false branch
                   if (ret) {
                   ^
   fs/ocfs2/refcounttree.c:2658:7: note: Assuming field 'l_tree_depth' is n=
ot equal to 0
                   if (el->l_tree_depth) {
                       ^~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:2658:3: note: Taking true branch
                   if (el->l_tree_depth) {
                   ^
   fs/ocfs2/refcounttree.c:2663:4: note: Control jumps to line 2823
                           goto out;
                           ^
   fs/ocfs2/refcounttree.c:2824:2: note: Returning without writing to '*cow=
_len'
           return ret;
           ^
   fs/ocfs2/refcounttree.c:2824:2: note: Returning value (loaded from 'ret'=
), which participates in a condition later
           return ret;
           ^~~~~~~~~~
   fs/ocfs2/refcounttree.c:3636:8: note: Returning from 'ocfs2_refcount_cal=
_cow_clusters'
           ret =3D ocfs2_refcount_cal_cow_clusters(inode, &xv->xr_list,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ocfs2/refcounttree.c:3639:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   fs/ocfs2/refcounttree.c:3639:2: note: Taking false branch
           if (ret) {
           ^
   fs/ocfs2/refcounttree.c:3644:17: note: The left operand of '=3D=3D' is a=
 garbage value
           BUG_ON(cow_len =3D=3D 0);
                          ^
   include/asm-generic/bug.h:183:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 16 warnings (3 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (4 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (4 in non-user code, 13 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +2222 fs/ocfs2/suballoc.c

e49e27674d1dd2 Mark Fasheh 2010-08-13  2192  =

1ed9b777f77929 Joel Becker 2010-05-06  2193  int ocfs2_claim_new_inode(hand=
le_t *handle,
138211515c1028 Tao Ma      2009-02-25  2194  			  struct inode *dir,
138211515c1028 Tao Ma      2009-02-25  2195  			  struct buffer_head *paren=
t_fe_bh,
ccd979bdbce9fb Mark Fasheh 2005-12-15  2196  			  struct ocfs2_alloc_contex=
t *ac,
2b6cb576aa8061 Joel Becker 2010-03-26  2197  			  u64 *suballoc_loc,
ccd979bdbce9fb Mark Fasheh 2005-12-15  2198  			  u16 *suballoc_bit,
ccd979bdbce9fb Mark Fasheh 2005-12-15  2199  			  u64 *fe_blkno)
ccd979bdbce9fb Mark Fasheh 2005-12-15  2200  {
ccd979bdbce9fb Mark Fasheh 2005-12-15  2201  	int status;
2b6cb576aa8061 Joel Becker 2010-03-26  2202  	struct ocfs2_suballoc_result =
res;
ccd979bdbce9fb Mark Fasheh 2005-12-15  2203  =

ccd979bdbce9fb Mark Fasheh 2005-12-15  2204  	BUG_ON(!ac);
ccd979bdbce9fb Mark Fasheh 2005-12-15  2205  	BUG_ON(ac->ac_bits_given !=3D=
 0);
ccd979bdbce9fb Mark Fasheh 2005-12-15  2206  	BUG_ON(ac->ac_bits_wanted !=
=3D 1);
ccd979bdbce9fb Mark Fasheh 2005-12-15  2207  	BUG_ON(ac->ac_which !=3D OCFS=
2_AC_USE_INODE);
ccd979bdbce9fb Mark Fasheh 2005-12-15  2208  =

138211515c1028 Tao Ma      2009-02-25  2209  	ocfs2_init_inode_ac_group(dir=
, parent_fe_bh, ac);
138211515c1028 Tao Ma      2009-02-25  2210  =

aa8f8e93c898a0 Joel Becker 2010-03-26  2211  	status =3D ocfs2_claim_suball=
oc_bits(ac,
da5cbf2f9df922 Mark Fasheh 2006-10-06  2212  					   handle,
ccd979bdbce9fb Mark Fasheh 2005-12-15  2213  					   1,
ccd979bdbce9fb Mark Fasheh 2005-12-15  2214  					   1,
7d1fe093bf0412 Joel Becker 2010-04-13  2215  					   &res);
ccd979bdbce9fb Mark Fasheh 2005-12-15  2216  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh 2005-12-15  2217  		mlog_errno(status);
ccd979bdbce9fb Mark Fasheh 2005-12-15  2218  		goto bail;
ccd979bdbce9fb Mark Fasheh 2005-12-15  2219  	}
1ed9b777f77929 Joel Becker 2010-05-06  2220  	atomic_inc(&OCFS2_SB(ac->ac_i=
node->i_sb)->alloc_stats.bg_allocs);
ccd979bdbce9fb Mark Fasheh 2005-12-15  2221  =

7d1fe093bf0412 Joel Becker 2010-04-13 @2222  	BUG_ON(res.sr_bits !=3D 1);
ccd979bdbce9fb Mark Fasheh 2005-12-15  2223  =

2b6cb576aa8061 Joel Becker 2010-03-26  2224  	*suballoc_loc =3D res.sr_bg_b=
lkno;
7d1fe093bf0412 Joel Becker 2010-04-13  2225  	*suballoc_bit =3D res.sr_bit_=
offset;
ba2066351b630f Joel Becker 2010-03-26  2226  	*fe_blkno =3D res.sr_blkno;
ccd979bdbce9fb Mark Fasheh 2005-12-15  2227  	ac->ac_bits_given++;
138211515c1028 Tao Ma      2009-02-25  2228  	ocfs2_save_inode_ac_group(dir=
, ac);
ccd979bdbce9fb Mark Fasheh 2005-12-15  2229  	status =3D 0;
ccd979bdbce9fb Mark Fasheh 2005-12-15  2230  bail:
c1e8d35ef5ffb3 Tao Ma      2011-03-07  2231  	if (status)
c1e8d35ef5ffb3 Tao Ma      2011-03-07  2232  		mlog_errno(status);
ccd979bdbce9fb Mark Fasheh 2005-12-15  2233  	return status;
ccd979bdbce9fb Mark Fasheh 2005-12-15  2234  }
ccd979bdbce9fb Mark Fasheh 2005-12-15  2235  =


:::::: The code at line 2222 was first introduced by commit
:::::: 7d1fe093bf04124dcc50c5dde1765bd098464bfa ocfs2: Pass suballocation r=
esults back via a structure.

:::::: TO: Joel Becker <joel.becker@oracle.com>
:::::: CC: Tao Ma <tao.ma@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4716062603850248410==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICENCKmEAAy5jb25maWcAlDxLe+M2kvf5Ffo6l93DJH51JzP7+QCSoISIJGgAlB8XfmpZ7njj
tryynEnm128V+ALAouzJId2qKhSAQr0B9g9/+2HG3g677+vD42b99PTX7Nv2ebtfH7b3s4fHp+3/
zBI5K6SZ8USYH4E4e3x++/Onl92/tvuXzezzj6dnP578fb85my23++ft0yzePT88fnsDDo+757/9
8LdYFqmY13Fcr7jSQha14Tfm8tPmaf38bfbHdv8KdLPTix9PfjyZ/de3x8M/f/oJ/v/9cb/f7X96
evrje/2y3/3vdnOYXWxP16dfLu5//nr/+fzL5/OHn/9xv91sTs9O1w/bn3+5uD97uN+erH/+70/d
rPNh2ssTZylC13HGivnlXz0Qf/a0pxcn8F+Hy5IxE4ABkyxLBhaZQ+czgBkXTNdM5/VcGunM6iNq
WZmyMiReFJkouIOShTaqio1UeoAKdVVfS7UcIFElssSInNeGRRmvtVTOBGahOIOtFKmE/wGJxqFw
bD/M5lYPnmav28Pby3CQkZJLXtRwjjovnYkLYWperGqmQBIiF+by/GxYa14KmNtw7cydyZhlncA+
ffIWXGuWGQe4YCteL7kqeFbP74QzMQlMeMqqzNhVOVw68EJqU7CcX376r+fd83bQF33NHC76Vq9E
GQ+AUmpxU+dXFa/wJH6YtfBrZuJFbcGzx9fZ8+6AUhvwsZJa1znPpbqtmTEsXrh0LVWleSYily+r
wOgISisNpmBOSwHrBElm3cGBDsxe376+/vV62H4fDm7OC65EbFVEL+T1sK0QU2d8xTMaHy9cOSMk
kTkThQ/TIqeI6oXgCtd962NTqWKetMooXLPUJVOaI5ErF3dBCY+qeap9uW+f72e7h0AS4XasUawG
4QXoGPRzCYIojCaQudR1VSbM8E7s5vE7ODNK8kbESzAYDrJ11L+Q9eIOTSOXhbs5AJYwh0xETBx9
M0okmaeAFkopipgvasW13av1E71sRsvtlVxxnpcGeBbeHB18JbOqMEzdkqreUhFr6cbHEoZ3QovL
6iezfv19doDlzNawtNfD+vA6W282u7fnw+Pzt0CMMKBmseXRKEo/80ooE6Drghmxom2SIofTJRaO
WmZ1hZ631IJUvg9srfePsAyhZQartbpgRaPiaqYpZSpua8C5S4CfNb8BraHkrhtid3gAAqevLY9W
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
6gEA
--===============4716062603850248410==--

