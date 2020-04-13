Content-Type: multipart/mixed; boundary="===============4869385884307315776=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [djwong-xfs:refactor-log-recovery 233/314] fs/xfs/scrub/inode.c:194:45: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Mon, 13 Apr 2020 11:50:26 +0800
Message-ID: <202004131121.glRzfTKD%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4869385884307315776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t refactor-log-recovery
head:   2dcdc305cfc2b8b1beee483cf8ae5c674d9fac86
commit: ccad049adcaa8ba2f2e35509d69b5e577d616b5a [233/314] xfs: widen ondis=
k timestamps to deal with y2038 problem
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/xfs/scrub/inode.c:194:45: warning: Boolean result is used in bitwise =
operation. Clarify expression with parentheses. [clarifyCondition]
    if (!!xfs_sb_version_hasbigtime(&mp->m_sb) ^
                                               ^

# https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/comm=
it/?id=3Dccad049adcaa8ba2f2e35509d69b5e577d616b5a
git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/d=
jwong/xfs-linux.git
git remote update djwong-xfs
git checkout ccad049adcaa8ba2f2e35509d69b5e577d616b5a
vim +194 fs/xfs/scrub/inode.c

80e4e12688029e Darrick J. Wong 2017-10-17  153  =

80e4e12688029e Darrick J. Wong 2017-10-17  154  /* Make sure the di_flags2 =
make sense for the inode. */
80e4e12688029e Darrick J. Wong 2017-10-17  155  STATIC void
c517b3aa02cff1 Darrick J. Wong 2018-07-19  156  xchk_inode_flags2(
1d8a748a8aa94a Darrick J. Wong 2018-07-19  157  	struct xfs_scrub	*sc,
80e4e12688029e Darrick J. Wong 2017-10-17  158  	struct xfs_dinode	*dip,
80e4e12688029e Darrick J. Wong 2017-10-17  159  	xfs_ino_t		ino,
80e4e12688029e Darrick J. Wong 2017-10-17  160  	uint16_t		mode,
80e4e12688029e Darrick J. Wong 2017-10-17  161  	uint16_t		flags,
80e4e12688029e Darrick J. Wong 2017-10-17  162  	uint64_t		flags2)
80e4e12688029e Darrick J. Wong 2017-10-17  163  {
80e4e12688029e Darrick J. Wong 2017-10-17  164  	struct xfs_mount	*mp =3D s=
c->mp;
80e4e12688029e Darrick J. Wong 2017-10-17  165  =

f369a13cead821 Eric Sandeen    2018-09-29  166  	/* Unknown di_flags2 could=
 be from a future kernel */
80e4e12688029e Darrick J. Wong 2017-10-17  167  	if (flags2 & ~XFS_DIFLAG2_=
ANY)
f369a13cead821 Eric Sandeen    2018-09-29  168  		xchk_ino_set_warning(sc, =
ino);
80e4e12688029e Darrick J. Wong 2017-10-17  169  =

80e4e12688029e Darrick J. Wong 2017-10-17  170  	/* reflink flag requires r=
eflink feature */
80e4e12688029e Darrick J. Wong 2017-10-17  171  	if ((flags2 & XFS_DIFLAG2_=
REFLINK) &&
80e4e12688029e Darrick J. Wong 2017-10-17  172  	    !xfs_sb_version_hasref=
link(&mp->m_sb))
80e4e12688029e Darrick J. Wong 2017-10-17  173  		goto bad;
80e4e12688029e Darrick J. Wong 2017-10-17  174  =

80e4e12688029e Darrick J. Wong 2017-10-17  175  	/* cowextsize flag is chec=
ked w.r.t. mode separately */
80e4e12688029e Darrick J. Wong 2017-10-17  176  =

80e4e12688029e Darrick J. Wong 2017-10-17  177  	/* file/dir-only flags */
80e4e12688029e Darrick J. Wong 2017-10-17  178  	if ((flags2 & XFS_DIFLAG2_=
DAX) && !(S_ISREG(mode) || S_ISDIR(mode)))
80e4e12688029e Darrick J. Wong 2017-10-17  179  		goto bad;
80e4e12688029e Darrick J. Wong 2017-10-17  180  =

80e4e12688029e Darrick J. Wong 2017-10-17  181  	/* file-only flags */
80e4e12688029e Darrick J. Wong 2017-10-17  182  	if ((flags2 & XFS_DIFLAG2_=
REFLINK) && !S_ISREG(mode))
80e4e12688029e Darrick J. Wong 2017-10-17  183  		goto bad;
80e4e12688029e Darrick J. Wong 2017-10-17  184  =

80e4e12688029e Darrick J. Wong 2017-10-17  185  	/* realtime and reflink ma=
ke no sense, currently */
80e4e12688029e Darrick J. Wong 2017-10-17  186  	if ((flags & XFS_DIFLAG_RE=
ALTIME) && (flags2 & XFS_DIFLAG2_REFLINK))
80e4e12688029e Darrick J. Wong 2017-10-17  187  		goto bad;
80e4e12688029e Darrick J. Wong 2017-10-17  188  =

80e4e12688029e Darrick J. Wong 2017-10-17  189  	/* dax and reflink make no=
 sense, currently */
80e4e12688029e Darrick J. Wong 2017-10-17  190  	if ((flags2 & XFS_DIFLAG2_=
DAX) && (flags2 & XFS_DIFLAG2_REFLINK))
80e4e12688029e Darrick J. Wong 2017-10-17  191  		goto bad;
80e4e12688029e Darrick J. Wong 2017-10-17  192  =

ccad049adcaa8b Darrick J. Wong 2020-02-19  193  	/* the incore bigtime ifla=
g always follows the feature flag */
ccad049adcaa8b Darrick J. Wong 2020-02-19 @194  	if (!!xfs_sb_version_hasbi=
gtime(&mp->m_sb) ^
ccad049adcaa8b Darrick J. Wong 2020-02-19  195  	    !!(flags2 & XFS_DIFLAG=
2_BIGTIME))
ccad049adcaa8b Darrick J. Wong 2020-02-19  196  		goto bad;
ccad049adcaa8b Darrick J. Wong 2020-02-19  197  =

80e4e12688029e Darrick J. Wong 2017-10-17  198  	return;
80e4e12688029e Darrick J. Wong 2017-10-17  199  bad:
c517b3aa02cff1 Darrick J. Wong 2018-07-19  200  	xchk_ino_set_corrupt(sc, i=
no);
80e4e12688029e Darrick J. Wong 2017-10-17  201  }
80e4e12688029e Darrick J. Wong 2017-10-17  202  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4869385884307315776==--

