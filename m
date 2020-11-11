Content-Type: multipart/mixed; boundary="===============8613088921986672194=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/xfs/libxfs/xfs_attr_remote.c:734:9: warning: Identical condition 'error', second condition is always false
Date: Wed, 11 Nov 2020 15:52:45 +0800
Message-ID: <202011111540.DmP4BQQI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8613088921986672194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Allison Collins <allison.henderson@oracle.com>
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: Chandan Rajendra <chandanrlinux@gmail.com>
CC: Brian Foster <bfoster@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eccc876724927ff3b9ff91f36f7b6b159e948f0c
commit: 8b8e0cc0208befc5971d552a8798c8f5537afa45 xfs: Refactor xfs_attr_rmt=
val_remove
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/xfs/libxfs/xfs_attr_remote.c:
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
>> fs/xfs/libxfs/xfs_attr_remote.c:734:9: warning: Identical condition 'err=
or', second condition is always false [identicalConditionAfterEarlyExit]
    return error;
           ^
   fs/xfs/libxfs/xfs_attr_remote.c:728:6: note: first condition
    if (error)
        ^
   fs/xfs/libxfs/xfs_attr_remote.c:734:9: note: second condition
    return error;
           ^
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
>> fs/xfs/libxfs/xfs_btree.c:690:21: warning: Array 'cur->bc_bufs[9]' acces=
sed at index 9998, which is out of bounds. [arrayIndexOutOfBounds]
    *bpp =3D cur->bc_bufs[level];
                       ^
   fs/xfs/libxfs/xfs_btree.c:4163:33: note: Calling function 'xfs_btree_del=
rec', 2nd argument 'level' value is 9998
     error =3D xfs_btree_delrec(cur, level, &i);
                                   ^
   fs/xfs/libxfs/xfs_btree.c:3657:35: note: Calling function 'xfs_btree_get=
_block', 2nd argument 'level' value is 9998
    block =3D xfs_btree_get_block(cur, level, &bp);
                                     ^
   fs/xfs/libxfs/xfs_btree.c:690:21: note: Array index out of bounds
    *bpp =3D cur->bc_bufs[level];
                       ^
   fs/xfs/libxfs/xfs_btree.c:3650:20: warning: Array 'cur->bc_ptrs[9]' acce=
ssed at index 9998, which is out of bounds. [arrayIndexOutOfBounds]
    ptr =3D cur->bc_ptrs[level];
                      ^
   fs/xfs/libxfs/xfs_btree.c:4163:33: note: Calling function 'xfs_btree_del=
rec', 2nd argument 'level' value is 9998
     error =3D xfs_btree_delrec(cur, level, &i);
                                   ^
   fs/xfs/libxfs/xfs_btree.c:3650:20: note: Array index out of bounds
    ptr =3D cur->bc_ptrs[level];
                      ^
   fs/xfs/libxfs/xfs_btree.c:1350:27: warning: Suspicious code: sign conver=
sion of dir in calculation, even though dir can have a negative value [sign=
Conversion]
    dst_key =3D (char *)key + (dir * cur->bc_ops->key_len);
                             ^
   fs/xfs/libxfs/xfs_btree.c:1369:27: warning: Suspicious code: sign conver=
sion of dir in calculation, even though dir can have a negative value [sign=
Conversion]
    dst_rec =3D (char *)rec + (dir * cur->bc_ops->rec_len);
                             ^
   fs/xfs/libxfs/xfs_btree.c:1388:27: warning: Suspicious code: sign conver=
sion of dir in calculation, even though dir can have a negative value [sign=
Conversion]
    dst_ptr =3D (char *)ptr + (dir * xfs_btree_ptr_len(cur));
                             ^
   fs/xfs/libxfs/xfs_btree.c:690:14: warning: Array 'cur.bc_bufs[9]' access=
ed at index 9998, which is out of bounds. [arrayIndexOutOfBounds]
    *bpp =3D cur->bc_bufs[level];
                ^
>> fs/xfs/libxfs/xfs_btree.c:3650:13: warning: Array 'cur.bc_ptrs[9]' acces=
sed at index 9998, which is out of bounds. [arrayIndexOutOfBounds]
    ptr =3D cur->bc_ptrs[level];
               ^
--
>> fs/xfs/libxfs/xfs_inode_fork.c:558:3: warning: Assignment of function pa=
rameter has no effect outside the function. Did you forget dereferencing it=
? [uselessAssignmentPtrArg]
     dp++;
     ^
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

vim +/error +734 fs/xfs/libxfs/xfs_attr_remote.c

8b8e0cc0208befc Allison Collins 2020-07-20  707  =

8b8e0cc0208befc Allison Collins 2020-07-20  708  /*
8b8e0cc0208befc Allison Collins 2020-07-20  709   * Remove the value associ=
ated with an attribute by deleting the out-of-line
8b8e0cc0208befc Allison Collins 2020-07-20  710   * buffer that it is store=
d on. Returns EAGAIN for the caller to refresh the
8b8e0cc0208befc Allison Collins 2020-07-20  711   * transaction and re-call=
 the function
8b8e0cc0208befc Allison Collins 2020-07-20  712   */
8b8e0cc0208befc Allison Collins 2020-07-20  713  int
8b8e0cc0208befc Allison Collins 2020-07-20  714  __xfs_attr_rmtval_remove(
8b8e0cc0208befc Allison Collins 2020-07-20  715  	struct xfs_da_args	*args)
8b8e0cc0208befc Allison Collins 2020-07-20  716  {
8b8e0cc0208befc Allison Collins 2020-07-20  717  	int			error, done;
8b8e0cc0208befc Allison Collins 2020-07-20  718  =

8b8e0cc0208befc Allison Collins 2020-07-20  719  	/*
8b8e0cc0208befc Allison Collins 2020-07-20  720  	 * Unmap value blocks for=
 this attr.
8b8e0cc0208befc Allison Collins 2020-07-20  721  	 */
8b8e0cc0208befc Allison Collins 2020-07-20  722  	error =3D xfs_bunmapi(arg=
s->trans, args->dp, args->rmtblkno,
8b8e0cc0208befc Allison Collins 2020-07-20  723  			    args->rmtblkcnt, XF=
S_BMAPI_ATTRFORK, 1, &done);
8b8e0cc0208befc Allison Collins 2020-07-20  724  	if (error)
8b8e0cc0208befc Allison Collins 2020-07-20  725  		return error;
8b8e0cc0208befc Allison Collins 2020-07-20  726  =

8b8e0cc0208befc Allison Collins 2020-07-20  727  	error =3D xfs_defer_finis=
h(&args->trans);
8b8e0cc0208befc Allison Collins 2020-07-20  728  	if (error)
8b8e0cc0208befc Allison Collins 2020-07-20  729  		return error;
8b8e0cc0208befc Allison Collins 2020-07-20  730  =

8b8e0cc0208befc Allison Collins 2020-07-20  731  	if (!done)
8b8e0cc0208befc Allison Collins 2020-07-20  732  		return -EAGAIN;
8b8e0cc0208befc Allison Collins 2020-07-20  733  =

8b8e0cc0208befc Allison Collins 2020-07-20 @734  	return error;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8613088921986672194==--

