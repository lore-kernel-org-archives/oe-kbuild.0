Content-Type: multipart/mixed; boundary="===============0220152173894320686=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:reserve-rt-metadata-space 37/173] fs/xfs/scrub/quotacheck_repair.c:246:9: warning: Identical condition 'error', second condition is always false
Date: Mon, 30 Nov 2020 21:54:50 +0800
Message-ID: <202011302147.0T9ZrudG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0220152173894320686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t reserve-rt-metadata-space
head:   a32adbd64a86719b62b97d2b26917850dc374779
commit: fae3e09a8467e1a03c227f7f69590013f8fca75a [37/173] xfs: repair dquot=
s based on live quotacheck results
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> fs/xfs/scrub/repair.c:248:6: warning: Uninitialized variable: freelen [u=
ninitvar]
        freelen >=3D aglen) {
        ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/xfs_qm_syscalls.c:748:9: warning: Identical condition 'error', se=
cond condition is always false [identicalConditionAfterEarlyExit]
    return error;
           ^
   fs/xfs/xfs_qm_syscalls.c:739:6: note: first condition
    if (error)
        ^
   fs/xfs/xfs_qm_syscalls.c:748:9: note: second condition
    return error;
           ^
>> fs/xfs/scrub/quotacheck_repair.c:246:9: warning: Identical condition 'er=
ror', second condition is always false [identicalConditionAfterEarlyExit]
    return error;
           ^
   fs/xfs/scrub/quotacheck_repair.c:237:6: note: first condition
    if (error)
        ^
   fs/xfs/scrub/quotacheck_repair.c:246:9: note: second condition
    return error;
           ^
--

vim +/error +246 fs/xfs/scrub/quotacheck_repair.c

fae3e09a8467e1a Darrick J. Wong 2020-10-25  191  =

fae3e09a8467e1a Darrick J. Wong 2020-10-25  192  /* Commit the new dquot co=
unters. */
fae3e09a8467e1a Darrick J. Wong 2020-10-25  193  int
fae3e09a8467e1a Darrick J. Wong 2020-10-25  194  xrep_quotacheck(
fae3e09a8467e1a Darrick J. Wong 2020-10-25  195  	struct xfs_scrub	*sc)
fae3e09a8467e1a Darrick J. Wong 2020-10-25  196  {
fae3e09a8467e1a Darrick J. Wong 2020-10-25  197  	struct xqcheck		*xqc =3D =
sc->buf;
fae3e09a8467e1a Darrick J. Wong 2020-10-25  198  	unsigned int		qflags =3D =
xqcheck_chkd_flags(sc->mp);
fae3e09a8467e1a Darrick J. Wong 2020-10-25  199  	int			error;
fae3e09a8467e1a Darrick J. Wong 2020-10-25  200  =

fae3e09a8467e1a Darrick J. Wong 2020-10-25  201  	/*
fae3e09a8467e1a Darrick J. Wong 2020-10-25  202  	 * Clear the CHKD flag fo=
r this quota type and commit the scrub
fae3e09a8467e1a Darrick J. Wong 2020-10-25  203  	 * transaction so that we=
 can allocate new quota block mappings if we
fae3e09a8467e1a Darrick J. Wong 2020-10-25  204  	 * have to.  If we crash =
after this point, the sb still has the CHKD
fae3e09a8467e1a Darrick J. Wong 2020-10-25  205  	 * flags cleared, so moun=
t quotacheck will fix all of this up.
fae3e09a8467e1a Darrick J. Wong 2020-10-25  206  	 */
fae3e09a8467e1a Darrick J. Wong 2020-10-25  207  	spin_lock(&sc->mp->m_sb_l=
ock);
fae3e09a8467e1a Darrick J. Wong 2020-10-25  208  	sc->mp->m_qflags &=3D ~qf=
lags;
fae3e09a8467e1a Darrick J. Wong 2020-10-25  209  	sc->mp->m_sb.sb_qflags &=
=3D ~qflags;
fae3e09a8467e1a Darrick J. Wong 2020-10-25  210  	spin_unlock(&sc->mp->m_sb=
_lock);
fae3e09a8467e1a Darrick J. Wong 2020-10-25  211  	xfs_log_sb(sc->tp);
fae3e09a8467e1a Darrick J. Wong 2020-10-25  212  =

fae3e09a8467e1a Darrick J. Wong 2020-10-25  213  	error =3D xfs_trans_commi=
t(sc->tp);
fae3e09a8467e1a Darrick J. Wong 2020-10-25  214  	sc->tp =3D NULL;
fae3e09a8467e1a Darrick J. Wong 2020-10-25  215  	if (error)
fae3e09a8467e1a Darrick J. Wong 2020-10-25  216  		return error;
fae3e09a8467e1a Darrick J. Wong 2020-10-25  217  =

fae3e09a8467e1a Darrick J. Wong 2020-10-25  218  	/* Commit the new counter=
s to the dquots. */
fae3e09a8467e1a Darrick J. Wong 2020-10-25  219  	if (xqc->ucounts) {
fae3e09a8467e1a Darrick J. Wong 2020-10-25  220  		error =3D xqcheck_commit=
_dqtype(xqc, XFS_DQTYPE_USER);
fae3e09a8467e1a Darrick J. Wong 2020-10-25  221  		if (error)
fae3e09a8467e1a Darrick J. Wong 2020-10-25  222  			return error;
fae3e09a8467e1a Darrick J. Wong 2020-10-25  223  	}
fae3e09a8467e1a Darrick J. Wong 2020-10-25  224  	if (xqc->gcounts) {
fae3e09a8467e1a Darrick J. Wong 2020-10-25  225  		error =3D xqcheck_commit=
_dqtype(xqc, XFS_DQTYPE_GROUP);
fae3e09a8467e1a Darrick J. Wong 2020-10-25  226  		if (error)
fae3e09a8467e1a Darrick J. Wong 2020-10-25  227  			return error;
fae3e09a8467e1a Darrick J. Wong 2020-10-25  228  	}
fae3e09a8467e1a Darrick J. Wong 2020-10-25  229  	if (xqc->pcounts) {
fae3e09a8467e1a Darrick J. Wong 2020-10-25  230  		error =3D xqcheck_commit=
_dqtype(xqc, XFS_DQTYPE_PROJ);
fae3e09a8467e1a Darrick J. Wong 2020-10-25  231  		if (error)
fae3e09a8467e1a Darrick J. Wong 2020-10-25  232  			return error;
fae3e09a8467e1a Darrick J. Wong 2020-10-25  233  	}
fae3e09a8467e1a Darrick J. Wong 2020-10-25  234  =

fae3e09a8467e1a Darrick J. Wong 2020-10-25  235  	/* Reinstate CHKD flags. =
*/
fae3e09a8467e1a Darrick J. Wong 2020-10-25  236  	error =3D xchk_trans_allo=
c(sc, 0);
fae3e09a8467e1a Darrick J. Wong 2020-10-25  237  	if (error)
fae3e09a8467e1a Darrick J. Wong 2020-10-25  238  		return error;
fae3e09a8467e1a Darrick J. Wong 2020-10-25  239  =

fae3e09a8467e1a Darrick J. Wong 2020-10-25  240  	spin_lock(&sc->mp->m_sb_l=
ock);
fae3e09a8467e1a Darrick J. Wong 2020-10-25  241  	sc->mp->m_qflags |=3D qfl=
ags;
fae3e09a8467e1a Darrick J. Wong 2020-10-25  242  	sc->mp->m_sb.sb_qflags |=
=3D qflags;
fae3e09a8467e1a Darrick J. Wong 2020-10-25  243  	spin_unlock(&sc->mp->m_sb=
_lock);
fae3e09a8467e1a Darrick J. Wong 2020-10-25  244  	xfs_log_sb(sc->tp);
fae3e09a8467e1a Darrick J. Wong 2020-10-25  245  =

fae3e09a8467e1a Darrick J. Wong 2020-10-25 @246  	return error;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0220152173894320686==--

