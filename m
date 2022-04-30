Content-Type: multipart/mixed; boundary="===============6706118897361481702=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 309/399] fs/xfs/libxfs/xfs_rmap.c:2558:20: warning: Parameter 'pag' can be declared with const [constParameter]
Date: Sat, 30 Apr 2022 18:15:59 +0800
Message-ID: <202204301807.CUScBHEg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6706118897361481702==
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
commit: 0c235943d6a275a48ce6fbe16f6b43ad60058869 [309/399] xfs: wire up rma=
p map and unmap to the realtime rmapbt
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: mips64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 0c235943d6a275a48ce6fbe16f6b43ad60058869
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/libxfs/xfs_rmap.c:2558:20: warning: Parameter 'pag' can be declar=
ed with const [constParameter]
    struct xfs_perag *pag)
                      ^
   fs/xfs/libxfs/xfs_rmap.c:2679:25: warning: Parameter 'bmap' can be decla=
red with const [constParameter]
    struct xfs_bmbt_irec  *bmap)
                           ^

vim +/pag +2558 fs/xfs/libxfs/xfs_rmap.c

0d82b5c4a91112 Darrick J. Wong 2022-01-06  2553  =

0c235943d6a275 Darrick J. Wong 2022-01-06  2554  /* Does this btree cursor =
match the given AG? */
0c235943d6a275 Darrick J. Wong 2022-01-06  2555  static inline bool
0c235943d6a275 Darrick J. Wong 2022-01-06  2556  xfs_rmap_is_wrong_cursor(
0c235943d6a275 Darrick J. Wong 2022-01-06  2557  	struct xfs_btree_cur	*cur,
0c235943d6a275 Darrick J. Wong 2022-01-06 @2558  	struct xfs_perag	*pag)
0c235943d6a275 Darrick J. Wong 2022-01-06  2559  {
0c235943d6a275 Darrick J. Wong 2022-01-06  2560  	if (!pag) {
0c235943d6a275 Darrick J. Wong 2022-01-06  2561  		/* finishing a realtime =
rmap */
0c235943d6a275 Darrick J. Wong 2022-01-06  2562  		return cur->bc_btnum !=
=3D XFS_BTNUM_RTRMAP;
0c235943d6a275 Darrick J. Wong 2022-01-06  2563  	}
0c235943d6a275 Darrick J. Wong 2022-01-06  2564  =

0c235943d6a275 Darrick J. Wong 2022-01-06  2565  	return cur->bc_ag.pag !=
=3D pag;
0c235943d6a275 Darrick J. Wong 2022-01-06  2566  }
0c235943d6a275 Darrick J. Wong 2022-01-06  2567  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6706118897361481702==--

