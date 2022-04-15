Content-Type: multipart/mixed; boundary="===============6316180265607239109=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 345/396] fs/xfs/libxfs/xfs_refcount.c:1215:20: warning: Parameter 'pag' can be declared with const [constParameter]
Date: Fri, 15 Apr 2022 13:30:23 +0800
Message-ID: <202204151346.Ddr23ZrE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6316180265607239109==
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
head:   bd756ef7af68274b79308166ee64949d288be861
commit: df341ad02c3a71b5884f2639b1c52dda76698566 [345/396] xfs: add a realt=
ime flag to the refcount update log redo items
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout df341ad02c3a71b5884f2639b1c52dda76698566
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/libxfs/xfs_refcount.c:1215:20: warning: Parameter 'pag' can be de=
clared with const [constParameter]
    struct xfs_perag *pag)
                      ^
--
>> fs/xfs/libxfs/xfs_rmap.c:2600:20: warning: Parameter 'pag' can be declar=
ed with const [constParameter]
    struct xfs_perag *pag)
                      ^
>> fs/xfs/libxfs/xfs_rmap.c:2721:25: warning: Parameter 'bmap' can be decla=
red with const [constParameter]
    struct xfs_bmbt_irec  *bmap)
                           ^

vim +/pag +1215 fs/xfs/libxfs/xfs_refcount.c

33ba6129208475 Darrick J. Wong 2016-10-03  1210  =

df341ad02c3a71 Darrick J. Wong 2022-01-06  1211  /* Does this btree cursor =
match the given AG? */
df341ad02c3a71 Darrick J. Wong 2022-01-06  1212  static inline bool
df341ad02c3a71 Darrick J. Wong 2022-01-06  1213  xfs_refcount_is_wrong_curs=
or(
df341ad02c3a71 Darrick J. Wong 2022-01-06  1214  	struct xfs_btree_cur	*cur,
df341ad02c3a71 Darrick J. Wong 2022-01-06 @1215  	struct xfs_perag	*pag)
df341ad02c3a71 Darrick J. Wong 2022-01-06  1216  {
df341ad02c3a71 Darrick J. Wong 2022-01-06  1217  	if (!pag) {
df341ad02c3a71 Darrick J. Wong 2022-01-06  1218  		/* finishing a realtime =
refcount */
df341ad02c3a71 Darrick J. Wong 2022-01-06  1219  		return cur->bc_btnum !=
=3D XFS_BTNUM_RTREFC;
df341ad02c3a71 Darrick J. Wong 2022-01-06  1220  	}
df341ad02c3a71 Darrick J. Wong 2022-01-06  1221  =

df341ad02c3a71 Darrick J. Wong 2022-01-06  1222  	return cur->bc_ag.pag !=
=3D pag;
df341ad02c3a71 Darrick J. Wong 2022-01-06  1223  }
df341ad02c3a71 Darrick J. Wong 2022-01-06  1224  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6316180265607239109==--

