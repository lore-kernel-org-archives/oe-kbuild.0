Content-Type: multipart/mixed; boundary="===============8798401080952035664=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [allisonhenderson-xfs_work:delayed_attrs_v22_extended 29/32] fs/xfs/xfs_inode.c:3526 xfs_rename() error: uninitialized symbol 'new_diroffset'.
Date: Sun, 01 Aug 2021 06:16:34 +0800
Message-ID: <202108010623.3OOFigeM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8798401080952035664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Allison Henderson <allison.henderson@oracle.com>
CC: Mark Tinguely <tinguely@sgi.com>
CC: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://github.com/allisonhenderson/xfs_work.git delayed_attrs_v22_=
extended
head:   aff89515c2d9aca9b24ac0296f3806af62cd9206
commit: 7ea04e9ca4238354c031a0ee00b8b5215c15ea01 [29/32] xfs: Add the paren=
t pointer support to the  superblock version 5.
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: microblaze-randconfig-m031-20210730 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/xfs_inode.c:3526 xfs_rename() error: uninitialized symbol 'new_dirof=
fset'.
fs/xfs/xfs_inode.c:3534 xfs_rename() error: uninitialized symbol 'old_dirof=
fset'.

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:91 current_thread_info() error: u=
ninitialized symbol 'sp'.

vim +/new_diroffset +3526 fs/xfs/xfs_inode.c

7dcf5c3e4527cfa Dave Chinner      2015-03-25  3155  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3156  /*
f6bba2017afb3bd Dave Chinner      2013-08-12  3157   * xfs_rename
f6bba2017afb3bd Dave Chinner      2013-08-12  3158   */
f6bba2017afb3bd Dave Chinner      2013-08-12  3159  int
f6bba2017afb3bd Dave Chinner      2013-08-12  3160  xfs_rename(
f736d93d76d3e97 Christoph Hellwig 2021-01-21  3161  	struct user_namespace	=
	*mnt_userns,
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3162  	struct xfs_inode		*src=
_dp,
f6bba2017afb3bd Dave Chinner      2013-08-12  3163  	struct xfs_name			*src=
_name,
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3164  	struct xfs_inode		*src=
_ip,
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3165  	struct xfs_inode		*tar=
get_dp,
f6bba2017afb3bd Dave Chinner      2013-08-12  3166  	struct xfs_name			*tar=
get_name,
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3167  	struct xfs_inode		*tar=
get_ip,
d31a1825450062b Carlos Maiolino   2014-12-24  3168  	unsigned int			flags)
f6bba2017afb3bd Dave Chinner      2013-08-12  3169  {
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3170  	struct xfs_mount		*mp =
=3D src_dp->i_mount;
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3171  	struct xfs_trans		*tp;
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3172  	struct xfs_inode		*wip=
 =3D NULL;		/* whiteout inode */
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3173  	struct xfs_inode		*ino=
des[__XFS_SORT_INODES];
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3174  	int				i;
95afcf5c7bca93f Dave Chinner      2015-03-25  3175  	int				num_inodes =3D =
__XFS_SORT_INODES;
2b93681f593577d Dave Chinner      2015-03-25  3176  	bool				new_parent =3D=
 (src_dp !=3D target_dp);
c19b3b05ae440de Dave Chinner      2016-02-09  3177  	bool				src_is_directo=
ry =3D S_ISDIR(VFS_I(src_ip)->i_mode);
f6bba2017afb3bd Dave Chinner      2013-08-12  3178  	int				spaceres;
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3179  	int				error;
3818584f03ce2d5 Allison Henderson 2021-03-24  3180  	struct xfs_parent_name=
_rec	new_rec;
3818584f03ce2d5 Allison Henderson 2021-03-24  3181  	struct xfs_parent_name=
_rec	old_rec;
3818584f03ce2d5 Allison Henderson 2021-03-24  3182  	xfs_dir2_dataptr_t		ne=
w_diroffset;
3818584f03ce2d5 Allison Henderson 2021-03-24  3183  	xfs_dir2_dataptr_t		ol=
d_diroffset;
3818584f03ce2d5 Allison Henderson 2021-03-24  3184  	struct xfs_da_args		ne=
w_args =3D {
3818584f03ce2d5 Allison Henderson 2021-03-24  3185  		.dp		=3D src_ip,
3818584f03ce2d5 Allison Henderson 2021-03-24  3186  		.geo		=3D mp->m_attr_=
geo,
3818584f03ce2d5 Allison Henderson 2021-03-24  3187  		.whichfork	=3D XFS_AT=
TR_FORK,
3818584f03ce2d5 Allison Henderson 2021-03-24  3188  		.attr_filter	=3D XFS_=
ATTR_PARENT,
3818584f03ce2d5 Allison Henderson 2021-03-24  3189  		.op_flags	=3D XFS_DA_=
OP_OKNOENT,
3818584f03ce2d5 Allison Henderson 2021-03-24  3190  		.name		=3D (const uin=
t8_t *)&new_rec,
3818584f03ce2d5 Allison Henderson 2021-03-24  3191  		.namelen	=3D sizeof(n=
ew_rec),
3818584f03ce2d5 Allison Henderson 2021-03-24  3192  		.value		=3D (void *)t=
arget_name->name,
3818584f03ce2d5 Allison Henderson 2021-03-24  3193  		.valuelen	=3D target_=
name->len,
3818584f03ce2d5 Allison Henderson 2021-03-24  3194  	};
3818584f03ce2d5 Allison Henderson 2021-03-24  3195  	struct xfs_da_args		ol=
d_args =3D {
3818584f03ce2d5 Allison Henderson 2021-03-24  3196  		.dp		=3D src_ip,
3818584f03ce2d5 Allison Henderson 2021-03-24  3197  		.geo		=3D mp->m_attr_=
geo,
3818584f03ce2d5 Allison Henderson 2021-03-24  3198  		.whichfork	=3D XFS_AT=
TR_FORK,
3818584f03ce2d5 Allison Henderson 2021-03-24  3199  		.attr_filter	=3D XFS_=
ATTR_PARENT,
3818584f03ce2d5 Allison Henderson 2021-03-24  3200  		.op_flags	=3D XFS_DA_=
OP_OKNOENT,
3818584f03ce2d5 Allison Henderson 2021-03-24  3201  		.name		=3D (const uin=
t8_t *)&old_rec,
3818584f03ce2d5 Allison Henderson 2021-03-24  3202  		.namelen	=3D sizeof(o=
ld_rec),
3818584f03ce2d5 Allison Henderson 2021-03-24  3203  		.value		=3D NULL,
3818584f03ce2d5 Allison Henderson 2021-03-24  3204  		.valuelen	=3D 0,
3818584f03ce2d5 Allison Henderson 2021-03-24  3205  	};
f6bba2017afb3bd Dave Chinner      2013-08-12  3206  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3207  	trace_xfs_rename(src_d=
p, target_dp, src_name, target_name);
f6bba2017afb3bd Dave Chinner      2013-08-12  3208  =

eeacd3217b8fa81 Dave Chinner      2015-03-25  3209  	if ((flags & RENAME_EX=
CHANGE) && !target_ip)
eeacd3217b8fa81 Dave Chinner      2015-03-25  3210  		return -EINVAL;
eeacd3217b8fa81 Dave Chinner      2015-03-25  3211  =

7dcf5c3e4527cfa Dave Chinner      2015-03-25  3212  	/*
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3213  	 * If we are doing a w=
hiteout operation, allocate the whiteout inode
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3214  	 * we will be placing =
at the target and ensure the type is set
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3215  	 * appropriately.
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3216  	 */
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3217  	if (flags & RENAME_WHI=
TEOUT) {
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3218  		ASSERT(!(flags & (REN=
AME_NOREPLACE | RENAME_EXCHANGE)));
f736d93d76d3e97 Christoph Hellwig 2021-01-21  3219  		error =3D xfs_rename_=
alloc_whiteout(mnt_userns, target_dp, &wip);
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3220  		if (error)
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3221  			return error;
f6bba2017afb3bd Dave Chinner      2013-08-12  3222  =

7dcf5c3e4527cfa Dave Chinner      2015-03-25  3223  		/* setup target diren=
t info as whiteout */
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3224  		src_name->type =3D XF=
S_DIR3_FT_CHRDEV;
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3225  	}
f6bba2017afb3bd Dave Chinner      2013-08-12  3226  =

7dcf5c3e4527cfa Dave Chinner      2015-03-25  3227  	xfs_sort_for_rename(sr=
c_dp, target_dp, src_ip, target_ip, wip,
f6bba2017afb3bd Dave Chinner      2013-08-12  3228  				inodes, &num_inodes=
);
3818584f03ce2d5 Allison Henderson 2021-03-24  3229  	if (xfs_hasdelattr(mp)=
) {
3818584f03ce2d5 Allison Henderson 2021-03-24  3230  		error =3D xfs_attr_us=
e_log_assist(mp);
3818584f03ce2d5 Allison Henderson 2021-03-24  3231  		if (error)
3818584f03ce2d5 Allison Henderson 2021-03-24  3232  			goto out_release_wip;
3818584f03ce2d5 Allison Henderson 2021-03-24  3233  	}
f6bba2017afb3bd Dave Chinner      2013-08-12  3234  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3235  	spaceres =3D XFS_RENAM=
E_SPACE_RES(mp, target_name->len);
253f4911f297b83 Christoph Hellwig 2016-04-06  3236  	error =3D xfs_trans_al=
loc(mp, &M_RES(mp)->tr_rename, spaceres, 0, 0, &tp);
2451337dd043901 Dave Chinner      2014-06-25  3237  	if (error =3D=3D -ENOS=
PC) {
f6bba2017afb3bd Dave Chinner      2013-08-12  3238  		spaceres =3D 0;
253f4911f297b83 Christoph Hellwig 2016-04-06  3239  		error =3D xfs_trans_a=
lloc(mp, &M_RES(mp)->tr_rename, 0, 0, 0,
253f4911f297b83 Christoph Hellwig 2016-04-06  3240  				&tp);
f6bba2017afb3bd Dave Chinner      2013-08-12  3241  	}
445883e8133975f Dave Chinner      2015-03-25  3242  	if (error)
3818584f03ce2d5 Allison Henderson 2021-03-24  3243  		goto drop_incompat;
f6bba2017afb3bd Dave Chinner      2013-08-12  3244  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3245  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3246  	 * Attach the dquots t=
o the inodes
f6bba2017afb3bd Dave Chinner      2013-08-12  3247  	 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3248  	error =3D xfs_qm_vop_r=
ename_dqattach(inodes);
445883e8133975f Dave Chinner      2015-03-25  3249  	if (error)
445883e8133975f Dave Chinner      2015-03-25  3250  		goto out_trans_cancel;
f6bba2017afb3bd Dave Chinner      2013-08-12  3251  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3252  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3253  	 * Lock all the partic=
ipating inodes. Depending upon whether
f6bba2017afb3bd Dave Chinner      2013-08-12  3254  	 * the target_name exi=
sts in the target directory, and
f6bba2017afb3bd Dave Chinner      2013-08-12  3255  	 * whether the target =
directory is the same as the source
f6bba2017afb3bd Dave Chinner      2013-08-12  3256  	 * directory, we can l=
ock from 2 to 4 inodes.
f6bba2017afb3bd Dave Chinner      2013-08-12  3257  	 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3258  	xfs_lock_inodes(inodes=
, num_inodes, XFS_ILOCK_EXCL);
f6bba2017afb3bd Dave Chinner      2013-08-12  3259  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3260  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3261  	 * Join all the inodes=
 to the transaction. From this point on,
f6bba2017afb3bd Dave Chinner      2013-08-12  3262  	 * we can rely on eith=
er trans_commit or trans_cancel to unlock
f6bba2017afb3bd Dave Chinner      2013-08-12  3263  	 * them.
f6bba2017afb3bd Dave Chinner      2013-08-12  3264  	 */
3818584f03ce2d5 Allison Henderson 2021-03-24  3265  	xfs_trans_ijoin(tp, sr=
c_dp, 0);
f6bba2017afb3bd Dave Chinner      2013-08-12  3266  	if (new_parent)
3818584f03ce2d5 Allison Henderson 2021-03-24  3267  		xfs_trans_ijoin(tp, t=
arget_dp, 0);
3818584f03ce2d5 Allison Henderson 2021-03-24  3268  	xfs_trans_ijoin(tp, sr=
c_ip, 0);
f6bba2017afb3bd Dave Chinner      2013-08-12  3269  	if (target_ip)
3818584f03ce2d5 Allison Henderson 2021-03-24  3270  		xfs_trans_ijoin(tp, t=
arget_ip, 0);
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3271  	if (wip)
3818584f03ce2d5 Allison Henderson 2021-03-24  3272  		xfs_trans_ijoin(tp, w=
ip, 0);
f6bba2017afb3bd Dave Chinner      2013-08-12  3273  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3274  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3275  	 * If we are using pro=
ject inheritance, we only allow renames
f6bba2017afb3bd Dave Chinner      2013-08-12  3276  	 * into our tree when =
the project IDs are the same; else the
f6bba2017afb3bd Dave Chinner      2013-08-12  3277  	 * tree quota mechanis=
m would be circumvented.
f6bba2017afb3bd Dave Chinner      2013-08-12  3278  	 */
db07349da2f5647 Christoph Hellwig 2021-03-29  3279  	if (unlikely((target_d=
p->i_diflags & XFS_DIFLAG_PROJINHERIT) &&
ceaf603c7024d3c Christoph Hellwig 2021-03-29  3280  		     target_dp->i_pro=
jid !=3D src_ip->i_projid)) {
2451337dd043901 Dave Chinner      2014-06-25  3281  		error =3D -EXDEV;
3818584f03ce2d5 Allison Henderson 2021-03-24  3282  		goto out_unlock;
f6bba2017afb3bd Dave Chinner      2013-08-12  3283  	}
f6bba2017afb3bd Dave Chinner      2013-08-12  3284  =

eeacd3217b8fa81 Dave Chinner      2015-03-25  3285  	/* RENAME_EXCHANGE is =
unique from here on. */
3818584f03ce2d5 Allison Henderson 2021-03-24  3286  	if (flags & RENAME_EXC=
HANGE) {
3818584f03ce2d5 Allison Henderson 2021-03-24  3287  		error =3D xfs_cross_r=
ename(tp, src_dp, src_name, src_ip,
d31a1825450062b Carlos Maiolino   2014-12-24  3288  					target_dp, target_=
name, target_ip,
f16dea54b789aad Brian Foster      2018-07-11  3289  					spaceres);
3818584f03ce2d5 Allison Henderson 2021-03-24  3290  		goto out_pptr;
3818584f03ce2d5 Allison Henderson 2021-03-24  3291  	}
f6bba2017afb3bd Dave Chinner      2013-08-12  3292  	/*
bc56ad8c74b8588 kaixuxia          2019-09-03  3293  	 * Check for expected =
errors before we dirty the transaction
bc56ad8c74b8588 kaixuxia          2019-09-03  3294  	 * so we can return an=
 error without a transaction abort.
02092a2f034fdea Chandan Babu R    2021-01-22  3295  	 *
02092a2f034fdea Chandan Babu R    2021-01-22  3296  	 * Extent count overfl=
ow check:
02092a2f034fdea Chandan Babu R    2021-01-22  3297  	 *
02092a2f034fdea Chandan Babu R    2021-01-22  3298  	 * From the perspectiv=
e of src_dp, a rename operation is essentially a
02092a2f034fdea Chandan Babu R    2021-01-22  3299  	 * directory entry rem=
ove operation. Hence the only place where we check
02092a2f034fdea Chandan Babu R    2021-01-22  3300  	 * for extent count ov=
erflow for src_dp is in
02092a2f034fdea Chandan Babu R    2021-01-22  3301  	 * xfs_bmap_del_extent=
_real(). xfs_bmap_del_extent_real() returns
02092a2f034fdea Chandan Babu R    2021-01-22  3302  	 * -ENOSPC when it det=
ects a possible extent count overflow and in
02092a2f034fdea Chandan Babu R    2021-01-22  3303  	 * response, the highe=
r layers of directory handling code do the
02092a2f034fdea Chandan Babu R    2021-01-22  3304  	 * following:
02092a2f034fdea Chandan Babu R    2021-01-22  3305  	 * 1. Data/Free blocks=
: XFS lets these blocks linger until a
02092a2f034fdea Chandan Babu R    2021-01-22  3306  	 *    future remove op=
eration removes them.
02092a2f034fdea Chandan Babu R    2021-01-22  3307  	 * 2. Dabtree blocks: =
XFS swaps the blocks with the last block in the
02092a2f034fdea Chandan Babu R    2021-01-22  3308  	 *    Leaf space and u=
nmaps the last block.
02092a2f034fdea Chandan Babu R    2021-01-22  3309  	 *
02092a2f034fdea Chandan Babu R    2021-01-22  3310  	 * For target_dp, ther=
e are two cases depending on whether the
02092a2f034fdea Chandan Babu R    2021-01-22  3311  	 * destination directo=
ry entry exists or not.
02092a2f034fdea Chandan Babu R    2021-01-22  3312  	 *
02092a2f034fdea Chandan Babu R    2021-01-22  3313  	 * When destination di=
rectory entry does not exist (i.e. target_ip =3D=3D
02092a2f034fdea Chandan Babu R    2021-01-22  3314  	 * NULL), extent count=
 overflow check is performed only when transaction
02092a2f034fdea Chandan Babu R    2021-01-22  3315  	 * has a non-zero size=
d space reservation associated with it.  With a
02092a2f034fdea Chandan Babu R    2021-01-22  3316  	 * zero-sized space re=
servation, XFS allows a rename operation to
02092a2f034fdea Chandan Babu R    2021-01-22  3317  	 * continue only when =
the directory has sufficient free space in its
02092a2f034fdea Chandan Babu R    2021-01-22  3318  	 * data/leaf/free spac=
e blocks to hold the new entry.
02092a2f034fdea Chandan Babu R    2021-01-22  3319  	 *
02092a2f034fdea Chandan Babu R    2021-01-22  3320  	 * When destination di=
rectory entry exists (i.e. target_ip !=3D NULL), all
02092a2f034fdea Chandan Babu R    2021-01-22  3321  	 * we need to do is ch=
ange the inode number associated with the already
02092a2f034fdea Chandan Babu R    2021-01-22  3322  	 * existing entry. Hen=
ce there is no need to perform an extent count
02092a2f034fdea Chandan Babu R    2021-01-22  3323  	 * overflow check.
f6bba2017afb3bd Dave Chinner      2013-08-12  3324  	 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3325  	if (target_ip =3D=3D N=
ULL) {
f6bba2017afb3bd Dave Chinner      2013-08-12  3326  		/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3327  		 * If there's no spac=
e reservation, check the entry will
f6bba2017afb3bd Dave Chinner      2013-08-12  3328  		 * fit before actuall=
y inserting it.
f6bba2017afb3bd Dave Chinner      2013-08-12  3329  		 */
94f3cad555d6604 Eric Sandeen      2014-09-09  3330  		if (!spaceres) {
94f3cad555d6604 Eric Sandeen      2014-09-09  3331  			error =3D xfs_dir_ca=
nenter(tp, target_dp, target_name);
f6bba2017afb3bd Dave Chinner      2013-08-12  3332  			if (error)
3818584f03ce2d5 Allison Henderson 2021-03-24  3333  				goto out_unlock;
02092a2f034fdea Chandan Babu R    2021-01-22  3334  		} else {
02092a2f034fdea Chandan Babu R    2021-01-22  3335  			error =3D xfs_iext_c=
ount_may_overflow(target_dp,
02092a2f034fdea Chandan Babu R    2021-01-22  3336  					XFS_DATA_FORK,
02092a2f034fdea Chandan Babu R    2021-01-22  3337  					XFS_IEXT_DIR_MANIP=
_CNT(mp));
02092a2f034fdea Chandan Babu R    2021-01-22  3338  			if (error)
02092a2f034fdea Chandan Babu R    2021-01-22  3339  				goto out_trans_canc=
el;
94f3cad555d6604 Eric Sandeen      2014-09-09  3340  		}
bc56ad8c74b8588 kaixuxia          2019-09-03  3341  	} else {
bc56ad8c74b8588 kaixuxia          2019-09-03  3342  		/*
bc56ad8c74b8588 kaixuxia          2019-09-03  3343  		 * If target exists a=
nd it's a directory, check that whether
bc56ad8c74b8588 kaixuxia          2019-09-03  3344  		 * it can be destroye=
d.
bc56ad8c74b8588 kaixuxia          2019-09-03  3345  		 */
bc56ad8c74b8588 kaixuxia          2019-09-03  3346  		if (S_ISDIR(VFS_I(tar=
get_ip)->i_mode) &&
bc56ad8c74b8588 kaixuxia          2019-09-03  3347  		    (!xfs_dir_isempty=
(target_ip) ||
bc56ad8c74b8588 kaixuxia          2019-09-03  3348  		     (VFS_I(target_ip=
)->i_nlink > 2))) {
bc56ad8c74b8588 kaixuxia          2019-09-03  3349  			error =3D -EEXIST;
bc56ad8c74b8588 kaixuxia          2019-09-03  3350  			goto out_trans_cance=
l;
bc56ad8c74b8588 kaixuxia          2019-09-03  3351  		}
bc56ad8c74b8588 kaixuxia          2019-09-03  3352  	}
bc56ad8c74b8588 kaixuxia          2019-09-03  3353  =

6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3354  	/*
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3355  	 * Lock the AGI buffer=
s we need to handle bumping the nlink of the
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3356  	 * whiteout inode off =
the unlinked list and to handle dropping the
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3357  	 * nlink of the target=
 inode.  Per locking order rules, do this in
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3358  	 * increasing AG order=
 and before directory block allocation tries to
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3359  	 * grab AGFs because w=
e grab AGIs before AGFs.
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3360  	 *
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3361  	 * The (vfs) caller mu=
st ensure that if src is a directory then
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3362  	 * target_ip is either=
 null or an empty directory.
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3363  	 */
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3364  	for (i =3D 0; i < num_=
inodes && inodes[i] !=3D NULL; i++) {
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3365  		if (inodes[i] =3D=3D =
wip ||
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3366  		    (inodes[i] =3D=3D=
 target_ip &&
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3367  		     (VFS_I(target_ip=
)->i_nlink =3D=3D 1 || src_is_directory))) {
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3368  			struct xfs_buf	*bp;
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3369  			xfs_agnumber_t	agno;
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3370  =

6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3371  			agno =3D XFS_INO_TO_=
AGNO(mp, inodes[i]->i_ino);
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3372  			error =3D xfs_read_a=
gi(mp, tp, agno, &bp);
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3373  			if (error)
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3374  				goto out_trans_canc=
el;
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3375  		}
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3376  	}
6da1b4b1ab36d80 Darrick J. Wong   2021-01-22  3377  =

bc56ad8c74b8588 kaixuxia          2019-09-03  3378  	/*
bc56ad8c74b8588 kaixuxia          2019-09-03  3379  	 * Directory entry cre=
ation below may acquire the AGF. Remove
bc56ad8c74b8588 kaixuxia          2019-09-03  3380  	 * the whiteout from t=
he unlinked list first to preserve correct
bc56ad8c74b8588 kaixuxia          2019-09-03  3381  	 * AGI/AGF locking ord=
er. This dirties the transaction so failures
bc56ad8c74b8588 kaixuxia          2019-09-03  3382  	 * after this point wi=
ll abort and log recovery will clean up the
bc56ad8c74b8588 kaixuxia          2019-09-03  3383  	 * mess.
bc56ad8c74b8588 kaixuxia          2019-09-03  3384  	 *
bc56ad8c74b8588 kaixuxia          2019-09-03  3385  	 * For whiteouts, we n=
eed to bump the link count on the whiteout
bc56ad8c74b8588 kaixuxia          2019-09-03  3386  	 * inode. After this p=
oint, we have a real link, clear the tmpfile
bc56ad8c74b8588 kaixuxia          2019-09-03  3387  	 * state flag from the=
 inode so it doesn't accidentally get misused
bc56ad8c74b8588 kaixuxia          2019-09-03  3388  	 * in future.
bc56ad8c74b8588 kaixuxia          2019-09-03  3389  	 */
bc56ad8c74b8588 kaixuxia          2019-09-03  3390  	if (wip) {
f40aadb2bb64fe0 Dave Chinner      2021-06-02  3391  		struct xfs_perag	*pag;
f40aadb2bb64fe0 Dave Chinner      2021-06-02  3392  =

bc56ad8c74b8588 kaixuxia          2019-09-03  3393  		ASSERT(VFS_I(wip)->i_=
nlink =3D=3D 0);
f40aadb2bb64fe0 Dave Chinner      2021-06-02  3394  =

f40aadb2bb64fe0 Dave Chinner      2021-06-02  3395  		pag =3D xfs_perag_get=
(mp, XFS_INO_TO_AGNO(mp, wip->i_ino));
f40aadb2bb64fe0 Dave Chinner      2021-06-02  3396  		error =3D xfs_iunlink=
_remove(tp, pag, wip);
f40aadb2bb64fe0 Dave Chinner      2021-06-02  3397  		xfs_perag_put(pag);
bc56ad8c74b8588 kaixuxia          2019-09-03  3398  		if (error)
bc56ad8c74b8588 kaixuxia          2019-09-03  3399  			goto out_trans_cance=
l;
bc56ad8c74b8588 kaixuxia          2019-09-03  3400  =

bc56ad8c74b8588 kaixuxia          2019-09-03  3401  		xfs_bumplink(tp, wip);
bc56ad8c74b8588 kaixuxia          2019-09-03  3402  		VFS_I(wip)->i_state &=
=3D ~I_LINKABLE;
bc56ad8c74b8588 kaixuxia          2019-09-03  3403  	}
bc56ad8c74b8588 kaixuxia          2019-09-03  3404  =

bc56ad8c74b8588 kaixuxia          2019-09-03  3405  	/*
bc56ad8c74b8588 kaixuxia          2019-09-03  3406  	 * Set up the target.
bc56ad8c74b8588 kaixuxia          2019-09-03  3407  	 */
bc56ad8c74b8588 kaixuxia          2019-09-03  3408  	if (target_ip =3D=3D N=
ULL) {
f6bba2017afb3bd Dave Chinner      2013-08-12  3409  		/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3410  		 * If target does not=
 exist and the rename crosses
f6bba2017afb3bd Dave Chinner      2013-08-12  3411  		 * directories, adjus=
t the target directory link count
f6bba2017afb3bd Dave Chinner      2013-08-12  3412  		 * to account for the=
 ".." reference from the new entry.
f6bba2017afb3bd Dave Chinner      2013-08-12  3413  		 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3414  		error =3D xfs_dir_cre=
atename(tp, target_dp, target_name,
3818584f03ce2d5 Allison Henderson 2021-03-24  3415  					   src_ip->i_ino, =
spaceres, &new_diroffset);
f6bba2017afb3bd Dave Chinner      2013-08-12  3416  		if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3417  			goto out_trans_cance=
l;
f6bba2017afb3bd Dave Chinner      2013-08-12  3418  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3419  		xfs_trans_ichgtime(tp=
, target_dp,
f6bba2017afb3bd Dave Chinner      2013-08-12  3420  					XFS_ICHGTIME_MOD |=
 XFS_ICHGTIME_CHG);
f6bba2017afb3bd Dave Chinner      2013-08-12  3421  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3422  		if (new_parent && src=
_is_directory) {
910832697cf8553 Eric Sandeen      2019-05-01  3423  			xfs_bumplink(tp, tar=
get_dp);
f6bba2017afb3bd Dave Chinner      2013-08-12  3424  		}
f6bba2017afb3bd Dave Chinner      2013-08-12  3425  	} else { /* target_ip =
!=3D NULL */
f6bba2017afb3bd Dave Chinner      2013-08-12  3426  		/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3427  		 * Link the source in=
ode under the target name.
f6bba2017afb3bd Dave Chinner      2013-08-12  3428  		 * If the source inod=
e is a directory and we are moving
f6bba2017afb3bd Dave Chinner      2013-08-12  3429  		 * it across director=
ies, its ".." entry will be
f6bba2017afb3bd Dave Chinner      2013-08-12  3430  		 * inconsistent until=
 we replace that down below.
f6bba2017afb3bd Dave Chinner      2013-08-12  3431  		 *
f6bba2017afb3bd Dave Chinner      2013-08-12  3432  		 * In case there is a=
lready an entry with the same
f6bba2017afb3bd Dave Chinner      2013-08-12  3433  		 * name at the destin=
ation directory, remove it first.
f6bba2017afb3bd Dave Chinner      2013-08-12  3434  		 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3435  		error =3D xfs_dir_rep=
lace(tp, target_dp, target_name,
3818584f03ce2d5 Allison Henderson 2021-03-24  3436  					src_ip->i_ino, spa=
ceres, &new_diroffset);
f6bba2017afb3bd Dave Chinner      2013-08-12  3437  		if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3438  			goto out_trans_cance=
l;
f6bba2017afb3bd Dave Chinner      2013-08-12  3439  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3440  		xfs_trans_ichgtime(tp=
, target_dp,
f6bba2017afb3bd Dave Chinner      2013-08-12  3441  					XFS_ICHGTIME_MOD |=
 XFS_ICHGTIME_CHG);
f6bba2017afb3bd Dave Chinner      2013-08-12  3442  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3443  		/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3444  		 * Decrement the link=
 count on the target since the target
f6bba2017afb3bd Dave Chinner      2013-08-12  3445  		 * dir no longer poin=
ts to it.
f6bba2017afb3bd Dave Chinner      2013-08-12  3446  		 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3447  		error =3D xfs_droplin=
k(tp, target_ip);
f6bba2017afb3bd Dave Chinner      2013-08-12  3448  		if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3449  			goto out_trans_cance=
l;
f6bba2017afb3bd Dave Chinner      2013-08-12  3450  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3451  		if (src_is_directory)=
 {
f6bba2017afb3bd Dave Chinner      2013-08-12  3452  			/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3453  			 * Drop the link fro=
m the old "." entry.
f6bba2017afb3bd Dave Chinner      2013-08-12  3454  			 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3455  			error =3D xfs_dropli=
nk(tp, target_ip);
f6bba2017afb3bd Dave Chinner      2013-08-12  3456  			if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3457  				goto out_trans_canc=
el;
f6bba2017afb3bd Dave Chinner      2013-08-12  3458  		}
f6bba2017afb3bd Dave Chinner      2013-08-12  3459  	} /* target_ip !=3D NU=
LL */
f6bba2017afb3bd Dave Chinner      2013-08-12  3460  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3461  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3462  	 * Remove the source.
f6bba2017afb3bd Dave Chinner      2013-08-12  3463  	 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3464  	if (new_parent && src_=
is_directory) {
f6bba2017afb3bd Dave Chinner      2013-08-12  3465  		/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3466  		 * Rewrite the ".." e=
ntry to point to the new
f6bba2017afb3bd Dave Chinner      2013-08-12  3467  		 * directory.
f6bba2017afb3bd Dave Chinner      2013-08-12  3468  		 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3469  		error =3D xfs_dir_rep=
lace(tp, src_ip, &xfs_name_dotdot,
3818584f03ce2d5 Allison Henderson 2021-03-24  3470  					target_dp->i_ino, =
spaceres, &new_diroffset);
2451337dd043901 Dave Chinner      2014-06-25  3471  		ASSERT(error !=3D -EE=
XIST);
f6bba2017afb3bd Dave Chinner      2013-08-12  3472  		if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3473  			goto out_trans_cance=
l;
f6bba2017afb3bd Dave Chinner      2013-08-12  3474  	}
f6bba2017afb3bd Dave Chinner      2013-08-12  3475  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3476  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3477  	 * We always want to h=
it the ctime on the source inode.
f6bba2017afb3bd Dave Chinner      2013-08-12  3478  	 *
f6bba2017afb3bd Dave Chinner      2013-08-12  3479  	 * This isn't strictly=
 required by the standards since the source
f6bba2017afb3bd Dave Chinner      2013-08-12  3480  	 * inode isn't really =
being changed, but old unix file systems did
f6bba2017afb3bd Dave Chinner      2013-08-12  3481  	 * it and some increme=
ntal backup programs won't work without it.
f6bba2017afb3bd Dave Chinner      2013-08-12  3482  	 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3483  	xfs_trans_ichgtime(tp,=
 src_ip, XFS_ICHGTIME_CHG);
f6bba2017afb3bd Dave Chinner      2013-08-12  3484  	xfs_trans_log_inode(tp=
, src_ip, XFS_ILOG_CORE);
f6bba2017afb3bd Dave Chinner      2013-08-12  3485  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3486  	/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3487  	 * Adjust the link cou=
nt on src_dp.  This is necessary when
f6bba2017afb3bd Dave Chinner      2013-08-12  3488  	 * renaming a director=
y, either within one parent when
f6bba2017afb3bd Dave Chinner      2013-08-12  3489  	 * the target existed,=
 or across two parent directories.
f6bba2017afb3bd Dave Chinner      2013-08-12  3490  	 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3491  	if (src_is_directory &=
& (new_parent || target_ip !=3D NULL)) {
f6bba2017afb3bd Dave Chinner      2013-08-12  3492  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3493  		/*
f6bba2017afb3bd Dave Chinner      2013-08-12  3494  		 * Decrement link cou=
nt on src_directory since the
f6bba2017afb3bd Dave Chinner      2013-08-12  3495  		 * entry that's moved=
 no longer points to it.
f6bba2017afb3bd Dave Chinner      2013-08-12  3496  		 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3497  		error =3D xfs_droplin=
k(tp, src_dp);
f6bba2017afb3bd Dave Chinner      2013-08-12  3498  		if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3499  			goto out_trans_cance=
l;
f6bba2017afb3bd Dave Chinner      2013-08-12  3500  	}
f6bba2017afb3bd Dave Chinner      2013-08-12  3501  =

7dcf5c3e4527cfa Dave Chinner      2015-03-25  3502  	/*
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3503  	 * For whiteouts, we o=
nly need to update the source dirent with the
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3504  	 * inode number of the=
 whiteout inode rather than removing it
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3505  	 * altogether.
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3506  	 */
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3507  	if (wip) {
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3508  		error =3D xfs_dir_rep=
lace(tp, src_dp, src_name, wip->i_ino,
3818584f03ce2d5 Allison Henderson 2021-03-24  3509  					spaceres, &old_dir=
offset);
02092a2f034fdea Chandan Babu R    2021-01-22  3510  	} else {
02092a2f034fdea Chandan Babu R    2021-01-22  3511  		/*
02092a2f034fdea Chandan Babu R    2021-01-22  3512  		 * NOTE: We don't nee=
d to check for extent count overflow here
02092a2f034fdea Chandan Babu R    2021-01-22  3513  		 * because the dir re=
move name code will leave the dir block in
02092a2f034fdea Chandan Babu R    2021-01-22  3514  		 * place if the exten=
t count would overflow.
02092a2f034fdea Chandan Babu R    2021-01-22  3515  		 */
f6bba2017afb3bd Dave Chinner      2013-08-12  3516  		error =3D xfs_dir_rem=
ovename(tp, src_dp, src_name, src_ip->i_ino,
3818584f03ce2d5 Allison Henderson 2021-03-24  3517  					   spaceres, &old_=
diroffset);
02092a2f034fdea Chandan Babu R    2021-01-22  3518  	}
02092a2f034fdea Chandan Babu R    2021-01-22  3519  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3520  	if (error)
c8eac49ef798a7d Brian Foster      2018-07-24  3521  		goto out_trans_cancel;
f6bba2017afb3bd Dave Chinner      2013-08-12  3522  =

3818584f03ce2d5 Allison Henderson 2021-03-24  3523  out_pptr:
3818584f03ce2d5 Allison Henderson 2021-03-24  3524  	if (xfs_sb_version_has=
parent(&mp->m_sb)) {
3818584f03ce2d5 Allison Henderson 2021-03-24  3525  		new_args.trans	=3D tp;
3818584f03ce2d5 Allison Henderson 2021-03-24 @3526  		xfs_init_parent_name_=
rec(&new_rec, target_dp, new_diroffset);
3818584f03ce2d5 Allison Henderson 2021-03-24  3527  		new_args.hashval =3D =
xfs_da_hashname(new_args.name,
3818584f03ce2d5 Allison Henderson 2021-03-24  3528  						   new_args.namel=
en);
3818584f03ce2d5 Allison Henderson 2021-03-24  3529  		error =3D  xfs_attr_s=
et_deferred(&new_args);
3818584f03ce2d5 Allison Henderson 2021-03-24  3530  		if (error)
3818584f03ce2d5 Allison Henderson 2021-03-24  3531  			goto out_trans_cance=
l;
3818584f03ce2d5 Allison Henderson 2021-03-24  3532  =

3818584f03ce2d5 Allison Henderson 2021-03-24  3533  		old_args.trans	=3D tp;
3818584f03ce2d5 Allison Henderson 2021-03-24 @3534  		xfs_init_parent_name_=
rec(&old_rec, src_dp, old_diroffset);
3818584f03ce2d5 Allison Henderson 2021-03-24  3535  		old_args.hashval =3D =
xfs_da_hashname(old_args.name,
3818584f03ce2d5 Allison Henderson 2021-03-24  3536  						   old_args.namel=
en);
3818584f03ce2d5 Allison Henderson 2021-03-24  3537  		error =3D xfs_attr_re=
move_deferred(&old_args);
3818584f03ce2d5 Allison Henderson 2021-03-24  3538  		if (error)
3818584f03ce2d5 Allison Henderson 2021-03-24  3539  			goto out_trans_cance=
l;
3818584f03ce2d5 Allison Henderson 2021-03-24  3540  	}
3818584f03ce2d5 Allison Henderson 2021-03-24  3541  =

f6bba2017afb3bd Dave Chinner      2013-08-12  3542  	xfs_trans_ichgtime(tp,=
 src_dp, XFS_ICHGTIME_MOD | XFS_ICHGTIME_CHG);
f6bba2017afb3bd Dave Chinner      2013-08-12  3543  	xfs_trans_log_inode(tp=
, src_dp, XFS_ILOG_CORE);
f6bba2017afb3bd Dave Chinner      2013-08-12  3544  	if (new_parent)
f6bba2017afb3bd Dave Chinner      2013-08-12  3545  		xfs_trans_log_inode(t=
p, target_dp, XFS_ILOG_CORE);
f6bba2017afb3bd Dave Chinner      2013-08-12  3546  =

c9cfdb381172174 Brian Foster      2018-07-11  3547  	error =3D xfs_finish_r=
ename(tp);
3818584f03ce2d5 Allison Henderson 2021-03-24  3548  =

3818584f03ce2d5 Allison Henderson 2021-03-24  3549  out_unlock:
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3550  	if (wip)
44a8736bd20a08e Darrick J. Wong   2018-07-25  3551  		xfs_irele(wip);
3818584f03ce2d5 Allison Henderson 2021-03-24  3552  	if (wip)
3818584f03ce2d5 Allison Henderson 2021-03-24  3553  		xfs_iunlock(wip, XFS_=
ILOCK_EXCL);
3818584f03ce2d5 Allison Henderson 2021-03-24  3554  	if (target_ip)
3818584f03ce2d5 Allison Henderson 2021-03-24  3555  		xfs_iunlock(target_ip=
, XFS_ILOCK_EXCL);
3818584f03ce2d5 Allison Henderson 2021-03-24  3556  	xfs_iunlock(src_ip, XF=
S_ILOCK_EXCL);
3818584f03ce2d5 Allison Henderson 2021-03-24  3557  	if (new_parent)
3818584f03ce2d5 Allison Henderson 2021-03-24  3558  		xfs_iunlock(target_dp=
, XFS_ILOCK_EXCL);
3818584f03ce2d5 Allison Henderson 2021-03-24  3559  	xfs_iunlock(src_dp, XF=
S_ILOCK_EXCL);
3818584f03ce2d5 Allison Henderson 2021-03-24  3560  =

7dcf5c3e4527cfa Dave Chinner      2015-03-25  3561  	return error;
f6bba2017afb3bd Dave Chinner      2013-08-12  3562  =

445883e8133975f Dave Chinner      2015-03-25  3563  out_trans_cancel:
4906e21545814e4 Christoph Hellwig 2015-06-04  3564  	xfs_trans_cancel(tp);
3818584f03ce2d5 Allison Henderson 2021-03-24  3565  drop_incompat:
3818584f03ce2d5 Allison Henderson 2021-03-24  3566  	if (xfs_hasdelattr(mp))
3818584f03ce2d5 Allison Henderson 2021-03-24  3567  		xlog_drop_incompat_fe=
at(mp->m_log);
253f4911f297b83 Christoph Hellwig 2016-04-06  3568  out_release_wip:
7dcf5c3e4527cfa Dave Chinner      2015-03-25  3569  	if (wip)
44a8736bd20a08e Darrick J. Wong   2018-07-25  3570  		xfs_irele(wip);
f6bba2017afb3bd Dave Chinner      2013-08-12  3571  	return error;
f6bba2017afb3bd Dave Chinner      2013-08-12  3572  }
f6bba2017afb3bd Dave Chinner      2013-08-12  3573  =


:::::: The code at line 3526 was first introduced by commit
:::::: 3818584f03ce2d5c1310199a6466aafdf22c8256 xfs: Add parent pointers to=
 rename

:::::: TO: Allison Henderson <allison.henderson@oracle.com>
:::::: CC: Allison Henderson <allison.henderson@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8798401080952035664==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
ZyUPTsFx4//6C7ygL5tU4QEA
--===============8798401080952035664==--

