Content-Type: multipart/mixed; boundary="===============0245570563130926716=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 11/36] xfs: Pre-calculate per-AG agbno geometry
Date: Sun, 05 Dec 2021 14:59:42 +0800
Message-ID: <202112051425.OoVe322K-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0245570563130926716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211203000111.2800982-12-david@fromorbit.com>
References: <20211203000111.2800982-12-david@fromorbit.com>
TO: Dave Chinner <david@fromorbit.com>
TO: linux-xfs(a)vger.kernel.org

Hi Dave,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dave-Chinner/xfs-more-work=
-towards-shrinking/20211203-080331
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001-20211203 (https://download.01.org/0day-ci/arch=
ive/20211205/202112051425.OoVe322K-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 1e328b=
06c15273edf4a40a27ca24931b5efb3a87)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ec9bd28a02575415892a9677f=
c3491e032c128c4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dave-Chinner/xfs-more-work-towards=
-shrinking/20211203-080331
        git checkout ec9bd28a02575415892a9677fc3491e032c128c4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/xfs/xfs_stats.h:196:36: note: expanded from macro 'XFS_STATS_ADD_OFF'
           per_cpu_ptr(mp->m_stats.xs_stats, current_cpu())->a[off] +=3D (i=
nc);      \
                                             ^
   fs/xfs/xfs_linux.h:103:25: note: expanded from macro 'current_cpu'
   #define current_cpu()           (raw_smp_processor_id())
                                    ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:323:42: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 4: pscr_ret__ =3D stem##4(variable); break;                =
  \
                                                   ^
   fs/xfs/libxfs/xfs_btree.c:3682:2: note: Loop condition is false.  Exitin=
g loop
           XFS_BTREE_STATS_ADD(cur, moves, numrecs - ptr);
           ^
   fs/xfs/libxfs/xfs_btree.h:91:2: note: expanded from macro 'XFS_BTREE_STA=
TS_ADD'
           XFS_STATS_ADD_OFF((cur)->bc_mp, (cur)->bc_statoff + __XBTS_ ## s=
tat, val)
           ^
   fs/xfs/xfs_stats.h:193:45: note: expanded from macro 'XFS_STATS_ADD_OFF'
   #define XFS_STATS_ADD_OFF(mp, off, inc)                                 \
                                                                           ^
   fs/xfs/libxfs/xfs_btree.c:3685:6: note: Assuming 'level' is <=3D 0
           if (level > 0) {
               ^~~~~~~~~
   fs/xfs/libxfs/xfs_btree.c:3685:2: note: Taking false branch
           if (level > 0) {
           ^
   fs/xfs/libxfs/xfs_btree.c:3707:7: note: Assuming 'ptr' is >=3D 'numrecs'
                   if (ptr < numrecs) {
                       ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_btree.c:3707:3: note: Taking false branch
                   if (ptr < numrecs) {
                   ^
   fs/xfs/libxfs/xfs_btree.c:3725:2: note: Taking false branch
           if (xfs_btree_is_lastrec(cur, block, level)) {
           ^
   fs/xfs/libxfs/xfs_btree.c:3735:6: note: Assuming the condition is false
           if (level =3D=3D cur->bc_nlevels - 1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_btree.c:3735:2: note: Taking false branch
           if (level =3D=3D cur->bc_nlevels - 1) {
           ^
   fs/xfs/libxfs/xfs_btree.c:3779:2: note: Taking false branch
           if (xfs_btree_needs_key_update(cur, ptr)) {
           ^
   fs/xfs/libxfs/xfs_btree.c:3789:6: note: Assuming the condition is false
           if (numrecs >=3D cur->bc_ops->get_minrecs(cur, level)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_btree.c:3789:2: note: Taking false branch
           if (numrecs >=3D cur->bc_ops->get_minrecs(cur, level)) {
           ^
   fs/xfs/libxfs/xfs_btree.c:3804:6: note: Assuming the condition is false
           if (cur->bc_flags & XFS_BTREE_ROOT_IN_INODE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_btree.c:3804:2: note: Taking false branch
           if (cur->bc_flags & XFS_BTREE_ROOT_IN_INODE) {
           ^
   fs/xfs/libxfs/xfs_btree.c:3822:44: note: Left side of '||' is true
           ASSERT(!xfs_btree_ptr_is_null(cur, &rptr) ||
                                                     ^
   fs/xfs/libxfs/xfs_btree.c:3822:2: note: '?' condition is true
           ASSERT(!xfs_btree_ptr_is_null(cur, &rptr) ||
           ^
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_btree.c:3830:6: note: 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_btree.c:3830:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_btree.c:3837:2: note: Taking false branch
           if (!xfs_btree_ptr_is_null(cur, &rptr)) {
           ^
   fs/xfs/libxfs/xfs_btree.c:3923:2: note: Taking false branch
           if (!xfs_btree_ptr_is_null(cur, &lptr)) {
           ^
   fs/xfs/libxfs/xfs_btree.c:3988:10: note: Calling 'xfs_btree_ptr_is_null'
           ASSERT(!xfs_btree_ptr_is_null(cur, &cptr));
                   ^
   fs/xfs/xfs_linux.h:214:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_btree.c:1018:2: note: Taking false branch
           if (cur->bc_flags & XFS_BTREE_LONG_PTRS)
           ^
   fs/xfs/libxfs/xfs_btree.c:1021:17: note: The left operand of '=3D=3D' is=
 a garbage value
                   return ptr->s =3D=3D cpu_to_be32(NULLAGBLOCK);
                          ~~~~~~ ^
>> fs/xfs/libxfs/xfs_btree.c:4509:2: warning: Value stored to 'agno' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           agno =3D xfs_daddr_to_agno(mp, xfs_buf_daddr(bp));
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_btree.c:4509:2: note: Value stored to 'agno' is never =
read
           agno =3D xfs_daddr_to_agno(mp, xfs_buf_daddr(bp));
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_btree.h:446:9: warning: Access to field 'bb_numrecs' r=
esults in a dereference of a null pointer (loaded from variable 'block') [c=
lang-analyzer-core.NullDereference]
           return be16_to_cpu(block->bb_numrecs);
                  ^
   include/linux/byteorder/generic.h:97:21: note: expanded from macro 'be16=
_to_cpu'
   #define be16_to_cpu __be16_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:42:58: note: expanded from =
macro '__be16_to_cpu'
   #define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
                                                            ^
   fs/xfs/libxfs/xfs_btree.c:1817:2: note: Loop condition is false.  Exitin=
g loop
           XFS_BTREE_STATS_INC(cur, lookup);
           ^
   fs/xfs/libxfs/xfs_btree.h:89:2: note: expanded from macro 'XFS_BTREE_STA=
TS_INC'
           XFS_STATS_INC_OFF((cur)->bc_mp, (cur)->bc_statoff + __XBTS_ ## s=
tat)
           ^
   fs/xfs/xfs_stats.h:183:2: note: expanded from macro 'XFS_STATS_INC_OFF'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->a[off]++;        \
           ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   fs/xfs/libxfs/xfs_btree.c:1817:2: note: Loop condition is false.  Exitin=
g loop
           XFS_BTREE_STATS_INC(cur, lookup);
           ^
   fs/xfs/libxfs/xfs_btree.h:89:2: note: expanded from macro 'XFS_BTREE_STA=
TS_INC'
           XFS_STATS_INC_OFF((cur)->bc_mp, (cur)->bc_statoff + __XBTS_ ## s=
tat)
           ^
   fs/xfs/xfs_stats.h:183:33: note: expanded from macro 'XFS_STATS_INC_OFF'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->a[off]++;        \
                                          ^
   fs/xfs/xfs_linux.h:103:25: note: expanded from macro 'current_cpu'
   #define current_cpu()           (raw_smp_processor_id())
                                    ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   fs/xfs/libxfs/xfs_btree.c:1817:2: note: Control jumps to 'case 4:'  at l=
ine 1817
           XFS_BTREE_STATS_INC(cur, lookup);
           ^
   fs/xfs/libxfs/xfs_btree.h:89:2: note: expanded from macro 'XFS_BTREE_STA=
TS_INC'
           XFS_STATS_INC_OFF((cur)->bc_mp, (cur)->bc_statoff + __XBTS_ ## s=
tat)
           ^
   fs/xfs/xfs_stats.h:183:33: note: expanded from macro 'XFS_STATS_INC_OFF'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->a[off]++;        \
                                          ^
   fs/xfs/xfs_linux.h:103:25: note: expanded from macro 'current_cpu'
   #define current_cpu()           (raw_smp_processor_id())
                                    ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   fs/xfs/libxfs/xfs_btree.c:1817:2: note:  Execution continues on line 1817
           XFS_BTREE_STATS_INC(cur, lookup);
           ^
   fs/xfs/libxfs/xfs_btree.h:89:2: note: expanded from macro 'XFS_BTREE_STA=
TS_INC'
           XFS_STATS_INC_OFF((cur)->bc_mp, (cur)->bc_statoff + __XBTS_ ## s=
tat)
           ^
   fs/xfs/xfs_stats.h:183:33: note: expanded from macro 'XFS_STATS_INC_OFF'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->a[off]++;        \
                                          ^
   fs/xfs/xfs_linux.h:103:25: note: expanded from macro 'current_cpu'
   #define current_cpu()           (raw_smp_processor_id())
                                    ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:323:42: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 4: pscr_ret__ =3D stem##4(variable); break;                =
  \
                                                   ^
   fs/xfs/libxfs/xfs_btree.c:1817:2: note: Loop condition is false.  Exitin=
g loop
           XFS_BTREE_STATS_INC(cur, lookup);
           ^
   fs/xfs/libxfs/xfs_btree.h:89:2: note: expanded from macro 'XFS_BTREE_STA=
TS_INC'
           XFS_STATS_INC_OFF((cur)->bc_mp, (cur)->bc_statoff + __XBTS_ ## s=
tat)
           ^
   fs/xfs/xfs_stats.h:184:2: note: expanded from macro 'XFS_STATS_INC_OFF'

vim +/agno +4509 fs/xfs/libxfs/xfs_btree.c

c5ab131ba0df8c Darrick J. Wong   2016-01-04  4488  =

c5ab131ba0df8c Darrick J. Wong   2016-01-04  4489  /**
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4490   * xfs_btree_sblock_veri=
fy() -- verify a short-format btree block
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4491   *
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4492   * @bp: buffer containin=
g the btree block
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4493   * @max_recs: maximum re=
cords allowed in this btree node
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4494   */
a6a781a58befcb Darrick J. Wong   2018-01-08  4495  xfs_failaddr_t
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4496  xfs_btree_sblock_verify(
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4497  	struct xfs_buf		*bp,
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4498  	unsigned int		max_recs)
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4499  {
dbd329f1e44ed4 Christoph Hellwig 2019-06-28  4500  	struct xfs_mount	*mp =
=3D bp->b_mount;
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4501  	struct xfs_btree_block	=
*block =3D XFS_BUF_TO_BLOCK(bp);
e1e55aaf1cc646 Darrick J. Wong   2018-01-08  4502  	xfs_agblock_t		agno;
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4503  =

c5ab131ba0df8c Darrick J. Wong   2016-01-04  4504  	/* numrecs verification=
 */
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4505  	if (be16_to_cpu(block->=
bb_numrecs) > max_recs)
a6a781a58befcb Darrick J. Wong   2018-01-08  4506  		return __this_address;
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4507  =

c5ab131ba0df8c Darrick J. Wong   2016-01-04  4508  	/* sibling pointer veri=
fication */
04fcad80cd0687 Dave Chinner      2021-08-18 @4509  	agno =3D xfs_daddr_to_a=
gno(mp, xfs_buf_daddr(bp));
e1e55aaf1cc646 Darrick J. Wong   2018-01-08  4510  	if (block->bb_u.s.bb_le=
ftsib !=3D cpu_to_be32(NULLAGBLOCK) &&
ec9bd28a025754 Dave Chinner      2021-12-03  4511  	    !xfs_verify_agbno(b=
p->b_pag, be32_to_cpu(block->bb_u.s.bb_leftsib)))
a6a781a58befcb Darrick J. Wong   2018-01-08  4512  		return __this_address;
e1e55aaf1cc646 Darrick J. Wong   2018-01-08  4513  	if (block->bb_u.s.bb_ri=
ghtsib !=3D cpu_to_be32(NULLAGBLOCK) &&
ec9bd28a025754 Dave Chinner      2021-12-03  4514  	    !xfs_verify_agbno(b=
p->b_pag, be32_to_cpu(block->bb_u.s.bb_rightsib)))
a6a781a58befcb Darrick J. Wong   2018-01-08  4515  		return __this_address;
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4516  =

a6a781a58befcb Darrick J. Wong   2018-01-08  4517  	return NULL;
c5ab131ba0df8c Darrick J. Wong   2016-01-04  4518  }
19b54ee66c4c5d Darrick J. Wong   2016-06-21  4519  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0245570563130926716==--

