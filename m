Content-Type: multipart/mixed; boundary="===============5385031728073893310=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 111/302] fs/xfs/libxfs/xfs_swapext.c:583:3: warning: Consecutive return, break, continue, goto or throw statements are unnecessary. [duplicateBreak]
Date: Wed, 26 May 2021 21:39:26 +0800
Message-ID: <202105262112.Vs4gygos-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5385031728073893310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   ee6dc8370a14c9c4f0e3d4de478714e952007c2c
commit: f71e13ddbec0f849350002983eafcf60d3844d3c [111/302] xfs: create defe=
rred log items for extent swapping
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: sh4-linux-gcc (GCC) 9.3.0

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
>> fs/xfs/xfs_attr_inactive.c:199:4: warning: Label '__here' is not used. S=
hould this be a 'case' of the enclosing switch()? [unusedLabelSwitch]
      xfs_buf_mark_corrupt(child_bp);
      ^
   fs/xfs/xfs_attr_inactive.c:296:3: warning: Label '__here' is not used. S=
hould this be a 'case' of the enclosing switch()? [unusedLabelSwitch]
     xfs_buf_mark_corrupt(bp);
     ^

vim +583 fs/xfs/libxfs/xfs_swapext.c

f71e13ddbec0f8 Darrick J. Wong 2021-01-05  508  =

f71e13ddbec0f8 Darrick J. Wong 2021-01-05  509  /* Estimate the effect of a=
 single swap on extent count. */
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  510  static inline int
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  511  delta_nextents_step(
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  512  	struct xfs_mount		*mp,
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  513  	const struct xfs_bmbt_irec=
	*left,
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  514  	const struct xfs_bmbt_irec=
	*curr,
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  515  	const struct xfs_bmbt_irec=
	*new,
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  516  	const struct xfs_bmbt_irec=
	*right)
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  517  {
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  518  	bool				lhole, rhole, chol=
e, nhole;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  519  	unsigned int			state =3D 0;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  520  	int				ret =3D 0;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  521  =

f71e13ddbec0f8 Darrick J. Wong 2021-01-05  522  	lhole =3D left->br_blockco=
unt =3D=3D 0 ||
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  523  		left->br_startblock =3D=
=3D HOLESTARTBLOCK;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  524  	rhole =3D right->br_blockc=
ount =3D=3D 0 ||
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  525  		right->br_startblock =3D=
=3D HOLESTARTBLOCK;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  526  	chole =3D curr->br_startbl=
ock =3D=3D HOLESTARTBLOCK;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  527  	nhole =3D new->br_startblo=
ck =3D=3D HOLESTARTBLOCK;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  528  =

f71e13ddbec0f8 Darrick J. Wong 2021-01-05  529  	if (chole)
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  530  		state |=3D CHOLE;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  531  	if (!lhole && !chole && ca=
n_merge(left, curr))
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  532  		state |=3D CLEFT_CONTIG;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  533  	if (!rhole && !chole && ca=
n_merge(curr, right))
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  534  		state |=3D CRIGHT_CONTIG;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  535  	if ((state & CBOTH_CONTIG)=
 =3D=3D CBOTH_CONTIG &&
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  536  	    left->br_startblock + =
curr->br_startblock +
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  537  					right->br_startblock >=
 MAXEXTLEN)
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  538  		state &=3D ~CRIGHT_CONTIG;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  539  =

f71e13ddbec0f8 Darrick J. Wong 2021-01-05  540  	if (nhole)
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  541  		state |=3D NHOLE;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  542  	if (!lhole && !nhole && ca=
n_merge(left, new))
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  543  		state |=3D NLEFT_CONTIG;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  544  	if (!rhole && !nhole && ca=
n_merge(new, right))
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  545  		state |=3D NRIGHT_CONTIG;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  546  	if ((state & NBOTH_CONTIG)=
 =3D=3D NBOTH_CONTIG &&
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  547  	    left->br_startblock + =
new->br_startblock +
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  548  					right->br_startblock >=
 MAXEXTLEN)
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  549  		state &=3D ~NRIGHT_CONTIG;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  550  =

f71e13ddbec0f8 Darrick J. Wong 2021-01-05  551  	switch (state & (CLEFT_CON=
TIG | CRIGHT_CONTIG | CHOLE)) {
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  552  	case CLEFT_CONTIG | CRIGHT=
_CONTIG:
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  553  		/*
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  554  		 * left/curr/right are th=
e same extent, so deleting curr causes
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  555  		 * 2 new extents to be cr=
eated.
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  556  		 */
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  557  		ret +=3D 2;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  558  		break;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  559  	case 0:
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  560  		/*
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  561  		 * curr is not contiguous=
 with any extent, so we remove curr
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  562  		 * completely
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  563  		 */
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  564  		ret--;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  565  		break;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  566  	case CHOLE:
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  567  		/* hole, do nothing */
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  568  		break;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  569  	case CLEFT_CONTIG:
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  570  	case CRIGHT_CONTIG:
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  571  		/* trim either left or ri=
ght, no change */
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  572  		break;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  573  	}
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  574  =

f71e13ddbec0f8 Darrick J. Wong 2021-01-05  575  	switch (state & (NLEFT_CON=
TIG | NRIGHT_CONTIG | NHOLE)) {
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  576  	case NLEFT_CONTIG | NRIGHT=
_CONTIG:
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  577  		/*
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  578  		 * left/curr/right will b=
ecome the same extent, so adding
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  579  		 * curr causes the deleti=
on of right.
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  580  		 */
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  581  		ret--;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  582  		break;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05 @583  		break;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  584  	case 0:
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  585  		/* new is not contiguous =
with any extent */
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  586  		ret++;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  587  		break;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  588  	case NHOLE:
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  589  		/* hole, do nothing. */
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  590  		break;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  591  	case NLEFT_CONTIG:
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  592  	case NRIGHT_CONTIG:
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  593  		/* new is absorbed into l=
eft or right, no change */
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  594  		break;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  595  	}
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  596  =

f71e13ddbec0f8 Darrick J. Wong 2021-01-05  597  	trace_xfs_swapext_delta_ne=
xtents_step(mp, left, curr, new, right, ret,
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  598  			state);
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  599  	return ret;
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  600  }
f71e13ddbec0f8 Darrick J. Wong 2021-01-05  601  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5385031728073893310==--

