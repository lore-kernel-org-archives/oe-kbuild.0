Content-Type: multipart/mixed; boundary="===============2609164885182256548=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 160/352] fs/xfs/libxfs/xfs_swapext.c:583:3: warning: Consecutive return, break, continue, goto or throw statements are unnecessary. [duplicateBreak]
Date: Sat, 03 Jul 2021 12:44:56 +0800
Message-ID: <202107031253.Db46LdxR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2609164885182256548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   9716b2732a485c80e6988c5bdf42bd53d337773f
commit: d4a3606ea177960033d82095fa14b063bd9d8363 [160/352] xfs: create defe=
rred log items for extent swapping
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/xfs/libxfs/xfs_swapext.c:
   fs/xfs/libxfs/xfs_format.h:327:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_ATTRBIT);
    ^
   fs/xfs/libxfs/xfs_format.h:337:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_QUOTABIT);
    ^
   fs/xfs/libxfs/xfs_format.h:353:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_DALIGNBIT);
    ^
   fs/xfs/libxfs/xfs_format.h:364:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_SECTORBIT);
    ^
   fs/xfs/libxfs/xfs_format.h:369:2: warning: Non-boolean value returned fr=
om function returning bool [returnNonBoolInBooleanFunction]
    return (sbp->sb_versionnum & XFS_SB_VERSION_BORGBIT);
    ^
>> fs/xfs/libxfs/xfs_swapext.c:583:3: warning: Consecutive return, break, c=
ontinue, goto or throw statements are unnecessary. [duplicateBreak]
     break;
     ^

vim +583 fs/xfs/libxfs/xfs_swapext.c

d4a3606ea17796 Darrick J. Wong 2021-01-05  508  =

d4a3606ea17796 Darrick J. Wong 2021-01-05  509  /* Estimate the effect of a=
 single swap on extent count. */
d4a3606ea17796 Darrick J. Wong 2021-01-05  510  static inline int
d4a3606ea17796 Darrick J. Wong 2021-01-05  511  delta_nextents_step(
d4a3606ea17796 Darrick J. Wong 2021-01-05  512  	struct xfs_mount		*mp,
d4a3606ea17796 Darrick J. Wong 2021-01-05  513  	const struct xfs_bmbt_irec=
	*left,
d4a3606ea17796 Darrick J. Wong 2021-01-05  514  	const struct xfs_bmbt_irec=
	*curr,
d4a3606ea17796 Darrick J. Wong 2021-01-05  515  	const struct xfs_bmbt_irec=
	*new,
d4a3606ea17796 Darrick J. Wong 2021-01-05  516  	const struct xfs_bmbt_irec=
	*right)
d4a3606ea17796 Darrick J. Wong 2021-01-05  517  {
d4a3606ea17796 Darrick J. Wong 2021-01-05  518  	bool				lhole, rhole, chol=
e, nhole;
d4a3606ea17796 Darrick J. Wong 2021-01-05  519  	unsigned int			state =3D 0;
d4a3606ea17796 Darrick J. Wong 2021-01-05  520  	int				ret =3D 0;
d4a3606ea17796 Darrick J. Wong 2021-01-05  521  =

d4a3606ea17796 Darrick J. Wong 2021-01-05  522  	lhole =3D left->br_blockco=
unt =3D=3D 0 ||
d4a3606ea17796 Darrick J. Wong 2021-01-05  523  		left->br_startblock =3D=
=3D HOLESTARTBLOCK;
d4a3606ea17796 Darrick J. Wong 2021-01-05  524  	rhole =3D right->br_blockc=
ount =3D=3D 0 ||
d4a3606ea17796 Darrick J. Wong 2021-01-05  525  		right->br_startblock =3D=
=3D HOLESTARTBLOCK;
d4a3606ea17796 Darrick J. Wong 2021-01-05  526  	chole =3D curr->br_startbl=
ock =3D=3D HOLESTARTBLOCK;
d4a3606ea17796 Darrick J. Wong 2021-01-05  527  	nhole =3D new->br_startblo=
ck =3D=3D HOLESTARTBLOCK;
d4a3606ea17796 Darrick J. Wong 2021-01-05  528  =

d4a3606ea17796 Darrick J. Wong 2021-01-05  529  	if (chole)
d4a3606ea17796 Darrick J. Wong 2021-01-05  530  		state |=3D CHOLE;
d4a3606ea17796 Darrick J. Wong 2021-01-05  531  	if (!lhole && !chole && ca=
n_merge(left, curr))
d4a3606ea17796 Darrick J. Wong 2021-01-05  532  		state |=3D CLEFT_CONTIG;
d4a3606ea17796 Darrick J. Wong 2021-01-05  533  	if (!rhole && !chole && ca=
n_merge(curr, right))
d4a3606ea17796 Darrick J. Wong 2021-01-05  534  		state |=3D CRIGHT_CONTIG;
d4a3606ea17796 Darrick J. Wong 2021-01-05  535  	if ((state & CBOTH_CONTIG)=
 =3D=3D CBOTH_CONTIG &&
d4a3606ea17796 Darrick J. Wong 2021-01-05  536  	    left->br_startblock + =
curr->br_startblock +
d4a3606ea17796 Darrick J. Wong 2021-01-05  537  					right->br_startblock >=
 MAXEXTLEN)
d4a3606ea17796 Darrick J. Wong 2021-01-05  538  		state &=3D ~CRIGHT_CONTIG;
d4a3606ea17796 Darrick J. Wong 2021-01-05  539  =

d4a3606ea17796 Darrick J. Wong 2021-01-05  540  	if (nhole)
d4a3606ea17796 Darrick J. Wong 2021-01-05  541  		state |=3D NHOLE;
d4a3606ea17796 Darrick J. Wong 2021-01-05  542  	if (!lhole && !nhole && ca=
n_merge(left, new))
d4a3606ea17796 Darrick J. Wong 2021-01-05  543  		state |=3D NLEFT_CONTIG;
d4a3606ea17796 Darrick J. Wong 2021-01-05  544  	if (!rhole && !nhole && ca=
n_merge(new, right))
d4a3606ea17796 Darrick J. Wong 2021-01-05  545  		state |=3D NRIGHT_CONTIG;
d4a3606ea17796 Darrick J. Wong 2021-01-05  546  	if ((state & NBOTH_CONTIG)=
 =3D=3D NBOTH_CONTIG &&
d4a3606ea17796 Darrick J. Wong 2021-01-05  547  	    left->br_startblock + =
new->br_startblock +
d4a3606ea17796 Darrick J. Wong 2021-01-05  548  					right->br_startblock >=
 MAXEXTLEN)
d4a3606ea17796 Darrick J. Wong 2021-01-05  549  		state &=3D ~NRIGHT_CONTIG;
d4a3606ea17796 Darrick J. Wong 2021-01-05  550  =

d4a3606ea17796 Darrick J. Wong 2021-01-05  551  	switch (state & (CLEFT_CON=
TIG | CRIGHT_CONTIG | CHOLE)) {
d4a3606ea17796 Darrick J. Wong 2021-01-05  552  	case CLEFT_CONTIG | CRIGHT=
_CONTIG:
d4a3606ea17796 Darrick J. Wong 2021-01-05  553  		/*
d4a3606ea17796 Darrick J. Wong 2021-01-05  554  		 * left/curr/right are th=
e same extent, so deleting curr causes
d4a3606ea17796 Darrick J. Wong 2021-01-05  555  		 * 2 new extents to be cr=
eated.
d4a3606ea17796 Darrick J. Wong 2021-01-05  556  		 */
d4a3606ea17796 Darrick J. Wong 2021-01-05  557  		ret +=3D 2;
d4a3606ea17796 Darrick J. Wong 2021-01-05  558  		break;
d4a3606ea17796 Darrick J. Wong 2021-01-05  559  	case 0:
d4a3606ea17796 Darrick J. Wong 2021-01-05  560  		/*
d4a3606ea17796 Darrick J. Wong 2021-01-05  561  		 * curr is not contiguous=
 with any extent, so we remove curr
d4a3606ea17796 Darrick J. Wong 2021-01-05  562  		 * completely
d4a3606ea17796 Darrick J. Wong 2021-01-05  563  		 */
d4a3606ea17796 Darrick J. Wong 2021-01-05  564  		ret--;
d4a3606ea17796 Darrick J. Wong 2021-01-05  565  		break;
d4a3606ea17796 Darrick J. Wong 2021-01-05  566  	case CHOLE:
d4a3606ea17796 Darrick J. Wong 2021-01-05  567  		/* hole, do nothing */
d4a3606ea17796 Darrick J. Wong 2021-01-05  568  		break;
d4a3606ea17796 Darrick J. Wong 2021-01-05  569  	case CLEFT_CONTIG:
d4a3606ea17796 Darrick J. Wong 2021-01-05  570  	case CRIGHT_CONTIG:
d4a3606ea17796 Darrick J. Wong 2021-01-05  571  		/* trim either left or ri=
ght, no change */
d4a3606ea17796 Darrick J. Wong 2021-01-05  572  		break;
d4a3606ea17796 Darrick J. Wong 2021-01-05  573  	}
d4a3606ea17796 Darrick J. Wong 2021-01-05  574  =

d4a3606ea17796 Darrick J. Wong 2021-01-05  575  	switch (state & (NLEFT_CON=
TIG | NRIGHT_CONTIG | NHOLE)) {
d4a3606ea17796 Darrick J. Wong 2021-01-05  576  	case NLEFT_CONTIG | NRIGHT=
_CONTIG:
d4a3606ea17796 Darrick J. Wong 2021-01-05  577  		/*
d4a3606ea17796 Darrick J. Wong 2021-01-05  578  		 * left/curr/right will b=
ecome the same extent, so adding
d4a3606ea17796 Darrick J. Wong 2021-01-05  579  		 * curr causes the deleti=
on of right.
d4a3606ea17796 Darrick J. Wong 2021-01-05  580  		 */
d4a3606ea17796 Darrick J. Wong 2021-01-05  581  		ret--;
d4a3606ea17796 Darrick J. Wong 2021-01-05  582  		break;
d4a3606ea17796 Darrick J. Wong 2021-01-05 @583  		break;
d4a3606ea17796 Darrick J. Wong 2021-01-05  584  	case 0:
d4a3606ea17796 Darrick J. Wong 2021-01-05  585  		/* new is not contiguous =
with any extent */
d4a3606ea17796 Darrick J. Wong 2021-01-05  586  		ret++;
d4a3606ea17796 Darrick J. Wong 2021-01-05  587  		break;
d4a3606ea17796 Darrick J. Wong 2021-01-05  588  	case NHOLE:
d4a3606ea17796 Darrick J. Wong 2021-01-05  589  		/* hole, do nothing. */
d4a3606ea17796 Darrick J. Wong 2021-01-05  590  		break;
d4a3606ea17796 Darrick J. Wong 2021-01-05  591  	case NLEFT_CONTIG:
d4a3606ea17796 Darrick J. Wong 2021-01-05  592  	case NRIGHT_CONTIG:
d4a3606ea17796 Darrick J. Wong 2021-01-05  593  		/* new is absorbed into l=
eft or right, no change */
d4a3606ea17796 Darrick J. Wong 2021-01-05  594  		break;
d4a3606ea17796 Darrick J. Wong 2021-01-05  595  	}
d4a3606ea17796 Darrick J. Wong 2021-01-05  596  =

d4a3606ea17796 Darrick J. Wong 2021-01-05  597  	trace_xfs_swapext_delta_ne=
xtents_step(mp, left, curr, new, right, ret,
d4a3606ea17796 Darrick J. Wong 2021-01-05  598  			state);
d4a3606ea17796 Darrick J. Wong 2021-01-05  599  	return ret;
d4a3606ea17796 Darrick J. Wong 2021-01-05  600  }
d4a3606ea17796 Darrick J. Wong 2021-01-05  601  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2609164885182256548==--

