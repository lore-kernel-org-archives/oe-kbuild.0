Content-Type: multipart/mixed; boundary="===============4488260907322794407=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 140/326] fs/xfs/libxfs/xfs_swapext.c:583:3: warning: Consecutive return, break, continue, goto or throw statements are unnecessary. [duplicateBreak]
Date: Sat, 01 May 2021 23:36:36 +0800
Message-ID: <202105012324.Z4n7f3oU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4488260907322794407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   69e2e5df9ef7ef56d03034a3558383f8c861c5e5
commit: c4a3a0ec771710fefff8138f254786716cf263a1 [140/326] xfs: create defe=
rred log items for extent swapping
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

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
>> fs/xfs/scrub/ialloc.c:179:27: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
     freemask_ok =3D irec_free ^ !!(dip->di_mode);
                             ^

vim +583 fs/xfs/libxfs/xfs_swapext.c

c4a3a0ec771710 Darrick J. Wong 2021-01-05  508  =

c4a3a0ec771710 Darrick J. Wong 2021-01-05  509  /* Estimate the effect of a=
 single swap on extent count. */
c4a3a0ec771710 Darrick J. Wong 2021-01-05  510  static inline int
c4a3a0ec771710 Darrick J. Wong 2021-01-05  511  delta_nextents_step(
c4a3a0ec771710 Darrick J. Wong 2021-01-05  512  	struct xfs_mount		*mp,
c4a3a0ec771710 Darrick J. Wong 2021-01-05  513  	const struct xfs_bmbt_irec=
	*left,
c4a3a0ec771710 Darrick J. Wong 2021-01-05  514  	const struct xfs_bmbt_irec=
	*curr,
c4a3a0ec771710 Darrick J. Wong 2021-01-05  515  	const struct xfs_bmbt_irec=
	*new,
c4a3a0ec771710 Darrick J. Wong 2021-01-05  516  	const struct xfs_bmbt_irec=
	*right)
c4a3a0ec771710 Darrick J. Wong 2021-01-05  517  {
c4a3a0ec771710 Darrick J. Wong 2021-01-05  518  	bool				lhole, rhole, chol=
e, nhole;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  519  	unsigned int			state =3D 0;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  520  	int				ret =3D 0;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  521  =

c4a3a0ec771710 Darrick J. Wong 2021-01-05  522  	lhole =3D left->br_blockco=
unt =3D=3D 0 ||
c4a3a0ec771710 Darrick J. Wong 2021-01-05  523  		left->br_startblock =3D=
=3D HOLESTARTBLOCK;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  524  	rhole =3D right->br_blockc=
ount =3D=3D 0 ||
c4a3a0ec771710 Darrick J. Wong 2021-01-05  525  		right->br_startblock =3D=
=3D HOLESTARTBLOCK;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  526  	chole =3D curr->br_startbl=
ock =3D=3D HOLESTARTBLOCK;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  527  	nhole =3D new->br_startblo=
ck =3D=3D HOLESTARTBLOCK;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  528  =

c4a3a0ec771710 Darrick J. Wong 2021-01-05  529  	if (chole)
c4a3a0ec771710 Darrick J. Wong 2021-01-05  530  		state |=3D CHOLE;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  531  	if (!lhole && !chole && ca=
n_merge(left, curr))
c4a3a0ec771710 Darrick J. Wong 2021-01-05  532  		state |=3D CLEFT_CONTIG;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  533  	if (!rhole && !chole && ca=
n_merge(curr, right))
c4a3a0ec771710 Darrick J. Wong 2021-01-05  534  		state |=3D CRIGHT_CONTIG;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  535  	if ((state & CBOTH_CONTIG)=
 =3D=3D CBOTH_CONTIG &&
c4a3a0ec771710 Darrick J. Wong 2021-01-05  536  	    left->br_startblock + =
curr->br_startblock +
c4a3a0ec771710 Darrick J. Wong 2021-01-05  537  					right->br_startblock >=
 MAXEXTLEN)
c4a3a0ec771710 Darrick J. Wong 2021-01-05  538  		state &=3D ~CRIGHT_CONTIG;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  539  =

c4a3a0ec771710 Darrick J. Wong 2021-01-05  540  	if (nhole)
c4a3a0ec771710 Darrick J. Wong 2021-01-05  541  		state |=3D NHOLE;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  542  	if (!lhole && !nhole && ca=
n_merge(left, new))
c4a3a0ec771710 Darrick J. Wong 2021-01-05  543  		state |=3D NLEFT_CONTIG;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  544  	if (!rhole && !nhole && ca=
n_merge(new, right))
c4a3a0ec771710 Darrick J. Wong 2021-01-05  545  		state |=3D NRIGHT_CONTIG;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  546  	if ((state & NBOTH_CONTIG)=
 =3D=3D NBOTH_CONTIG &&
c4a3a0ec771710 Darrick J. Wong 2021-01-05  547  	    left->br_startblock + =
new->br_startblock +
c4a3a0ec771710 Darrick J. Wong 2021-01-05  548  					right->br_startblock >=
 MAXEXTLEN)
c4a3a0ec771710 Darrick J. Wong 2021-01-05  549  		state &=3D ~NRIGHT_CONTIG;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  550  =

c4a3a0ec771710 Darrick J. Wong 2021-01-05  551  	switch (state & (CLEFT_CON=
TIG | CRIGHT_CONTIG | CHOLE)) {
c4a3a0ec771710 Darrick J. Wong 2021-01-05  552  	case CLEFT_CONTIG | CRIGHT=
_CONTIG:
c4a3a0ec771710 Darrick J. Wong 2021-01-05  553  		/*
c4a3a0ec771710 Darrick J. Wong 2021-01-05  554  		 * left/curr/right are th=
e same extent, so deleting curr causes
c4a3a0ec771710 Darrick J. Wong 2021-01-05  555  		 * 2 new extents to be cr=
eated.
c4a3a0ec771710 Darrick J. Wong 2021-01-05  556  		 */
c4a3a0ec771710 Darrick J. Wong 2021-01-05  557  		ret +=3D 2;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  558  		break;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  559  	case 0:
c4a3a0ec771710 Darrick J. Wong 2021-01-05  560  		/*
c4a3a0ec771710 Darrick J. Wong 2021-01-05  561  		 * curr is not contiguous=
 with any extent, so we remove curr
c4a3a0ec771710 Darrick J. Wong 2021-01-05  562  		 * completely
c4a3a0ec771710 Darrick J. Wong 2021-01-05  563  		 */
c4a3a0ec771710 Darrick J. Wong 2021-01-05  564  		ret--;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  565  		break;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  566  	case CHOLE:
c4a3a0ec771710 Darrick J. Wong 2021-01-05  567  		/* hole, do nothing */
c4a3a0ec771710 Darrick J. Wong 2021-01-05  568  		break;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  569  	case CLEFT_CONTIG:
c4a3a0ec771710 Darrick J. Wong 2021-01-05  570  	case CRIGHT_CONTIG:
c4a3a0ec771710 Darrick J. Wong 2021-01-05  571  		/* trim either left or ri=
ght, no change */
c4a3a0ec771710 Darrick J. Wong 2021-01-05  572  		break;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  573  	}
c4a3a0ec771710 Darrick J. Wong 2021-01-05  574  =

c4a3a0ec771710 Darrick J. Wong 2021-01-05  575  	switch (state & (NLEFT_CON=
TIG | NRIGHT_CONTIG | NHOLE)) {
c4a3a0ec771710 Darrick J. Wong 2021-01-05  576  	case NLEFT_CONTIG | NRIGHT=
_CONTIG:
c4a3a0ec771710 Darrick J. Wong 2021-01-05  577  		/*
c4a3a0ec771710 Darrick J. Wong 2021-01-05  578  		 * left/curr/right will b=
ecome the same extent, so adding
c4a3a0ec771710 Darrick J. Wong 2021-01-05  579  		 * curr causes the deleti=
on of right.
c4a3a0ec771710 Darrick J. Wong 2021-01-05  580  		 */
c4a3a0ec771710 Darrick J. Wong 2021-01-05  581  		ret--;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  582  		break;
c4a3a0ec771710 Darrick J. Wong 2021-01-05 @583  		break;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  584  	case 0:
c4a3a0ec771710 Darrick J. Wong 2021-01-05  585  		/* new is not contiguous =
with any extent */
c4a3a0ec771710 Darrick J. Wong 2021-01-05  586  		ret++;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  587  		break;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  588  	case NHOLE:
c4a3a0ec771710 Darrick J. Wong 2021-01-05  589  		/* hole, do nothing. */
c4a3a0ec771710 Darrick J. Wong 2021-01-05  590  		break;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  591  	case NLEFT_CONTIG:
c4a3a0ec771710 Darrick J. Wong 2021-01-05  592  	case NRIGHT_CONTIG:
c4a3a0ec771710 Darrick J. Wong 2021-01-05  593  		/* new is absorbed into l=
eft or right, no change */
c4a3a0ec771710 Darrick J. Wong 2021-01-05  594  		break;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  595  	}
c4a3a0ec771710 Darrick J. Wong 2021-01-05  596  =

c4a3a0ec771710 Darrick J. Wong 2021-01-05  597  	trace_xfs_swapext_delta_ne=
xtents_step(mp, left, curr, new, right, ret,
c4a3a0ec771710 Darrick J. Wong 2021-01-05  598  			state);
c4a3a0ec771710 Darrick J. Wong 2021-01-05  599  	return ret;
c4a3a0ec771710 Darrick J. Wong 2021-01-05  600  }
c4a3a0ec771710 Darrick J. Wong 2021-01-05  601  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4488260907322794407==--

