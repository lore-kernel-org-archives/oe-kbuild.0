Content-Type: multipart/mixed; boundary="===============7459300230389305567=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 293/399] fs/xfs/libxfs/xfs_rmap.c:2609:25: warning: Parameter 'bmap' can be declared with const [constParameter]
Date: Sat, 30 Apr 2022 17:05:11 +0800
Message-ID: <202204301621.7OqdD7hA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7459300230389305567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   afeb4fa123e9a46cb653baab2baa3259c051f7d7
commit: 502ebc43eaea6e55ac3e1f3b97e10cb0c1c2d655 [293/399] xfs: clean up rm=
ap log intent item tracepoint callsites
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
compiler: mips64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 502ebc43eaea6e55ac3e1f3b97e10cb0c1c2d655
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/libxfs/xfs_rmap.c:2609:25: warning: Parameter 'bmap' can be decla=
red with const [constParameter]
    struct xfs_bmbt_irec  *bmap)
                           ^

vim +/bmap +2609 fs/xfs/libxfs/xfs_rmap.c

9c19464469556a Darrick J. Wong 2016-08-03  2598  =

9c19464469556a Darrick J. Wong 2016-08-03  2599  /*
9c19464469556a Darrick J. Wong 2016-08-03  2600   * Record a rmap intent; t=
he list is kept sorted first by AG and then by
9c19464469556a Darrick J. Wong 2016-08-03  2601   * increasing age.
9c19464469556a Darrick J. Wong 2016-08-03  2602   */
bc46ac64713f11 Darrick J. Wong 2019-08-26  2603  static void
9c19464469556a Darrick J. Wong 2016-08-03  2604  __xfs_rmap_add(
0f37d1780c3d86 Brian Foster    2018-08-01  2605  	struct xfs_trans		*tp,
9c19464469556a Darrick J. Wong 2016-08-03  2606  	enum xfs_rmap_intent_type=
	type,
c8ce540db5f67d Darrick J. Wong 2017-06-16  2607  	uint64_t			owner,
9c19464469556a Darrick J. Wong 2016-08-03  2608  	int				whichfork,
9c19464469556a Darrick J. Wong 2016-08-03 @2609  	struct xfs_bmbt_irec		*bm=
ap)
9c19464469556a Darrick J. Wong 2016-08-03  2610  {
9c19464469556a Darrick J. Wong 2016-08-03  2611  	struct xfs_rmap_intent		*=
ri;
9c19464469556a Darrick J. Wong 2016-08-03  2612  =

f3c799c22c661e Darrick J. Wong 2021-10-12  2613  	ri =3D kmem_cache_alloc(x=
fs_rmap_intent_cache, GFP_NOFS | __GFP_NOFAIL);
9c19464469556a Darrick J. Wong 2016-08-03  2614  	INIT_LIST_HEAD(&ri->ri_li=
st);
9c19464469556a Darrick J. Wong 2016-08-03  2615  	ri->ri_type =3D type;
9c19464469556a Darrick J. Wong 2016-08-03  2616  	ri->ri_owner =3D owner;
9c19464469556a Darrick J. Wong 2016-08-03  2617  	ri->ri_whichfork =3D whic=
hfork;
9c19464469556a Darrick J. Wong 2016-08-03  2618  	ri->ri_bmap =3D *bmap;
9c19464469556a Darrick J. Wong 2016-08-03  2619  =

502ebc43eaea6e Darrick J. Wong 2022-01-06  2620  	trace_xfs_rmap_defer(tp->=
t_mountp, ri);
0f37d1780c3d86 Brian Foster    2018-08-01  2621  	xfs_defer_add(tp, XFS_DEF=
ER_OPS_TYPE_RMAP, &ri->ri_list);
9c19464469556a Darrick J. Wong 2016-08-03  2622  }
9c19464469556a Darrick J. Wong 2016-08-03  2623  =


:::::: The code at line 2609 was first introduced by commit
:::::: 9c19464469556a0cd342fc40a24926ab46d7d243 xfs: propagate bmap updates=
 to rmapbt

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Dave Chinner <david@fromorbit.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7459300230389305567==--

