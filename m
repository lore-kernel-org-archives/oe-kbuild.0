Content-Type: multipart/mixed; boundary="===============0156804020826694308=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 104/327] fs/xfs/scrub/rmap_repair.c:1474:2: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 01 Jan 2022 19:04:46 +0800
Message-ID: <202201011803.HYrCGsXx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0156804020826694308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   7bd5ed813c460c39b9ed735852970905ad0a633b
commit: 79e2564e37a58e00e0a48476101ee77bc6cecb90 [104/327] xfs: create a sh=
adow rmap btree during rmap repair
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-c006-20211231 (https://download.01.org/0day-ci/arc=
hive/20220101/202201011803.HYrCGsXx-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c05440=
2170cd8466683a20385befc0523aba3359)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3D79e2564e37a58e00e0a48476101ee77bc6cecb90
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout 79e2564e37a58e00e0a48476101ee77bc6cecb90
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/crypto/hkdf.c:157:7: note: Assuming the condition is false
                   if (okmlen - i < HKDF_HASHLEN) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/crypto/hkdf.c:157:3: note: Taking false branch
                   if (okmlen - i < HKDF_HASHLEN) {
                   ^
   fs/crypto/hkdf.c:165:8: note: Assuming 'err' is 0
                           if (err)
                               ^~~
   fs/crypto/hkdf.c:165:4: note: Taking false branch
                           if (err)
                           ^
   fs/crypto/hkdf.c:136:14: note: Assuming 'i' is < 'okmlen'
           for (i =3D 0; i < okmlen; i +=3D HKDF_HASHLEN) {
                       ^~~~~~~~~~
   fs/crypto/hkdf.c:136:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < okmlen; i +=3D HKDF_HASHLEN) {
           ^
   fs/crypto/hkdf.c:139:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/crypto/hkdf.c:139:3: note: Taking false branch
                   if (err)
                   ^
   fs/crypto/hkdf.c:142:7: note: Assuming 'prev' is null
                   if (prev) {
                       ^~~~
   fs/crypto/hkdf.c:142:3: note: Taking false branch
                   if (prev) {
                   ^
   fs/crypto/hkdf.c:149:7: note: Assuming 'err' is not equal to 0
                   if (err)
                       ^~~
   fs/crypto/hkdf.c:149:3: note: Taking true branch
                   if (err)
                   ^
   fs/crypto/hkdf.c:150:4: note: Control jumps to line 173
                           goto out;
                           ^
   fs/crypto/hkdf.c:173:15: note: 'err' is not equal to 0
           if (unlikely(err))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/crypto/hkdf.c:173:2: note: Taking true branch
           if (unlikely(err))
           ^
   fs/crypto/hkdf.c:174:20: note: Passing null pointer value via 1st parame=
ter 's'
                   memzero_explicit(okm, okmlen); /* so caller doesn't need=
 to */
                                    ^~~
   fs/crypto/hkdf.c:174:3: note: Calling 'memzero_explicit'
                   memzero_explicit(okm, okmlen); /* so caller doesn't need=
 to */
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/string.h:237:2: note: Null pointer passed as 1st argument =
to memory set function
           memset(s, 0, count);
           ^      ~
   Suppressed 6 warnings (6 in non-user code).
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
   11 warnings generated.
   fs/xfs/scrub/inode_repair.c:964:4: warning: Value stored to 'afork_min' =
is never read [clang-analyzer-deadcode.DeadStores]
                           afork_min =3D bmdr_minsz;
                           ^           ~~~~~~~~~~
   fs/xfs/scrub/inode_repair.c:964:4: note: Value stored to 'afork_min' is =
never read
                           afork_min =3D bmdr_minsz;
                           ^           ~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
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
   9 warnings generated.
   fs/xfs/scrub/repair.c:1749:3: warning: Value stored to 'dirty' is never =
read [clang-analyzer-deadcode.DeadStores]
                   dirty =3D false;
                   ^       ~~~~~
   fs/xfs/scrub/repair.c:1749:3: note: Value stored to 'dirty' is never read
                   dirty =3D false;
                   ^       ~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> fs/xfs/scrub/rmap_repair.c:1474:2: warning: Value stored to 'error' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           error =3D xfbtree_head_read_buf(rr->rmap_btree, NULL, &mhead_bp);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/rmap_repair.c:1474:2: note: Value stored to 'error' is neve=
r read
           error =3D xfbtree_head_read_buf(rr->rmap_btree, NULL, &mhead_bp);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/rmap_repair.c:1531:13: warning: Value stored to 'levels' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           uint8_t                 *levels =3D sc->sa.pag->pagf_levels;
                                    ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/rmap_repair.c:1531:13: note: Value stored to 'levels' durin=
g its initialization is never read
           uint8_t                 *levels =3D sc->sa.pag->pagf_levels;
                                    ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   6 warnings generated.
   fs/bfs/dir.c:228:2: warning: Value stored to 'error' is never read [clan=
g-analyzer-deadcode.DeadStores]
           error =3D -EPERM;
           ^       ~~~~~~
   fs/bfs/dir.c:228:2: note: Value stored to 'error' is never read
           error =3D -EPERM;
           ^       ~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/hfsplus/super.c:231:2: warning: Value stored to 'error2' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           error2 =3D hfsplus_submit_bio(sb,
           ^        ~~~~~~~~~~~~~~~~~~~~~~
   fs/hfsplus/super.c:231:2: note: Value stored to 'error2' is never read
           error2 =3D hfsplus_submit_bio(sb,
           ^        ~~~~~~~~~~~~~~~~~~~~~~
   fs/hfsplus/super.c:236:3: warning: Value stored to 'error2' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   error2 =3D error;
                   ^        ~~~~~
   fs/hfsplus/super.c:236:3: note: Value stored to 'error2' is never read
                   error2 =3D error;
                   ^        ~~~~~
   fs/hfsplus/super.c:570:5: warning: Value stored to 'err' is never read [=
clang-analyzer-deadcode.DeadStores]
                                   err =3D 0; /* Operation is not supported=
. */
                                   ^     ~
   fs/hfsplus/super.c:570:5: note: Value stored to 'err' is never read
                                   err =3D 0; /* Operation is not supported=
. */
                                   ^     ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/reiserfs/stree.c:1051:22: warning: Value stored to 'bh' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct buffer_head *bh =3D PATH_PLAST_BUFFER(path);
                               ^~
   fs/reiserfs/stree.c:1051:22: note: Value stored to 'bh' during its initi=
alization is never read
           struct buffer_head *bh =3D PATH_PLAST_BUFFER(path);
                               ^~
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
   14 warnings generated.
   fs/reiserfs/journal.c:264:3: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
                   list_del(next);
                   ^
   fs/reiserfs/journal.c:1975:9: note: Calling 'do_journal_release'
           return do_journal_release(th, sb, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/journal.c:1911:7: note: 'error' is 1
           if (!error && !sb_rdonly(sb)) {

vim +/error +1474 fs/xfs/scrub/rmap_repair.c

79e2564e37a58e Darrick J. Wong 2021-09-21  1449  =

45095d937eaae3 Darrick J. Wong 2021-09-01  1450  /*
45095d937eaae3 Darrick J. Wong 2021-09-01  1451   * Reap the old rmapbt blo=
cks.  Now that the rmapbt is fully rebuilt, we make
45095d937eaae3 Darrick J. Wong 2021-09-01  1452   * a list of gaps in the r=
map records and a list of the extents mentioned in
45095d937eaae3 Darrick J. Wong 2021-09-01  1453   * the bnobt.  Any block t=
hat's in the new rmapbt gap list but not mentioned
45095d937eaae3 Darrick J. Wong 2021-09-01  1454   * in the bnobt is a block=
 from the old rmapbt and can be removed.
45095d937eaae3 Darrick J. Wong 2021-09-01  1455   */
45095d937eaae3 Darrick J. Wong 2021-09-01  1456  STATIC int
45095d937eaae3 Darrick J. Wong 2021-09-01  1457  xrep_rmap_remove_old_tree(
45095d937eaae3 Darrick J. Wong 2021-09-01  1458  	struct xrep_rmap	*rr)
45095d937eaae3 Darrick J. Wong 2021-09-01  1459  {
79e2564e37a58e Darrick J. Wong 2021-09-21  1460  	struct xrep_rmap_find_gap=
s rfg;
45095d937eaae3 Darrick J. Wong 2021-09-01  1461  	struct xfs_scrub	*sc =3D =
rr->sc;
45095d937eaae3 Darrick J. Wong 2021-09-01  1462  	struct xfs_mount	*mp =3D =
sc->mp;
45095d937eaae3 Darrick J. Wong 2021-09-01  1463  	struct xfs_agf		*agf =3D =
sc->sa.agf_bp->b_addr;
45095d937eaae3 Darrick J. Wong 2021-09-01  1464  	struct xfs_btree_cur	*cur;
79e2564e37a58e Darrick J. Wong 2021-09-21  1465  	struct xfs_buf		*mhead_bp;
45095d937eaae3 Darrick J. Wong 2021-09-01  1466  	xfs_fsblock_t		agend_fsb;
45095d937eaae3 Darrick J. Wong 2021-09-01  1467  	int			error;
45095d937eaae3 Darrick J. Wong 2021-09-01  1468  =

79e2564e37a58e Darrick J. Wong 2021-09-21  1469  	xbitmap_init(&rfg.rmap_ga=
ps);
79e2564e37a58e Darrick J. Wong 2021-09-21  1470  	rfg.agno =3D sc->sa.pag->=
pag_agno;
79e2564e37a58e Darrick J. Wong 2021-09-21  1471  	rfg.next_fsb =3D XFS_AGB_=
TO_FSB(mp, sc->sa.pag->pag_agno, 0);
45095d937eaae3 Darrick J. Wong 2021-09-01  1472  =

45095d937eaae3 Darrick J. Wong 2021-09-01  1473  	/* Compute free space fro=
m the new rmapbt. */
79e2564e37a58e Darrick J. Wong 2021-09-21 @1474  	error =3D xfbtree_head_re=
ad_buf(rr->rmap_btree, NULL, &mhead_bp);
79e2564e37a58e Darrick J. Wong 2021-09-21  1475  	cur =3D xfs_rmapbt_mem_cu=
rsor(rr->sc->mp, NULL, mhead_bp,
79e2564e37a58e Darrick J. Wong 2021-09-21  1476  			rr->rmap_btree);
79e2564e37a58e Darrick J. Wong 2021-09-21  1477  	error =3D xfs_rmap_query_=
all(cur, xrep_rmap_find_gaps, &rfg);
79e2564e37a58e Darrick J. Wong 2021-09-21  1478  	xfs_btree_del_cursor(cur,=
 error);
79e2564e37a58e Darrick J. Wong 2021-09-21  1479  	xfs_buf_relse(mhead_bp);
45095d937eaae3 Darrick J. Wong 2021-09-01  1480  	if (error)
45095d937eaae3 Darrick J. Wong 2021-09-01  1481  		goto out_bitmap;
45095d937eaae3 Darrick J. Wong 2021-09-01  1482  =

45095d937eaae3 Darrick J. Wong 2021-09-01  1483  	/* Insert a record for sp=
ace between the last rmap and EOAG. */
45095d937eaae3 Darrick J. Wong 2021-09-01  1484  	agend_fsb =3D XFS_AGB_TO_=
FSB(mp, sc->sa.pag->pag_agno,
45095d937eaae3 Darrick J. Wong 2021-09-01  1485  			be32_to_cpu(agf->agf_le=
ngth));
79e2564e37a58e Darrick J. Wong 2021-09-21  1486  	if (rfg.next_fsb < agend_=
fsb) {
79e2564e37a58e Darrick J. Wong 2021-09-21  1487  		error =3D xbitmap_set(&r=
fg.rmap_gaps, rfg.next_fsb,
79e2564e37a58e Darrick J. Wong 2021-09-21  1488  				agend_fsb - rfg.next_f=
sb);
45095d937eaae3 Darrick J. Wong 2021-09-01  1489  		if (error)
45095d937eaae3 Darrick J. Wong 2021-09-01  1490  			goto out_bitmap;
45095d937eaae3 Darrick J. Wong 2021-09-01  1491  	}
45095d937eaae3 Darrick J. Wong 2021-09-01  1492  =

45095d937eaae3 Darrick J. Wong 2021-09-01  1493  	/* Compute free space fro=
m the existing bnobt. */
45095d937eaae3 Darrick J. Wong 2021-09-01  1494  	cur =3D xfs_allocbt_init_=
cursor(sc->mp, sc->tp, sc->sa.agf_bp,
45095d937eaae3 Darrick J. Wong 2021-09-01  1495  			sc->sa.pag, XFS_BTNUM_B=
NO);
79e2564e37a58e Darrick J. Wong 2021-09-21  1496  	error =3D xfs_alloc_query=
_all(cur, xrep_rmap_find_freesp, &rfg.rmap_gaps);
45095d937eaae3 Darrick J. Wong 2021-09-01  1497  	xfs_btree_del_cursor(cur,=
 error);
45095d937eaae3 Darrick J. Wong 2021-09-01  1498  	if (error)
45095d937eaae3 Darrick J. Wong 2021-09-01  1499  		goto out_bitmap;
45095d937eaae3 Darrick J. Wong 2021-09-01  1500  =

45095d937eaae3 Darrick J. Wong 2021-09-01  1501  	/*
45095d937eaae3 Darrick J. Wong 2021-09-01  1502  	 * Free the "free" blocks=
 that the new rmapbt knows about but the bnobt
45095d937eaae3 Darrick J. Wong 2021-09-01  1503  	 * doesn't--these are the=
 old rmapbt blocks.  Credit the old rmapbt
45095d937eaae3 Darrick J. Wong 2021-09-01  1504  	 * block usage count back=
 to the per-AG rmapbt reservation (and not
45095d937eaae3 Darrick J. Wong 2021-09-01  1505  	 * fdblocks, since the rm=
ap btree lives in free space) to keep the
45095d937eaae3 Darrick J. Wong 2021-09-01  1506  	 * reservation and free s=
pace accounting correct.
45095d937eaae3 Darrick J. Wong 2021-09-01  1507  	 */
79e2564e37a58e Darrick J. Wong 2021-09-21  1508  	error =3D xrep_reap_exten=
ts(sc, &rfg.rmap_gaps,
79e2564e37a58e Darrick J. Wong 2021-09-21  1509  			&XFS_RMAP_OINFO_ANY_OWN=
ER, XFS_AG_RESV_IGNORE);
45095d937eaae3 Darrick J. Wong 2021-09-01  1510  	if (error)
45095d937eaae3 Darrick J. Wong 2021-09-01  1511  		goto out_bitmap;
45095d937eaae3 Darrick J. Wong 2021-09-01  1512  	sc->sa.pag->pag_rmapbt_re=
sv.ar_reserved +=3D rr->old_rmapbt_fsbcount;
45095d937eaae3 Darrick J. Wong 2021-09-01  1513  =

45095d937eaae3 Darrick J. Wong 2021-09-01  1514  	/*
45095d937eaae3 Darrick J. Wong 2021-09-01  1515  	 * Now that we've invalid=
ated the old blocks, set the incore btree
45095d937eaae3 Darrick J. Wong 2021-09-01  1516  	 * height to the new leve=
l and reset the block reservation.
45095d937eaae3 Darrick J. Wong 2021-09-01  1517  	 */
45095d937eaae3 Darrick J. Wong 2021-09-01  1518  	sc->flags |=3D XREP_RESET=
_PERAG_RESV;
45095d937eaae3 Darrick J. Wong 2021-09-01  1519  	sc->sa.pag->pagf_levels[X=
FS_BTNUM_RMAPi] =3D rr->rmap_bload.btree_height;
45095d937eaae3 Darrick J. Wong 2021-09-01  1520  out_bitmap:
79e2564e37a58e Darrick J. Wong 2021-09-21  1521  	xbitmap_destroy(&rfg.rmap=
_gaps);
45095d937eaae3 Darrick J. Wong 2021-09-01  1522  	return error;
45095d937eaae3 Darrick J. Wong 2021-09-01  1523  }
45095d937eaae3 Darrick J. Wong 2021-09-01  1524  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0156804020826694308==--

