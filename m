Content-Type: multipart/mixed; boundary="===============0055626061774447059=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 139/396] fs/xfs/scrub/quotacheck.c:179:20: warning: Parameter 'dqp' can be declared with const [constParameter]
Date: Fri, 15 Apr 2022 16:44:24 +0800
Message-ID: <202204151616.0TewXg6y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0055626061774447059==
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
commit: 1893019c9b24187f47053b87430b6340b0d5a6e5 [139/396] xfs: track quota=
 updates during live quotacheck
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: csky-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 1893019c9b24187f47053b87430b6340b0d5a6e5
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/scrub/refcount.c:179:13: warning: Uninitialized variable: frag->r=
m [uninitvar]
     if (frag->rm.rm_startblock < bno)
               ^
   fs/xfs/scrub/refcount.c:162:16: note: Assuming condition is false
    if (target_nr =3D=3D 0)
                  ^
   fs/xfs/scrub/refcount.c:179:13: note: Uninitialized variable: frag->rm
     if (frag->rm.rm_startblock < bno)
               ^
--
>> fs/xfs/scrub/quotacheck.c:179:20: warning: Parameter 'dqp' can be declar=
ed with const [constParameter]
    struct xfs_dquot *dqp)
                      ^

vim +/dqp +179 fs/xfs/scrub/quotacheck.c

1893019c9b2418 Darrick J. Wong 2022-01-06  174  =

1893019c9b2418 Darrick J. Wong 2022-01-06  175  /* Find a shadow dqtrx slot=
 for the given dquot. */
1893019c9b2418 Darrick J. Wong 2022-01-06  176  STATIC struct xqcheck_dqtrx=
 *
1893019c9b2418 Darrick J. Wong 2022-01-06  177  xqcheck_get_dqtrx(
1893019c9b2418 Darrick J. Wong 2022-01-06  178  	struct xqcheck_dqacct	*dqa,
1893019c9b2418 Darrick J. Wong 2022-01-06 @179  	struct xfs_dquot	*dqp)
1893019c9b2418 Darrick J. Wong 2022-01-06  180  {
1893019c9b2418 Darrick J. Wong 2022-01-06  181  	int			i;
1893019c9b2418 Darrick J. Wong 2022-01-06  182  =

1893019c9b2418 Darrick J. Wong 2022-01-06  183  	for (i =3D 0; i < XQCHECK_=
MAX_NR_DQTRXS; i++) {
1893019c9b2418 Darrick J. Wong 2022-01-06  184  		if (dqa->dqtrx[i].dqp =3D=
=3D NULL ||
1893019c9b2418 Darrick J. Wong 2022-01-06  185  		    dqa->dqtrx[i].dqp =3D=
=3D dqp)
1893019c9b2418 Darrick J. Wong 2022-01-06  186  			return &dqa->dqtrx[i];
1893019c9b2418 Darrick J. Wong 2022-01-06  187  	}
1893019c9b2418 Darrick J. Wong 2022-01-06  188  =

1893019c9b2418 Darrick J. Wong 2022-01-06  189  	return NULL;
1893019c9b2418 Darrick J. Wong 2022-01-06  190  }
1893019c9b2418 Darrick J. Wong 2022-01-06  191  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0055626061774447059==--

