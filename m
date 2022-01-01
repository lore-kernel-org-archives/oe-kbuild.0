Content-Type: multipart/mixed; boundary="===============3763635622803842758=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 146/327] fs/xfs/scrub/attr_repair.c:904:3: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 02 Jan 2022 04:32:19 +0800
Message-ID: <202201020442.U23C0oOm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3763635622803842758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   7bd5ed813c460c39b9ed735852970905ad0a633b
commit: 042c4579d40b9ecacb5d5332a8177fc5514bcbb3 [146/327] xfs: repair exte=
nded attributes
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: riscv-randconfig-c006-20211231 (https://download.01.org/0day-ci/arc=
hive/20220102/202201020442.U23C0oOm-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c05440=
2170cd8466683a20385befc0523aba3359)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3D042c4579d40b9ecacb5d5332a8177fc5514bcbb3
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout 042c4579d40b9ecacb5d5332a8177fc5514bcbb3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6397-regulator.c:206:9: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           regval >>=3D ffs(info->modeset_mask) - 1;
                  ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/mt6397-regulator.c:199:6: note: Assuming 'ret' is equa=
l to 0
           if (ret !=3D 0) {
               ^~~~~~~~
   drivers/regulator/mt6397-regulator.c:199:2: note: Taking false branch
           if (ret !=3D 0) {
           ^
   drivers/regulator/mt6397-regulator.c:206:9: note: Assigned value is garb=
age or undefined
           regval >>=3D ffs(info->modeset_mask) - 1;
                  ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/regulator/palmas-regulator.c:1598:36: warning: Value stored to '=
pdata' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct palmas_pmic_platform_data *pdata =3D dev_get_platdata(&pd=
ev->dev);
                                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/regulator/palmas-regulator.c:1598:36: note: Value stored to 'pda=
ta' during its initialization is never read
           struct palmas_pmic_platform_data *pdata =3D dev_get_platdata(&pd=
ev->dev);
                                             ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/regulator/pca9450-regulator.c:171:6: warning: Assigned value is =
garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                           i <<=3D ffs(desc->vsel_mask) - 1;
                             ^
   drivers/regulator/pca9450-regulator.c:191:2: note: Loop condition is tru=
e.  Entering loop body
           for (i =3D 0; i < PCA9450_DVS_LEVEL_MAX; i++) {
           ^
   drivers/regulator/pca9450-regulator.c:192:3: note: Control jumps to 'cas=
e PCA9450_DVS_LEVEL_RUN:' @line 193
                   switch (i) {
                   ^
   drivers/regulator/pca9450-regulator.c:197:4: note:  Execution continues =
on line 207
                           break;
                           ^
   drivers/regulator/pca9450-regulator.c:207:9: note: Calling 'buck_set_dvs'
                   ret =3D buck_set_dvs(desc, np, cfg->regmap, prop, reg, m=
ask);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/regulator/pca9450-regulator.c:160:8: note: Calling 'of_property_=
read_u32'
           ret =3D of_property_read_u32(np, prop, &uv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1257:9: note: Calling 'of_property_read_u32_array'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:507:6: note: Assuming 'ret' is >=3D 0
           if (ret >=3D 0)
               ^~~~~~~~
   include/linux/of.h:507:2: note: Taking true branch
           if (ret >=3D 0)
           ^
   include/linux/of.h:508:3: note: Returning zero, which participates in a =
condition later
                   return 0;
                   ^~~~~~~~
   include/linux/of.h:1257:9: note: Returning from 'of_property_read_u32_ar=
ray'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1257:2: note: Returning zero, which participates in a=
 condition later
           return of_property_read_u32_array(np, propname, out_value, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/pca9450-regulator.c:160:8: note: Returning from 'of_pr=
operty_read_u32'
           ret =3D of_property_read_u32(np, prop, &uv);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/pca9450-regulator.c:161:2: note: Taking false branch
           if (ret =3D=3D -EINVAL)
           ^
   drivers/regulator/pca9450-regulator.c:163:11: note: 'ret' is 0
           else if (ret)
                    ^~~
   drivers/regulator/pca9450-regulator.c:163:7: note: Taking false branch
           else if (ret)
                ^
   drivers/regulator/pca9450-regulator.c:166:14: note: Assuming 'i' is < fi=
eld 'n_voltages'
           for (i =3D 0; i < desc->n_voltages; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/regulator/pca9450-regulator.c:166:2: note: Loop condition is tru=
e.  Entering loop body
           for (i =3D 0; i < desc->n_voltages; i++) {
           ^
   drivers/regulator/pca9450-regulator.c:168:7: note: Assuming 'ret' is >=
=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/regulator/pca9450-regulator.c:168:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/regulator/pca9450-regulator.c:170:7: note: Assuming 'ret' is equ=
al to 'uv'
                   if (ret =3D=3D uv) {
                       ^~~~~~~~~
   drivers/regulator/pca9450-regulator.c:170:3: note: Taking true branch
                   if (ret =3D=3D uv) {
                   ^
   drivers/regulator/pca9450-regulator.c:171:6: note: Assigned value is gar=
bage or undefined
                           i <<=3D ffs(desc->vsel_mask) - 1;
                             ^   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> fs/xfs/scrub/attr_repair.c:904:3: warning: Value stored to 'error' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   error =3D xfs_defer_finish(&sc->tp);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/attr_repair.c:904:3: note: Value stored to 'error' is never=
 read
                   error =3D xfs_defer_finish(&sc->tp);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
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
   11 warnings generated.
   fs/xfs/scrub/inode_repair.c:964:4: warning: Value stored to 'afork_min' =
is never read [clang-analyzer-deadcode.DeadStores]
                           afork_min =3D bmdr_minsz;
                           ^           ~~~~~~~~~~
   fs/xfs/scrub/inode_repair.c:964:4: note: Value stored to 'afork_min' is =
never read
                           afork_min =3D bmdr_minsz;
                           ^           ~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
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
   9 warnings generated.
   fs/xfs/scrub/repair.c:2124:3: warning: Value stored to 'dirty' is never =
read [clang-analyzer-deadcode.DeadStores]
                   dirty =3D false;
                   ^       ~~~~~
   fs/xfs/scrub/repair.c:2124:3: note: Value stored to 'dirty' is never read
                   dirty =3D false;
                   ^       ~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/regulator/helpers.c:963:6: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
           sel <<=3D ffs(rdev->desc->ramp_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/helpers.c:951:14: note: Assuming field 'n_ramp_values'=
 is not equal to 0
           if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_dela=
y_table))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/regulator/helpers.c:951:14: note: Left side of '||' is false
           if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_dela=
y_table))
                       ^
   drivers/regulator/helpers.c:951:44: note: Assuming field 'ramp_delay_tab=
le' is non-null
           if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_dela=
y_table))
                                                     ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/regulator/helpers.c:951:6: note: Taking false branch
           if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_dela=
y_table))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/regulator/helpers.c:951:2: note: Taking false branch
           if (WARN_ON(!rdev->desc->n_ramp_values || !rdev->desc->ramp_dela=
y_table))
           ^
   drivers/regulator/helpers.c:957:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/regulator/helpers.c:957:2: note: Taking false branch
           if (ret) {
           ^
   drivers/regulator/helpers.c:963:6: note: Assigned value is garbage or un=
defined
           sel <<=3D ffs(rdev->desc->ramp_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/error +904 fs/xfs/scrub/attr_repair.c

042c4579d40b9e Darrick J. Wong 2021-09-01  866  =

042c4579d40b9e Darrick J. Wong 2021-09-01  867  /*
042c4579d40b9e Darrick J. Wong 2021-09-01  868   * Prepare both inodes' att=
ribute forks for extent swapping.  Promote the
042c4579d40b9e Darrick J. Wong 2021-09-01  869   * tempfile from short form=
at to leaf format, and if the file being repaired
042c4579d40b9e Darrick J. Wong 2021-09-01  870   * has a short format attr =
fork, turn it into an empty extent list.
042c4579d40b9e Darrick J. Wong 2021-09-01  871   */
042c4579d40b9e Darrick J. Wong 2021-09-01  872  STATIC int
042c4579d40b9e Darrick J. Wong 2021-09-01  873  xrep_xattr_swap_prep(
042c4579d40b9e Darrick J. Wong 2021-09-01  874  	struct xfs_scrub	*sc,
042c4579d40b9e Darrick J. Wong 2021-09-01  875  	bool			temp_local,
042c4579d40b9e Darrick J. Wong 2021-09-01  876  	bool			ip_local)
042c4579d40b9e Darrick J. Wong 2021-09-01  877  {
042c4579d40b9e Darrick J. Wong 2021-09-01  878  	int			error;
042c4579d40b9e Darrick J. Wong 2021-09-01  879  =

042c4579d40b9e Darrick J. Wong 2021-09-01  880  	/*
042c4579d40b9e Darrick J. Wong 2021-09-01  881  	 * If the tempfile's attri=
butes are in shortform format, convert that
042c4579d40b9e Darrick J. Wong 2021-09-01  882  	 * to a single leaf extent=
 so that we can use the atomic extent swap.
042c4579d40b9e Darrick J. Wong 2021-09-01  883  	 */
042c4579d40b9e Darrick J. Wong 2021-09-01  884  	if (temp_local) {
042c4579d40b9e Darrick J. Wong 2021-09-01  885  		struct xfs_buf		*leaf_bp =
=3D NULL;
042c4579d40b9e Darrick J. Wong 2021-09-01  886  		struct xfs_da_args	args =
=3D {
042c4579d40b9e Darrick J. Wong 2021-09-01  887  			.dp		=3D sc->tempip,
042c4579d40b9e Darrick J. Wong 2021-09-01  888  			.geo		=3D sc->mp->m_attr=
_geo,
042c4579d40b9e Darrick J. Wong 2021-09-01  889  			.whichfork	=3D XFS_ATTR_=
FORK,
042c4579d40b9e Darrick J. Wong 2021-09-01  890  			.trans		=3D sc->tp,
042c4579d40b9e Darrick J. Wong 2021-09-01  891  			.total		=3D 1,
042c4579d40b9e Darrick J. Wong 2021-09-01  892  		};
042c4579d40b9e Darrick J. Wong 2021-09-01  893  =

042c4579d40b9e Darrick J. Wong 2021-09-01  894  		error =3D xfs_attr_shortf=
orm_to_leaf(&args, &leaf_bp);
042c4579d40b9e Darrick J. Wong 2021-09-01  895  		if (error)
042c4579d40b9e Darrick J. Wong 2021-09-01  896  			return error;
042c4579d40b9e Darrick J. Wong 2021-09-01  897  =

042c4579d40b9e Darrick J. Wong 2021-09-01  898  		/*
042c4579d40b9e Darrick J. Wong 2021-09-01  899  		 * Roll the deferred log =
items to get us back to a clean
042c4579d40b9e Darrick J. Wong 2021-09-01  900  		 * transaction.  Hold on =
to the leaf buffer across this roll
042c4579d40b9e Darrick J. Wong 2021-09-01  901  		 * so that the AIL cannot=
 grab our half-baked block.
042c4579d40b9e Darrick J. Wong 2021-09-01  902  		 */
042c4579d40b9e Darrick J. Wong 2021-09-01  903  		xfs_trans_bhold(sc->tp, l=
eaf_bp);
042c4579d40b9e Darrick J. Wong 2021-09-01 @904  		error =3D xfs_defer_finis=
h(&sc->tp);
042c4579d40b9e Darrick J. Wong 2021-09-01  905  		xfs_trans_bhold_release(s=
c->tp, leaf_bp);
042c4579d40b9e Darrick J. Wong 2021-09-01  906  	}
042c4579d40b9e Darrick J. Wong 2021-09-01  907  =

042c4579d40b9e Darrick J. Wong 2021-09-01  908  	/*
042c4579d40b9e Darrick J. Wong 2021-09-01  909  	 * If the file being repai=
red had a shortform attribute fork, convert
042c4579d40b9e Darrick J. Wong 2021-09-01  910  	 * that to an empty extent=
 list in preparation for the atomic extent
042c4579d40b9e Darrick J. Wong 2021-09-01  911  	 * swap.
042c4579d40b9e Darrick J. Wong 2021-09-01  912  	 */
042c4579d40b9e Darrick J. Wong 2021-09-01  913  	if (ip_local) {
042c4579d40b9e Darrick J. Wong 2021-09-01  914  		struct xfs_ifork	*ifp;
042c4579d40b9e Darrick J. Wong 2021-09-01  915  =

042c4579d40b9e Darrick J. Wong 2021-09-01  916  		ifp =3D XFS_IFORK_PTR(sc-=
>ip, XFS_ATTR_FORK);
042c4579d40b9e Darrick J. Wong 2021-09-01  917  =

042c4579d40b9e Darrick J. Wong 2021-09-01  918  		xfs_idestroy_fork(ifp);
042c4579d40b9e Darrick J. Wong 2021-09-01  919  		ifp->if_format =3D XFS_DI=
NODE_FMT_EXTENTS;
042c4579d40b9e Darrick J. Wong 2021-09-01  920  		ifp->if_nextents =3D 0;
042c4579d40b9e Darrick J. Wong 2021-09-01  921  		ifp->if_bytes =3D 0;
042c4579d40b9e Darrick J. Wong 2021-09-01  922  		ifp->if_u1.if_root =3D NU=
LL;
042c4579d40b9e Darrick J. Wong 2021-09-01  923  		ifp->if_height =3D 0;
042c4579d40b9e Darrick J. Wong 2021-09-01  924  =

042c4579d40b9e Darrick J. Wong 2021-09-01  925  		xfs_trans_log_inode(sc->t=
p, sc->ip,
042c4579d40b9e Darrick J. Wong 2021-09-01  926  				XFS_ILOG_CORE | XFS_ILO=
G_ADATA);
042c4579d40b9e Darrick J. Wong 2021-09-01  927  	}
042c4579d40b9e Darrick J. Wong 2021-09-01  928  =

042c4579d40b9e Darrick J. Wong 2021-09-01  929  	return 0;
042c4579d40b9e Darrick J. Wong 2021-09-01  930  }
042c4579d40b9e Darrick J. Wong 2021-09-01  931  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3763635622803842758==--

