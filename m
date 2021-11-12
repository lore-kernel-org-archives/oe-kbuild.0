Content-Type: multipart/mixed; boundary="===============2977307748210948351=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [allisonhenderson-xfs-work:refs/heads/pptrs_restart130 27/32] fs/xfs/xfs_inode.c:3578 xfs_rename() error: uninitialized symbol 'new_diroffset'.
Date: Fri, 12 Nov 2021 15:53:31 +0800
Message-ID: <202111121516.v6Q9cnX5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2977307748210948351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Allison Henderson <allison.henderson@oracle.com>
CC: Mark Tinguely <tinguely@sgi.com>
CC: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://github.com/allisonhenderson/xfs_work.git refs/heads/pptrs_r=
estart130
head:   81b586ed999042613d6e120407086764e8ebf095
commit: b867e03dc38883e100333f7bf7a9619810458acd [27/32] xfs: Add the paren=
t pointer support to the  superblock version 5.
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-m031-20211103 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/xfs/xfs_inode.c:3578 xfs_rename() error: uninitialized symbol 'new_dirof=
fset'.
fs/xfs/xfs_inode.c:3586 xfs_rename() error: uninitialized symbol 'old_dirof=
fset'.

vim +/new_diroffset +3578 fs/xfs/xfs_inode.c

7dcf5c3e4527cf Dave Chinner      2015-03-25  3207  =

f6bba2017afb3b Dave Chinner      2013-08-12  3208  /*
f6bba2017afb3b Dave Chinner      2013-08-12  3209   * xfs_rename
f6bba2017afb3b Dave Chinner      2013-08-12  3210   */
f6bba2017afb3b Dave Chinner      2013-08-12  3211  int
f6bba2017afb3b Dave Chinner      2013-08-12  3212  xfs_rename(
f736d93d76d3e9 Christoph Hellwig 2021-01-21  3213  	struct user_namespace		=
*mnt_userns,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3214  	struct xfs_inode		*src_=
dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3215  	struct xfs_name			*src_=
name,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3216  	struct xfs_inode		*src_=
ip,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3217  	struct xfs_inode		*targ=
et_dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3218  	struct xfs_name			*targ=
et_name,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3219  	struct xfs_inode		*targ=
et_ip,
d31a1825450062 Carlos Maiolino   2014-12-24  3220  	unsigned int			flags)
f6bba2017afb3b Dave Chinner      2013-08-12  3221  {
7dcf5c3e4527cf Dave Chinner      2015-03-25  3222  	struct xfs_mount		*mp =
=3D src_dp->i_mount;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3223  	struct xfs_trans		*tp;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3224  	struct xfs_inode		*wip =
=3D NULL;		/* whiteout inode */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3225  	struct xfs_inode		*inod=
es[__XFS_SORT_INODES];
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3226  	int				i;
95afcf5c7bca93 Dave Chinner      2015-03-25  3227  	int				num_inodes =3D _=
_XFS_SORT_INODES;
2b93681f593577 Dave Chinner      2015-03-25  3228  	bool				new_parent =3D =
(src_dp !=3D target_dp);
c19b3b05ae440d Dave Chinner      2016-02-09  3229  	bool				src_is_director=
y =3D S_ISDIR(VFS_I(src_ip)->i_mode);
f6bba2017afb3b Dave Chinner      2013-08-12  3230  	int				spaceres;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3231  	int				error;
26259f90cd074a Allison Henderson 2021-03-24  3232  	struct xfs_parent_name_=
rec	new_rec;
26259f90cd074a Allison Henderson 2021-03-24  3233  	struct xfs_parent_name_=
rec	old_rec;
26259f90cd074a Allison Henderson 2021-03-24  3234  	xfs_dir2_dataptr_t		new=
_diroffset;
26259f90cd074a Allison Henderson 2021-03-24  3235  	xfs_dir2_dataptr_t		old=
_diroffset;
26259f90cd074a Allison Henderson 2021-03-24  3236  	struct xfs_da_args		new=
_args =3D {
26259f90cd074a Allison Henderson 2021-03-24  3237  		.dp		=3D src_ip,
26259f90cd074a Allison Henderson 2021-03-24  3238  		.geo		=3D mp->m_attr_g=
eo,
26259f90cd074a Allison Henderson 2021-03-24  3239  		.whichfork	=3D XFS_ATT=
R_FORK,
26259f90cd074a Allison Henderson 2021-03-24  3240  		.attr_filter	=3D XFS_A=
TTR_PARENT,
26259f90cd074a Allison Henderson 2021-03-24  3241  		.op_flags	=3D XFS_DA_O=
P_OKNOENT,
26259f90cd074a Allison Henderson 2021-03-24  3242  		.name		=3D (const uint=
8_t *)&new_rec,
26259f90cd074a Allison Henderson 2021-03-24  3243  		.namelen	=3D sizeof(ne=
w_rec),
26259f90cd074a Allison Henderson 2021-03-24  3244  		.value		=3D (void *)ta=
rget_name->name,
26259f90cd074a Allison Henderson 2021-03-24  3245  		.valuelen	=3D target_n=
ame->len,
26259f90cd074a Allison Henderson 2021-03-24  3246  	};
26259f90cd074a Allison Henderson 2021-03-24  3247  	struct xfs_da_args		old=
_args =3D {
26259f90cd074a Allison Henderson 2021-03-24  3248  		.dp		=3D src_ip,
26259f90cd074a Allison Henderson 2021-03-24  3249  		.geo		=3D mp->m_attr_g=
eo,
26259f90cd074a Allison Henderson 2021-03-24  3250  		.whichfork	=3D XFS_ATT=
R_FORK,
26259f90cd074a Allison Henderson 2021-03-24  3251  		.attr_filter	=3D XFS_A=
TTR_PARENT,
26259f90cd074a Allison Henderson 2021-03-24  3252  		.op_flags	=3D XFS_DA_O=
P_OKNOENT,
26259f90cd074a Allison Henderson 2021-03-24  3253  		.name		=3D (const uint=
8_t *)&old_rec,
26259f90cd074a Allison Henderson 2021-03-24  3254  		.namelen	=3D sizeof(ol=
d_rec),
26259f90cd074a Allison Henderson 2021-03-24  3255  		.value		=3D NULL,
26259f90cd074a Allison Henderson 2021-03-24  3256  		.valuelen	=3D 0,
26259f90cd074a Allison Henderson 2021-03-24  3257  	};
f6bba2017afb3b Dave Chinner      2013-08-12  3258  =

f6bba2017afb3b Dave Chinner      2013-08-12  3259  	trace_xfs_rename(src_dp=
, target_dp, src_name, target_name);
f6bba2017afb3b Dave Chinner      2013-08-12  3260  =

eeacd3217b8fa8 Dave Chinner      2015-03-25  3261  	if ((flags & RENAME_EXC=
HANGE) && !target_ip)
eeacd3217b8fa8 Dave Chinner      2015-03-25  3262  		return -EINVAL;
eeacd3217b8fa8 Dave Chinner      2015-03-25  3263  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3264  	/*
7dcf5c3e4527cf Dave Chinner      2015-03-25  3265  	 * If we are doing a wh=
iteout operation, allocate the whiteout inode
7dcf5c3e4527cf Dave Chinner      2015-03-25  3266  	 * we will be placing a=
t the target and ensure the type is set
7dcf5c3e4527cf Dave Chinner      2015-03-25  3267  	 * appropriately.
7dcf5c3e4527cf Dave Chinner      2015-03-25  3268  	 */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3269  	if (flags & RENAME_WHIT=
EOUT) {
7dcf5c3e4527cf Dave Chinner      2015-03-25  3270  		ASSERT(!(flags & (RENA=
ME_NOREPLACE | RENAME_EXCHANGE)));
f736d93d76d3e9 Christoph Hellwig 2021-01-21  3271  		error =3D xfs_rename_a=
lloc_whiteout(mnt_userns, target_dp, &wip);
7dcf5c3e4527cf Dave Chinner      2015-03-25  3272  		if (error)
7dcf5c3e4527cf Dave Chinner      2015-03-25  3273  			return error;
f6bba2017afb3b Dave Chinner      2013-08-12  3274  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3275  		/* setup target dirent=
 info as whiteout */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3276  		src_name->type =3D XFS=
_DIR3_FT_CHRDEV;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3277  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3278  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3279  	xfs_sort_for_rename(src=
_dp, target_dp, src_ip, target_ip, wip,
f6bba2017afb3b Dave Chinner      2013-08-12  3280  				inodes, &num_inodes);
26259f90cd074a Allison Henderson 2021-03-24  3281  	if (xfs_has_larp(mp)) {
26259f90cd074a Allison Henderson 2021-03-24  3282  		error =3D xfs_attr_use=
_log_assist(mp);
26259f90cd074a Allison Henderson 2021-03-24  3283  		if (error)
26259f90cd074a Allison Henderson 2021-03-24  3284  			goto out_release_wip;
26259f90cd074a Allison Henderson 2021-03-24  3285  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3286  =

f6bba2017afb3b Dave Chinner      2013-08-12  3287  	spaceres =3D XFS_RENAME=
_SPACE_RES(mp, target_name->len);
253f4911f297b8 Christoph Hellwig 2016-04-06  3288  	error =3D xfs_trans_all=
oc(mp, &M_RES(mp)->tr_rename, spaceres, 0, 0, &tp);
2451337dd04390 Dave Chinner      2014-06-25  3289  	if (error =3D=3D -ENOSP=
C) {
f6bba2017afb3b Dave Chinner      2013-08-12  3290  		spaceres =3D 0;
253f4911f297b8 Christoph Hellwig 2016-04-06  3291  		error =3D xfs_trans_al=
loc(mp, &M_RES(mp)->tr_rename, 0, 0, 0,
253f4911f297b8 Christoph Hellwig 2016-04-06  3292  				&tp);
f6bba2017afb3b Dave Chinner      2013-08-12  3293  	}
445883e8133975 Dave Chinner      2015-03-25  3294  	if (error)
26259f90cd074a Allison Henderson 2021-03-24  3295  		goto drop_incompat;
f6bba2017afb3b Dave Chinner      2013-08-12  3296  =

f6bba2017afb3b Dave Chinner      2013-08-12  3297  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3298  	 * Attach the dquots to=
 the inodes
f6bba2017afb3b Dave Chinner      2013-08-12  3299  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3300  	error =3D xfs_qm_vop_re=
name_dqattach(inodes);
445883e8133975 Dave Chinner      2015-03-25  3301  	if (error)
445883e8133975 Dave Chinner      2015-03-25  3302  		goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3303  =

f6bba2017afb3b Dave Chinner      2013-08-12  3304  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3305  	 * Lock all the partici=
pating inodes. Depending upon whether
f6bba2017afb3b Dave Chinner      2013-08-12  3306  	 * the target_name exis=
ts in the target directory, and
f6bba2017afb3b Dave Chinner      2013-08-12  3307  	 * whether the target d=
irectory is the same as the source
f6bba2017afb3b Dave Chinner      2013-08-12  3308  	 * directory, we can lo=
ck from 2 to 4 inodes.
f6bba2017afb3b Dave Chinner      2013-08-12  3309  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3310  	xfs_lock_inodes(inodes,=
 num_inodes, XFS_ILOCK_EXCL);
f6bba2017afb3b Dave Chinner      2013-08-12  3311  =

f6bba2017afb3b Dave Chinner      2013-08-12  3312  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3313  	 * Join all the inodes =
to the transaction. From this point on,
f6bba2017afb3b Dave Chinner      2013-08-12  3314  	 * we can rely on eithe=
r trans_commit or trans_cancel to unlock
f6bba2017afb3b Dave Chinner      2013-08-12  3315  	 * them.
f6bba2017afb3b Dave Chinner      2013-08-12  3316  	 */
26259f90cd074a Allison Henderson 2021-03-24  3317  	xfs_trans_ijoin(tp, src=
_dp, 0);
f6bba2017afb3b Dave Chinner      2013-08-12  3318  	if (new_parent)
26259f90cd074a Allison Henderson 2021-03-24  3319  		xfs_trans_ijoin(tp, ta=
rget_dp, 0);
26259f90cd074a Allison Henderson 2021-03-24  3320  	xfs_trans_ijoin(tp, src=
_ip, 0);
f6bba2017afb3b Dave Chinner      2013-08-12  3321  	if (target_ip)
26259f90cd074a Allison Henderson 2021-03-24  3322  		xfs_trans_ijoin(tp, ta=
rget_ip, 0);
7dcf5c3e4527cf Dave Chinner      2015-03-25  3323  	if (wip)
26259f90cd074a Allison Henderson 2021-03-24  3324  		xfs_trans_ijoin(tp, wi=
p, 0);
f6bba2017afb3b Dave Chinner      2013-08-12  3325  =

f6bba2017afb3b Dave Chinner      2013-08-12  3326  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3327  	 * If we are using proj=
ect inheritance, we only allow renames
f6bba2017afb3b Dave Chinner      2013-08-12  3328  	 * into our tree when t=
he project IDs are the same; else the
f6bba2017afb3b Dave Chinner      2013-08-12  3329  	 * tree quota mechanism=
 would be circumvented.
f6bba2017afb3b Dave Chinner      2013-08-12  3330  	 */
db07349da2f564 Christoph Hellwig 2021-03-29  3331  	if (unlikely((target_dp=
->i_diflags & XFS_DIFLAG_PROJINHERIT) &&
ceaf603c7024d3 Christoph Hellwig 2021-03-29  3332  		     target_dp->i_proj=
id !=3D src_ip->i_projid)) {
2451337dd04390 Dave Chinner      2014-06-25  3333  		error =3D -EXDEV;
26259f90cd074a Allison Henderson 2021-03-24  3334  		goto out_unlock;
f6bba2017afb3b Dave Chinner      2013-08-12  3335  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3336  =

eeacd3217b8fa8 Dave Chinner      2015-03-25  3337  	/* RENAME_EXCHANGE is u=
nique from here on. */
26259f90cd074a Allison Henderson 2021-03-24  3338  	if (flags & RENAME_EXCH=
ANGE) {
26259f90cd074a Allison Henderson 2021-03-24  3339  		error =3D xfs_cross_re=
name(tp, src_dp, src_name, src_ip,
d31a1825450062 Carlos Maiolino   2014-12-24  3340  					target_dp, target_n=
ame, target_ip,
f16dea54b789aa Brian Foster      2018-07-11  3341  					spaceres);
26259f90cd074a Allison Henderson 2021-03-24  3342  		goto out_pptr;
26259f90cd074a Allison Henderson 2021-03-24  3343  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3344  	/*
bc56ad8c74b858 kaixuxia          2019-09-03  3345  	 * Check for expected e=
rrors before we dirty the transaction
bc56ad8c74b858 kaixuxia          2019-09-03  3346  	 * so we can return an =
error without a transaction abort.
02092a2f034fde Chandan Babu R    2021-01-22  3347  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3348  	 * Extent count overflo=
w check:
02092a2f034fde Chandan Babu R    2021-01-22  3349  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3350  	 * From the perspective=
 of src_dp, a rename operation is essentially a
02092a2f034fde Chandan Babu R    2021-01-22  3351  	 * directory entry remo=
ve operation. Hence the only place where we check
02092a2f034fde Chandan Babu R    2021-01-22  3352  	 * for extent count ove=
rflow for src_dp is in
02092a2f034fde Chandan Babu R    2021-01-22  3353  	 * xfs_bmap_del_extent_=
real(). xfs_bmap_del_extent_real() returns
02092a2f034fde Chandan Babu R    2021-01-22  3354  	 * -ENOSPC when it dete=
cts a possible extent count overflow and in
02092a2f034fde Chandan Babu R    2021-01-22  3355  	 * response, the higher=
 layers of directory handling code do the
02092a2f034fde Chandan Babu R    2021-01-22  3356  	 * following:
02092a2f034fde Chandan Babu R    2021-01-22  3357  	 * 1. Data/Free blocks:=
 XFS lets these blocks linger until a
02092a2f034fde Chandan Babu R    2021-01-22  3358  	 *    future remove ope=
ration removes them.
02092a2f034fde Chandan Babu R    2021-01-22  3359  	 * 2. Dabtree blocks: X=
FS swaps the blocks with the last block in the
02092a2f034fde Chandan Babu R    2021-01-22  3360  	 *    Leaf space and un=
maps the last block.
02092a2f034fde Chandan Babu R    2021-01-22  3361  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3362  	 * For target_dp, there=
 are two cases depending on whether the
02092a2f034fde Chandan Babu R    2021-01-22  3363  	 * destination director=
y entry exists or not.
02092a2f034fde Chandan Babu R    2021-01-22  3364  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3365  	 * When destination dir=
ectory entry does not exist (i.e. target_ip =3D=3D
02092a2f034fde Chandan Babu R    2021-01-22  3366  	 * NULL), extent count =
overflow check is performed only when transaction
02092a2f034fde Chandan Babu R    2021-01-22  3367  	 * has a non-zero sized=
 space reservation associated with it.  With a
02092a2f034fde Chandan Babu R    2021-01-22  3368  	 * zero-sized space res=
ervation, XFS allows a rename operation to
02092a2f034fde Chandan Babu R    2021-01-22  3369  	 * continue only when t=
he directory has sufficient free space in its
02092a2f034fde Chandan Babu R    2021-01-22  3370  	 * data/leaf/free space=
 blocks to hold the new entry.
02092a2f034fde Chandan Babu R    2021-01-22  3371  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3372  	 * When destination dir=
ectory entry exists (i.e. target_ip !=3D NULL), all
02092a2f034fde Chandan Babu R    2021-01-22  3373  	 * we need to do is cha=
nge the inode number associated with the already
02092a2f034fde Chandan Babu R    2021-01-22  3374  	 * existing entry. Henc=
e there is no need to perform an extent count
02092a2f034fde Chandan Babu R    2021-01-22  3375  	 * overflow check.
f6bba2017afb3b Dave Chinner      2013-08-12  3376  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3377  	if (target_ip =3D=3D NU=
LL) {
f6bba2017afb3b Dave Chinner      2013-08-12  3378  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3379  		 * If there's no space=
 reservation, check the entry will
f6bba2017afb3b Dave Chinner      2013-08-12  3380  		 * fit before actually=
 inserting it.
f6bba2017afb3b Dave Chinner      2013-08-12  3381  		 */
94f3cad555d660 Eric Sandeen      2014-09-09  3382  		if (!spaceres) {
94f3cad555d660 Eric Sandeen      2014-09-09  3383  			error =3D xfs_dir_can=
enter(tp, target_dp, target_name);
f6bba2017afb3b Dave Chinner      2013-08-12  3384  			if (error)
26259f90cd074a Allison Henderson 2021-03-24  3385  				goto out_unlock;
02092a2f034fde Chandan Babu R    2021-01-22  3386  		} else {
02092a2f034fde Chandan Babu R    2021-01-22  3387  			error =3D xfs_iext_co=
unt_may_overflow(target_dp,
02092a2f034fde Chandan Babu R    2021-01-22  3388  					XFS_DATA_FORK,
02092a2f034fde Chandan Babu R    2021-01-22  3389  					XFS_IEXT_DIR_MANIP_=
CNT(mp));
02092a2f034fde Chandan Babu R    2021-01-22  3390  			if (error)
02092a2f034fde Chandan Babu R    2021-01-22  3391  				goto out_trans_cance=
l;
94f3cad555d660 Eric Sandeen      2014-09-09  3392  		}
bc56ad8c74b858 kaixuxia          2019-09-03  3393  	} else {
bc56ad8c74b858 kaixuxia          2019-09-03  3394  		/*
bc56ad8c74b858 kaixuxia          2019-09-03  3395  		 * If target exists an=
d it's a directory, check that whether
bc56ad8c74b858 kaixuxia          2019-09-03  3396  		 * it can be destroyed.
bc56ad8c74b858 kaixuxia          2019-09-03  3397  		 */
bc56ad8c74b858 kaixuxia          2019-09-03  3398  		if (S_ISDIR(VFS_I(targ=
et_ip)->i_mode) &&
bc56ad8c74b858 kaixuxia          2019-09-03  3399  		    (!xfs_dir_isempty(=
target_ip) ||
bc56ad8c74b858 kaixuxia          2019-09-03  3400  		     (VFS_I(target_ip)=
->i_nlink > 2))) {
bc56ad8c74b858 kaixuxia          2019-09-03  3401  			error =3D -EEXIST;
bc56ad8c74b858 kaixuxia          2019-09-03  3402  			goto out_trans_cancel;
bc56ad8c74b858 kaixuxia          2019-09-03  3403  		}
bc56ad8c74b858 kaixuxia          2019-09-03  3404  	}
bc56ad8c74b858 kaixuxia          2019-09-03  3405  =

6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3406  	/*
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3407  	 * Lock the AGI buffers=
 we need to handle bumping the nlink of the
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3408  	 * whiteout inode off t=
he unlinked list and to handle dropping the
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3409  	 * nlink of the target =
inode.  Per locking order rules, do this in
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3410  	 * increasing AG order =
and before directory block allocation tries to
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3411  	 * grab AGFs because we=
 grab AGIs before AGFs.
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3412  	 *
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3413  	 * The (vfs) caller mus=
t ensure that if src is a directory then
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3414  	 * target_ip is either =
null or an empty directory.
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3415  	 */
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3416  	for (i =3D 0; i < num_i=
nodes && inodes[i] !=3D NULL; i++) {
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3417  		if (inodes[i] =3D=3D w=
ip ||
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3418  		    (inodes[i] =3D=3D =
target_ip &&
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3419  		     (VFS_I(target_ip)=
->i_nlink =3D=3D 1 || src_is_directory))) {
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3420  			struct xfs_buf	*bp;
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3421  			xfs_agnumber_t	agno;
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3422  =

6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3423  			agno =3D XFS_INO_TO_A=
GNO(mp, inodes[i]->i_ino);
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3424  			error =3D xfs_read_ag=
i(mp, tp, agno, &bp);
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3425  			if (error)
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3426  				goto out_trans_cance=
l;
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3427  		}
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3428  	}
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3429  =

bc56ad8c74b858 kaixuxia          2019-09-03  3430  	/*
bc56ad8c74b858 kaixuxia          2019-09-03  3431  	 * Directory entry crea=
tion below may acquire the AGF. Remove
bc56ad8c74b858 kaixuxia          2019-09-03  3432  	 * the whiteout from th=
e unlinked list first to preserve correct
bc56ad8c74b858 kaixuxia          2019-09-03  3433  	 * AGI/AGF locking orde=
r. This dirties the transaction so failures
bc56ad8c74b858 kaixuxia          2019-09-03  3434  	 * after this point wil=
l abort and log recovery will clean up the
bc56ad8c74b858 kaixuxia          2019-09-03  3435  	 * mess.
bc56ad8c74b858 kaixuxia          2019-09-03  3436  	 *
bc56ad8c74b858 kaixuxia          2019-09-03  3437  	 * For whiteouts, we ne=
ed to bump the link count on the whiteout
bc56ad8c74b858 kaixuxia          2019-09-03  3438  	 * inode. After this po=
int, we have a real link, clear the tmpfile
bc56ad8c74b858 kaixuxia          2019-09-03  3439  	 * state flag from the =
inode so it doesn't accidentally get misused
bc56ad8c74b858 kaixuxia          2019-09-03  3440  	 * in future.
bc56ad8c74b858 kaixuxia          2019-09-03  3441  	 */
bc56ad8c74b858 kaixuxia          2019-09-03  3442  	if (wip) {
f40aadb2bb64fe Dave Chinner      2021-06-02  3443  		struct xfs_perag	*pag;
f40aadb2bb64fe Dave Chinner      2021-06-02  3444  =

bc56ad8c74b858 kaixuxia          2019-09-03  3445  		ASSERT(VFS_I(wip)->i_n=
link =3D=3D 0);
f40aadb2bb64fe Dave Chinner      2021-06-02  3446  =

f40aadb2bb64fe Dave Chinner      2021-06-02  3447  		pag =3D xfs_perag_get(=
mp, XFS_INO_TO_AGNO(mp, wip->i_ino));
f40aadb2bb64fe Dave Chinner      2021-06-02  3448  		error =3D xfs_iunlink_=
remove(tp, pag, wip);
f40aadb2bb64fe Dave Chinner      2021-06-02  3449  		xfs_perag_put(pag);
bc56ad8c74b858 kaixuxia          2019-09-03  3450  		if (error)
bc56ad8c74b858 kaixuxia          2019-09-03  3451  			goto out_trans_cancel;
bc56ad8c74b858 kaixuxia          2019-09-03  3452  =

bc56ad8c74b858 kaixuxia          2019-09-03  3453  		xfs_bumplink(tp, wip);
bc56ad8c74b858 kaixuxia          2019-09-03  3454  		VFS_I(wip)->i_state &=
=3D ~I_LINKABLE;
bc56ad8c74b858 kaixuxia          2019-09-03  3455  	}
bc56ad8c74b858 kaixuxia          2019-09-03  3456  =

bc56ad8c74b858 kaixuxia          2019-09-03  3457  	/*
bc56ad8c74b858 kaixuxia          2019-09-03  3458  	 * Set up the target.
bc56ad8c74b858 kaixuxia          2019-09-03  3459  	 */
bc56ad8c74b858 kaixuxia          2019-09-03  3460  	if (target_ip =3D=3D NU=
LL) {
f6bba2017afb3b Dave Chinner      2013-08-12  3461  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3462  		 * If target does not =
exist and the rename crosses
f6bba2017afb3b Dave Chinner      2013-08-12  3463  		 * directories, adjust=
 the target directory link count
f6bba2017afb3b Dave Chinner      2013-08-12  3464  		 * to account for the =
".." reference from the new entry.
f6bba2017afb3b Dave Chinner      2013-08-12  3465  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3466  		error =3D xfs_dir_crea=
tename(tp, target_dp, target_name,
26259f90cd074a Allison Henderson 2021-03-24  3467  					   src_ip->i_ino, s=
paceres, &new_diroffset);
f6bba2017afb3b Dave Chinner      2013-08-12  3468  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3469  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3470  =

f6bba2017afb3b Dave Chinner      2013-08-12  3471  		xfs_trans_ichgtime(tp,=
 target_dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3472  					XFS_ICHGTIME_MOD | =
XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3473  =

f6bba2017afb3b Dave Chinner      2013-08-12  3474  		if (new_parent && src_=
is_directory) {
910832697cf855 Eric Sandeen      2019-05-01  3475  			xfs_bumplink(tp, targ=
et_dp);
f6bba2017afb3b Dave Chinner      2013-08-12  3476  		}
f6bba2017afb3b Dave Chinner      2013-08-12  3477  	} else { /* target_ip !=
=3D NULL */
f6bba2017afb3b Dave Chinner      2013-08-12  3478  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3479  		 * Link the source ino=
de under the target name.
f6bba2017afb3b Dave Chinner      2013-08-12  3480  		 * If the source inode=
 is a directory and we are moving
f6bba2017afb3b Dave Chinner      2013-08-12  3481  		 * it across directori=
es, its ".." entry will be
f6bba2017afb3b Dave Chinner      2013-08-12  3482  		 * inconsistent until =
we replace that down below.
f6bba2017afb3b Dave Chinner      2013-08-12  3483  		 *
f6bba2017afb3b Dave Chinner      2013-08-12  3484  		 * In case there is al=
ready an entry with the same
f6bba2017afb3b Dave Chinner      2013-08-12  3485  		 * name at the destina=
tion directory, remove it first.
f6bba2017afb3b Dave Chinner      2013-08-12  3486  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3487  		error =3D xfs_dir_repl=
ace(tp, target_dp, target_name,
26259f90cd074a Allison Henderson 2021-03-24  3488  					src_ip->i_ino, spac=
eres, &new_diroffset);
f6bba2017afb3b Dave Chinner      2013-08-12  3489  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3490  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3491  =

f6bba2017afb3b Dave Chinner      2013-08-12  3492  		xfs_trans_ichgtime(tp,=
 target_dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3493  					XFS_ICHGTIME_MOD | =
XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3494  =

f6bba2017afb3b Dave Chinner      2013-08-12  3495  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3496  		 * Decrement the link =
count on the target since the target
f6bba2017afb3b Dave Chinner      2013-08-12  3497  		 * dir no longer point=
s to it.
f6bba2017afb3b Dave Chinner      2013-08-12  3498  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3499  		error =3D xfs_droplink=
(tp, target_ip);
f6bba2017afb3b Dave Chinner      2013-08-12  3500  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3501  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3502  =

f6bba2017afb3b Dave Chinner      2013-08-12  3503  		if (src_is_directory) {
f6bba2017afb3b Dave Chinner      2013-08-12  3504  			/*
f6bba2017afb3b Dave Chinner      2013-08-12  3505  			 * Drop the link from=
 the old "." entry.
f6bba2017afb3b Dave Chinner      2013-08-12  3506  			 */
f6bba2017afb3b Dave Chinner      2013-08-12  3507  			error =3D xfs_droplin=
k(tp, target_ip);
f6bba2017afb3b Dave Chinner      2013-08-12  3508  			if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3509  				goto out_trans_cance=
l;
f6bba2017afb3b Dave Chinner      2013-08-12  3510  		}
f6bba2017afb3b Dave Chinner      2013-08-12  3511  	} /* target_ip !=3D NUL=
L */
f6bba2017afb3b Dave Chinner      2013-08-12  3512  =

f6bba2017afb3b Dave Chinner      2013-08-12  3513  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3514  	 * Remove the source.
f6bba2017afb3b Dave Chinner      2013-08-12  3515  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3516  	if (new_parent && src_i=
s_directory) {
f6bba2017afb3b Dave Chinner      2013-08-12  3517  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3518  		 * Rewrite the ".." en=
try to point to the new
f6bba2017afb3b Dave Chinner      2013-08-12  3519  		 * directory.
f6bba2017afb3b Dave Chinner      2013-08-12  3520  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3521  		error =3D xfs_dir_repl=
ace(tp, src_ip, &xfs_name_dotdot,
26259f90cd074a Allison Henderson 2021-03-24  3522  					target_dp->i_ino, s=
paceres, &new_diroffset);
2451337dd04390 Dave Chinner      2014-06-25  3523  		ASSERT(error !=3D -EEX=
IST);
f6bba2017afb3b Dave Chinner      2013-08-12  3524  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3525  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3526  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3527  =

f6bba2017afb3b Dave Chinner      2013-08-12  3528  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3529  	 * We always want to hi=
t the ctime on the source inode.
f6bba2017afb3b Dave Chinner      2013-08-12  3530  	 *
f6bba2017afb3b Dave Chinner      2013-08-12  3531  	 * This isn't strictly =
required by the standards since the source
f6bba2017afb3b Dave Chinner      2013-08-12  3532  	 * inode isn't really b=
eing changed, but old unix file systems did
f6bba2017afb3b Dave Chinner      2013-08-12  3533  	 * it and some incremen=
tal backup programs won't work without it.
f6bba2017afb3b Dave Chinner      2013-08-12  3534  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3535  	xfs_trans_ichgtime(tp, =
src_ip, XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3536  	xfs_trans_log_inode(tp,=
 src_ip, XFS_ILOG_CORE);
f6bba2017afb3b Dave Chinner      2013-08-12  3537  =

f6bba2017afb3b Dave Chinner      2013-08-12  3538  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3539  	 * Adjust the link coun=
t on src_dp.  This is necessary when
f6bba2017afb3b Dave Chinner      2013-08-12  3540  	 * renaming a directory=
, either within one parent when
f6bba2017afb3b Dave Chinner      2013-08-12  3541  	 * the target existed, =
or across two parent directories.
f6bba2017afb3b Dave Chinner      2013-08-12  3542  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3543  	if (src_is_directory &&=
 (new_parent || target_ip !=3D NULL)) {
f6bba2017afb3b Dave Chinner      2013-08-12  3544  =

f6bba2017afb3b Dave Chinner      2013-08-12  3545  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3546  		 * Decrement link coun=
t on src_directory since the
f6bba2017afb3b Dave Chinner      2013-08-12  3547  		 * entry that's moved =
no longer points to it.
f6bba2017afb3b Dave Chinner      2013-08-12  3548  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3549  		error =3D xfs_droplink=
(tp, src_dp);
f6bba2017afb3b Dave Chinner      2013-08-12  3550  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3551  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3552  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3553  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3554  	/*
7dcf5c3e4527cf Dave Chinner      2015-03-25  3555  	 * For whiteouts, we on=
ly need to update the source dirent with the
7dcf5c3e4527cf Dave Chinner      2015-03-25  3556  	 * inode number of the =
whiteout inode rather than removing it
7dcf5c3e4527cf Dave Chinner      2015-03-25  3557  	 * altogether.
7dcf5c3e4527cf Dave Chinner      2015-03-25  3558  	 */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3559  	if (wip) {
7dcf5c3e4527cf Dave Chinner      2015-03-25  3560  		error =3D xfs_dir_repl=
ace(tp, src_dp, src_name, wip->i_ino,
26259f90cd074a Allison Henderson 2021-03-24  3561  					spaceres, &old_diro=
ffset);
02092a2f034fde Chandan Babu R    2021-01-22  3562  	} else {
02092a2f034fde Chandan Babu R    2021-01-22  3563  		/*
02092a2f034fde Chandan Babu R    2021-01-22  3564  		 * NOTE: We don't need=
 to check for extent count overflow here
02092a2f034fde Chandan Babu R    2021-01-22  3565  		 * because the dir rem=
ove name code will leave the dir block in
02092a2f034fde Chandan Babu R    2021-01-22  3566  		 * place if the extent=
 count would overflow.
02092a2f034fde Chandan Babu R    2021-01-22  3567  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3568  		error =3D xfs_dir_remo=
vename(tp, src_dp, src_name, src_ip->i_ino,
26259f90cd074a Allison Henderson 2021-03-24  3569  					   spaceres, &old_d=
iroffset);
02092a2f034fde Chandan Babu R    2021-01-22  3570  	}
02092a2f034fde Chandan Babu R    2021-01-22  3571  =

f6bba2017afb3b Dave Chinner      2013-08-12  3572  	if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3573  		goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3574  =

26259f90cd074a Allison Henderson 2021-03-24  3575  out_pptr:
26259f90cd074a Allison Henderson 2021-03-24  3576  	if (xfs_sb_version_hasp=
arent(&mp->m_sb)) {
26259f90cd074a Allison Henderson 2021-03-24  3577  		new_args.trans	=3D tp;
26259f90cd074a Allison Henderson 2021-03-24 @3578  		xfs_init_parent_name_r=
ec(&new_rec, target_dp, new_diroffset);
26259f90cd074a Allison Henderson 2021-03-24  3579  		new_args.hashval =3D x=
fs_da_hashname(new_args.name,
26259f90cd074a Allison Henderson 2021-03-24  3580  						   new_args.namele=
n);
26259f90cd074a Allison Henderson 2021-03-24  3581  		error =3D  xfs_attr_se=
t_deferred(&new_args);
26259f90cd074a Allison Henderson 2021-03-24  3582  		if (error)
26259f90cd074a Allison Henderson 2021-03-24  3583  			goto out_trans_cancel;
26259f90cd074a Allison Henderson 2021-03-24  3584  =

26259f90cd074a Allison Henderson 2021-03-24  3585  		old_args.trans	=3D tp;
26259f90cd074a Allison Henderson 2021-03-24 @3586  		xfs_init_parent_name_r=
ec(&old_rec, src_dp, old_diroffset);
26259f90cd074a Allison Henderson 2021-03-24  3587  		old_args.hashval =3D x=
fs_da_hashname(old_args.name,
26259f90cd074a Allison Henderson 2021-03-24  3588  						   old_args.namele=
n);
26259f90cd074a Allison Henderson 2021-03-24  3589  		error =3D xfs_attr_rem=
ove_deferred(&old_args);
26259f90cd074a Allison Henderson 2021-03-24  3590  		if (error)
26259f90cd074a Allison Henderson 2021-03-24  3591  			goto out_trans_cancel;
26259f90cd074a Allison Henderson 2021-03-24  3592  	}
26259f90cd074a Allison Henderson 2021-03-24  3593  =

f6bba2017afb3b Dave Chinner      2013-08-12  3594  	xfs_trans_ichgtime(tp, =
src_dp, XFS_ICHGTIME_MOD | XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3595  	xfs_trans_log_inode(tp,=
 src_dp, XFS_ILOG_CORE);
f6bba2017afb3b Dave Chinner      2013-08-12  3596  	if (new_parent)
f6bba2017afb3b Dave Chinner      2013-08-12  3597  		xfs_trans_log_inode(tp=
, target_dp, XFS_ILOG_CORE);
f6bba2017afb3b Dave Chinner      2013-08-12  3598  =

c9cfdb38117217 Brian Foster      2018-07-11  3599  	error =3D xfs_finish_re=
name(tp);
26259f90cd074a Allison Henderson 2021-03-24  3600  =

26259f90cd074a Allison Henderson 2021-03-24  3601  out_unlock:
7dcf5c3e4527cf Dave Chinner      2015-03-25  3602  	if (wip)
44a8736bd20a08 Darrick J. Wong   2018-07-25  3603  		xfs_irele(wip);
26259f90cd074a Allison Henderson 2021-03-24  3604  	if (wip)
26259f90cd074a Allison Henderson 2021-03-24  3605  		xfs_iunlock(wip, XFS_I=
LOCK_EXCL);
26259f90cd074a Allison Henderson 2021-03-24  3606  	if (target_ip)
26259f90cd074a Allison Henderson 2021-03-24  3607  		xfs_iunlock(target_ip,=
 XFS_ILOCK_EXCL);
26259f90cd074a Allison Henderson 2021-03-24  3608  	xfs_iunlock(src_ip, XFS=
_ILOCK_EXCL);
26259f90cd074a Allison Henderson 2021-03-24  3609  	if (new_parent)
26259f90cd074a Allison Henderson 2021-03-24  3610  		xfs_iunlock(target_dp,=
 XFS_ILOCK_EXCL);
26259f90cd074a Allison Henderson 2021-03-24  3611  	xfs_iunlock(src_dp, XFS=
_ILOCK_EXCL);
26259f90cd074a Allison Henderson 2021-03-24  3612  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3613  	return error;
f6bba2017afb3b Dave Chinner      2013-08-12  3614  =

445883e8133975 Dave Chinner      2015-03-25  3615  out_trans_cancel:
4906e21545814e Christoph Hellwig 2015-06-04  3616  	xfs_trans_cancel(tp);
26259f90cd074a Allison Henderson 2021-03-24  3617  drop_incompat:
26259f90cd074a Allison Henderson 2021-03-24  3618  	if (xfs_has_larp(mp))
26259f90cd074a Allison Henderson 2021-03-24  3619  		xlog_drop_incompat_fea=
t(mp->m_log);
253f4911f297b8 Christoph Hellwig 2016-04-06  3620  out_release_wip:
7dcf5c3e4527cf Dave Chinner      2015-03-25  3621  	if (wip)
44a8736bd20a08 Darrick J. Wong   2018-07-25  3622  		xfs_irele(wip);
f6bba2017afb3b Dave Chinner      2013-08-12  3623  	return error;
f6bba2017afb3b Dave Chinner      2013-08-12  3624  }
f6bba2017afb3b Dave Chinner      2013-08-12  3625  =


:::::: The code at line 3578 was first introduced by commit
:::::: 26259f90cd074af2c19b40f43172166124b61948 xfs: Add parent pointers to=
 rename

:::::: TO: Allison Henderson <allison.henderson@oracle.com>
:::::: CC: Allison Henderson <allison.henderson@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2977307748210948351==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
/X/gCOQjDV0CAA==
--===============2977307748210948351==--

