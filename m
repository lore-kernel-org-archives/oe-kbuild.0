Content-Type: multipart/mixed; boundary="===============5741428023593945258=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dgc-xfs:xfs-5.19-compose 37/43] fs/xfs/libxfs/xfs_attr.c:1317 xfs_attr_node_remove_attr() warn: variable dereferenced before check 'state' (see line 1299)
Date: Sat, 07 May 2022 14:20:37 +0800
Message-ID: <202205071435.Hnr6CAin-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5741428023593945258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Dave Chinner <david@fromorbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git x=
fs-5.19-compose
head:   d8fa98c66946d5b1e01531cf7cb50151817f6894
commit: 8fe8ae0a2020818650526263645667f1b437f5fb [37/43] xfs: clean up fina=
l attr removal in xfs_attr_set_iter
:::::: branch date: 22 hours ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m031-20220506 (https://download.01.org/0day-ci/=
archive/20220507/202205071435.Hnr6CAin-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/xfs/libxfs/xfs_attr.c:1317 xfs_attr_node_remove_attr() warn: variable de=
referenced before check 'state' (see line 1299)

vim +/state +1317 fs/xfs/libxfs/xfs_attr.c

f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18  1280  =

f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18  1281  =

8fe8ae0a202081 fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-05  1282 =
 static int
8fe8ae0a202081 fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-05  1283 =
 xfs_attr_node_remove_attr(
2b8e5f1a3c023c fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-05-04  1284 =
 	struct xfs_attr_item		*attr)
f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18  1285 =
 {
2b8e5f1a3c023c fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-05-04  1286 =
 	struct xfs_da_args		*args =3D attr->xattri_da_args;
f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18  1287 =
 	struct xfs_da_state		*state =3D NULL;
c2b3b59946c43d fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-05-04  1288 =
 	struct xfs_mount		*mp =3D args->dp->i_mount;
f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18  1289 =
 	int				retval =3D 0;
f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18  1290 =
 	int				error =3D 0;
f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18  1291  =

^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1292 =
 	/*
bf4a5cfffee096 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  1293 =
 	 * Re-find the "old" attribute entry after any split ops. The INCOMPLETE
bf4a5cfffee096 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  1294 =
 	 * flag means that we will find the "old" attr, not the "new" one.
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1295 =
 	 */
c2b3b59946c43d fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-05-04  1296 =
 	if (!xfs_has_larp(mp))
254f800f810415 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  1297 =
 		args->attr_filter |=3D XFS_ATTR_INCOMPLETE;
4491a3dd7192fb fs/xfs/libxfs/xfs_attr.c Carlos Maiolino   2020-07-22  1298 =
 	state =3D xfs_da_state_alloc(args);
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16 @1299 =
 	state->inleaf =3D 0;
f5ea110044fa85 fs/xfs/xfs_attr.c        Dave Chinner      2013-04-24  1300 =
 	error =3D xfs_da3_node_lookup_int(state, &retval);
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1301 =
 	if (error)
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1302 =
 		goto out;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1303  =

816c8e39b7ea08 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-05-28  1304 =
 	error =3D xfs_attr_node_removename(args, state);
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1305  =

^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1306 =
 	/*
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1307 =
 	 * Check to see if the tree needs to be collapsed.
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1308 =
 	 */
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1309 =
 	if (retval && (state->path.active > 1)) {
f5ea110044fa85 fs/xfs/xfs_attr.c        Dave Chinner      2013-04-24  1310 =
 		error =3D xfs_da3_join(state);
8ad7c629b18695 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2017-08-28  1311 =
 		if (error)
d5a2e2893da0d6 fs/xfs/libxfs/xfs_attr.c Brian Foster      2018-09-29  1312 =
 			goto out;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1313 =
 	}
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1314 =
 	retval =3D error =3D 0;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1315  =

^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1316 =
 out:
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16 @1317 =
 	if (state)
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1318 =
 		xfs_da_state_free(state);
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1319 =
 	if (error)
d99831ff393ff2 fs/xfs/xfs_attr.c        Eric Sandeen      2014-06-22  1320 =
 		return error;
d99831ff393ff2 fs/xfs/xfs_attr.c        Eric Sandeen      2014-06-22  1321 =
 	return retval;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1322 =
 }
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1323  =


:::::: The code at line 1317 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5741428023593945258==--

