Content-Type: multipart/mixed; boundary="===============7386685290168055387=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [allisonhenderson-xfs_work:delayed_attrs_v22_extended 28/32] fs/xfs/xfs_inode.c:3287:3: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 28 Jul 2021 04:03:47 +0800
Message-ID: <202107280442.uDSMSKAb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7386685290168055387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Allison Henderson <allison.henderson@oracle.com>

tree:   https://github.com/allisonhenderson/xfs_work.git delayed_attrs_v22_=
extended
head:   aff89515c2d9aca9b24ac0296f3806af62cd9206
commit: 3818584f03ce2d5c1310199a6466aafdf22c8256 [28/32] xfs: Add parent po=
inters to rename
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-c001-20210727 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project c658b4=
72f3e61e1818e1909bf02f3d65470018a5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://github.com/allisonhenderson/xfs_work/commit/3818584f03ce2=
d5c1310199a6466aafdf22c8256
        git remote add allisonhenderson-xfs_work https://github.com/allison=
henderson/xfs_work.git
        git fetch --no-tags allisonhenderson-xfs_work delayed_attrs_v22_ext=
ended
        git checkout 3818584f03ce2d5c1310199a6466aafdf22c8256
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                      ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/md/dm-zoned-target.c:481:29: note: Taking false branch
           struct dm_chunk_work *cw =3D container_of(work, struct dm_chunk_=
work, work);
                                      ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/md/dm-zoned-target.c:481:29: note: Loop condition is false.  Exi=
ting loop
           struct dm_chunk_work *cw =3D container_of(work, struct dm_chunk_=
work, work);
                                      ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/md/dm-zoned-target.c:488:2: note: Loop condition is true.  Enter=
ing loop body
           while ((bio =3D bio_list_pop(&cw->bio_list))) {
           ^
   drivers/md/dm-zoned-target.c:492:3: note: Calling 'dmz_put_chunk_work'
                   dmz_put_chunk_work(cw);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-zoned-target.c:469:6: note: Assuming the condition is true
           if (refcount_dec_and_test(&cw->refcount)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-zoned-target.c:469:2: note: Taking true branch
           if (refcount_dec_and_test(&cw->refcount)) {
           ^
   drivers/md/dm-zoned-target.c:470:3: note: Taking false branch
                   WARN_ON(!bio_list_empty(&cw->bio_list));
                   ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/md/dm-zoned-target.c:472:3: note: Memory is released
                   kfree(cw);
                   ^~~~~~~~~
   drivers/md/dm-zoned-target.c:492:3: note: Returning; memory was released=
 via 1st parameter
                   dmz_put_chunk_work(cw);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-zoned-target.c:488:16: note: Calling 'bio_list_pop'
           while ((bio =3D bio_list_pop(&cw->bio_list))) {
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bio.h:657:20: note: Use of memory after it is freed
           struct bio *bio =3D bl->head;
                             ^~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   fs/xfs/xfs_iops.c:704:11: warning: Value stored to 'uid' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           kuid_t                  uid =3D GLOBAL_ROOT_UID, iuid =3D GLOBAL=
_ROOT_UID;
                                   ^~~
   fs/xfs/xfs_iops.c:704:11: note: Value stored to 'uid' during its initial=
ization is never read
           kuid_t                  uid =3D GLOBAL_ROOT_UID, iuid =3D GLOBAL=
_ROOT_UID;
                                   ^~~
   fs/xfs/xfs_iops.c:704:34: warning: Value stored to 'iuid' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           kuid_t                  uid =3D GLOBAL_ROOT_UID, iuid =3D GLOBAL=
_ROOT_UID;
                                                          ^~~~
   fs/xfs/xfs_iops.c:704:34: note: Value stored to 'iuid' during its initia=
lization is never read
           kuid_t                  uid =3D GLOBAL_ROOT_UID, iuid =3D GLOBAL=
_ROOT_UID;
                                                          ^~~~
   fs/xfs/xfs_iops.c:705:11: warning: Value stored to 'gid' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           kgid_t                  gid =3D GLOBAL_ROOT_GID, igid =3D GLOBAL=
_ROOT_GID;
                                   ^~~
   fs/xfs/xfs_iops.c:705:11: note: Value stored to 'gid' during its initial=
ization is never read
           kgid_t                  gid =3D GLOBAL_ROOT_GID, igid =3D GLOBAL=
_ROOT_GID;
                                   ^~~
   fs/xfs/xfs_iops.c:705:34: warning: Value stored to 'igid' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           kgid_t                  gid =3D GLOBAL_ROOT_GID, igid =3D GLOBAL=
_ROOT_GID;
                                                          ^~~~
   fs/xfs/xfs_iops.c:705:34: note: Value stored to 'igid' during its initia=
lization is never read
           kgid_t                  gid =3D GLOBAL_ROOT_GID, igid =3D GLOBAL=
_ROOT_GID;
                                                          ^~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> fs/xfs/xfs_inode.c:3287:3: warning: Value stored to 'error' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   error =3D xfs_cross_rename(tp, src_dp, src_name, src_ip,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_inode.c:3287:3: note: Value stored to 'error' is never read
                   error =3D xfs_cross_rename(tp, src_dp, src_name, src_ip,
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/input/touchscreen/edt-ft5x06.c:705:21: warning: Value stored to =
'client' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct i2c_client *client =3D tsdata->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   drivers/input/touchscreen/edt-ft5x06.c:705:21: note: Value stored to 'cl=
ient' during its initialization is never read
           struct i2c_client *client =3D tsdata->client;
                              ^~~~~~   ~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/md/dm-snap-persistent.c:632:6: warning: Branch condition evaluat=
es to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (new_snapshot) {
               ^~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:609:9: note: 'new_snapshot' declared wit=
hout an initial value
           int r, new_snapshot;
                  ^~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:615:6: note: Calling 'read_header'
           r =3D read_header(ps, &new_snapshot);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:315:6: note: Assuming field 'chunk_size'=
 is not equal to 0
           if (!ps->store->chunk_size) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:315:2: note: Taking false branch
           if (!ps->store->chunk_size) {
           ^
   drivers/md/dm-snap-persistent.c:325:6: note: Calling 'IS_ERR'
           if (IS_ERR(ps->io_client))
               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is true
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/err.h:36:2: note: Returning the value 1, which participate=
s in a condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:325:6: note: Returning from 'IS_ERR'
           if (IS_ERR(ps->io_client))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-snap-persistent.c:325:2: note: Taking true branch
           if (IS_ERR(ps->io_client))
           ^
   drivers/md/dm-snap-persistent.c:326:3: note: Returning without writing t=
o 'ps->callbacks', which participates in a condition later
                   return PTR_ERR(ps->io_client);
                   ^
   drivers/md/dm-snap-persistent.c:326:3: note: Returning without writing t=
o '*new_snapshot'
   drivers/md/dm-snap-persistent.c:326:3: note: Returning value, which part=
icipates in a condition later

vim +/error +3287 fs/xfs/xfs_inode.c

7dcf5c3e4527cf Dave Chinner      2015-03-25  3155  =

f6bba2017afb3b Dave Chinner      2013-08-12  3156  /*
f6bba2017afb3b Dave Chinner      2013-08-12  3157   * xfs_rename
f6bba2017afb3b Dave Chinner      2013-08-12  3158   */
f6bba2017afb3b Dave Chinner      2013-08-12  3159  int
f6bba2017afb3b Dave Chinner      2013-08-12  3160  xfs_rename(
f736d93d76d3e9 Christoph Hellwig 2021-01-21  3161  	struct user_namespace		=
*mnt_userns,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3162  	struct xfs_inode		*src_=
dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3163  	struct xfs_name			*src_=
name,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3164  	struct xfs_inode		*src_=
ip,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3165  	struct xfs_inode		*targ=
et_dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3166  	struct xfs_name			*targ=
et_name,
7dcf5c3e4527cf Dave Chinner      2015-03-25  3167  	struct xfs_inode		*targ=
et_ip,
d31a1825450062 Carlos Maiolino   2014-12-24  3168  	unsigned int			flags)
f6bba2017afb3b Dave Chinner      2013-08-12  3169  {
7dcf5c3e4527cf Dave Chinner      2015-03-25  3170  	struct xfs_mount		*mp =
=3D src_dp->i_mount;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3171  	struct xfs_trans		*tp;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3172  	struct xfs_inode		*wip =
=3D NULL;		/* whiteout inode */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3173  	struct xfs_inode		*inod=
es[__XFS_SORT_INODES];
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3174  	int				i;
95afcf5c7bca93 Dave Chinner      2015-03-25  3175  	int				num_inodes =3D _=
_XFS_SORT_INODES;
2b93681f593577 Dave Chinner      2015-03-25  3176  	bool				new_parent =3D =
(src_dp !=3D target_dp);
c19b3b05ae440d Dave Chinner      2016-02-09  3177  	bool				src_is_director=
y =3D S_ISDIR(VFS_I(src_ip)->i_mode);
f6bba2017afb3b Dave Chinner      2013-08-12  3178  	int				spaceres;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3179  	int				error;
3818584f03ce2d Allison Henderson 2021-03-24  3180  	struct xfs_parent_name_=
rec	new_rec;
3818584f03ce2d Allison Henderson 2021-03-24  3181  	struct xfs_parent_name_=
rec	old_rec;
3818584f03ce2d Allison Henderson 2021-03-24  3182  	xfs_dir2_dataptr_t		new=
_diroffset;
3818584f03ce2d Allison Henderson 2021-03-24  3183  	xfs_dir2_dataptr_t		old=
_diroffset;
3818584f03ce2d Allison Henderson 2021-03-24  3184  	struct xfs_da_args		new=
_args =3D {
3818584f03ce2d Allison Henderson 2021-03-24  3185  		.dp		=3D src_ip,
3818584f03ce2d Allison Henderson 2021-03-24  3186  		.geo		=3D mp->m_attr_g=
eo,
3818584f03ce2d Allison Henderson 2021-03-24  3187  		.whichfork	=3D XFS_ATT=
R_FORK,
3818584f03ce2d Allison Henderson 2021-03-24  3188  		.attr_filter	=3D XFS_A=
TTR_PARENT,
3818584f03ce2d Allison Henderson 2021-03-24  3189  		.op_flags	=3D XFS_DA_O=
P_OKNOENT,
3818584f03ce2d Allison Henderson 2021-03-24  3190  		.name		=3D (const uint=
8_t *)&new_rec,
3818584f03ce2d Allison Henderson 2021-03-24  3191  		.namelen	=3D sizeof(ne=
w_rec),
3818584f03ce2d Allison Henderson 2021-03-24  3192  		.value		=3D (void *)ta=
rget_name->name,
3818584f03ce2d Allison Henderson 2021-03-24  3193  		.valuelen	=3D target_n=
ame->len,
3818584f03ce2d Allison Henderson 2021-03-24  3194  	};
3818584f03ce2d Allison Henderson 2021-03-24  3195  	struct xfs_da_args		old=
_args =3D {
3818584f03ce2d Allison Henderson 2021-03-24  3196  		.dp		=3D src_ip,
3818584f03ce2d Allison Henderson 2021-03-24  3197  		.geo		=3D mp->m_attr_g=
eo,
3818584f03ce2d Allison Henderson 2021-03-24  3198  		.whichfork	=3D XFS_ATT=
R_FORK,
3818584f03ce2d Allison Henderson 2021-03-24  3199  		.attr_filter	=3D XFS_A=
TTR_PARENT,
3818584f03ce2d Allison Henderson 2021-03-24  3200  		.op_flags	=3D XFS_DA_O=
P_OKNOENT,
3818584f03ce2d Allison Henderson 2021-03-24  3201  		.name		=3D (const uint=
8_t *)&old_rec,
3818584f03ce2d Allison Henderson 2021-03-24  3202  		.namelen	=3D sizeof(ol=
d_rec),
3818584f03ce2d Allison Henderson 2021-03-24  3203  		.value		=3D NULL,
3818584f03ce2d Allison Henderson 2021-03-24  3204  		.valuelen	=3D 0,
3818584f03ce2d Allison Henderson 2021-03-24  3205  	};
f6bba2017afb3b Dave Chinner      2013-08-12  3206  =

f6bba2017afb3b Dave Chinner      2013-08-12  3207  	trace_xfs_rename(src_dp=
, target_dp, src_name, target_name);
f6bba2017afb3b Dave Chinner      2013-08-12  3208  =

eeacd3217b8fa8 Dave Chinner      2015-03-25  3209  	if ((flags & RENAME_EXC=
HANGE) && !target_ip)
eeacd3217b8fa8 Dave Chinner      2015-03-25  3210  		return -EINVAL;
eeacd3217b8fa8 Dave Chinner      2015-03-25  3211  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3212  	/*
7dcf5c3e4527cf Dave Chinner      2015-03-25  3213  	 * If we are doing a wh=
iteout operation, allocate the whiteout inode
7dcf5c3e4527cf Dave Chinner      2015-03-25  3214  	 * we will be placing a=
t the target and ensure the type is set
7dcf5c3e4527cf Dave Chinner      2015-03-25  3215  	 * appropriately.
7dcf5c3e4527cf Dave Chinner      2015-03-25  3216  	 */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3217  	if (flags & RENAME_WHIT=
EOUT) {
7dcf5c3e4527cf Dave Chinner      2015-03-25  3218  		ASSERT(!(flags & (RENA=
ME_NOREPLACE | RENAME_EXCHANGE)));
f736d93d76d3e9 Christoph Hellwig 2021-01-21  3219  		error =3D xfs_rename_a=
lloc_whiteout(mnt_userns, target_dp, &wip);
7dcf5c3e4527cf Dave Chinner      2015-03-25  3220  		if (error)
7dcf5c3e4527cf Dave Chinner      2015-03-25  3221  			return error;
f6bba2017afb3b Dave Chinner      2013-08-12  3222  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3223  		/* setup target dirent=
 info as whiteout */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3224  		src_name->type =3D XFS=
_DIR3_FT_CHRDEV;
7dcf5c3e4527cf Dave Chinner      2015-03-25  3225  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3226  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3227  	xfs_sort_for_rename(src=
_dp, target_dp, src_ip, target_ip, wip,
f6bba2017afb3b Dave Chinner      2013-08-12  3228  				inodes, &num_inodes);
3818584f03ce2d Allison Henderson 2021-03-24  3229  	if (xfs_hasdelattr(mp))=
 {
3818584f03ce2d Allison Henderson 2021-03-24  3230  		error =3D xfs_attr_use=
_log_assist(mp);
3818584f03ce2d Allison Henderson 2021-03-24  3231  		if (error)
3818584f03ce2d Allison Henderson 2021-03-24  3232  			goto out_release_wip;
3818584f03ce2d Allison Henderson 2021-03-24  3233  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3234  =

f6bba2017afb3b Dave Chinner      2013-08-12  3235  	spaceres =3D XFS_RENAME=
_SPACE_RES(mp, target_name->len);
253f4911f297b8 Christoph Hellwig 2016-04-06  3236  	error =3D xfs_trans_all=
oc(mp, &M_RES(mp)->tr_rename, spaceres, 0, 0, &tp);
2451337dd04390 Dave Chinner      2014-06-25  3237  	if (error =3D=3D -ENOSP=
C) {
f6bba2017afb3b Dave Chinner      2013-08-12  3238  		spaceres =3D 0;
253f4911f297b8 Christoph Hellwig 2016-04-06  3239  		error =3D xfs_trans_al=
loc(mp, &M_RES(mp)->tr_rename, 0, 0, 0,
253f4911f297b8 Christoph Hellwig 2016-04-06  3240  				&tp);
f6bba2017afb3b Dave Chinner      2013-08-12  3241  	}
445883e8133975 Dave Chinner      2015-03-25  3242  	if (error)
3818584f03ce2d Allison Henderson 2021-03-24  3243  		goto drop_incompat;
f6bba2017afb3b Dave Chinner      2013-08-12  3244  =

f6bba2017afb3b Dave Chinner      2013-08-12  3245  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3246  	 * Attach the dquots to=
 the inodes
f6bba2017afb3b Dave Chinner      2013-08-12  3247  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3248  	error =3D xfs_qm_vop_re=
name_dqattach(inodes);
445883e8133975 Dave Chinner      2015-03-25  3249  	if (error)
445883e8133975 Dave Chinner      2015-03-25  3250  		goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3251  =

f6bba2017afb3b Dave Chinner      2013-08-12  3252  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3253  	 * Lock all the partici=
pating inodes. Depending upon whether
f6bba2017afb3b Dave Chinner      2013-08-12  3254  	 * the target_name exis=
ts in the target directory, and
f6bba2017afb3b Dave Chinner      2013-08-12  3255  	 * whether the target d=
irectory is the same as the source
f6bba2017afb3b Dave Chinner      2013-08-12  3256  	 * directory, we can lo=
ck from 2 to 4 inodes.
f6bba2017afb3b Dave Chinner      2013-08-12  3257  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3258  	xfs_lock_inodes(inodes,=
 num_inodes, XFS_ILOCK_EXCL);
f6bba2017afb3b Dave Chinner      2013-08-12  3259  =

f6bba2017afb3b Dave Chinner      2013-08-12  3260  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3261  	 * Join all the inodes =
to the transaction. From this point on,
f6bba2017afb3b Dave Chinner      2013-08-12  3262  	 * we can rely on eithe=
r trans_commit or trans_cancel to unlock
f6bba2017afb3b Dave Chinner      2013-08-12  3263  	 * them.
f6bba2017afb3b Dave Chinner      2013-08-12  3264  	 */
3818584f03ce2d Allison Henderson 2021-03-24  3265  	xfs_trans_ijoin(tp, src=
_dp, 0);
f6bba2017afb3b Dave Chinner      2013-08-12  3266  	if (new_parent)
3818584f03ce2d Allison Henderson 2021-03-24  3267  		xfs_trans_ijoin(tp, ta=
rget_dp, 0);
3818584f03ce2d Allison Henderson 2021-03-24  3268  	xfs_trans_ijoin(tp, src=
_ip, 0);
f6bba2017afb3b Dave Chinner      2013-08-12  3269  	if (target_ip)
3818584f03ce2d Allison Henderson 2021-03-24  3270  		xfs_trans_ijoin(tp, ta=
rget_ip, 0);
7dcf5c3e4527cf Dave Chinner      2015-03-25  3271  	if (wip)
3818584f03ce2d Allison Henderson 2021-03-24  3272  		xfs_trans_ijoin(tp, wi=
p, 0);
f6bba2017afb3b Dave Chinner      2013-08-12  3273  =

f6bba2017afb3b Dave Chinner      2013-08-12  3274  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3275  	 * If we are using proj=
ect inheritance, we only allow renames
f6bba2017afb3b Dave Chinner      2013-08-12  3276  	 * into our tree when t=
he project IDs are the same; else the
f6bba2017afb3b Dave Chinner      2013-08-12  3277  	 * tree quota mechanism=
 would be circumvented.
f6bba2017afb3b Dave Chinner      2013-08-12  3278  	 */
db07349da2f564 Christoph Hellwig 2021-03-29  3279  	if (unlikely((target_dp=
->i_diflags & XFS_DIFLAG_PROJINHERIT) &&
ceaf603c7024d3 Christoph Hellwig 2021-03-29  3280  		     target_dp->i_proj=
id !=3D src_ip->i_projid)) {
2451337dd04390 Dave Chinner      2014-06-25  3281  		error =3D -EXDEV;
3818584f03ce2d Allison Henderson 2021-03-24  3282  		goto out_unlock;
f6bba2017afb3b Dave Chinner      2013-08-12  3283  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3284  =

eeacd3217b8fa8 Dave Chinner      2015-03-25  3285  	/* RENAME_EXCHANGE is u=
nique from here on. */
3818584f03ce2d Allison Henderson 2021-03-24  3286  	if (flags & RENAME_EXCH=
ANGE) {
3818584f03ce2d Allison Henderson 2021-03-24 @3287  		error =3D xfs_cross_re=
name(tp, src_dp, src_name, src_ip,
d31a1825450062 Carlos Maiolino   2014-12-24  3288  					target_dp, target_n=
ame, target_ip,
f16dea54b789aa Brian Foster      2018-07-11  3289  					spaceres);
3818584f03ce2d Allison Henderson 2021-03-24  3290  		goto out_pptr;
3818584f03ce2d Allison Henderson 2021-03-24  3291  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3292  	/*
bc56ad8c74b858 kaixuxia          2019-09-03  3293  	 * Check for expected e=
rrors before we dirty the transaction
bc56ad8c74b858 kaixuxia          2019-09-03  3294  	 * so we can return an =
error without a transaction abort.
02092a2f034fde Chandan Babu R    2021-01-22  3295  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3296  	 * Extent count overflo=
w check:
02092a2f034fde Chandan Babu R    2021-01-22  3297  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3298  	 * From the perspective=
 of src_dp, a rename operation is essentially a
02092a2f034fde Chandan Babu R    2021-01-22  3299  	 * directory entry remo=
ve operation. Hence the only place where we check
02092a2f034fde Chandan Babu R    2021-01-22  3300  	 * for extent count ove=
rflow for src_dp is in
02092a2f034fde Chandan Babu R    2021-01-22  3301  	 * xfs_bmap_del_extent_=
real(). xfs_bmap_del_extent_real() returns
02092a2f034fde Chandan Babu R    2021-01-22  3302  	 * -ENOSPC when it dete=
cts a possible extent count overflow and in
02092a2f034fde Chandan Babu R    2021-01-22  3303  	 * response, the higher=
 layers of directory handling code do the
02092a2f034fde Chandan Babu R    2021-01-22  3304  	 * following:
02092a2f034fde Chandan Babu R    2021-01-22  3305  	 * 1. Data/Free blocks:=
 XFS lets these blocks linger until a
02092a2f034fde Chandan Babu R    2021-01-22  3306  	 *    future remove ope=
ration removes them.
02092a2f034fde Chandan Babu R    2021-01-22  3307  	 * 2. Dabtree blocks: X=
FS swaps the blocks with the last block in the
02092a2f034fde Chandan Babu R    2021-01-22  3308  	 *    Leaf space and un=
maps the last block.
02092a2f034fde Chandan Babu R    2021-01-22  3309  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3310  	 * For target_dp, there=
 are two cases depending on whether the
02092a2f034fde Chandan Babu R    2021-01-22  3311  	 * destination director=
y entry exists or not.
02092a2f034fde Chandan Babu R    2021-01-22  3312  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3313  	 * When destination dir=
ectory entry does not exist (i.e. target_ip =3D=3D
02092a2f034fde Chandan Babu R    2021-01-22  3314  	 * NULL), extent count =
overflow check is performed only when transaction
02092a2f034fde Chandan Babu R    2021-01-22  3315  	 * has a non-zero sized=
 space reservation associated with it.  With a
02092a2f034fde Chandan Babu R    2021-01-22  3316  	 * zero-sized space res=
ervation, XFS allows a rename operation to
02092a2f034fde Chandan Babu R    2021-01-22  3317  	 * continue only when t=
he directory has sufficient free space in its
02092a2f034fde Chandan Babu R    2021-01-22  3318  	 * data/leaf/free space=
 blocks to hold the new entry.
02092a2f034fde Chandan Babu R    2021-01-22  3319  	 *
02092a2f034fde Chandan Babu R    2021-01-22  3320  	 * When destination dir=
ectory entry exists (i.e. target_ip !=3D NULL), all
02092a2f034fde Chandan Babu R    2021-01-22  3321  	 * we need to do is cha=
nge the inode number associated with the already
02092a2f034fde Chandan Babu R    2021-01-22  3322  	 * existing entry. Henc=
e there is no need to perform an extent count
02092a2f034fde Chandan Babu R    2021-01-22  3323  	 * overflow check.
f6bba2017afb3b Dave Chinner      2013-08-12  3324  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3325  	if (target_ip =3D=3D NU=
LL) {
f6bba2017afb3b Dave Chinner      2013-08-12  3326  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3327  		 * If there's no space=
 reservation, check the entry will
f6bba2017afb3b Dave Chinner      2013-08-12  3328  		 * fit before actually=
 inserting it.
f6bba2017afb3b Dave Chinner      2013-08-12  3329  		 */
94f3cad555d660 Eric Sandeen      2014-09-09  3330  		if (!spaceres) {
94f3cad555d660 Eric Sandeen      2014-09-09  3331  			error =3D xfs_dir_can=
enter(tp, target_dp, target_name);
f6bba2017afb3b Dave Chinner      2013-08-12  3332  			if (error)
3818584f03ce2d Allison Henderson 2021-03-24  3333  				goto out_unlock;
02092a2f034fde Chandan Babu R    2021-01-22  3334  		} else {
02092a2f034fde Chandan Babu R    2021-01-22  3335  			error =3D xfs_iext_co=
unt_may_overflow(target_dp,
02092a2f034fde Chandan Babu R    2021-01-22  3336  					XFS_DATA_FORK,
02092a2f034fde Chandan Babu R    2021-01-22  3337  					XFS_IEXT_DIR_MANIP_=
CNT(mp));
02092a2f034fde Chandan Babu R    2021-01-22  3338  			if (error)
02092a2f034fde Chandan Babu R    2021-01-22  3339  				goto out_trans_cance=
l;
94f3cad555d660 Eric Sandeen      2014-09-09  3340  		}
bc56ad8c74b858 kaixuxia          2019-09-03  3341  	} else {
bc56ad8c74b858 kaixuxia          2019-09-03  3342  		/*
bc56ad8c74b858 kaixuxia          2019-09-03  3343  		 * If target exists an=
d it's a directory, check that whether
bc56ad8c74b858 kaixuxia          2019-09-03  3344  		 * it can be destroyed.
bc56ad8c74b858 kaixuxia          2019-09-03  3345  		 */
bc56ad8c74b858 kaixuxia          2019-09-03  3346  		if (S_ISDIR(VFS_I(targ=
et_ip)->i_mode) &&
bc56ad8c74b858 kaixuxia          2019-09-03  3347  		    (!xfs_dir_isempty(=
target_ip) ||
bc56ad8c74b858 kaixuxia          2019-09-03  3348  		     (VFS_I(target_ip)=
->i_nlink > 2))) {
bc56ad8c74b858 kaixuxia          2019-09-03  3349  			error =3D -EEXIST;
bc56ad8c74b858 kaixuxia          2019-09-03  3350  			goto out_trans_cancel;
bc56ad8c74b858 kaixuxia          2019-09-03  3351  		}
bc56ad8c74b858 kaixuxia          2019-09-03  3352  	}
bc56ad8c74b858 kaixuxia          2019-09-03  3353  =

6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3354  	/*
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3355  	 * Lock the AGI buffers=
 we need to handle bumping the nlink of the
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3356  	 * whiteout inode off t=
he unlinked list and to handle dropping the
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3357  	 * nlink of the target =
inode.  Per locking order rules, do this in
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3358  	 * increasing AG order =
and before directory block allocation tries to
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3359  	 * grab AGFs because we=
 grab AGIs before AGFs.
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3360  	 *
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3361  	 * The (vfs) caller mus=
t ensure that if src is a directory then
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3362  	 * target_ip is either =
null or an empty directory.
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3363  	 */
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3364  	for (i =3D 0; i < num_i=
nodes && inodes[i] !=3D NULL; i++) {
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3365  		if (inodes[i] =3D=3D w=
ip ||
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3366  		    (inodes[i] =3D=3D =
target_ip &&
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3367  		     (VFS_I(target_ip)=
->i_nlink =3D=3D 1 || src_is_directory))) {
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3368  			struct xfs_buf	*bp;
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3369  			xfs_agnumber_t	agno;
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3370  =

6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3371  			agno =3D XFS_INO_TO_A=
GNO(mp, inodes[i]->i_ino);
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3372  			error =3D xfs_read_ag=
i(mp, tp, agno, &bp);
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3373  			if (error)
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3374  				goto out_trans_cance=
l;
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3375  		}
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3376  	}
6da1b4b1ab36d8 Darrick J. Wong   2021-01-22  3377  =

bc56ad8c74b858 kaixuxia          2019-09-03  3378  	/*
bc56ad8c74b858 kaixuxia          2019-09-03  3379  	 * Directory entry crea=
tion below may acquire the AGF. Remove
bc56ad8c74b858 kaixuxia          2019-09-03  3380  	 * the whiteout from th=
e unlinked list first to preserve correct
bc56ad8c74b858 kaixuxia          2019-09-03  3381  	 * AGI/AGF locking orde=
r. This dirties the transaction so failures
bc56ad8c74b858 kaixuxia          2019-09-03  3382  	 * after this point wil=
l abort and log recovery will clean up the
bc56ad8c74b858 kaixuxia          2019-09-03  3383  	 * mess.
bc56ad8c74b858 kaixuxia          2019-09-03  3384  	 *
bc56ad8c74b858 kaixuxia          2019-09-03  3385  	 * For whiteouts, we ne=
ed to bump the link count on the whiteout
bc56ad8c74b858 kaixuxia          2019-09-03  3386  	 * inode. After this po=
int, we have a real link, clear the tmpfile
bc56ad8c74b858 kaixuxia          2019-09-03  3387  	 * state flag from the =
inode so it doesn't accidentally get misused
bc56ad8c74b858 kaixuxia          2019-09-03  3388  	 * in future.
bc56ad8c74b858 kaixuxia          2019-09-03  3389  	 */
bc56ad8c74b858 kaixuxia          2019-09-03  3390  	if (wip) {
f40aadb2bb64fe Dave Chinner      2021-06-02  3391  		struct xfs_perag	*pag;
f40aadb2bb64fe Dave Chinner      2021-06-02  3392  =

bc56ad8c74b858 kaixuxia          2019-09-03  3393  		ASSERT(VFS_I(wip)->i_n=
link =3D=3D 0);
f40aadb2bb64fe Dave Chinner      2021-06-02  3394  =

f40aadb2bb64fe Dave Chinner      2021-06-02  3395  		pag =3D xfs_perag_get(=
mp, XFS_INO_TO_AGNO(mp, wip->i_ino));
f40aadb2bb64fe Dave Chinner      2021-06-02  3396  		error =3D xfs_iunlink_=
remove(tp, pag, wip);
f40aadb2bb64fe Dave Chinner      2021-06-02  3397  		xfs_perag_put(pag);
bc56ad8c74b858 kaixuxia          2019-09-03  3398  		if (error)
bc56ad8c74b858 kaixuxia          2019-09-03  3399  			goto out_trans_cancel;
bc56ad8c74b858 kaixuxia          2019-09-03  3400  =

bc56ad8c74b858 kaixuxia          2019-09-03  3401  		xfs_bumplink(tp, wip);
bc56ad8c74b858 kaixuxia          2019-09-03  3402  		VFS_I(wip)->i_state &=
=3D ~I_LINKABLE;
bc56ad8c74b858 kaixuxia          2019-09-03  3403  	}
bc56ad8c74b858 kaixuxia          2019-09-03  3404  =

bc56ad8c74b858 kaixuxia          2019-09-03  3405  	/*
bc56ad8c74b858 kaixuxia          2019-09-03  3406  	 * Set up the target.
bc56ad8c74b858 kaixuxia          2019-09-03  3407  	 */
bc56ad8c74b858 kaixuxia          2019-09-03  3408  	if (target_ip =3D=3D NU=
LL) {
f6bba2017afb3b Dave Chinner      2013-08-12  3409  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3410  		 * If target does not =
exist and the rename crosses
f6bba2017afb3b Dave Chinner      2013-08-12  3411  		 * directories, adjust=
 the target directory link count
f6bba2017afb3b Dave Chinner      2013-08-12  3412  		 * to account for the =
".." reference from the new entry.
f6bba2017afb3b Dave Chinner      2013-08-12  3413  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3414  		error =3D xfs_dir_crea=
tename(tp, target_dp, target_name,
3818584f03ce2d Allison Henderson 2021-03-24  3415  					   src_ip->i_ino, s=
paceres, &new_diroffset);
f6bba2017afb3b Dave Chinner      2013-08-12  3416  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3417  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3418  =

f6bba2017afb3b Dave Chinner      2013-08-12  3419  		xfs_trans_ichgtime(tp,=
 target_dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3420  					XFS_ICHGTIME_MOD | =
XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3421  =

f6bba2017afb3b Dave Chinner      2013-08-12  3422  		if (new_parent && src_=
is_directory) {
910832697cf855 Eric Sandeen      2019-05-01  3423  			xfs_bumplink(tp, targ=
et_dp);
f6bba2017afb3b Dave Chinner      2013-08-12  3424  		}
f6bba2017afb3b Dave Chinner      2013-08-12  3425  	} else { /* target_ip !=
=3D NULL */
f6bba2017afb3b Dave Chinner      2013-08-12  3426  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3427  		 * Link the source ino=
de under the target name.
f6bba2017afb3b Dave Chinner      2013-08-12  3428  		 * If the source inode=
 is a directory and we are moving
f6bba2017afb3b Dave Chinner      2013-08-12  3429  		 * it across directori=
es, its ".." entry will be
f6bba2017afb3b Dave Chinner      2013-08-12  3430  		 * inconsistent until =
we replace that down below.
f6bba2017afb3b Dave Chinner      2013-08-12  3431  		 *
f6bba2017afb3b Dave Chinner      2013-08-12  3432  		 * In case there is al=
ready an entry with the same
f6bba2017afb3b Dave Chinner      2013-08-12  3433  		 * name at the destina=
tion directory, remove it first.
f6bba2017afb3b Dave Chinner      2013-08-12  3434  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3435  		error =3D xfs_dir_repl=
ace(tp, target_dp, target_name,
3818584f03ce2d Allison Henderson 2021-03-24  3436  					src_ip->i_ino, spac=
eres, &new_diroffset);
f6bba2017afb3b Dave Chinner      2013-08-12  3437  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3438  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3439  =

f6bba2017afb3b Dave Chinner      2013-08-12  3440  		xfs_trans_ichgtime(tp,=
 target_dp,
f6bba2017afb3b Dave Chinner      2013-08-12  3441  					XFS_ICHGTIME_MOD | =
XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3442  =

f6bba2017afb3b Dave Chinner      2013-08-12  3443  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3444  		 * Decrement the link =
count on the target since the target
f6bba2017afb3b Dave Chinner      2013-08-12  3445  		 * dir no longer point=
s to it.
f6bba2017afb3b Dave Chinner      2013-08-12  3446  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3447  		error =3D xfs_droplink=
(tp, target_ip);
f6bba2017afb3b Dave Chinner      2013-08-12  3448  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3449  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3450  =

f6bba2017afb3b Dave Chinner      2013-08-12  3451  		if (src_is_directory) {
f6bba2017afb3b Dave Chinner      2013-08-12  3452  			/*
f6bba2017afb3b Dave Chinner      2013-08-12  3453  			 * Drop the link from=
 the old "." entry.
f6bba2017afb3b Dave Chinner      2013-08-12  3454  			 */
f6bba2017afb3b Dave Chinner      2013-08-12  3455  			error =3D xfs_droplin=
k(tp, target_ip);
f6bba2017afb3b Dave Chinner      2013-08-12  3456  			if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3457  				goto out_trans_cance=
l;
f6bba2017afb3b Dave Chinner      2013-08-12  3458  		}
f6bba2017afb3b Dave Chinner      2013-08-12  3459  	} /* target_ip !=3D NUL=
L */
f6bba2017afb3b Dave Chinner      2013-08-12  3460  =

f6bba2017afb3b Dave Chinner      2013-08-12  3461  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3462  	 * Remove the source.
f6bba2017afb3b Dave Chinner      2013-08-12  3463  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3464  	if (new_parent && src_i=
s_directory) {
f6bba2017afb3b Dave Chinner      2013-08-12  3465  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3466  		 * Rewrite the ".." en=
try to point to the new
f6bba2017afb3b Dave Chinner      2013-08-12  3467  		 * directory.
f6bba2017afb3b Dave Chinner      2013-08-12  3468  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3469  		error =3D xfs_dir_repl=
ace(tp, src_ip, &xfs_name_dotdot,
3818584f03ce2d Allison Henderson 2021-03-24  3470  					target_dp->i_ino, s=
paceres, &new_diroffset);
2451337dd04390 Dave Chinner      2014-06-25  3471  		ASSERT(error !=3D -EEX=
IST);
f6bba2017afb3b Dave Chinner      2013-08-12  3472  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3473  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3474  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3475  =

f6bba2017afb3b Dave Chinner      2013-08-12  3476  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3477  	 * We always want to hi=
t the ctime on the source inode.
f6bba2017afb3b Dave Chinner      2013-08-12  3478  	 *
f6bba2017afb3b Dave Chinner      2013-08-12  3479  	 * This isn't strictly =
required by the standards since the source
f6bba2017afb3b Dave Chinner      2013-08-12  3480  	 * inode isn't really b=
eing changed, but old unix file systems did
f6bba2017afb3b Dave Chinner      2013-08-12  3481  	 * it and some incremen=
tal backup programs won't work without it.
f6bba2017afb3b Dave Chinner      2013-08-12  3482  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3483  	xfs_trans_ichgtime(tp, =
src_ip, XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3484  	xfs_trans_log_inode(tp,=
 src_ip, XFS_ILOG_CORE);
f6bba2017afb3b Dave Chinner      2013-08-12  3485  =

f6bba2017afb3b Dave Chinner      2013-08-12  3486  	/*
f6bba2017afb3b Dave Chinner      2013-08-12  3487  	 * Adjust the link coun=
t on src_dp.  This is necessary when
f6bba2017afb3b Dave Chinner      2013-08-12  3488  	 * renaming a directory=
, either within one parent when
f6bba2017afb3b Dave Chinner      2013-08-12  3489  	 * the target existed, =
or across two parent directories.
f6bba2017afb3b Dave Chinner      2013-08-12  3490  	 */
f6bba2017afb3b Dave Chinner      2013-08-12  3491  	if (src_is_directory &&=
 (new_parent || target_ip !=3D NULL)) {
f6bba2017afb3b Dave Chinner      2013-08-12  3492  =

f6bba2017afb3b Dave Chinner      2013-08-12  3493  		/*
f6bba2017afb3b Dave Chinner      2013-08-12  3494  		 * Decrement link coun=
t on src_directory since the
f6bba2017afb3b Dave Chinner      2013-08-12  3495  		 * entry that's moved =
no longer points to it.
f6bba2017afb3b Dave Chinner      2013-08-12  3496  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3497  		error =3D xfs_droplink=
(tp, src_dp);
f6bba2017afb3b Dave Chinner      2013-08-12  3498  		if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3499  			goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3500  	}
f6bba2017afb3b Dave Chinner      2013-08-12  3501  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3502  	/*
7dcf5c3e4527cf Dave Chinner      2015-03-25  3503  	 * For whiteouts, we on=
ly need to update the source dirent with the
7dcf5c3e4527cf Dave Chinner      2015-03-25  3504  	 * inode number of the =
whiteout inode rather than removing it
7dcf5c3e4527cf Dave Chinner      2015-03-25  3505  	 * altogether.
7dcf5c3e4527cf Dave Chinner      2015-03-25  3506  	 */
7dcf5c3e4527cf Dave Chinner      2015-03-25  3507  	if (wip) {
7dcf5c3e4527cf Dave Chinner      2015-03-25  3508  		error =3D xfs_dir_repl=
ace(tp, src_dp, src_name, wip->i_ino,
3818584f03ce2d Allison Henderson 2021-03-24  3509  					spaceres, &old_diro=
ffset);
02092a2f034fde Chandan Babu R    2021-01-22  3510  	} else {
02092a2f034fde Chandan Babu R    2021-01-22  3511  		/*
02092a2f034fde Chandan Babu R    2021-01-22  3512  		 * NOTE: We don't need=
 to check for extent count overflow here
02092a2f034fde Chandan Babu R    2021-01-22  3513  		 * because the dir rem=
ove name code will leave the dir block in
02092a2f034fde Chandan Babu R    2021-01-22  3514  		 * place if the extent=
 count would overflow.
02092a2f034fde Chandan Babu R    2021-01-22  3515  		 */
f6bba2017afb3b Dave Chinner      2013-08-12  3516  		error =3D xfs_dir_remo=
vename(tp, src_dp, src_name, src_ip->i_ino,
3818584f03ce2d Allison Henderson 2021-03-24  3517  					   spaceres, &old_d=
iroffset);
02092a2f034fde Chandan Babu R    2021-01-22  3518  	}
02092a2f034fde Chandan Babu R    2021-01-22  3519  =

f6bba2017afb3b Dave Chinner      2013-08-12  3520  	if (error)
c8eac49ef798a7 Brian Foster      2018-07-24  3521  		goto out_trans_cancel;
f6bba2017afb3b Dave Chinner      2013-08-12  3522  =

3818584f03ce2d Allison Henderson 2021-03-24  3523  out_pptr:
3818584f03ce2d Allison Henderson 2021-03-24  3524  	if (xfs_sb_version_hasp=
arent(&mp->m_sb)) {
3818584f03ce2d Allison Henderson 2021-03-24  3525  		new_args.trans	=3D tp;
3818584f03ce2d Allison Henderson 2021-03-24  3526  		xfs_init_parent_name_r=
ec(&new_rec, target_dp, new_diroffset);
3818584f03ce2d Allison Henderson 2021-03-24  3527  		new_args.hashval =3D x=
fs_da_hashname(new_args.name,
3818584f03ce2d Allison Henderson 2021-03-24  3528  						   new_args.namele=
n);
3818584f03ce2d Allison Henderson 2021-03-24  3529  		error =3D  xfs_attr_se=
t_deferred(&new_args);
3818584f03ce2d Allison Henderson 2021-03-24  3530  		if (error)
3818584f03ce2d Allison Henderson 2021-03-24  3531  			goto out_trans_cancel;
3818584f03ce2d Allison Henderson 2021-03-24  3532  =

3818584f03ce2d Allison Henderson 2021-03-24  3533  		old_args.trans	=3D tp;
3818584f03ce2d Allison Henderson 2021-03-24  3534  		xfs_init_parent_name_r=
ec(&old_rec, src_dp, old_diroffset);
3818584f03ce2d Allison Henderson 2021-03-24  3535  		old_args.hashval =3D x=
fs_da_hashname(old_args.name,
3818584f03ce2d Allison Henderson 2021-03-24  3536  						   old_args.namele=
n);
3818584f03ce2d Allison Henderson 2021-03-24  3537  		error =3D xfs_attr_rem=
ove_deferred(&old_args);
3818584f03ce2d Allison Henderson 2021-03-24  3538  		if (error)
3818584f03ce2d Allison Henderson 2021-03-24  3539  			goto out_trans_cancel;
3818584f03ce2d Allison Henderson 2021-03-24  3540  	}
3818584f03ce2d Allison Henderson 2021-03-24  3541  =

f6bba2017afb3b Dave Chinner      2013-08-12  3542  	xfs_trans_ichgtime(tp, =
src_dp, XFS_ICHGTIME_MOD | XFS_ICHGTIME_CHG);
f6bba2017afb3b Dave Chinner      2013-08-12  3543  	xfs_trans_log_inode(tp,=
 src_dp, XFS_ILOG_CORE);
f6bba2017afb3b Dave Chinner      2013-08-12  3544  	if (new_parent)
f6bba2017afb3b Dave Chinner      2013-08-12  3545  		xfs_trans_log_inode(tp=
, target_dp, XFS_ILOG_CORE);
f6bba2017afb3b Dave Chinner      2013-08-12  3546  =

c9cfdb38117217 Brian Foster      2018-07-11  3547  	error =3D xfs_finish_re=
name(tp);
3818584f03ce2d Allison Henderson 2021-03-24  3548  =

3818584f03ce2d Allison Henderson 2021-03-24  3549  out_unlock:
7dcf5c3e4527cf Dave Chinner      2015-03-25  3550  	if (wip)
44a8736bd20a08 Darrick J. Wong   2018-07-25  3551  		xfs_irele(wip);
3818584f03ce2d Allison Henderson 2021-03-24  3552  	if (wip)
3818584f03ce2d Allison Henderson 2021-03-24  3553  		xfs_iunlock(wip, XFS_I=
LOCK_EXCL);
3818584f03ce2d Allison Henderson 2021-03-24  3554  	if (target_ip)
3818584f03ce2d Allison Henderson 2021-03-24  3555  		xfs_iunlock(target_ip,=
 XFS_ILOCK_EXCL);
3818584f03ce2d Allison Henderson 2021-03-24  3556  	xfs_iunlock(src_ip, XFS=
_ILOCK_EXCL);
3818584f03ce2d Allison Henderson 2021-03-24  3557  	if (new_parent)
3818584f03ce2d Allison Henderson 2021-03-24  3558  		xfs_iunlock(target_dp,=
 XFS_ILOCK_EXCL);
3818584f03ce2d Allison Henderson 2021-03-24  3559  	xfs_iunlock(src_dp, XFS=
_ILOCK_EXCL);
3818584f03ce2d Allison Henderson 2021-03-24  3560  =

7dcf5c3e4527cf Dave Chinner      2015-03-25  3561  	return error;
f6bba2017afb3b Dave Chinner      2013-08-12  3562  =

445883e8133975 Dave Chinner      2015-03-25  3563  out_trans_cancel:
4906e21545814e Christoph Hellwig 2015-06-04  3564  	xfs_trans_cancel(tp);
3818584f03ce2d Allison Henderson 2021-03-24  3565  drop_incompat:
3818584f03ce2d Allison Henderson 2021-03-24  3566  	if (xfs_hasdelattr(mp))
3818584f03ce2d Allison Henderson 2021-03-24  3567  		xlog_drop_incompat_fea=
t(mp->m_log);
253f4911f297b8 Christoph Hellwig 2016-04-06  3568  out_release_wip:
7dcf5c3e4527cf Dave Chinner      2015-03-25  3569  	if (wip)
44a8736bd20a08 Darrick J. Wong   2018-07-25  3570  		xfs_irele(wip);
f6bba2017afb3b Dave Chinner      2013-08-12  3571  	return error;
f6bba2017afb3b Dave Chinner      2013-08-12  3572  }
f6bba2017afb3b Dave Chinner      2013-08-12  3573  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7386685290168055387==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7386685290168055387==--

