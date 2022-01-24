Content-Type: multipart/mixed; boundary="===============6908916689785079528=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [allisonhenderson-xfs-work:delayed_attrs_v26_extended 25/30] fs/xfs/xfs_inode.c:3582 xfs_rename() error: uninitialized symbol 'new_diroffset'.
Date: Tue, 25 Jan 2022 06:23:24 +0800
Message-ID: <202201250548.KFJnDeKd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6908916689785079528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Allison Henderson <allison.henderson@oracle.com>
CC: Mark Tinguely <tinguely@sgi.com>
CC: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://github.com/allisonhenderson/xfs_work.git delayed_attrs_v26_=
extended
head:   19459f5cfa422b0a6a9cd3898892e43ecb49f8f3
commit: ac5b2b3cba559de224a21089e8b27821e2104fb2 [25/30] xfs: Add the paren=
t pointer support to the  superblock version 5.
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: nios2-randconfig-m031-20220124 (https://download.01.org/0day-ci/arc=
hive/20220125/202201250548.KFJnDeKd-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/xfs_inode.c:3582 xfs_rename() error: uninitialized symbol 'new_dirof=
fset'.
fs/xfs/xfs_inode.c:3590 xfs_rename() error: uninitialized symbol 'old_dirof=
fset'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.

vim +/new_diroffset +3582 fs/xfs/xfs_inode.c

7dcf5c3e4527cf Dave Chinner      2015-03-25  3212  =

f6bba2017afb3b Dave Chinner      2013-08-12  3213  /*
f6bba2017afb3b Dave Chinner      2013-08-12  3214   * xfs_rename
f6bba2017afb3b Dave Chinner      2013-08-12  3215   */
f6bba2017afb3b Dave Chinner      2013-08-12  3216  int
f6bba2017afb3b Dave Chinner      2013-08-12  3217  xfs_rename(
f736d93d76d3e9 Christoph Hellwig 2021-01-21  3218  	struct user_namespace		=
*mnt_userns,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3219  	struct xfs_inode		*src_=
dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3220  	struct xfs_name			*src_=
name,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3221  	struct xfs_inode		*src_=
ip,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3222  	struct xfs_inode		*targ=
et_dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3223  	struct xfs_name			*targ=
et_name,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3224  	struct xfs_inode		*targ=
et_ip,
d31a1825450062 Carlos Maiolino   2014-12-24  3225  	unsigned int			flags)
f6bba2017afb3b Dave Chinner      2013-08-12  3226  {
7dcf5c3e4527cf Dave Chinner      2015-03-25  3227  	struct xfs_mount		*mp =
=3D src_dp->i_mount;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3228  	struct xfs_trans		*tp;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3229  	struct xfs_inode		*wip =
=3D NULL;		/* whiteout inode */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3230  	struct xfs_inode		*inod=
es[__XFS_SORT_INODES];
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3231  	int				i;
95afcf5c7bca93 Dave Chinner      2015-03-25  3232  	int				num_inodes =3D _=
_XFS_SORT_INODES;
2b93681f593577 Dave Chinner      2015-03-25  3233  	bool				new_parent =3D =
(src_dp !=3D target_dp);
c19b3b05ae440d Dave Chinner      2016-02-09  3234  	bool				src_is_director=
y =3D S_ISDIR(VFS_I(src_ip)->i_mode);
f6bba2017afb3b Dave Chinner      2013-08-12  3235  	int				spaceres;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3236  	int				error;
b519cd5b0b0155 Allison Henderson 2021-03-24  3237  	struct xfs_parent_name_=
rec	new_rec;
b519cd5b0b0155 Allison Henderson 2021-03-24  3238  	struct xfs_parent_name_=
rec	old_rec;
b519cd5b0b0155 Allison Henderson 2021-03-24  3239  	xfs_dir2_dataptr_t		new=
_diroffset;
b519cd5b0b0155 Allison Henderson 2021-03-24  3240  	xfs_dir2_dataptr_t		old=
_diroffset;
b519cd5b0b0155 Allison Henderson 2021-03-24  3241  	struct xfs_da_args		new=
_args =3D {
b519cd5b0b0155 Allison Henderson 2021-03-24  3242  		.dp		=3D src_ip,
b519cd5b0b0155 Allison Henderson 2021-03-24  3243  		.geo		=3D mp->m_attr_g=
eo,
b519cd5b0b0155 Allison Henderson 2021-03-24  3244  		.whichfork	=3D XFS_ATT=
R_FORK,
b519cd5b0b0155 Allison Henderson 2021-03-24  3245  		.attr_filter	=3D XFS_A=
TTR_PARENT,
b519cd5b0b0155 Allison Henderson 2021-03-24  3246  		.op_flags	=3D XFS_DA_O=
P_OKNOENT,
b519cd5b0b0155 Allison Henderson 2021-03-24  3247  		.name		=3D (const uint=
8_t *)&new_rec,
b519cd5b0b0155 Allison Henderson 2021-03-24  3248  		.namelen	=3D sizeof(ne=
w_rec),
b519cd5b0b0155 Allison Henderson 2021-03-24  3249  		.value		=3D (void *)ta=
rget_name->name,
b519cd5b0b0155 Allison Henderson 2021-03-24  3250  		.valuelen	=3D target_n=
ame->len,
b519cd5b0b0155 Allison Henderson 2021-03-24  3251  	};
b519cd5b0b0155 Allison Henderson 2021-03-24  3252  	struct xfs_da_args		old=
_args =3D {
b519cd5b0b0155 Allison Henderson 2021-03-24  3253  		.dp		=3D src_ip,
b519cd5b0b0155 Allison Henderson 2021-03-24  3254  		.geo		=3D mp->m_attr_g=
eo,
b519cd5b0b0155 Allison Henderson 2021-03-24  3255  		.whichfork	=3D XFS_ATT=
R_FORK,
b519cd5b0b0155 Allison Henderson 2021-03-24  3256  		.attr_filter	=3D XFS_A=
TTR_PARENT,
b519cd5b0b0155 Allison Henderson 2021-03-24  3257  		.op_flags	=3D XFS_DA_O=
P_OKNOENT,
b519cd5b0b0155 Allison Henderson 2021-03-24  3258  		.name		=3D (const uint=
8_t *)&old_rec,
b519cd5b0b0155 Allison Henderson 2021-03-24  3259  		.namelen	=3D sizeof(ol=
d_rec),
b519cd5b0b0155 Allison Henderson 2021-03-24  3260  		.value		=3D NULL,
b519cd5b0b0155 Allison Henderson 2021-03-24  3261  		.valuelen	=3D 0,
b519cd5b0b0155 Allison Henderson 2021-03-24  3262  	};
f6bba2017afb3b Dave Chinner      2013-08-12  3263  =

f6bba2017afb3b Dave Chinner      2013-08-12  3264  	trace_xfs_rename(src_dp=
, target_dp, src_name, target_name);
f6bba2017afb3b Dave Chinner      2013-08-12  3265  =

eeacd3217b8fa8 Dave Chinner      2015-03-25  3266  	if ((flags & RENAME_EXC=
HANGE) && !target_ip)
eeacd3217b8fa8 Dave Chinner      2015-03-25  3267  		return -EINVAL;
eeacd3217b8fa8 Dave Chinner      2015-03-25  3268  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3269  	/*
7dcf5c3e4527cf Dave Chinner      2015-03-25  3270  	 * If we are doing a wh=
iteout operation, allocate the whiteout inode
7dcf5c3e4527cf Dave Chinner      2015-03-25  3271  	 * we will be placing a=
t the target and ensure the type is set
7dcf5c3e4527cf Dave Chinner      2015-03-25  3272  	 * appropriately.
7dcf5c3e4527cf Dave Chinner      2015-03-25  3273  	 */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3274  	if (flags & RENAME_WHIT=
EOUT) {
f736d93d76d3e9 Christoph Hellwig 2021-01-21  3275  		error =3D xfs_rename_a=
lloc_whiteout(mnt_userns, target_dp, &wip);
7dcf5c3e4527cf Dave Chinner      2015-03-25  3276  		if (error)
7dcf5c3e4527cf Dave Chinner      2015-03-25  3277  			return error;
f6bba2017afb3b Dave Chinner      2013-08-12  3278  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3279  		/* setup target dirent=
 info as whiteout */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3280  		src_name->type =3D XFS=
_DIR3_FT_CHRDEV;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3281  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3282  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3283  	xfs_sort_for_rename(src=
_dp, target_dp, src_ip, target_ip, wip,
f6bba2017afb3b Dave Chinner      2013-08-12  3284  				inodes, &num_inodes);
b519cd5b0b0155 Allison Henderson 2021-03-24  3285  	if (xfs_has_larp(mp)) {
b519cd5b0b0155 Allison Henderson 2021-03-24  3286  		error =3D xfs_attr_use=
_log_assist(mp);
b519cd5b0b0155 Allison Henderson 2021-03-24  3287  		if (error)
b519cd5b0b0155 Allison Henderson 2021-03-24  3288  			goto out_release_wip;
b519cd5b0b0155 Allison Henderson 2021-03-24  3289  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3290  =

f6bba2017afb3b Dave Chinner      2013-08-12  3291  	spaceres =3D XFS_RENAME=
_SPACE_RES(mp, target_name->len);
253f4911f297b8 Christoph Hellwig 2016-04-06  3292  	error =3D xfs_trans_all=
oc(mp, &M_RES(mp)->tr_rename, spaceres, 0, 0, &tp);
2451337dd04390 Dave Chinner      2014-06-25  3293  	if (error =3D=3D -ENOSP=
C) {
f6bba2017afb3b Dave Chinner      2013-08-12  3294  		spaceres =3D 0;
253f4911f297b8 Christoph Hellwig 2016-04-06  3295  		error =3D xfs_trans_al=
loc(mp, &M_RES(mp)->tr_rename, 0, 0, 0,
253f4911f297b8 Christoph Hellwig 2016-04-06  3296  				&tp);
f6bba2017afb3b Dave Chinner      2013-08-12  3297  	}
445883e8133975 Dave Chinner      2015-03-25  3298  	if (error)
b519cd5b0b0155 Allison Henderson 2021-03-24  3299  		goto drop_incompat;
f6bba2017afb3b Dave Chinner      2013-08-12  3300  =

f6bba2017afb3b Dave Chinner      2013-08-12  3301  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3302  	 * Attach the dquots to=
 the inodes
f6bba2017afb3b Dave Chinner      2013-08-12  3303  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3304  	error =3D xfs_qm_vop_re=
name_dqattach(inodes);
445883e8133975 Dave Chinner      2015-03-25  3305  	if (error)
445883e8133975 Dave Chinner      2015-03-25  3306  		goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3307  =

f6bba2017afb3b Dave Chinner      2013-08-12  3308  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3309  	 * Lock all the partici=
pating inodes. Depending upon whether
f6bba2017afb3b Dave Chinner      2013-08-12  3310  	 * the target_name exis=
ts in the target directory, and
f6bba2017afb3b Dave Chinner      2013-08-12  3311  	 * whether the target d=
irectory is the same as the source
f6bba2017afb3b Dave Chinner      2013-08-12  3312  	 * directory, we can lo=
ck from 2 to 4 inodes.
f6bba2017afb3b Dave Chinner      2013-08-12  3313  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3314  	xfs_lock_inodes(inodes,=
 num_inodes, XFS_ILOCK_EXCL);
f6bba2017afb3b Dave Chinner      2013-08-12  3315  =

f6bba2017afb3b Dave Chinner      2013-08-12  3316  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3317  	 * Join all the inodes =
to the transaction. From this point on,
f6bba2017afb3b Dave Chinner      2013-08-12  3318  	 * we can rely on eithe=
r trans_commit or trans_cancel to unlock
f6bba2017afb3b Dave Chinner      2013-08-12  3319  	 * them.
f6bba2017afb3b Dave Chinner      2013-08-12  3320  	 */
b519cd5b0b0155 Allison Henderson 2021-03-24  3321  	xfs_trans_ijoin(tp, src=
_dp, 0);
f6bba2017afb3b Dave Chinner      2013-08-12  3322  	if (new_parent)
b519cd5b0b0155 Allison Henderson 2021-03-24  3323  		xfs_trans_ijoin(tp, ta=
rget_dp, 0);
b519cd5b0b0155 Allison Henderson 2021-03-24  3324  	xfs_trans_ijoin(tp, src=
_ip, 0);
f6bba2017afb3b Dave Chinner      2013-08-12  3325  	if (target_ip)
b519cd5b0b0155 Allison Henderson 2021-03-24  3326  		xfs_trans_ijoin(tp, ta=
rget_ip, 0);
7dcf5c3e4527cf Dave Chinner      2015-03-25  3327  	if (wip)
b519cd5b0b0155 Allison Henderson 2021-03-24  3328  		xfs_trans_ijoin(tp, wi=
p, 0);
f6bba2017afb3b Dave Chinner      2013-08-12  3329  =

f6bba2017afb3b Dave Chinner      2013-08-12  3330  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3331  	 * If we are using proj=
ect inheritance, we only allow renames
f6bba2017afb3b Dave Chinner      2013-08-12  3332  	 * into our tree when t=
he project IDs are the same; else the
f6bba2017afb3b Dave Chinner      2013-08-12  3333  	 * tree quota mechanism=
 would be circumvented.
f6bba2017afb3b Dave Chinner      2013-08-12  3334  	 */
db07349da2f564 Christoph Hellwig 2021-03-29  3335  	if (unlikely((target_dp=
->i_diflags & XFS_DIFLAG_PROJINHERIT) &&
ceaf603c7024d3 Christoph Hellwig 2021-03-29  3336  		     target_dp->i_proj=
id !=3D src_ip->i_projid)) {
2451337dd04390 Dave Chinner      2014-06-25  3337  		error =3D -EXDEV;
b519cd5b0b0155 Allison Henderson 2021-03-24  3338  		goto out_unlock;
f6bba2017afb3b Dave Chinner      2013-08-12  3339  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3340  =

eeacd3217b8fa8 Dave Chinner      2015-03-25  3341  	/* RENAME_EXCHANGE is u=
nique from here on. */
b519cd5b0b0155 Allison Henderson 2021-03-24  3342  	if (flags & RENAME_EXCH=
ANGE) {
b519cd5b0b0155 Allison Henderson 2021-03-24  3343  		error =3D xfs_cross_re=
name(tp, src_dp, src_name, src_ip,
d31a1825450062 Carlos Maiolino   2014-12-24  3344  					target_dp, target_n=
ame, target_ip,
f16dea54b789aa Brian Foster      2018-07-11  3345  					spaceres);
b519cd5b0b0155 Allison Henderson 2021-03-24  3346  		goto out_pptr;
b519cd5b0b0155 Allison Henderson 2021-03-24  3347  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3348  	/*
bc56ad8c74b858 kaixuxia          2019-09-03  3349  	 * Check for expected e=
rrors before we dirty the transaction
bc56ad8c74b858 kaixuxia          2019-09-03  3350  	 * so we can return an =
error without a transaction abort.
02092a2f034fde Chandan Babu R    2021-01-22  3351  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3352  	 * Extent count overflo=
w check:
02092a2f034fde Chandan Babu R    2021-01-22  3353  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3354  	 * From the perspective=
 of src_dp, a rename operation is essentially a
02092a2f034fde Chandan Babu R    2021-01-22  3355  	 * directory entry remo=
ve operation. Hence the only place where we check
02092a2f034fde Chandan Babu R    2021-01-22  3356  	 * for extent count ove=
rflow for src_dp is in
02092a2f034fde Chandan Babu R    2021-01-22  3357  	 * xfs_bmap_del_extent_=
real(). xfs_bmap_del_extent_real() returns
02092a2f034fde Chandan Babu R    2021-01-22  3358  	 * -ENOSPC when it dete=
cts a possible extent count overflow and in
02092a2f034fde Chandan Babu R    2021-01-22  3359  	 * response, the higher=
 layers of directory handling code do the
02092a2f034fde Chandan Babu R    2021-01-22  3360  	 * following:
02092a2f034fde Chandan Babu R    2021-01-22  3361  	 * 1. Data/Free blocks:=
 XFS lets these blocks linger until a
02092a2f034fde Chandan Babu R    2021-01-22  3362  	 *    future remove ope=
ration removes them.
02092a2f034fde Chandan Babu R    2021-01-22  3363  	 * 2. Dabtree blocks: X=
FS swaps the blocks with the last block in the
02092a2f034fde Chandan Babu R    2021-01-22  3364  	 *    Leaf space and un=
maps the last block.
02092a2f034fde Chandan Babu R    2021-01-22  3365  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3366  	 * For target_dp, there=
 are two cases depending on whether the
02092a2f034fde Chandan Babu R    2021-01-22  3367  	 * destination director=
y entry exists or not.
02092a2f034fde Chandan Babu R    2021-01-22  3368  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3369  	 * When destination dir=
ectory entry does not exist (i.e. target_ip =3D=3D
02092a2f034fde Chandan Babu R    2021-01-22  3370  	 * NULL), extent count =
overflow check is performed only when transaction
02092a2f034fde Chandan Babu R    2021-01-22  3371  	 * has a non-zero sized=
 space reservation associated with it.  With a
02092a2f034fde Chandan Babu R    2021-01-22  3372  	 * zero-sized space res=
ervation, XFS allows a rename operation to
02092a2f034fde Chandan Babu R    2021-01-22  3373  	 * continue only when t=
he directory has sufficient free space in its
02092a2f034fde Chandan Babu R    2021-01-22  3374  	 * data/leaf/free space=
 blocks to hold the new entry.
02092a2f034fde Chandan Babu R    2021-01-22  3375  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3376  	 * When destination dir=
ectory entry exists (i.e. target_ip !=3D NULL), all
02092a2f034fde Chandan Babu R    2021-01-22  3377  	 * we need to do is cha=
nge the inode number associated with the already
02092a2f034fde Chandan Babu R    2021-01-22  3378  	 * existing entry. Henc=
e there is no need to perform an extent count
02092a2f034fde Chandan Babu R    2021-01-22  3379  	 * overflow check.
f6bba2017afb3b Dave Chinner      2013-08-12  3380  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3381  	if (target_ip =3D=3D NU=
LL) {
f6bba2017afb3b Dave Chinner      2013-08-12  3382  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3383  		 * If there's no space=
 reservation, check the entry will
f6bba2017afb3b Dave Chinner      2013-08-12  3384  		 * fit before actually=
 inserting it.
f6bba2017afb3b Dave Chinner      2013-08-12  3385  		 */
94f3cad555d660 Eric Sandeen      2014-09-09  3386  		if (!spaceres) {
94f3cad555d660 Eric Sandeen      2014-09-09  3387  			error =3D xfs_dir_can=
enter(tp, target_dp, target_name);
f6bba2017afb3b Dave Chinner      2013-08-12  3388  			if (error)
b519cd5b0b0155 Allison Henderson 2021-03-24  3389  				goto out_unlock;
02092a2f034fde Chandan Babu R    2021-01-22  3390  		} else {
02092a2f034fde Chandan Babu R    2021-01-22  3391  			error =3D xfs_iext_co=
unt_may_overflow(target_dp,
02092a2f034fde Chandan Babu R    2021-01-22  3392  					XFS_DATA_FORK,
02092a2f034fde Chandan Babu R    2021-01-22  3393  					XFS_IEXT_DIR_MANIP_=
CNT(mp));
02092a2f034fde Chandan Babu R    2021-01-22  3394  			if (error)
02092a2f034fde Chandan Babu R    2021-01-22  3395  				goto out_trans_cance=
l;
94f3cad555d660 Eric Sandeen      2014-09-09  3396  		}
bc56ad8c74b858 kaixuxia          2019-09-03  3397  	} else {
bc56ad8c74b858 kaixuxia          2019-09-03  3398  		/*
bc56ad8c74b858 kaixuxia          2019-09-03  3399  		 * If target exists an=
d it's a directory, check that whether
bc56ad8c74b858 kaixuxia          2019-09-03  3400  		 * it can be destroyed.
bc56ad8c74b858 kaixuxia          2019-09-03  3401  		 */
bc56ad8c74b858 kaixuxia          2019-09-03  3402  		if (S_ISDIR(VFS_I(targ=
et_ip)->i_mode) &&
bc56ad8c74b858 kaixuxia          2019-09-03  3403  		    (!xfs_dir_isempty(=
target_ip) ||
bc56ad8c74b858 kaixuxia          2019-09-03  3404  		     (VFS_I(target_ip)=
->i_nlink > 2))) {
bc56ad8c74b858 kaixuxia          2019-09-03  3405  			error =3D -EEXIST;
bc56ad8c74b858 kaixuxia          2019-09-03  3406  			goto out_trans_cancel;
bc56ad8c74b858 kaixuxia          2019-09-03  3407  		}
bc56ad8c74b858 kaixuxia          2019-09-03  3408  	}
bc56ad8c74b858 kaixuxia          2019-09-03  3409  =

6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3410  	/*
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3411  	 * Lock the AGI buffers=
 we need to handle bumping the nlink of the
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3412  	 * whiteout inode off t=
he unlinked list and to handle dropping the
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3413  	 * nlink of the target =
inode.  Per locking order rules, do this in
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3414  	 * increasing AG order =
and before directory block allocation tries to
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3415  	 * grab AGFs because we=
 grab AGIs before AGFs.
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3416  	 *
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3417  	 * The (vfs) caller mus=
t ensure that if src is a directory then
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3418  	 * target_ip is either =
null or an empty directory.
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3419  	 */
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3420  	for (i =3D 0; i < num_i=
nodes && inodes[i] !=3D NULL; i++) {
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3421  		if (inodes[i] =3D=3D w=
ip ||
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3422  		    (inodes[i] =3D=3D =
target_ip &&
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3423  		     (VFS_I(target_ip)=
->i_nlink =3D=3D 1 || src_is_directory))) {
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3424  			struct xfs_buf	*bp;
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3425  			xfs_agnumber_t	agno;
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3426  =

6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3427  			agno =3D XFS_INO_TO_A=
GNO(mp, inodes[i]->i_ino);
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3428  			error =3D xfs_read_ag=
i(mp, tp, agno, &bp);
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3429  			if (error)
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3430  				goto out_trans_cance=
l;
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3431  		}
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3432  	}
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3433  =

bc56ad8c74b858 kaixuxia          2019-09-03  3434  	/*
bc56ad8c74b858 kaixuxia          2019-09-03  3435  	 * Directory entry crea=
tion below may acquire the AGF. Remove
bc56ad8c74b858 kaixuxia          2019-09-03  3436  	 * the whiteout from th=
e unlinked list first to preserve correct
bc56ad8c74b858 kaixuxia          2019-09-03  3437  	 * AGI/AGF locking orde=
r. This dirties the transaction so failures
bc56ad8c74b858 kaixuxia          2019-09-03  3438  	 * after this point wil=
l abort and log recovery will clean up the
bc56ad8c74b858 kaixuxia          2019-09-03  3439  	 * mess.
bc56ad8c74b858 kaixuxia          2019-09-03  3440  	 *
bc56ad8c74b858 kaixuxia          2019-09-03  3441  	 * For whiteouts, we ne=
ed to bump the link count on the whiteout
bc56ad8c74b858 kaixuxia          2019-09-03  3442  	 * inode. After this po=
int, we have a real link, clear the tmpfile
bc56ad8c74b858 kaixuxia          2019-09-03  3443  	 * state flag from the =
inode so it doesn't accidentally get misused
bc56ad8c74b858 kaixuxia          2019-09-03  3444  	 * in future.
bc56ad8c74b858 kaixuxia          2019-09-03  3445  	 */
bc56ad8c74b858 kaixuxia          2019-09-03  3446  	if (wip) {
f40aadb2bb64fe Dave Chinner      2021-06-02  3447  		struct xfs_perag	*pag;
f40aadb2bb64fe Dave Chinner      2021-06-02  3448  =

bc56ad8c74b858 kaixuxia          2019-09-03  3449  		ASSERT(VFS_I(wip)->i_n=
link =3D=3D 0);
f40aadb2bb64fe Dave Chinner      2021-06-02  3450  =

f40aadb2bb64fe Dave Chinner      2021-06-02  3451  		pag =3D xfs_perag_get(=
mp, XFS_INO_TO_AGNO(mp, wip->i_ino));
f40aadb2bb64fe Dave Chinner      2021-06-02  3452  		error =3D xfs_iunlink_=
remove(tp, pag, wip);
f40aadb2bb64fe Dave Chinner      2021-06-02  3453  		xfs_perag_put(pag);
bc56ad8c74b858 kaixuxia          2019-09-03  3454  		if (error)
bc56ad8c74b858 kaixuxia          2019-09-03  3455  			goto out_trans_cancel;
bc56ad8c74b858 kaixuxia          2019-09-03  3456  =

bc56ad8c74b858 kaixuxia          2019-09-03  3457  		xfs_bumplink(tp, wip);
bc56ad8c74b858 kaixuxia          2019-09-03  3458  		VFS_I(wip)->i_state &=
=3D ~I_LINKABLE;
bc56ad8c74b858 kaixuxia          2019-09-03  3459  	}
bc56ad8c74b858 kaixuxia          2019-09-03  3460  =

bc56ad8c74b858 kaixuxia          2019-09-03  3461  	/*
bc56ad8c74b858 kaixuxia          2019-09-03  3462  	 * Set up the target.
bc56ad8c74b858 kaixuxia          2019-09-03  3463  	 */
bc56ad8c74b858 kaixuxia          2019-09-03  3464  	if (target_ip =3D=3D NU=
LL) {
f6bba2017afb3b Dave Chinner      2013-08-12  3465  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3466  		 * If target does not =
exist and the rename crosses
f6bba2017afb3b Dave Chinner      2013-08-12  3467  		 * directories, adjust=
 the target directory link count
f6bba2017afb3b Dave Chinner      2013-08-12  3468  		 * to account for the =
".." reference from the new entry.
f6bba2017afb3b Dave Chinner      2013-08-12  3469  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3470  		error =3D xfs_dir_crea=
tename(tp, target_dp, target_name,
b519cd5b0b0155 Allison Henderson 2021-03-24  3471  					   src_ip->i_ino, s=
paceres, &new_diroffset);
f6bba2017afb3b Dave Chinner      2013-08-12  3472  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3473  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3474  =

f6bba2017afb3b Dave Chinner      2013-08-12  3475  		xfs_trans_ichgtime(tp,=
 target_dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3476  					XFS_ICHGTIME_MOD | =
XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3477  =

f6bba2017afb3b Dave Chinner      2013-08-12  3478  		if (new_parent && src_=
is_directory) {
910832697cf855 Eric Sandeen      2019-05-01  3479  			xfs_bumplink(tp, targ=
et_dp);
f6bba2017afb3b Dave Chinner      2013-08-12  3480  		}
f6bba2017afb3b Dave Chinner      2013-08-12  3481  	} else { /* target_ip !=
=3D NULL */
f6bba2017afb3b Dave Chinner      2013-08-12  3482  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3483  		 * Link the source ino=
de under the target name.
f6bba2017afb3b Dave Chinner      2013-08-12  3484  		 * If the source inode=
 is a directory and we are moving
f6bba2017afb3b Dave Chinner      2013-08-12  3485  		 * it across directori=
es, its ".." entry will be
f6bba2017afb3b Dave Chinner      2013-08-12  3486  		 * inconsistent until =
we replace that down below.
f6bba2017afb3b Dave Chinner      2013-08-12  3487  		 *
f6bba2017afb3b Dave Chinner      2013-08-12  3488  		 * In case there is al=
ready an entry with the same
f6bba2017afb3b Dave Chinner      2013-08-12  3489  		 * name at the destina=
tion directory, remove it first.
f6bba2017afb3b Dave Chinner      2013-08-12  3490  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3491  		error =3D xfs_dir_repl=
ace(tp, target_dp, target_name,
b519cd5b0b0155 Allison Henderson 2021-03-24  3492  					src_ip->i_ino, spac=
eres, &new_diroffset);
f6bba2017afb3b Dave Chinner      2013-08-12  3493  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3494  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3495  =

f6bba2017afb3b Dave Chinner      2013-08-12  3496  		xfs_trans_ichgtime(tp,=
 target_dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3497  					XFS_ICHGTIME_MOD | =
XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3498  =

f6bba2017afb3b Dave Chinner      2013-08-12  3499  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3500  		 * Decrement the link =
count on the target since the target
f6bba2017afb3b Dave Chinner      2013-08-12  3501  		 * dir no longer point=
s to it.
f6bba2017afb3b Dave Chinner      2013-08-12  3502  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3503  		error =3D xfs_droplink=
(tp, target_ip);
f6bba2017afb3b Dave Chinner      2013-08-12  3504  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3505  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3506  =

f6bba2017afb3b Dave Chinner      2013-08-12  3507  		if (src_is_directory) {
f6bba2017afb3b Dave Chinner      2013-08-12  3508  			/*
f6bba2017afb3b Dave Chinner      2013-08-12  3509  			 * Drop the link from=
 the old "." entry.
f6bba2017afb3b Dave Chinner      2013-08-12  3510  			 */
f6bba2017afb3b Dave Chinner      2013-08-12  3511  			error =3D xfs_droplin=
k(tp, target_ip);
f6bba2017afb3b Dave Chinner      2013-08-12  3512  			if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3513  				goto out_trans_cance=
l;
f6bba2017afb3b Dave Chinner      2013-08-12  3514  		}
f6bba2017afb3b Dave Chinner      2013-08-12  3515  	} /* target_ip !=3D NUL=
L */
f6bba2017afb3b Dave Chinner      2013-08-12  3516  =

f6bba2017afb3b Dave Chinner      2013-08-12  3517  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3518  	 * Remove the source.
f6bba2017afb3b Dave Chinner      2013-08-12  3519  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3520  	if (new_parent && src_i=
s_directory) {
f6bba2017afb3b Dave Chinner      2013-08-12  3521  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3522  		 * Rewrite the ".." en=
try to point to the new
f6bba2017afb3b Dave Chinner      2013-08-12  3523  		 * directory.
f6bba2017afb3b Dave Chinner      2013-08-12  3524  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3525  		error =3D xfs_dir_repl=
ace(tp, src_ip, &xfs_name_dotdot,
b519cd5b0b0155 Allison Henderson 2021-03-24  3526  					target_dp->i_ino, s=
paceres, &new_diroffset);
2451337dd04390 Dave Chinner      2014-06-25  3527  		ASSERT(error !=3D -EEX=
IST);
f6bba2017afb3b Dave Chinner      2013-08-12  3528  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3529  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3530  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3531  =

f6bba2017afb3b Dave Chinner      2013-08-12  3532  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3533  	 * We always want to hi=
t the ctime on the source inode.
f6bba2017afb3b Dave Chinner      2013-08-12  3534  	 *
f6bba2017afb3b Dave Chinner      2013-08-12  3535  	 * This isn't strictly =
required by the standards since the source
f6bba2017afb3b Dave Chinner      2013-08-12  3536  	 * inode isn't really b=
eing changed, but old unix file systems did
f6bba2017afb3b Dave Chinner      2013-08-12  3537  	 * it and some incremen=
tal backup programs won't work without it.
f6bba2017afb3b Dave Chinner      2013-08-12  3538  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3539  	xfs_trans_ichgtime(tp, =
src_ip, XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3540  	xfs_trans_log_inode(tp,=
 src_ip, XFS_ILOG_CORE);
f6bba2017afb3b Dave Chinner      2013-08-12  3541  =

f6bba2017afb3b Dave Chinner      2013-08-12  3542  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3543  	 * Adjust the link coun=
t on src_dp.  This is necessary when
f6bba2017afb3b Dave Chinner      2013-08-12  3544  	 * renaming a directory=
, either within one parent when
f6bba2017afb3b Dave Chinner      2013-08-12  3545  	 * the target existed, =
or across two parent directories.
f6bba2017afb3b Dave Chinner      2013-08-12  3546  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3547  	if (src_is_directory &&=
 (new_parent || target_ip !=3D NULL)) {
f6bba2017afb3b Dave Chinner      2013-08-12  3548  =

f6bba2017afb3b Dave Chinner      2013-08-12  3549  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3550  		 * Decrement link coun=
t on src_directory since the
f6bba2017afb3b Dave Chinner      2013-08-12  3551  		 * entry that's moved =
no longer points to it.
f6bba2017afb3b Dave Chinner      2013-08-12  3552  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3553  		error =3D xfs_droplink=
(tp, src_dp);
f6bba2017afb3b Dave Chinner      2013-08-12  3554  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3555  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3556  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3557  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3558  	/*
7dcf5c3e4527cf Dave Chinner      2015-03-25  3559  	 * For whiteouts, we on=
ly need to update the source dirent with the
7dcf5c3e4527cf Dave Chinner      2015-03-25  3560  	 * inode number of the =
whiteout inode rather than removing it
7dcf5c3e4527cf Dave Chinner      2015-03-25  3561  	 * altogether.
7dcf5c3e4527cf Dave Chinner      2015-03-25  3562  	 */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3563  	if (wip) {
7dcf5c3e4527cf Dave Chinner      2015-03-25  3564  		error =3D xfs_dir_repl=
ace(tp, src_dp, src_name, wip->i_ino,
b519cd5b0b0155 Allison Henderson 2021-03-24  3565  					spaceres, &old_diro=
ffset);
02092a2f034fde Chandan Babu R    2021-01-22  3566  	} else {
02092a2f034fde Chandan Babu R    2021-01-22  3567  		/*
02092a2f034fde Chandan Babu R    2021-01-22  3568  		 * NOTE: We don't need=
 to check for extent count overflow here
02092a2f034fde Chandan Babu R    2021-01-22  3569  		 * because the dir rem=
ove name code will leave the dir block in
02092a2f034fde Chandan Babu R    2021-01-22  3570  		 * place if the extent=
 count would overflow.
02092a2f034fde Chandan Babu R    2021-01-22  3571  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3572  		error =3D xfs_dir_remo=
vename(tp, src_dp, src_name, src_ip->i_ino,
b519cd5b0b0155 Allison Henderson 2021-03-24  3573  					   spaceres, &old_d=
iroffset);
02092a2f034fde Chandan Babu R    2021-01-22  3574  	}
02092a2f034fde Chandan Babu R    2021-01-22  3575  =

f6bba2017afb3b Dave Chinner      2013-08-12  3576  	if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3577  		goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3578  =

b519cd5b0b0155 Allison Henderson 2021-03-24  3579  out_pptr:
b519cd5b0b0155 Allison Henderson 2021-03-24  3580  	if (xfs_sb_version_hasp=
arent(&mp->m_sb)) {
b519cd5b0b0155 Allison Henderson 2021-03-24  3581  		new_args.trans	=3D tp;
b519cd5b0b0155 Allison Henderson 2021-03-24 @3582  		xfs_init_parent_name_r=
ec(&new_rec, target_dp, new_diroffset);
b519cd5b0b0155 Allison Henderson 2021-03-24  3583  		new_args.hashval =3D x=
fs_da_hashname(new_args.name,
b519cd5b0b0155 Allison Henderson 2021-03-24  3584  						   new_args.namele=
n);
b519cd5b0b0155 Allison Henderson 2021-03-24  3585  		error =3D  xfs_attr_se=
t_deferred(&new_args);
b519cd5b0b0155 Allison Henderson 2021-03-24  3586  		if (error)
b519cd5b0b0155 Allison Henderson 2021-03-24  3587  			goto out_trans_cancel;
b519cd5b0b0155 Allison Henderson 2021-03-24  3588  =

b519cd5b0b0155 Allison Henderson 2021-03-24  3589  		old_args.trans	=3D tp;
b519cd5b0b0155 Allison Henderson 2021-03-24 @3590  		xfs_init_parent_name_r=
ec(&old_rec, src_dp, old_diroffset);
b519cd5b0b0155 Allison Henderson 2021-03-24  3591  		old_args.hashval =3D x=
fs_da_hashname(old_args.name,
b519cd5b0b0155 Allison Henderson 2021-03-24  3592  						   old_args.namele=
n);
b519cd5b0b0155 Allison Henderson 2021-03-24  3593  		error =3D xfs_attr_rem=
ove_deferred(&old_args);
b519cd5b0b0155 Allison Henderson 2021-03-24  3594  		if (error)
b519cd5b0b0155 Allison Henderson 2021-03-24  3595  			goto out_trans_cancel;
b519cd5b0b0155 Allison Henderson 2021-03-24  3596  	}
b519cd5b0b0155 Allison Henderson 2021-03-24  3597  =

f6bba2017afb3b Dave Chinner      2013-08-12  3598  	xfs_trans_ichgtime(tp, =
src_dp, XFS_ICHGTIME_MOD | XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3599  	xfs_trans_log_inode(tp,=
 src_dp, XFS_ILOG_CORE);
f6bba2017afb3b Dave Chinner      2013-08-12  3600  	if (new_parent)
f6bba2017afb3b Dave Chinner      2013-08-12  3601  		xfs_trans_log_inode(tp=
, target_dp, XFS_ILOG_CORE);
f6bba2017afb3b Dave Chinner      2013-08-12  3602  =

c9cfdb38117217 Brian Foster      2018-07-11  3603  	error =3D xfs_finish_re=
name(tp);
b519cd5b0b0155 Allison Henderson 2021-03-24  3604  =

b519cd5b0b0155 Allison Henderson 2021-03-24  3605  out_unlock:
7dcf5c3e4527cf Dave Chinner      2015-03-25  3606  	if (wip)
44a8736bd20a08 Darrick J. Wong   2018-07-25  3607  		xfs_irele(wip);
b519cd5b0b0155 Allison Henderson 2021-03-24  3608  	if (wip)
b519cd5b0b0155 Allison Henderson 2021-03-24  3609  		xfs_iunlock(wip, XFS_I=
LOCK_EXCL);
b519cd5b0b0155 Allison Henderson 2021-03-24  3610  	if (target_ip)
b519cd5b0b0155 Allison Henderson 2021-03-24  3611  		xfs_iunlock(target_ip,=
 XFS_ILOCK_EXCL);
b519cd5b0b0155 Allison Henderson 2021-03-24  3612  	xfs_iunlock(src_ip, XFS=
_ILOCK_EXCL);
b519cd5b0b0155 Allison Henderson 2021-03-24  3613  	if (new_parent)
b519cd5b0b0155 Allison Henderson 2021-03-24  3614  		xfs_iunlock(target_dp,=
 XFS_ILOCK_EXCL);
b519cd5b0b0155 Allison Henderson 2021-03-24  3615  	xfs_iunlock(src_dp, XFS=
_ILOCK_EXCL);
b519cd5b0b0155 Allison Henderson 2021-03-24  3616  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3617  	return error;
f6bba2017afb3b Dave Chinner      2013-08-12  3618  =

445883e8133975 Dave Chinner      2015-03-25  3619  out_trans_cancel:
4906e21545814e Christoph Hellwig 2015-06-04  3620  	xfs_trans_cancel(tp);
b519cd5b0b0155 Allison Henderson 2021-03-24  3621  drop_incompat:
b519cd5b0b0155 Allison Henderson 2021-03-24  3622  	if (xfs_has_larp(mp))
b519cd5b0b0155 Allison Henderson 2021-03-24  3623  		xlog_drop_incompat_fea=
t(mp->m_log);
253f4911f297b8 Christoph Hellwig 2016-04-06  3624  out_release_wip:
7dcf5c3e4527cf Dave Chinner      2015-03-25  3625  	if (wip)
44a8736bd20a08 Darrick J. Wong   2018-07-25  3626  		xfs_irele(wip);
f6bba2017afb3b Dave Chinner      2013-08-12  3627  	return error;
f6bba2017afb3b Dave Chinner      2013-08-12  3628  }
f6bba2017afb3b Dave Chinner      2013-08-12  3629  =


:::::: The code at line 3582 was first introduced by commit
:::::: b519cd5b0b0155455c70512f3574660899d3a72f xfs: Add parent pointers to=
 rename

:::::: TO: Allison Henderson <allison.henderson@oracle.com>
:::::: CC: Allison Henderson <allison.henderson@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6908916689785079528==--

