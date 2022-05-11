Content-Type: multipart/mixed; boundary="===============0430890979135546209=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [allisonhenderson-xfs-work:larp_cleanupv4_pptrs 32/35] fs/xfs/xfs_inode.c:3552 xfs_rename() error: uninitialized symbol 'new_diroffset'.
Date: Thu, 12 May 2022 06:36:28 +0800
Message-ID: <202205120608.uFd4vPyl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0430890979135546209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Allison Henderson <allison.henderson@oracle.com>
CC: Mark Tinguely <tinguely@sgi.com>
CC: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://github.com/allisonhenderson/xfs_work.git larp_cleanupv4_ppt=
rs
head:   3d7771d8177638d5d115404cbee0b9a77cf0bb4c
commit: 726b39b480bc016f88942a3044669c4856232e7c [32/35] xfs: Add the paren=
t pointer support to the  superblock version 5.
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-m031-20220509 (https://download.01.org/0day-ci/arch=
ive/20220512/202205120608.uFd4vPyl-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/xfs/xfs_inode.c:3552 xfs_rename() error: uninitialized symbol 'new_dirof=
fset'.
fs/xfs/xfs_inode.c:3560 xfs_rename() error: uninitialized symbol 'old_dirof=
fset'.

vim +/new_diroffset +3552 fs/xfs/xfs_inode.c

7dcf5c3e4527cf Dave Chinner      2015-03-25  3194  =

f6bba2017afb3b Dave Chinner      2013-08-12  3195  /*
f6bba2017afb3b Dave Chinner      2013-08-12  3196   * xfs_rename
f6bba2017afb3b Dave Chinner      2013-08-12  3197   */
f6bba2017afb3b Dave Chinner      2013-08-12  3198  int
f6bba2017afb3b Dave Chinner      2013-08-12  3199  xfs_rename(
f736d93d76d3e9 Christoph Hellwig 2021-01-21  3200  	struct user_namespace		=
*mnt_userns,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3201  	struct xfs_inode		*src_=
dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3202  	struct xfs_name			*src_=
name,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3203  	struct xfs_inode		*src_=
ip,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3204  	struct xfs_inode		*targ=
et_dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3205  	struct xfs_name			*targ=
et_name,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3206  	struct xfs_inode		*targ=
et_ip,
d31a1825450062 Carlos Maiolino   2014-12-24  3207  	unsigned int			flags)
f6bba2017afb3b Dave Chinner      2013-08-12  3208  {
7dcf5c3e4527cf Dave Chinner      2015-03-25  3209  	struct xfs_mount		*mp =
=3D src_dp->i_mount;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3210  	struct xfs_trans		*tp;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3211  	struct xfs_inode		*wip =
=3D NULL;		/* whiteout inode */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3212  	struct xfs_inode		*inod=
es[__XFS_SORT_INODES];
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3213  	int				i;
95afcf5c7bca93 Dave Chinner      2015-03-25  3214  	int				num_inodes =3D _=
_XFS_SORT_INODES;
2b93681f593577 Dave Chinner      2015-03-25  3215  	bool				new_parent =3D =
(src_dp !=3D target_dp);
c19b3b05ae440d Dave Chinner      2016-02-09  3216  	bool				src_is_director=
y =3D S_ISDIR(VFS_I(src_ip)->i_mode);
f6bba2017afb3b Dave Chinner      2013-08-12  3217  	int				spaceres;
41667260bc84db Darrick J. Wong   2022-03-09  3218  	bool				retried =3D fal=
se;
41667260bc84db Darrick J. Wong   2022-03-09  3219  	int				error, nospace_e=
rror =3D 0;
548859ddf49f8d Allison Henderson 2022-03-22  3220  	struct xfs_parent_name_=
rec	new_rec;
548859ddf49f8d Allison Henderson 2022-03-22  3221  	struct xfs_parent_name_=
rec	old_rec;
548859ddf49f8d Allison Henderson 2022-03-22  3222  	xfs_dir2_dataptr_t		new=
_diroffset;
548859ddf49f8d Allison Henderson 2022-03-22  3223  	xfs_dir2_dataptr_t		old=
_diroffset;
548859ddf49f8d Allison Henderson 2022-03-22  3224  	struct xfs_da_args		new=
_args =3D {
548859ddf49f8d Allison Henderson 2022-03-22  3225  		.dp		=3D src_ip,
548859ddf49f8d Allison Henderson 2022-03-22  3226  		.geo		=3D mp->m_attr_g=
eo,
548859ddf49f8d Allison Henderson 2022-03-22  3227  		.whichfork	=3D XFS_ATT=
R_FORK,
548859ddf49f8d Allison Henderson 2022-03-22  3228  		.attr_filter	=3D XFS_A=
TTR_PARENT,
548859ddf49f8d Allison Henderson 2022-03-22  3229  		.op_flags	=3D XFS_DA_O=
P_OKNOENT,
548859ddf49f8d Allison Henderson 2022-03-22  3230  		.name		=3D (const uint=
8_t *)&new_rec,
548859ddf49f8d Allison Henderson 2022-03-22  3231  		.namelen	=3D sizeof(ne=
w_rec),
548859ddf49f8d Allison Henderson 2022-03-22  3232  		.value		=3D (void *)ta=
rget_name->name,
548859ddf49f8d Allison Henderson 2022-03-22  3233  		.valuelen	=3D target_n=
ame->len,
548859ddf49f8d Allison Henderson 2022-03-22  3234  	};
548859ddf49f8d Allison Henderson 2022-03-22  3235  	struct xfs_da_args		old=
_args =3D {
548859ddf49f8d Allison Henderson 2022-03-22  3236  		.dp		=3D src_ip,
548859ddf49f8d Allison Henderson 2022-03-22  3237  		.geo		=3D mp->m_attr_g=
eo,
548859ddf49f8d Allison Henderson 2022-03-22  3238  		.whichfork	=3D XFS_ATT=
R_FORK,
548859ddf49f8d Allison Henderson 2022-03-22  3239  		.attr_filter	=3D XFS_A=
TTR_PARENT,
548859ddf49f8d Allison Henderson 2022-03-22  3240  		.op_flags	=3D XFS_DA_O=
P_OKNOENT,
548859ddf49f8d Allison Henderson 2022-03-22  3241  		.name		=3D (const uint=
8_t *)&old_rec,
548859ddf49f8d Allison Henderson 2022-03-22  3242  		.namelen	=3D sizeof(ol=
d_rec),
548859ddf49f8d Allison Henderson 2022-03-22  3243  		.value		=3D NULL,
548859ddf49f8d Allison Henderson 2022-03-22  3244  		.valuelen	=3D 0,
548859ddf49f8d Allison Henderson 2022-03-22  3245  	};
f6bba2017afb3b Dave Chinner      2013-08-12  3246  =

f6bba2017afb3b Dave Chinner      2013-08-12  3247  	trace_xfs_rename(src_dp=
, target_dp, src_name, target_name);
f6bba2017afb3b Dave Chinner      2013-08-12  3248  =

eeacd3217b8fa8 Dave Chinner      2015-03-25  3249  	if ((flags & RENAME_EXC=
HANGE) && !target_ip)
eeacd3217b8fa8 Dave Chinner      2015-03-25  3250  		return -EINVAL;
eeacd3217b8fa8 Dave Chinner      2015-03-25  3251  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3252  	/*
7dcf5c3e4527cf Dave Chinner      2015-03-25  3253  	 * If we are doing a wh=
iteout operation, allocate the whiteout inode
7dcf5c3e4527cf Dave Chinner      2015-03-25  3254  	 * we will be placing a=
t the target and ensure the type is set
7dcf5c3e4527cf Dave Chinner      2015-03-25  3255  	 * appropriately.
7dcf5c3e4527cf Dave Chinner      2015-03-25  3256  	 */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3257  	if (flags & RENAME_WHIT=
EOUT) {
f736d93d76d3e9 Christoph Hellwig 2021-01-21  3258  		error =3D xfs_rename_a=
lloc_whiteout(mnt_userns, target_dp, &wip);
7dcf5c3e4527cf Dave Chinner      2015-03-25  3259  		if (error)
7dcf5c3e4527cf Dave Chinner      2015-03-25  3260  			return error;
f6bba2017afb3b Dave Chinner      2013-08-12  3261  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3262  		/* setup target dirent=
 info as whiteout */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3263  		src_name->type =3D XFS=
_DIR3_FT_CHRDEV;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3264  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3265  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3266  	xfs_sort_for_rename(src=
_dp, target_dp, src_ip, target_ip, wip,
f6bba2017afb3b Dave Chinner      2013-08-12  3267  				inodes, &num_inodes);
548859ddf49f8d Allison Henderson 2022-03-22  3268  	if (xfs_has_larp(mp)) {
548859ddf49f8d Allison Henderson 2022-03-22  3269  		error =3D xfs_attr_use=
_log_assist(mp);
548859ddf49f8d Allison Henderson 2022-03-22  3270  		if (error)
548859ddf49f8d Allison Henderson 2022-03-22  3271  			goto out_release_wip;
548859ddf49f8d Allison Henderson 2022-03-22  3272  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3273  =

41667260bc84db Darrick J. Wong   2022-03-09  3274  retry:
41667260bc84db Darrick J. Wong   2022-03-09  3275  	nospace_error =3D 0;
f6bba2017afb3b Dave Chinner      2013-08-12  3276  	spaceres =3D XFS_RENAME=
_SPACE_RES(mp, target_name->len);
253f4911f297b8 Christoph Hellwig 2016-04-06  3277  	error =3D xfs_trans_all=
oc(mp, &M_RES(mp)->tr_rename, spaceres, 0, 0, &tp);
2451337dd04390 Dave Chinner      2014-06-25  3278  	if (error =3D=3D -ENOSP=
C) {
41667260bc84db Darrick J. Wong   2022-03-09  3279  		nospace_error =3D erro=
r;
f6bba2017afb3b Dave Chinner      2013-08-12  3280  		spaceres =3D 0;
253f4911f297b8 Christoph Hellwig 2016-04-06  3281  		error =3D xfs_trans_al=
loc(mp, &M_RES(mp)->tr_rename, 0, 0, 0,
253f4911f297b8 Christoph Hellwig 2016-04-06  3282  				&tp);
f6bba2017afb3b Dave Chinner      2013-08-12  3283  	}
445883e8133975 Dave Chinner      2015-03-25  3284  	if (error)
548859ddf49f8d Allison Henderson 2022-03-22  3285  		goto drop_incompat;
f6bba2017afb3b Dave Chinner      2013-08-12  3286  =

f6bba2017afb3b Dave Chinner      2013-08-12  3287  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3288  	 * Attach the dquots to=
 the inodes
f6bba2017afb3b Dave Chinner      2013-08-12  3289  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3290  	error =3D xfs_qm_vop_re=
name_dqattach(inodes);
445883e8133975 Dave Chinner      2015-03-25  3291  	if (error)
445883e8133975 Dave Chinner      2015-03-25  3292  		goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3293  =

f6bba2017afb3b Dave Chinner      2013-08-12  3294  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3295  	 * Lock all the partici=
pating inodes. Depending upon whether
f6bba2017afb3b Dave Chinner      2013-08-12  3296  	 * the target_name exis=
ts in the target directory, and
f6bba2017afb3b Dave Chinner      2013-08-12  3297  	 * whether the target d=
irectory is the same as the source
f6bba2017afb3b Dave Chinner      2013-08-12  3298  	 * directory, we can lo=
ck from 2 to 4 inodes.
f6bba2017afb3b Dave Chinner      2013-08-12  3299  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3300  	xfs_lock_inodes(inodes,=
 num_inodes, XFS_ILOCK_EXCL);
f6bba2017afb3b Dave Chinner      2013-08-12  3301  =

f6bba2017afb3b Dave Chinner      2013-08-12  3302  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3303  	 * Join all the inodes =
to the transaction. From this point on,
f6bba2017afb3b Dave Chinner      2013-08-12  3304  	 * we can rely on eithe=
r trans_commit or trans_cancel to unlock
f6bba2017afb3b Dave Chinner      2013-08-12  3305  	 * them.
f6bba2017afb3b Dave Chinner      2013-08-12  3306  	 */
548859ddf49f8d Allison Henderson 2022-03-22  3307  	xfs_trans_ijoin(tp, src=
_dp, 0);
f6bba2017afb3b Dave Chinner      2013-08-12  3308  	if (new_parent)
548859ddf49f8d Allison Henderson 2022-03-22  3309  		xfs_trans_ijoin(tp, ta=
rget_dp, 0);
548859ddf49f8d Allison Henderson 2022-03-22  3310  	xfs_trans_ijoin(tp, src=
_ip, 0);
f6bba2017afb3b Dave Chinner      2013-08-12  3311  	if (target_ip)
548859ddf49f8d Allison Henderson 2022-03-22  3312  		xfs_trans_ijoin(tp, ta=
rget_ip, 0);
7dcf5c3e4527cf Dave Chinner      2015-03-25  3313  	if (wip)
548859ddf49f8d Allison Henderson 2022-03-22  3314  		xfs_trans_ijoin(tp, wi=
p, 0);
f6bba2017afb3b Dave Chinner      2013-08-12  3315  =

f6bba2017afb3b Dave Chinner      2013-08-12  3316  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3317  	 * If we are using proj=
ect inheritance, we only allow renames
f6bba2017afb3b Dave Chinner      2013-08-12  3318  	 * into our tree when t=
he project IDs are the same; else the
f6bba2017afb3b Dave Chinner      2013-08-12  3319  	 * tree quota mechanism=
 would be circumvented.
f6bba2017afb3b Dave Chinner      2013-08-12  3320  	 */
db07349da2f564 Christoph Hellwig 2021-03-29  3321  	if (unlikely((target_dp=
->i_diflags & XFS_DIFLAG_PROJINHERIT) &&
ceaf603c7024d3 Christoph Hellwig 2021-03-29  3322  		     target_dp->i_proj=
id !=3D src_ip->i_projid)) {
2451337dd04390 Dave Chinner      2014-06-25  3323  		error =3D -EXDEV;
548859ddf49f8d Allison Henderson 2022-03-22  3324  		goto out_unlock;
f6bba2017afb3b Dave Chinner      2013-08-12  3325  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3326  =

eeacd3217b8fa8 Dave Chinner      2015-03-25  3327  	/* RENAME_EXCHANGE is u=
nique from here on. */
548859ddf49f8d Allison Henderson 2022-03-22  3328  	if (flags & RENAME_EXCH=
ANGE) {
548859ddf49f8d Allison Henderson 2022-03-22  3329  		error =3D xfs_cross_re=
name(tp, src_dp, src_name, src_ip,
d31a1825450062 Carlos Maiolino   2014-12-24  3330  					target_dp, target_n=
ame, target_ip,
f16dea54b789aa Brian Foster      2018-07-11  3331  					spaceres);
548859ddf49f8d Allison Henderson 2022-03-22  3332  		goto out_pptr;
548859ddf49f8d Allison Henderson 2022-03-22  3333  	}
41667260bc84db Darrick J. Wong   2022-03-09  3334  	/*
41667260bc84db Darrick J. Wong   2022-03-09  3335  	 * Try to reserve quota=
 to handle an expansion of the target directory.
41667260bc84db Darrick J. Wong   2022-03-09  3336  	 * We'll allow the rena=
me to continue in reservationless mode if we hit
41667260bc84db Darrick J. Wong   2022-03-09  3337  	 * a space usage constr=
aint.  If we trigger reservationless mode, save
41667260bc84db Darrick J. Wong   2022-03-09  3338  	 * the errno if there i=
sn't any free space in the target directory.
41667260bc84db Darrick J. Wong   2022-03-09  3339  	 */
41667260bc84db Darrick J. Wong   2022-03-09  3340  	if (spaceres !=3D 0) {
41667260bc84db Darrick J. Wong   2022-03-09  3341  		error =3D xfs_trans_re=
serve_quota_nblks(tp, target_dp, spaceres,
41667260bc84db Darrick J. Wong   2022-03-09  3342  				0, false);
41667260bc84db Darrick J. Wong   2022-03-09  3343  		if (error =3D=3D -EDQU=
OT || error =3D=3D -ENOSPC) {
41667260bc84db Darrick J. Wong   2022-03-09  3344  			if (!retried) {
41667260bc84db Darrick J. Wong   2022-03-09  3345  				xfs_trans_cancel(tp);
41667260bc84db Darrick J. Wong   2022-03-09  3346  				xfs_blockgc_free_quo=
ta(target_dp, 0);
41667260bc84db Darrick J. Wong   2022-03-09  3347  				retried =3D true;
41667260bc84db Darrick J. Wong   2022-03-09  3348  				goto retry;
41667260bc84db Darrick J. Wong   2022-03-09  3349  			}
41667260bc84db Darrick J. Wong   2022-03-09  3350  =

41667260bc84db Darrick J. Wong   2022-03-09  3351  			nospace_error =3D err=
or;
41667260bc84db Darrick J. Wong   2022-03-09  3352  			spaceres =3D 0;
41667260bc84db Darrick J. Wong   2022-03-09  3353  			error =3D 0;
41667260bc84db Darrick J. Wong   2022-03-09  3354  		}
41667260bc84db Darrick J. Wong   2022-03-09  3355  		if (error)
41667260bc84db Darrick J. Wong   2022-03-09  3356  			goto out_trans_cancel;
41667260bc84db Darrick J. Wong   2022-03-09  3357  	}
41667260bc84db Darrick J. Wong   2022-03-09  3358  =

f6bba2017afb3b Dave Chinner      2013-08-12  3359  	/*
bc56ad8c74b858 kaixuxia          2019-09-03  3360  	 * Check for expected e=
rrors before we dirty the transaction
bc56ad8c74b858 kaixuxia          2019-09-03  3361  	 * so we can return an =
error without a transaction abort.
f6bba2017afb3b Dave Chinner      2013-08-12  3362  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3363  	if (target_ip =3D=3D NU=
LL) {
f6bba2017afb3b Dave Chinner      2013-08-12  3364  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3365  		 * If there's no space=
 reservation, check the entry will
f6bba2017afb3b Dave Chinner      2013-08-12  3366  		 * fit before actually=
 inserting it.
f6bba2017afb3b Dave Chinner      2013-08-12  3367  		 */
94f3cad555d660 Eric Sandeen      2014-09-09  3368  		if (!spaceres) {
94f3cad555d660 Eric Sandeen      2014-09-09  3369  			error =3D xfs_dir_can=
enter(tp, target_dp, target_name);
f6bba2017afb3b Dave Chinner      2013-08-12  3370  			if (error)
445883e8133975 Dave Chinner      2015-03-25  3371  				goto out_trans_cance=
l;
94f3cad555d660 Eric Sandeen      2014-09-09  3372  		}
bc56ad8c74b858 kaixuxia          2019-09-03  3373  	} else {
bc56ad8c74b858 kaixuxia          2019-09-03  3374  		/*
bc56ad8c74b858 kaixuxia          2019-09-03  3375  		 * If target exists an=
d it's a directory, check that whether
bc56ad8c74b858 kaixuxia          2019-09-03  3376  		 * it can be destroyed.
bc56ad8c74b858 kaixuxia          2019-09-03  3377  		 */
bc56ad8c74b858 kaixuxia          2019-09-03  3378  		if (S_ISDIR(VFS_I(targ=
et_ip)->i_mode) &&
bc56ad8c74b858 kaixuxia          2019-09-03  3379  		    (!xfs_dir_isempty(=
target_ip) ||
bc56ad8c74b858 kaixuxia          2019-09-03  3380  		     (VFS_I(target_ip)=
->i_nlink > 2))) {
bc56ad8c74b858 kaixuxia          2019-09-03  3381  			error =3D -EEXIST;
bc56ad8c74b858 kaixuxia          2019-09-03  3382  			goto out_trans_cancel;
bc56ad8c74b858 kaixuxia          2019-09-03  3383  		}
bc56ad8c74b858 kaixuxia          2019-09-03  3384  	}
bc56ad8c74b858 kaixuxia          2019-09-03  3385  =

6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3386  	/*
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3387  	 * Lock the AGI buffers=
 we need to handle bumping the nlink of the
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3388  	 * whiteout inode off t=
he unlinked list and to handle dropping the
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3389  	 * nlink of the target =
inode.  Per locking order rules, do this in
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3390  	 * increasing AG order =
and before directory block allocation tries to
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3391  	 * grab AGFs because we=
 grab AGIs before AGFs.
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3392  	 *
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3393  	 * The (vfs) caller mus=
t ensure that if src is a directory then
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3394  	 * target_ip is either =
null or an empty directory.
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3395  	 */
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3396  	for (i =3D 0; i < num_i=
nodes && inodes[i] !=3D NULL; i++) {
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3397  		if (inodes[i] =3D=3D w=
ip ||
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3398  		    (inodes[i] =3D=3D =
target_ip &&
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3399  		     (VFS_I(target_ip)=
->i_nlink =3D=3D 1 || src_is_directory))) {
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3400  			struct xfs_buf	*bp;
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3401  			xfs_agnumber_t	agno;
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3402  =

6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3403  			agno =3D XFS_INO_TO_A=
GNO(mp, inodes[i]->i_ino);
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3404  			error =3D xfs_read_ag=
i(mp, tp, agno, &bp);
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3405  			if (error)
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3406  				goto out_trans_cance=
l;
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3407  		}
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3408  	}
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3409  =

bc56ad8c74b858 kaixuxia          2019-09-03  3410  	/*
bc56ad8c74b858 kaixuxia          2019-09-03  3411  	 * Directory entry crea=
tion below may acquire the AGF. Remove
bc56ad8c74b858 kaixuxia          2019-09-03  3412  	 * the whiteout from th=
e unlinked list first to preserve correct
bc56ad8c74b858 kaixuxia          2019-09-03  3413  	 * AGI/AGF locking orde=
r. This dirties the transaction so failures
bc56ad8c74b858 kaixuxia          2019-09-03  3414  	 * after this point wil=
l abort and log recovery will clean up the
bc56ad8c74b858 kaixuxia          2019-09-03  3415  	 * mess.
bc56ad8c74b858 kaixuxia          2019-09-03  3416  	 *
bc56ad8c74b858 kaixuxia          2019-09-03  3417  	 * For whiteouts, we ne=
ed to bump the link count on the whiteout
bc56ad8c74b858 kaixuxia          2019-09-03  3418  	 * inode. After this po=
int, we have a real link, clear the tmpfile
bc56ad8c74b858 kaixuxia          2019-09-03  3419  	 * state flag from the =
inode so it doesn't accidentally get misused
bc56ad8c74b858 kaixuxia          2019-09-03  3420  	 * in future.
bc56ad8c74b858 kaixuxia          2019-09-03  3421  	 */
bc56ad8c74b858 kaixuxia          2019-09-03  3422  	if (wip) {
f40aadb2bb64fe Dave Chinner      2021-06-02  3423  		struct xfs_perag	*pag;
f40aadb2bb64fe Dave Chinner      2021-06-02  3424  =

bc56ad8c74b858 kaixuxia          2019-09-03  3425  		ASSERT(VFS_I(wip)->i_n=
link =3D=3D 0);
f40aadb2bb64fe Dave Chinner      2021-06-02  3426  =

f40aadb2bb64fe Dave Chinner      2021-06-02  3427  		pag =3D xfs_perag_get(=
mp, XFS_INO_TO_AGNO(mp, wip->i_ino));
f40aadb2bb64fe Dave Chinner      2021-06-02  3428  		error =3D xfs_iunlink_=
remove(tp, pag, wip);
f40aadb2bb64fe Dave Chinner      2021-06-02  3429  		xfs_perag_put(pag);
bc56ad8c74b858 kaixuxia          2019-09-03  3430  		if (error)
bc56ad8c74b858 kaixuxia          2019-09-03  3431  			goto out_trans_cancel;
bc56ad8c74b858 kaixuxia          2019-09-03  3432  =

bc56ad8c74b858 kaixuxia          2019-09-03  3433  		xfs_bumplink(tp, wip);
bc56ad8c74b858 kaixuxia          2019-09-03  3434  		VFS_I(wip)->i_state &=
=3D ~I_LINKABLE;
bc56ad8c74b858 kaixuxia          2019-09-03  3435  	}
bc56ad8c74b858 kaixuxia          2019-09-03  3436  =

bc56ad8c74b858 kaixuxia          2019-09-03  3437  	/*
bc56ad8c74b858 kaixuxia          2019-09-03  3438  	 * Set up the target.
bc56ad8c74b858 kaixuxia          2019-09-03  3439  	 */
bc56ad8c74b858 kaixuxia          2019-09-03  3440  	if (target_ip =3D=3D NU=
LL) {
f6bba2017afb3b Dave Chinner      2013-08-12  3441  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3442  		 * If target does not =
exist and the rename crosses
f6bba2017afb3b Dave Chinner      2013-08-12  3443  		 * directories, adjust=
 the target directory link count
f6bba2017afb3b Dave Chinner      2013-08-12  3444  		 * to account for the =
".." reference from the new entry.
f6bba2017afb3b Dave Chinner      2013-08-12  3445  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3446  		error =3D xfs_dir_crea=
tename(tp, target_dp, target_name,
548859ddf49f8d Allison Henderson 2022-03-22  3447  					   src_ip->i_ino, s=
paceres, &new_diroffset);
f6bba2017afb3b Dave Chinner      2013-08-12  3448  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3449  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3450  =

f6bba2017afb3b Dave Chinner      2013-08-12  3451  		xfs_trans_ichgtime(tp,=
 target_dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3452  					XFS_ICHGTIME_MOD | =
XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3453  =

f6bba2017afb3b Dave Chinner      2013-08-12  3454  		if (new_parent && src_=
is_directory) {
910832697cf855 Eric Sandeen      2019-05-01  3455  			xfs_bumplink(tp, targ=
et_dp);
f6bba2017afb3b Dave Chinner      2013-08-12  3456  		}
f6bba2017afb3b Dave Chinner      2013-08-12  3457  	} else { /* target_ip !=
=3D NULL */
f6bba2017afb3b Dave Chinner      2013-08-12  3458  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3459  		 * Link the source ino=
de under the target name.
f6bba2017afb3b Dave Chinner      2013-08-12  3460  		 * If the source inode=
 is a directory and we are moving
f6bba2017afb3b Dave Chinner      2013-08-12  3461  		 * it across directori=
es, its ".." entry will be
f6bba2017afb3b Dave Chinner      2013-08-12  3462  		 * inconsistent until =
we replace that down below.
f6bba2017afb3b Dave Chinner      2013-08-12  3463  		 *
f6bba2017afb3b Dave Chinner      2013-08-12  3464  		 * In case there is al=
ready an entry with the same
f6bba2017afb3b Dave Chinner      2013-08-12  3465  		 * name at the destina=
tion directory, remove it first.
f6bba2017afb3b Dave Chinner      2013-08-12  3466  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3467  		error =3D xfs_dir_repl=
ace(tp, target_dp, target_name,
548859ddf49f8d Allison Henderson 2022-03-22  3468  					src_ip->i_ino, spac=
eres, &new_diroffset);
f6bba2017afb3b Dave Chinner      2013-08-12  3469  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3470  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3471  =

f6bba2017afb3b Dave Chinner      2013-08-12  3472  		xfs_trans_ichgtime(tp,=
 target_dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3473  					XFS_ICHGTIME_MOD | =
XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3474  =

f6bba2017afb3b Dave Chinner      2013-08-12  3475  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3476  		 * Decrement the link =
count on the target since the target
f6bba2017afb3b Dave Chinner      2013-08-12  3477  		 * dir no longer point=
s to it.
f6bba2017afb3b Dave Chinner      2013-08-12  3478  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3479  		error =3D xfs_droplink=
(tp, target_ip);
f6bba2017afb3b Dave Chinner      2013-08-12  3480  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3481  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3482  =

f6bba2017afb3b Dave Chinner      2013-08-12  3483  		if (src_is_directory) {
f6bba2017afb3b Dave Chinner      2013-08-12  3484  			/*
f6bba2017afb3b Dave Chinner      2013-08-12  3485  			 * Drop the link from=
 the old "." entry.
f6bba2017afb3b Dave Chinner      2013-08-12  3486  			 */
f6bba2017afb3b Dave Chinner      2013-08-12  3487  			error =3D xfs_droplin=
k(tp, target_ip);
f6bba2017afb3b Dave Chinner      2013-08-12  3488  			if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3489  				goto out_trans_cance=
l;
f6bba2017afb3b Dave Chinner      2013-08-12  3490  		}
f6bba2017afb3b Dave Chinner      2013-08-12  3491  	} /* target_ip !=3D NUL=
L */
f6bba2017afb3b Dave Chinner      2013-08-12  3492  =

f6bba2017afb3b Dave Chinner      2013-08-12  3493  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3494  	 * Remove the source.
f6bba2017afb3b Dave Chinner      2013-08-12  3495  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3496  	if (new_parent && src_i=
s_directory) {
f6bba2017afb3b Dave Chinner      2013-08-12  3497  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3498  		 * Rewrite the ".." en=
try to point to the new
f6bba2017afb3b Dave Chinner      2013-08-12  3499  		 * directory.
f6bba2017afb3b Dave Chinner      2013-08-12  3500  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3501  		error =3D xfs_dir_repl=
ace(tp, src_ip, &xfs_name_dotdot,
548859ddf49f8d Allison Henderson 2022-03-22  3502  					target_dp->i_ino, s=
paceres, &new_diroffset);
2451337dd04390 Dave Chinner      2014-06-25  3503  		ASSERT(error !=3D -EEX=
IST);
f6bba2017afb3b Dave Chinner      2013-08-12  3504  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3505  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3506  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3507  =

f6bba2017afb3b Dave Chinner      2013-08-12  3508  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3509  	 * We always want to hi=
t the ctime on the source inode.
f6bba2017afb3b Dave Chinner      2013-08-12  3510  	 *
f6bba2017afb3b Dave Chinner      2013-08-12  3511  	 * This isn't strictly =
required by the standards since the source
f6bba2017afb3b Dave Chinner      2013-08-12  3512  	 * inode isn't really b=
eing changed, but old unix file systems did
f6bba2017afb3b Dave Chinner      2013-08-12  3513  	 * it and some incremen=
tal backup programs won't work without it.
f6bba2017afb3b Dave Chinner      2013-08-12  3514  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3515  	xfs_trans_ichgtime(tp, =
src_ip, XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3516  	xfs_trans_log_inode(tp,=
 src_ip, XFS_ILOG_CORE);
f6bba2017afb3b Dave Chinner      2013-08-12  3517  =

f6bba2017afb3b Dave Chinner      2013-08-12  3518  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3519  	 * Adjust the link coun=
t on src_dp.  This is necessary when
f6bba2017afb3b Dave Chinner      2013-08-12  3520  	 * renaming a directory=
, either within one parent when
f6bba2017afb3b Dave Chinner      2013-08-12  3521  	 * the target existed, =
or across two parent directories.
f6bba2017afb3b Dave Chinner      2013-08-12  3522  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3523  	if (src_is_directory &&=
 (new_parent || target_ip !=3D NULL)) {
f6bba2017afb3b Dave Chinner      2013-08-12  3524  =

f6bba2017afb3b Dave Chinner      2013-08-12  3525  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3526  		 * Decrement link coun=
t on src_directory since the
f6bba2017afb3b Dave Chinner      2013-08-12  3527  		 * entry that's moved =
no longer points to it.
f6bba2017afb3b Dave Chinner      2013-08-12  3528  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3529  		error =3D xfs_droplink=
(tp, src_dp);
f6bba2017afb3b Dave Chinner      2013-08-12  3530  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3531  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3532  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3533  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3534  	/*
7dcf5c3e4527cf Dave Chinner      2015-03-25  3535  	 * For whiteouts, we on=
ly need to update the source dirent with the
7dcf5c3e4527cf Dave Chinner      2015-03-25  3536  	 * inode number of the =
whiteout inode rather than removing it
7dcf5c3e4527cf Dave Chinner      2015-03-25  3537  	 * altogether.
7dcf5c3e4527cf Dave Chinner      2015-03-25  3538  	 */
49076df67754f5 Chandan Babu R    2022-04-11  3539  	if (wip)
7dcf5c3e4527cf Dave Chinner      2015-03-25  3540  		error =3D xfs_dir_repl=
ace(tp, src_dp, src_name, wip->i_ino,
548859ddf49f8d Allison Henderson 2022-03-22  3541  					spaceres, &old_diro=
ffset);
49076df67754f5 Chandan Babu R    2022-04-11  3542  	else
f6bba2017afb3b Dave Chinner      2013-08-12  3543  		error =3D xfs_dir_remo=
vename(tp, src_dp, src_name, src_ip->i_ino,
548859ddf49f8d Allison Henderson 2022-03-22  3544  					   spaceres, &old_d=
iroffset);
548859ddf49f8d Allison Henderson 2022-03-22  3545  =

548859ddf49f8d Allison Henderson 2022-03-22  3546  	if (error)
548859ddf49f8d Allison Henderson 2022-03-22  3547  		goto out_trans_cancel;
548859ddf49f8d Allison Henderson 2022-03-22  3548  =

548859ddf49f8d Allison Henderson 2022-03-22  3549  out_pptr:
548859ddf49f8d Allison Henderson 2022-03-22  3550  	if (xfs_sb_version_hasp=
arent(&mp->m_sb)) {
548859ddf49f8d Allison Henderson 2022-03-22  3551  		new_args.trans	=3D tp;
548859ddf49f8d Allison Henderson 2022-03-22 @3552  		xfs_init_parent_name_r=
ec(&new_rec, target_dp, new_diroffset);
548859ddf49f8d Allison Henderson 2022-03-22  3553  		new_args.hashval =3D x=
fs_da_hashname(new_args.name,
548859ddf49f8d Allison Henderson 2022-03-22  3554  						   new_args.namele=
n);
548859ddf49f8d Allison Henderson 2022-03-22  3555  		error =3D  xfs_attr_de=
fer_add(&new_args);
548859ddf49f8d Allison Henderson 2022-03-22  3556  		if (error)
548859ddf49f8d Allison Henderson 2022-03-22  3557  			goto out_trans_cancel;
02092a2f034fde Chandan Babu R    2021-01-22  3558  =

548859ddf49f8d Allison Henderson 2022-03-22  3559  		old_args.trans	=3D tp;
548859ddf49f8d Allison Henderson 2022-03-22 @3560  		xfs_init_parent_name_r=
ec(&old_rec, src_dp, old_diroffset);
548859ddf49f8d Allison Henderson 2022-03-22  3561  		old_args.hashval =3D x=
fs_da_hashname(old_args.name,
548859ddf49f8d Allison Henderson 2022-03-22  3562  						   old_args.namele=
n);
548859ddf49f8d Allison Henderson 2022-03-22  3563  		error =3D xfs_attr_def=
er_remove(&old_args);
f6bba2017afb3b Dave Chinner      2013-08-12  3564  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3565  			goto out_trans_cancel;
548859ddf49f8d Allison Henderson 2022-03-22  3566  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3567  =

f6bba2017afb3b Dave Chinner      2013-08-12  3568  	xfs_trans_ichgtime(tp, =
src_dp, XFS_ICHGTIME_MOD | XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3569  	xfs_trans_log_inode(tp,=
 src_dp, XFS_ILOG_CORE);
f6bba2017afb3b Dave Chinner      2013-08-12  3570  	if (new_parent)
f6bba2017afb3b Dave Chinner      2013-08-12  3571  		xfs_trans_log_inode(tp=
, target_dp, XFS_ILOG_CORE);
f6bba2017afb3b Dave Chinner      2013-08-12  3572  =

c9cfdb38117217 Brian Foster      2018-07-11  3573  	error =3D xfs_finish_re=
name(tp);
548859ddf49f8d Allison Henderson 2022-03-22  3574  =

548859ddf49f8d Allison Henderson 2022-03-22  3575  out_unlock:
7dcf5c3e4527cf Dave Chinner      2015-03-25  3576  	if (wip)
44a8736bd20a08 Darrick J. Wong   2018-07-25  3577  		xfs_irele(wip);
548859ddf49f8d Allison Henderson 2022-03-22  3578  	if (wip)
548859ddf49f8d Allison Henderson 2022-03-22  3579  		xfs_iunlock(wip, XFS_I=
LOCK_EXCL);
548859ddf49f8d Allison Henderson 2022-03-22  3580  	if (target_ip)
548859ddf49f8d Allison Henderson 2022-03-22  3581  		xfs_iunlock(target_ip,=
 XFS_ILOCK_EXCL);
548859ddf49f8d Allison Henderson 2022-03-22  3582  	xfs_iunlock(src_ip, XFS=
_ILOCK_EXCL);
548859ddf49f8d Allison Henderson 2022-03-22  3583  	if (new_parent)
548859ddf49f8d Allison Henderson 2022-03-22  3584  		xfs_iunlock(target_dp,=
 XFS_ILOCK_EXCL);
548859ddf49f8d Allison Henderson 2022-03-22  3585  	xfs_iunlock(src_dp, XFS=
_ILOCK_EXCL);
548859ddf49f8d Allison Henderson 2022-03-22  3586  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3587  	return error;
f6bba2017afb3b Dave Chinner      2013-08-12  3588  =

445883e8133975 Dave Chinner      2015-03-25  3589  out_trans_cancel:
4906e21545814e Christoph Hellwig 2015-06-04  3590  	xfs_trans_cancel(tp);
548859ddf49f8d Allison Henderson 2022-03-22  3591  drop_incompat:
548859ddf49f8d Allison Henderson 2022-03-22  3592  	if (xfs_has_larp(mp))
548859ddf49f8d Allison Henderson 2022-03-22  3593  		xlog_drop_incompat_fea=
t(mp->m_log);
253f4911f297b8 Christoph Hellwig 2016-04-06  3594  out_release_wip:
7dcf5c3e4527cf Dave Chinner      2015-03-25  3595  	if (wip)
44a8736bd20a08 Darrick J. Wong   2018-07-25  3596  		xfs_irele(wip);
41667260bc84db Darrick J. Wong   2022-03-09  3597  	if (error =3D=3D -ENOSP=
C && nospace_error)
41667260bc84db Darrick J. Wong   2022-03-09  3598  		error =3D nospace_erro=
r;
f6bba2017afb3b Dave Chinner      2013-08-12  3599  	return error;
f6bba2017afb3b Dave Chinner      2013-08-12  3600  }
f6bba2017afb3b Dave Chinner      2013-08-12  3601  =


:::::: The code at line 3552 was first introduced by commit
:::::: 548859ddf49f8d7ffcec57c0d9fd0b0046fcdb8b xfs: Add parent pointers to=
 rename

:::::: TO: Allison Henderson <allison.henderson@oracle.com>
:::::: CC: Allison Henderson <allison.henderson@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0430890979135546209==--

