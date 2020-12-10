Content-Type: multipart/mixed; boundary="===============5174387139741524038=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:xfs-5.11-merge 27/30] fs/xfs/libxfs/xfs_sb.c:367:21: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses.
Date: Thu, 10 Dec 2020 15:48:54 +0800
Message-ID: <202012101547.eWP7RnvD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5174387139741524038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: Gao Xiang <hsiangkao@redhat.com>
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: Brian Foster <bfoster@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t xfs-5.11-merge
head:   207ddc0ef4f413ab1f4e0c1fcab2226425dec293
commit: 7bc1fea9d36c78e783ce7d4ad28ad129ebcce435 [27/30] xfs: introduce xfs=
_validate_stripe_geometry()
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/xfs/libxfs/xfs_sb.c:
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
>> fs/xfs/libxfs/xfs_sb.c:367:21: warning: Boolean result is used in bitwis=
e operation. Clarify expression with parentheses. [clarifyCondition]
    if (!!sbp->sb_unit ^ xfs_sb_version_hasdalign(sbp)) {
                       ^

vim +367 fs/xfs/libxfs/xfs_sb.c

eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  215  =

eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  216  /=
* Check the validity of the SB. */
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  217  S=
TATIC int
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  218  x=
fs_validate_sb_common(
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  219  	=
struct xfs_mount	*mp,
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  220  	=
struct xfs_buf		*bp,
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  221  	=
struct xfs_sb		*sbp)
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  222  {
3e6e8afd3abb745 fs/xfs/libxfs/xfs_sb.c Christoph Hellwig 2020-03-10  223  	=
struct xfs_dsb		*dsb =3D bp->b_addr;
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  224  	=
uint32_t		agcount =3D 0;
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  225  	=
uint32_t		rem;
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  226  =

39708c20ab51337 fs/xfs/libxfs/xfs_sb.c Brian Foster      2019-02-07  227  	=
if (!xfs_verify_magic(bp, dsb->sb_magicnum)) {
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  228  	=
	xfs_warn(mp, "bad magic number");
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  229  	=
	return -EWRONGFS;
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  230  	}
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  231  =

eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  232  	=
if (!xfs_sb_good_version(sbp)) {
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  233  	=
	xfs_warn(mp, "bad version");
eca383fcd63b452 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-07-29  234  	=
	return -EWRONGFS;
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  235  	}
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  236  =

ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  237  	=
if (xfs_sb_version_has_pquotino(sbp)) {
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  238  	=
	if (sbp->sb_qflags & (XFS_OQUOTA_ENFD | XFS_OQUOTA_CHKD)) {
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  239  	=
		xfs_notice(mp,
08e96e1a3c5fd82 fs/xfs/xfs_sb.c        Eric Sandeen      2013-10-11  240  	=
		   "Version 5 of Super block has XFS_OQUOTA bits.");
2451337dd043901 fs/xfs/libxfs/xfs_sb.c Dave Chinner      2014-06-25  241  	=
		return -EFSCORRUPTED;
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  242  	=
	}
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  243  	=
} else if (sbp->sb_qflags & (XFS_PQUOTA_ENFD | XFS_GQUOTA_ENFD |
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  244  	=
			XFS_PQUOTA_CHKD | XFS_GQUOTA_CHKD)) {
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  245  	=
		xfs_notice(mp,
14506f7a91d8f4d fs/xfs/libxfs/xfs_sb.c Kaixu Xia         2020-05-11  246  "=
Superblock earlier than Version 5 has XFS_{P|G}QUOTA_{ENFD|CHKD} bits.");
2451337dd043901 fs/xfs/libxfs/xfs_sb.c Dave Chinner      2014-06-25  247  	=
		return -EFSCORRUPTED;
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  248  	}
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  249  =

e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  250  	=
/*
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  251  	=
 * Full inode chunks must be aligned to inode chunk size when
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  252  	=
 * sparse inodes are enabled to support the sparse chunk
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  253  	=
 * allocation algorithm and prevent overlapping inode records.
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  254  	=
 */
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  255  	=
if (xfs_sb_version_hassparseinodes(sbp)) {
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  256  	=
	uint32_t	align;
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  257  =

e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  258  	=
	align =3D XFS_INODES_PER_CHUNK * sbp->sb_inodesize
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  259  	=
			>> sbp->sb_blocklog;
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  260  	=
	if (sbp->sb_inoalignmt !=3D align) {
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  261  	=
		xfs_warn(mp,
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  262  "=
Inode block alignment (%u) must match chunk size (%u) for sparse inodes.",
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  263  	=
			 sbp->sb_inoalignmt, align);
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  264  	=
		return -EINVAL;
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  265  	=
	}
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  266  	}
e5376fc15acdd6b fs/xfs/libxfs/xfs_sb.c Brian Foster      2015-05-29  267  =

ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  268  	=
if (unlikely(
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  269  	=
    sbp->sb_logstart =3D=3D 0 && mp->m_logdev_targp =3D=3D mp->m_ddev_targp=
)) {
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  270  	=
	xfs_warn(mp,
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  271  	=
	"filesystem is marked as having an external log; "
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  272  	=
	"specify logdev on the mount command line.");
2451337dd043901 fs/xfs/libxfs/xfs_sb.c Dave Chinner      2014-06-25  273  	=
	return -EINVAL;
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  274  	}
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  275  =

ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  276  	=
if (unlikely(
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  277  	=
    sbp->sb_logstart !=3D 0 && mp->m_logdev_targp !=3D mp->m_ddev_targp)) {
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  278  	=
	xfs_warn(mp,
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  279  	=
	"filesystem is marked as having an internal log; "
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  280  	=
	"do not specify logdev on the mount command line.");
2451337dd043901 fs/xfs/libxfs/xfs_sb.c Dave Chinner      2014-06-25  281  	=
	return -EINVAL;
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  282  	}
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  283  =

4bb73d014785cc5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-01-16  284  	=
/* Compute agcount for this number of dblocks and agblocks */
4bb73d014785cc5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-01-16  285  	=
if (sbp->sb_agblocks) {
4bb73d014785cc5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-01-16  286  	=
	agcount =3D div_u64_rem(sbp->sb_dblocks, sbp->sb_agblocks, &rem);
4bb73d014785cc5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-01-16  287  	=
	if (rem)
4bb73d014785cc5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-01-16  288  	=
		agcount++;
4bb73d014785cc5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-01-16  289  	}
4bb73d014785cc5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-01-16  290  =

ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  291  	=
/*
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  292  	=
 * More sanity checking.  Most of these were stolen directly from
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  293  	=
 * xfs_repair.
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  294  	=
 */
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  295  	=
if (unlikely(
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  296  	=
    sbp->sb_agcount <=3D 0					||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  297  	=
    sbp->sb_sectsize < XFS_MIN_SECTORSIZE			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  298  	=
    sbp->sb_sectsize > XFS_MAX_SECTORSIZE			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  299  	=
    sbp->sb_sectlog < XFS_MIN_SECTORSIZE_LOG			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  300  	=
    sbp->sb_sectlog > XFS_MAX_SECTORSIZE_LOG			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  301  	=
    sbp->sb_sectsize !=3D (1 << sbp->sb_sectlog)			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  302  	=
    sbp->sb_blocksize < XFS_MIN_BLOCKSIZE			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  303  	=
    sbp->sb_blocksize > XFS_MAX_BLOCKSIZE			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  304  	=
    sbp->sb_blocklog < XFS_MIN_BLOCKSIZE_LOG			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  305  	=
    sbp->sb_blocklog > XFS_MAX_BLOCKSIZE_LOG			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  306  	=
    sbp->sb_blocksize !=3D (1 << sbp->sb_blocklog)		||
83d230eb5c63894 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2017-01-23  307  	=
    sbp->sb_dirblklog + sbp->sb_blocklog > XFS_MAX_BLOCKSIZE_LOG ||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  308  	=
    sbp->sb_inodesize < XFS_DINODE_MIN_SIZE			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  309  	=
    sbp->sb_inodesize > XFS_DINODE_MAX_SIZE			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  310  	=
    sbp->sb_inodelog < XFS_DINODE_MIN_LOG			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  311  	=
    sbp->sb_inodelog > XFS_DINODE_MAX_LOG			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  312  	=
    sbp->sb_inodesize !=3D (1 << sbp->sb_inodelog)		||
e1b05723ed83409 fs/xfs/libxfs/xfs_sb.c Eric Sandeen      2014-09-09  313  	=
    sbp->sb_logsunit > XLOG_MAX_RECORD_BSIZE			||
392c6de98af1fd7 fs/xfs/xfs_sb.c        Eric Sandeen      2014-02-07  314  	=
    sbp->sb_inopblock !=3D howmany(sbp->sb_blocksize,sbp->sb_inodesize) ||
4bb73d014785cc5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-01-16  315  	=
    XFS_FSB_TO_B(mp, sbp->sb_agblocks) < XFS_MIN_AG_BYTES	||
4bb73d014785cc5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-01-16  316  	=
    XFS_FSB_TO_B(mp, sbp->sb_agblocks) > XFS_MAX_AG_BYTES	||
4bb73d014785cc5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-01-16  317  	=
    sbp->sb_agblklog !=3D xfs_highbit32(sbp->sb_agblocks - 1) + 1	||
4bb73d014785cc5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2018-01-16  318  	=
    agcount =3D=3D 0 || agcount !=3D sbp->sb_agcount			||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  319  	=
    (sbp->sb_blocklog - sbp->sb_inodelog !=3D sbp->sb_inopblog)	||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  320  	=
    (sbp->sb_rextsize * sbp->sb_blocksize > XFS_MAX_RTEXTSIZE)	||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  321  	=
    (sbp->sb_rextsize * sbp->sb_blocksize < XFS_MIN_RTEXTSIZE)	||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  322  	=
    (sbp->sb_imax_pct > 100 /* zero sb_imax_pct is valid */)	||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  323  	=
    sbp->sb_dblocks =3D=3D 0					||
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  324  	=
    sbp->sb_dblocks > XFS_MAX_DBLOCKS(sbp)			||
ab3e57b53f549ad fs/xfs/xfs_sb.c        Dave Chinner      2014-05-20  325  	=
    sbp->sb_dblocks < XFS_MIN_DBLOCKS(sbp)			||
ab3e57b53f549ad fs/xfs/xfs_sb.c        Dave Chinner      2014-05-20  326  	=
    sbp->sb_shared_vn !=3D 0)) {
5ef11eb0700f806 fs/xfs/xfs_sb.c        Eric Sandeen      2014-02-19  327  	=
	xfs_notice(mp, "SB sanity check failed");
2451337dd043901 fs/xfs/libxfs/xfs_sb.c Dave Chinner      2014-06-25  328  	=
	return -EFSCORRUPTED;
bec9d48d7a303a5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2016-11-09  329  	}
bec9d48d7a303a5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2016-11-09  330  =

f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  331  	=
/* Validate the realtime geometry; stolen from xfs_repair */
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  332  	=
if (sbp->sb_rextsize * sbp->sb_blocksize > XFS_MAX_RTEXTSIZE ||
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  333  	=
    sbp->sb_rextsize * sbp->sb_blocksize < XFS_MIN_RTEXTSIZE) {
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  334  	=
	xfs_notice(mp,
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  335  	=
		"realtime extent sanity check failed");
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  336  	=
	return -EFSCORRUPTED;
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  337  	}
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  338  =

f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  339  	=
if (sbp->sb_rblocks =3D=3D 0) {
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  340  	=
	if (sbp->sb_rextents !=3D 0 || sbp->sb_rbmblocks !=3D 0 ||
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  341  	=
	    sbp->sb_rextslog !=3D 0 || sbp->sb_frextents !=3D 0) {
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  342  	=
		xfs_notice(mp,
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  343  	=
			"realtime zeroed geometry check failed");
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  344  	=
		return -EFSCORRUPTED;
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  345  	=
	}
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  346  	=
} else {
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  347  	=
	uint64_t	rexts;
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  348  	=
	uint64_t	rbmblocks;
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  349  =

f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  350  	=
	rexts =3D div_u64(sbp->sb_rblocks, sbp->sb_rextsize);
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  351  	=
	rbmblocks =3D howmany_64(sbp->sb_rextents,
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  352  	=
			       NBBY * sbp->sb_blocksize);
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  353  =

f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  354  	=
	if (sbp->sb_rextents !=3D rexts ||
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  355  	=
	    sbp->sb_rextslog !=3D xfs_highbit32(sbp->sb_rextents) ||
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  356  	=
	    sbp->sb_rbmblocks !=3D rbmblocks) {
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  357  	=
		xfs_notice(mp,
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  358  	=
			"realtime geometry sanity check failed");
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  359  	=
		return -EFSCORRUPTED;
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  360  	=
	}
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  361  	}
f8e566c0f5e1fd8 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2020-03-24  362  =

7bc1fea9d36c78e fs/xfs/libxfs/xfs_sb.c Gao Xiang         2020-12-03  363  	=
/*
7bc1fea9d36c78e fs/xfs/libxfs/xfs_sb.c Gao Xiang         2020-12-03  364  	=
 * Either (sb_unit and !hasdalign) or (!sb_unit and hasdalign)
7bc1fea9d36c78e fs/xfs/libxfs/xfs_sb.c Gao Xiang         2020-12-03  365  	=
 * would imply the image is corrupted.
7bc1fea9d36c78e fs/xfs/libxfs/xfs_sb.c Gao Xiang         2020-12-03  366  	=
 */
7bc1fea9d36c78e fs/xfs/libxfs/xfs_sb.c Gao Xiang         2020-12-03 @367  	=
if (!!sbp->sb_unit ^ xfs_sb_version_hasdalign(sbp)) {
fa4ca9c5574605d fs/xfs/libxfs/xfs_sb.c Dave Chinner      2018-06-05  368  	=
	xfs_notice(mp, "SB stripe alignment sanity check failed");
fa4ca9c5574605d fs/xfs/libxfs/xfs_sb.c Dave Chinner      2018-06-05  369  	=
	return -EFSCORRUPTED;
fa4ca9c5574605d fs/xfs/libxfs/xfs_sb.c Dave Chinner      2018-06-05  370  	}
fa4ca9c5574605d fs/xfs/libxfs/xfs_sb.c Dave Chinner      2018-06-05  371  =

7bc1fea9d36c78e fs/xfs/libxfs/xfs_sb.c Gao Xiang         2020-12-03  372  	=
if (!xfs_validate_stripe_geometry(mp, XFS_FSB_TO_B(mp, sbp->sb_unit),
7bc1fea9d36c78e fs/xfs/libxfs/xfs_sb.c Gao Xiang         2020-12-03  373  	=
		XFS_FSB_TO_B(mp, sbp->sb_width), 0, false))
7bc1fea9d36c78e fs/xfs/libxfs/xfs_sb.c Gao Xiang         2020-12-03  374  	=
	return -EFSCORRUPTED;
fa4ca9c5574605d fs/xfs/libxfs/xfs_sb.c Dave Chinner      2018-06-05  375  =

bec9d48d7a303a5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2016-11-09  376  	=
if (xfs_sb_version_hascrc(&mp->m_sb) &&
bec9d48d7a303a5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2016-11-09  377  	=
    sbp->sb_blocksize < XFS_MIN_CRC_BLOCKSIZE) {
bec9d48d7a303a5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2016-11-09  378  	=
	xfs_notice(mp, "v5 SB sanity check failed");
bec9d48d7a303a5 fs/xfs/libxfs/xfs_sb.c Darrick J. Wong   2016-11-09  379  	=
	return -EFSCORRUPTED;
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  380  	}
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  381  =

ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  382  	=
/*
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  383  	=
 * Currently only very few inode sizes are supported.
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  384  	=
 */
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  385  	=
switch (sbp->sb_inodesize) {
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  386  	=
case 256:
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  387  	=
case 512:
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  388  	=
case 1024:
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  389  	=
case 2048:
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  390  	=
	break;
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  391  	=
default:
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  392  	=
	xfs_warn(mp, "inode size of %d bytes not supported",
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  393  	=
			sbp->sb_inodesize);
2451337dd043901 fs/xfs/libxfs/xfs_sb.c Dave Chinner      2014-06-25  394  	=
	return -ENOSYS;
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  395  	}
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  396  =

ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  397  	=
return 0;
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  398  }
ff55068c2010f39 fs/xfs/xfs_sb.c        Dave Chinner      2013-08-12  399  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5174387139741524038==--

