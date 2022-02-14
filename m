Content-Type: multipart/mixed; boundary="===============2027739236259604047=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xiang:xfs/end_cow 2/3] fs/xfs/libxfs/xfs_bmap.c:2464:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Tue, 15 Feb 2022 01:19:41 +0800
Message-ID: <202202142334.HN9MnJuX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2027739236259604047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Xiang Gao <xiang@kernel.org>
CC: linux-kernel(a)vger.kernel.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/linux.git xfs=
/end_cow
head:   20a175b5d3ff8ecb5be2451ce9dcdf82c4aa2afd
commit: 9d499a4f68f24f9dc7880e6f310c7488fe026610 [2/3] xfs: introduce xfs_b=
map_update_extent_real()
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20214/202202142334.HN9MnJuX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea0718=
84b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/xiang/linux.git/c=
ommit/?id=3D9d499a4f68f24f9dc7880e6f310c7488fe026610
        git remote add xiang https://git.kernel.org/pub/scm/linux/kernel/gi=
t/xiang/linux.git
        git fetch --no-tags xiang xfs/end_cow
        git checkout 9d499a4f68f24f9dc7880e6f310c7488fe026610
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/leds/led-triggers.c:279:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy((char *)trig->name, name);
           ^~~~~~
   drivers/leds/led-triggers.c:279:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy((char *)trig->name, name);
           ^~~~~~
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
   5 warnings generated.
   drivers/leds/trigger/ledtrig-cpu.c:54:7: warning: Value stored to 'is_ac=
tive' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           bool is_active =3D trig->is_active;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~
   drivers/leds/trigger/ledtrig-cpu.c:54:7: note: Value stored to 'is_activ=
e' during its initialization is never read
           bool is_active =3D trig->is_active;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   fs/xfs/libxfs/xfs_attr.c:1243:2: warning: Value stored to 'error' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           error =3D xfs_attr_node_removename(args, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr.c:1243:2: note: Value stored to 'error' is never =
read
           error =3D xfs_attr_node_removename(args, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/xfs/libxfs/xfs_attr_leaf.c:2243:29: warning: Value stored to 'drop_le=
af' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xfs_attr_leafblock *drop_leaf =3D drop_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2243:29: note: Value stored to 'drop_leaf'=
 during its initialization is never read
           struct xfs_attr_leafblock *drop_leaf =3D drop_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2244:29: warning: Value stored to 'save_le=
af' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xfs_attr_leafblock *save_leaf =3D save_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2244:29: note: Value stored to 'save_leaf'=
 during its initialization is never read
           struct xfs_attr_leafblock *save_leaf =3D save_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
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
   12 warnings generated.
   fs/xfs/libxfs/xfs_bmap.c:344:2: warning: Value stored to 'bno' is never =
read [clang-analyzer-deadcode.DeadStores]
           bno =3D NULLFSBLOCK;
           ^
   fs/xfs/libxfs/xfs_bmap.c:344:2: note: Value stored to 'bno' is never read
   fs/xfs/libxfs/xfs_bmap.c:388:4: warning: Value stored to 'error' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                           error =3D -EFSCORRUPTED;
                           ^       ~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:388:4: note: Value stored to 'error' is never r=
ead
                           error =3D -EFSCORRUPTED;
                           ^       ~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:441:4: warning: Value stored to 'bp_release' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           bp_release =3D 0;
                           ^            ~
   fs/xfs/libxfs/xfs_bmap.c:441:4: note: Value stored to 'bp_release' is ne=
ver read
                           bp_release =3D 0;
                           ^            ~
   fs/xfs/libxfs/xfs_bmap.c:800:2: warning: Value stored to 'error' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           error =3D 0;
           ^       ~
   fs/xfs/libxfs/xfs_bmap.c:800:2: note: Value stored to 'error' is never r=
ead
           error =3D 0;
           ^       ~
>> fs/xfs/libxfs/xfs_bmap.c:2464:13: warning: Assigned value is garbage or =
undefined [clang-analyzer-core.uninitialized.Assign]
           *logflagsp |=3D tmp_logflags;
                      ^  ~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:1960:2: note: 'tmp_logflags' declared without a=
n initial value
           int                     tmp_logflags;   /* partial log flag retu=
rn val */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:1965:8: note: Assuming 'whichfork' is not equal=
 to 0
           ifp =3D XFS_IFORK_PTR(ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap.c:1965:8: note: '?' condition is false
           ifp =3D XFS_IFORK_PTR(ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^
   fs/xfs/libxfs/xfs_bmap.c:1965:8: note: 'whichfork' is not equal to 1
           ifp =3D XFS_IFORK_PTR(ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^~~
   fs/xfs/libxfs/xfs_bmap.c:1965:8: note: '?' condition is false
           ifp =3D XFS_IFORK_PTR(ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^
   fs/xfs/libxfs/xfs_bmap.c:1967:2: note: '?' condition is true
           ASSERT(!isnullstartblock(new->br_startblock));
           ^
   fs/xfs/xfs_linux.h:208:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_bmap.c:1969:2: note: Loop condition is false.  Exiting=
 loop
           XFS_STATS_INC(mp, xs_add_exlist);
           ^
   fs/xfs/xfs_stats.h:165:2: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->s.v++;   \
           ^
   include/linux/percpu-defs.h:235:2: note: expanded from macro 'per_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   fs/xfs/libxfs/xfs_bmap.c:1969:2: note: Loop condition is false.  Exiting=
 loop
           XFS_STATS_INC(mp, xs_add_exlist);
           ^
   fs/xfs/xfs_stats.h:165:33: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->s.v++;   \
                                          ^
   fs/xfs/xfs_linux.h:104:25: note: expanded from macro 'current_cpu'
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
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   fs/xfs/libxfs/xfs_bmap.c:1969:2: note: Control jumps to 'case 4:'  at li=
ne 1969
           XFS_STATS_INC(mp, xs_add_exlist);
           ^
   fs/xfs/xfs_stats.h:165:33: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->s.v++;   \
                                          ^
   fs/xfs/xfs_linux.h:104:25: note: expanded from macro 'current_cpu'
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
   fs/xfs/libxfs/xfs_bmap.c:1969:2: note:  Execution continues on line 1969
           XFS_STATS_INC(mp, xs_add_exlist);
           ^
   fs/xfs/xfs_stats.h:165:33: note: expanded from macro 'XFS_STATS_INC'
           per_cpu_ptr(xfsstats.xs_stats, current_cpu())->s.v++;   \
                                          ^
   fs/xfs/xfs_linux.h:104:25: note: expanded from macro 'current_cpu'
   #define current_cpu()           (raw_smp_processor_id())
                                    ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)

vim +2464 fs/xfs/libxfs/xfs_bmap.c

^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  1931  =

^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  1932 =
 /*
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1933 =
  * Update a real allocated extent (including converting an unwritten
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1934 =
  * allocation to a real allocation or vice versa.)
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  1935 =
  */
26b91c728b2d15 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2019-02-18  1936 =
 int					/* error */
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1937 =
 xfs_bmap_update_extent_real(
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1938 =
 	struct xfs_trans	*tp,
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1939 =
 	struct xfs_inode	*ip,	/* incore inode pointer */
05a630d76bd3f3 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-02-02  1940 =
 	int			whichfork,
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  1941 =
 	struct xfs_iext_cursor	*icur,
ae127f087dc22b fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2021-09-16  1942 =
 	struct xfs_btree_cur	**curp,	/* if *curp is null, not a btree */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1943 =
 	struct xfs_bmbt_irec	*new,	/* new data to add to file extents */
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1944 =
 	int			*logflagsp, /* inode logging flags */
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1945 =
 	bool			convert)
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  1946 =
 {
ae127f087dc22b fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2021-09-16  1947 =
 	struct xfs_btree_cur	*cur;	/* btree cursor */
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  1948 =
 	int			error;	/* error return value */
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  1949 =
 	int			i;	/* temp state */
3ba738df25239f fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2018-07-17  1950 =
 	struct xfs_ifork	*ifp;	/* inode fork pointer */
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1951 =
 	xfs_fileoff_t		del_startoff;	/* start offset of del entry */
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1952 =
 	xfs_exntst_t		del_state;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1953 =
 	xfs_fileoff_t		new_endoff;	/* end offset of new entry */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1954 =
 	struct xfs_bmbt_irec	left, right;	/* neighbor extent entries */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1955 =
 	struct xfs_bmbt_irec	prev;		/* previous old extent */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1956 =
 	int			rval=3D0;	/* return value (logging flags) */
060ea65b39409f fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-19  1957 =
 	int			state =3D xfs_bmap_fork_to_state(whichfork);
05a630d76bd3f3 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-02-02  1958 =
 	struct xfs_mount	*mp =3D ip->i_mount;
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  1959 =
 	struct xfs_bmbt_irec	old;
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1960 =
 	int			tmp_logflags;	/* partial log flag return val */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1961  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1962 =
 	*logflagsp =3D 0;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1963  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1964 =
 	cur =3D *curp;
05a630d76bd3f3 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-02-02  1965 =
 	ifp =3D XFS_IFORK_PTR(ip, whichfork);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1966  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1967 =
 	ASSERT(!isnullstartblock(new->br_startblock));
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1968  =

ff6d6af2351cae fs/xfs/libxfs/xfs_bmap.c Bill O'Donnell    2015-10-12  1969 =
 	XFS_STATS_INC(mp, xs_add_exlist);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1970  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1971 =
 	/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1972 =
 	 * Set up a bunch of variables to make the tests simpler.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1973 =
 	 */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1974 =
 	error =3D 0;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1975 =
 	xfs_iext_get_extent(ifp, icur, &prev);
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1976 =
 	ASSERT(!convert || new->br_state !=3D prev.br_state);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1977 =
 	new_endoff =3D new->br_startoff + new->br_blockcount;
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1978 =
 	del_startoff =3D prev.br_startblock +
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1979 =
 		new->br_startoff - prev.br_startoff;
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1980 =
 	del_state =3D prev.br_state;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1981 =
 	ASSERT(prev.br_startoff <=3D new->br_startoff);
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1982 =
 	ASSERT(prev.br_startoff + prev.br_blockcount >=3D new_endoff);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1983  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1984 =
 	/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1985 =
 	 * Set flags determining what part of the previous oldext allocation
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1986 =
 	 * extent is being replaced by a newext allocation.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1987 =
 	 */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1988 =
 	if (prev.br_startoff =3D=3D new->br_startoff)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1989 =
 		state |=3D BMAP_LEFT_FILLING;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1990 =
 	if (prev.br_startoff + prev.br_blockcount =3D=3D new_endoff)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1991 =
 		state |=3D BMAP_RIGHT_FILLING;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1992  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1993 =
 	/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1994 =
 	 * Check and set flags if this segment has a left neighbor.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1995 =
 	 * Don't set contiguous if the combined extent would be too large.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1996 =
 	 */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1997 =
 	if (xfs_iext_peek_prev_extent(ifp, icur, &left)) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  1998 =
 		state |=3D BMAP_LEFT_VALID;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  1999 =
 		if (isnullstartblock(left.br_startblock))
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2000 =
 			state |=3D BMAP_LEFT_DELAY;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2001 =
 	}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2002  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2003 =
 	if ((state & BMAP_LEFT_VALID) && !(state & BMAP_LEFT_DELAY) &&
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2004 =
 	    left.br_startoff + left.br_blockcount =3D=3D new->br_startoff &&
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2005 =
 	    left.br_startblock + left.br_blockcount =3D=3D new->br_startblock &&
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2006 =
 	    left.br_state =3D=3D new->br_state &&
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2007 =
 	    left.br_blockcount + new->br_blockcount <=3D MAXEXTLEN)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2008 =
 		state |=3D BMAP_LEFT_CONTIG;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2009  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2010 =
 	/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2011 =
 	 * Check and set flags if this segment has a right neighbor.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2012 =
 	 * Don't set contiguous if the combined extent would be too large.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2013 =
 	 * Also check for all-three-contiguous being too large.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2014 =
 	 */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2015 =
 	if (xfs_iext_peek_next_extent(ifp, icur, &right)) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2016 =
 		state |=3D BMAP_RIGHT_VALID;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2017 =
 		if (isnullstartblock(right.br_startblock))
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2018 =
 			state |=3D BMAP_RIGHT_DELAY;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2019 =
 	}
0b1b213fcf3a84 fs/xfs/xfs_bmap.c        Christoph Hellwig 2009-12-14  2020  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2021 =
 	if ((state & BMAP_RIGHT_VALID) && !(state & BMAP_RIGHT_DELAY) &&
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2022 =
 	    new_endoff =3D=3D right.br_startoff &&
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2023 =
 	    new->br_startblock + new->br_blockcount =3D=3D right.br_startblock &&
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2024 =
 	    new->br_state =3D=3D right.br_state &&
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2025 =
 	    new->br_blockcount + right.br_blockcount <=3D MAXEXTLEN &&
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2026 =
 	    ((state & (BMAP_LEFT_CONTIG | BMAP_LEFT_FILLING |
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2027 =
 		       BMAP_RIGHT_FILLING)) !=3D
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2028 =
 		      (BMAP_LEFT_CONTIG | BMAP_LEFT_FILLING |
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2029 =
 		       BMAP_RIGHT_FILLING) ||
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2030 =
 	     left.br_blockcount + new->br_blockcount + right.br_blockcount
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2031 =
 			<=3D MAXEXTLEN))
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2032 =
 		state |=3D BMAP_RIGHT_CONTIG;
0b1b213fcf3a84 fs/xfs/xfs_bmap.c        Christoph Hellwig 2009-12-14  2033  =

^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2034 =
 	/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2035 =
 	 * Switch out based on the FILLING and CONTIG state bits.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2036 =
 	 */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2037 =
 	switch (state & (BMAP_LEFT_FILLING | BMAP_LEFT_CONTIG |
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2038 =
 			 BMAP_RIGHT_FILLING | BMAP_RIGHT_CONTIG)) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2039 =
 	case BMAP_LEFT_FILLING | BMAP_LEFT_CONTIG |
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2040 =
 	     BMAP_RIGHT_FILLING | BMAP_RIGHT_CONTIG:
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2041 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2042 =
 		 * Setting all of a previous oldext extent to newext.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2043 =
 		 * The left and right neighbors are both contiguous with new.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2044 =
 		 */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2045 =
 		left.br_blockcount +=3D prev.br_blockcount + right.br_blockcount;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2046  =

c38ccf599022e7 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2047 =
 		xfs_iext_remove(ip, icur, state);
c38ccf599022e7 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2048 =
 		xfs_iext_remove(ip, icur, state);
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2049 =
 		xfs_iext_prev(ifp, icur);
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2050 =
 		xfs_iext_update_extent(ip, state, icur, &left);
daf83964a3681c fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2020-05-18  2051 =
 		ifp->if_nextents -=3D 2;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2052 =
 		if (cur =3D=3D NULL) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2053 =
 			rval =3D XFS_ILOG_CORE | XFS_ILOG_DEXT;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2054 =
 		} else {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2055 =
 			rval =3D XFS_ILOG_CORE;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2056 =
 			error =3D xfs_bmbt_lookup_eq(cur, &right, &i);
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2057 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2058 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2059 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2060 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2061 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2062 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2063 =
 			if ((error =3D xfs_btree_delete(cur, &i)))
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2064 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2065 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2066 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2067 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2068 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2069 =
 			if ((error =3D xfs_btree_decrement(cur, 0, &i)))
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2070 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2071 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2072 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2073 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2074 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2075 =
 			if ((error =3D xfs_btree_delete(cur, &i)))
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2076 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2077 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2078 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2079 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2080 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2081 =
 			if ((error =3D xfs_btree_decrement(cur, 0, &i)))
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2082 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2083 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2084 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2085 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2086 =
 			}
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2087 =
 			error =3D xfs_bmbt_update(cur, &left);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2088 =
 			if (error)
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2089 =
 				goto done;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2090 =
 		}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2091 =
 		break;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2092  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2093 =
 	case BMAP_LEFT_FILLING | BMAP_RIGHT_FILLING | BMAP_LEFT_CONTIG:
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2094 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2095 =
 		 * Setting all of a previous oldext extent to newext.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2096 =
 		 * The left neighbor is contiguous, the right is not.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2097 =
 		 */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2098 =
 		left.br_blockcount +=3D prev.br_blockcount;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2099  =

c38ccf599022e7 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2100 =
 		xfs_iext_remove(ip, icur, state);
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2101 =
 		xfs_iext_prev(ifp, icur);
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2102 =
 		xfs_iext_update_extent(ip, state, icur, &left);
daf83964a3681c fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2020-05-18  2103 =
 		ifp->if_nextents--;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2104 =
 		if (cur =3D=3D NULL) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2105 =
 			rval =3D XFS_ILOG_CORE | XFS_ILOG_DEXT;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2106 =
 		} else {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2107 =
 			rval =3D XFS_ILOG_CORE;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2108 =
 			error =3D xfs_bmbt_lookup_eq(cur, &prev, &i);
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2109 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2110 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2111 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2112 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2113 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2114 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2115 =
 			if ((error =3D xfs_btree_delete(cur, &i)))
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2116 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2117 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2118 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2119 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2120 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2121 =
 			if ((error =3D xfs_btree_decrement(cur, 0, &i)))
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2122 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2123 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2124 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2125 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2126 =
 			}
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2127 =
 			error =3D xfs_bmbt_update(cur, &left);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2128 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2129 =
 				goto done;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2130 =
 		}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2131 =
 		break;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2132  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2133 =
 	case BMAP_LEFT_FILLING | BMAP_RIGHT_FILLING | BMAP_RIGHT_CONTIG:
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2134 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2135 =
 		 * Setting all of a previous oldext extent to newext.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2136 =
 		 * The right neighbor is contiguous, the left is not.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2137 =
 		 */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2138 =
 		prev.br_blockcount +=3D right.br_blockcount;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2139 =
 		prev.br_state =3D new->br_state;
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2140 =
 		prev.br_startblock =3D new->br_startblock;
a681847796df31 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2141  =

b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2142 =
 		xfs_iext_next(ifp, icur);
c38ccf599022e7 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2143 =
 		xfs_iext_remove(ip, icur, state);
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2144 =
 		xfs_iext_prev(ifp, icur);
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2145 =
 		xfs_iext_update_extent(ip, state, icur, &prev);
daf83964a3681c fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2020-05-18  2146 =
 		ifp->if_nextents--;
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2147  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2148 =
 		if (cur =3D=3D NULL) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2149 =
 			rval =3D XFS_ILOG_CORE | XFS_ILOG_DEXT;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2150 =
 		} else {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2151 =
 			rval =3D XFS_ILOG_CORE;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2152 =
 			error =3D xfs_bmbt_lookup_eq(cur, &right, &i);
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2153 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2154 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2155 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2156 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2157 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2158 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2159 =
 			if ((error =3D xfs_btree_delete(cur, &i)))
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2160 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2161 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2162 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2163 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2164 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2165 =
 			if ((error =3D xfs_btree_decrement(cur, 0, &i)))
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2166 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2167 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2168 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2169 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2170 =
 			}
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2171 =
 			error =3D xfs_bmbt_update(cur, &prev);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2172 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2173 =
 				goto done;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2174 =
 		}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2175 =
 		break;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2176  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2177 =
 	case BMAP_LEFT_FILLING | BMAP_RIGHT_FILLING:
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2178 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2179 =
 		 * Setting all of a previous oldext extent to newext.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2180 =
 		 * Neither the left nor right neighbors are contiguous with
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2181 =
 		 * the new one.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2182 =
 		 */
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2183 =
 		prev.br_startblock =3D new->br_startblock;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2184 =
 		prev.br_state =3D new->br_state;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2185 =
 		xfs_iext_update_extent(ip, state, icur, &prev);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2186  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2187 =
 		if (cur =3D=3D NULL) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2188 =
 			rval =3D XFS_ILOG_DEXT;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2189 =
 		} else {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2190 =
 			rval =3D 0;
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2191 =
 			error =3D xfs_bmbt_lookup_eq(cur, new, &i);
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2192 =
 			if (error)
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2193 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2194 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2195 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2196 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2197 =
 			}
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2198 =
 			error =3D xfs_bmbt_update(cur, &prev);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2199 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2200 =
 				goto done;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2201 =
 		}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2202 =
 		break;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2203  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2204 =
 	case BMAP_LEFT_FILLING | BMAP_LEFT_CONTIG:
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2205 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2206 =
 		 * Setting the first part of a previous oldext extent to newext.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2207 =
 		 * The left neighbor is contiguous.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2208 =
 		 */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2209 =
 		left.br_blockcount +=3D new->br_blockcount;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2210  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2211 =
 		old =3D prev;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2212 =
 		prev.br_startoff +=3D new->br_blockcount;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2213 =
 		prev.br_startblock +=3D new->br_blockcount;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2214 =
 		prev.br_blockcount -=3D new->br_blockcount;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2215  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2216 =
 		xfs_iext_update_extent(ip, state, icur, &prev);
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2217 =
 		xfs_iext_prev(ifp, icur);
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2218 =
 		xfs_iext_update_extent(ip, state, icur, &left);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2219  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2220 =
 		if (cur =3D=3D NULL) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2221 =
 			rval =3D XFS_ILOG_DEXT;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2222 =
 		} else {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2223 =
 			rval =3D 0;
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2224 =
 			error =3D xfs_bmbt_lookup_eq(cur, &old, &i);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2225 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2226 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2227 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2228 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2229 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2230 =
 			}
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2231 =
 			error =3D xfs_bmbt_update(cur, &prev);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2232 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2233 =
 				goto done;
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2234 =
 			error =3D xfs_btree_decrement(cur, 0, &i);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2235 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2236 =
 				goto done;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2237 =
 			error =3D xfs_bmbt_update(cur, &left);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2238 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2239 =
 				goto done;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2240 =
 		}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2241 =
 		break;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2242  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2243 =
 	case BMAP_LEFT_FILLING:
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2244 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2245 =
 		 * Setting the first part of a previous oldext extent to newext.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2246 =
 		 * The left neighbor is not contiguous.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2247 =
 		 */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2248 =
 		old =3D prev;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2249 =
 		prev.br_startoff +=3D new->br_blockcount;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2250 =
 		prev.br_startblock +=3D new->br_blockcount;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2251 =
 		prev.br_blockcount -=3D new->br_blockcount;
233eebb9a96f95 fs/xfs/xfs_bmap.c        Christoph Hellwig 2011-05-11  2252  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2253 =
 		xfs_iext_update_extent(ip, state, icur, &prev);
0254c2f253d6fe fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2254 =
 		xfs_iext_insert(ip, icur, new, state);
daf83964a3681c fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2020-05-18  2255 =
 		ifp->if_nextents++;
daf83964a3681c fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2020-05-18  2256  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2257 =
 		if (cur =3D=3D NULL) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2258 =
 			rval =3D XFS_ILOG_CORE | XFS_ILOG_DEXT;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2259 =
 		} else {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2260 =
 			rval =3D XFS_ILOG_CORE;
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2261 =
 			error =3D xfs_bmbt_lookup_eq(cur, &old, &i);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2262 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2263 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2264 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2265 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2266 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2267 =
 			}
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2268 =
 			error =3D xfs_bmbt_update(cur, &prev);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2269 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2270 =
 				goto done;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2271 =
 			cur->bc_rec.b =3D *new;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2272 =
 			if ((error =3D xfs_btree_insert(cur, &i)))
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2273 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2274 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2275 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2276 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2277 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2278 =
 		}
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2279 =
 		break;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2280  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2281 =
 	case BMAP_RIGHT_FILLING | BMAP_RIGHT_CONTIG:
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2282 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2283 =
 		 * Setting the last part of a previous oldext extent to newext.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2284 =
 		 * The right neighbor is contiguous with the new allocation.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2285 =
 		 */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2286 =
 		old =3D prev;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2287 =
 		prev.br_blockcount -=3D new->br_blockcount;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2288  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2289 =
 		right.br_startoff =3D new->br_startoff;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2290 =
 		right.br_startblock =3D new->br_startblock;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2291 =
 		right.br_blockcount +=3D new->br_blockcount;
a681847796df31 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2292  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2293 =
 		xfs_iext_update_extent(ip, state, icur, &prev);
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2294 =
 		xfs_iext_next(ifp, icur);
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2295 =
 		xfs_iext_update_extent(ip, state, icur, &right);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2296  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2297 =
 		if (cur =3D=3D NULL) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2298 =
 			rval =3D XFS_ILOG_DEXT;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2299 =
 		} else {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2300 =
 			rval =3D 0;
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2301 =
 			error =3D xfs_bmbt_lookup_eq(cur, &old, &i);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2302 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2303 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2304 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2305 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2306 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2307 =
 			}
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2308 =
 			error =3D xfs_bmbt_update(cur, &prev);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2309 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2310 =
 				goto done;
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2311 =
 			error =3D xfs_btree_increment(cur, 0, &i);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2312 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2313 =
 				goto done;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2314 =
 			error =3D xfs_bmbt_update(cur, &right);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2315 =
 			if (error)
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2316 =
 				goto done;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2317 =
 		}
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2318 =
 		break;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2319  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2320 =
 	case BMAP_RIGHT_FILLING:
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2321 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2322 =
 		 * Setting the last part of a previous oldext extent to newext.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2323 =
 		 * The right neighbor is not contiguous.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2324 =
 		 */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2325 =
 		old =3D prev;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2326 =
 		prev.br_blockcount -=3D new->br_blockcount;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2327  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2328 =
 		xfs_iext_update_extent(ip, state, icur, &prev);
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2329 =
 		xfs_iext_next(ifp, icur);
0254c2f253d6fe fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2330 =
 		xfs_iext_insert(ip, icur, new, state);
daf83964a3681c fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2020-05-18  2331 =
 		ifp->if_nextents++;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2332  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2333 =
 		if (cur =3D=3D NULL) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2334 =
 			rval =3D XFS_ILOG_CORE | XFS_ILOG_DEXT;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2335 =
 		} else {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2336 =
 			rval =3D XFS_ILOG_CORE;
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2337 =
 			error =3D xfs_bmbt_lookup_eq(cur, &old, &i);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2338 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2339 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2340 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2341 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2342 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2343 =
 			}
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2344 =
 			error =3D xfs_bmbt_update(cur, &prev);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2345 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2346 =
 				goto done;
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2347 =
 			error =3D xfs_bmbt_lookup_eq(cur, new, &i);
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2348 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2349 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2350 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 0)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2351 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2352 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2353 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2354 =
 			if ((error =3D xfs_btree_insert(cur, &i)))
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2355 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2356 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2357 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2358 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2359 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2360 =
 		}
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2361 =
 		break;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2362  =

^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2363 =
 	case 0:
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2364 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2365 =
 		 * Setting the middle part of a previous oldext extent to
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2366 =
 		 * newext.  Contiguity is impossible here.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2367 =
 		 * One extent becomes three extents.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2368 =
 		 */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2369 =
 		old =3D prev;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2370 =
 		prev.br_blockcount =3D new->br_startoff - prev.br_startoff;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2371  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2372 =
 		right.br_startoff =3D new_endoff;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2373 =
 		right.br_blockcount =3D
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2374 =
 			old.br_startoff + old.br_blockcount - new_endoff;
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2375 =
 		right.br_startblock =3D old.br_startblock + prev.br_blockcount +
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2376 =
 			new->br_blockcount;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2377 =
 		right.br_state =3D prev.br_state;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2378  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2379 =
 		xfs_iext_update_extent(ip, state, icur, &prev);
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  2380 =
 		xfs_iext_next(ifp, icur);
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2381 =
 		xfs_iext_insert(ip, icur, &right, state);
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2382 =
 		xfs_iext_insert(ip, icur, new, state);
daf83964a3681c fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2020-05-18  2383 =
 		ifp->if_nextents +=3D 2;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2384  =

6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2385 =
 		if (cur =3D=3D NULL) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2386 =
 			rval =3D XFS_ILOG_CORE | XFS_ILOG_DEXT;
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2387 =
 		} else {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2388 =
 			rval =3D XFS_ILOG_CORE;
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2389 =
 			error =3D xfs_bmbt_lookup_eq(cur, &old, &i);
79fa6143a939a6 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2390 =
 			if (error)
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2391 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2392 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2393 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2394 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2395 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2396 =
 			/* new right extent - oldext */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2397 =
 			error =3D xfs_bmbt_update(cur, &right);
a67d00a55507dc fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2398 =
 			if (error)
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2399 =
 				goto done;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2400 =
 			/* new left extent - oldext */
6449ec0132d85c fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2401 =
 			cur->bc_rec.b =3D prev;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2402 =
 			if ((error =3D xfs_btree_insert(cur, &i)))
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2403 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2404 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2405 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2406 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2407 =
 			}
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2408 =
 			/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2409 =
 			 * Reset the cursor to the position of the new extent
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2410 =
 			 * we are about to insert as we can't trust it after
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2411 =
 			 * the previous insert.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2412 =
 			 */
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2413 =
 			error =3D xfs_bmbt_lookup_eq(cur, new, &i);
e16cf9b03cee4d fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  2414 =
 			if (error)
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2415 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2416 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 0)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2417 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2418 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2419 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2420 =
 			/* new middle extent - newext */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2421 =
 			if ((error =3D xfs_btree_insert(cur, &i)))
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2422 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2423 =
 			if (XFS_IS_CORRUPT(mp, i !=3D 1)) {
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2424 =
 				error =3D -EFSCORRUPTED;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2425 =
 				goto done;
f9e0370648b9f9 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  2426 =
 			}
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2427 =
 		}
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2428 =
 		break;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2429  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2430 =
 	case BMAP_LEFT_FILLING | BMAP_LEFT_CONTIG | BMAP_RIGHT_CONTIG:
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2431 =
 	case BMAP_RIGHT_FILLING | BMAP_LEFT_CONTIG | BMAP_RIGHT_CONTIG:
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2432 =
 	case BMAP_LEFT_FILLING | BMAP_RIGHT_CONTIG:
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2433 =
 	case BMAP_RIGHT_FILLING | BMAP_LEFT_CONTIG:
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2434 =
 	case BMAP_LEFT_CONTIG | BMAP_RIGHT_CONTIG:
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2435 =
 	case BMAP_LEFT_CONTIG:
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2436 =
 	case BMAP_RIGHT_CONTIG:
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2437 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2438 =
 		 * These cases are all impossible.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2439 =
 		 */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2440 =
 		ASSERT(0);
96540c78583a41 fs/xfs/xfs_bmap.c        Christoph Hellwig 2010-09-30  2441 =
 	}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2442  =

9c19464469556a fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-08-03  2443 =
 	/* update reverse mappings */
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2444 =
 	if (!convert) {
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2445 =
 		old =3D *new;
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2446 =
 		old.br_startblock =3D del_startoff;
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2447 =
 		old.br_state =3D del_state;
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2448 =
 		xfs_rmap_unmap_extent(tp, ip, whichfork, &old);
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2449 =
 		xfs_rmap_map_extent(tp, ip, whichfork, new);
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2450 =
 	} else {
bc46ac64713f11 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-08-26  2451 =
 		xfs_rmap_convert_extent(mp, tp, ip, whichfork, new);
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2452 =
 	}
9c19464469556a fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-08-03  2453  =

9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2454 =
 	/* convert to a btree or extents if necessary */
05a630d76bd3f3 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-02-02  2455 =
 	if (xfs_bmap_needs_btree(ip, whichfork)) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2456 =
 		ASSERT(cur =3D=3D NULL);
280253d213fb73 fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  2457 =
 		error =3D xfs_bmap_extents_to_btree(tp, ip, &cur, 0,
280253d213fb73 fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  2458 =
 				&tmp_logflags, whichfork);
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2459 =
 	} else if (!convert) {
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2460 =
 		error =3D xfs_bmap_btree_to_extents(tp, ip, cur,
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2461 =
 				&tmp_logflags, whichfork);
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2462 =
 	}
9d499a4f68f24f fs/xfs/libxfs/xfs_bmap.c Gao Xiang         2022-02-09  2463  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25 @2464 =
 	*logflagsp |=3D tmp_logflags;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2465 =
 	if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2466 =
 		goto done;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2467  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2468 =
 	/* clear out the allocated field, done with it now in any case. */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2469 =
 	if (cur) {
92219c292af8dd fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2020-03-10  2470 =
 		cur->bc_ino.allocated =3D 0;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2471 =
 		*curp =3D cur;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2472 =
 	}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2473  =

05a630d76bd3f3 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-02-02  2474 =
 	xfs_bmap_check_leaf_extents(*curp, ip, whichfork);
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2475 =
 done:
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  2476 =
 	*logflagsp |=3D rval;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2477 =
 	return error;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2478 =
 }
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  2479  =


:::::: The code at line 2464 was first introduced by commit
:::::: 9e5987a7792194ec338f53643237150c0db5f5e0 xfs: rearrange some code in=
 xfs_bmap for better locality

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Ben Myers <bpm@sgi.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2027739236259604047==--

