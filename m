Content-Type: multipart/mixed; boundary="===============7397388386352763404=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dgc-xfs:xfs-5.19-compose 38/43] fs/xfs/libxfs/xfs_attr.c:1262 xfs_attr_node_try_addname() warn: variable dereferenced before check 'state' (see line 1230)
Date: Sat, 07 May 2022 20:10:08 +0800
Message-ID: <202205072021.kK00RLPq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7397388386352763404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Dave Chinner <david@fromorbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git x=
fs-5.19-compose
head:   d8fa98c66946d5b1e01531cf7cb50151817f6894
commit: 138c77e4e08cf844f8a2bc4ad6f06add05f77eb5 [38/43] xfs: xfs_attr_set_=
iter() does not need to return EAGAIN
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m031-20220506 (https://download.01.org/0day-ci/=
archive/20220507/202205072021.kK00RLPq-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/libxfs/xfs_attr.c:1262 xfs_attr_node_try_addname() warn: variable de=
referenced before check 'state' (see line 1230)

Old smatch warnings:
fs/xfs/libxfs/xfs_attr.c:1303 xfs_attr_node_remove_attr() warn: variable de=
referenced before check 'state' (see line 1285)

vim +/state +1262 fs/xfs/libxfs/xfs_attr.c

6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1211  =

6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1212 =
 /*
6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1213 =
  * Add a name to a Btree-format attribute list.
6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1214 =
  *
6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1215 =
  * This will involve walking down the Btree, and may involve splitting
6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1216 =
  * leaf nodes and even splitting intermediate nodes up to and including
6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1217 =
  * the root node (a special case of an intermediate node).
6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1218 =
  */
ef36bf49a4fc8e fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-05  1219 =
 static int
ef36bf49a4fc8e fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-05  1220 =
 xfs_attr_node_try_addname(
2b8e5f1a3c023c fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-05-04  1221 =
 	struct xfs_attr_item		*attr)
6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1222 =
 {
2b8e5f1a3c023c fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-05-04  1223 =
 	struct xfs_da_args		*args =3D attr->xattri_da_args;
2b8e5f1a3c023c fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-05-04  1224 =
 	struct xfs_da_state		*state =3D attr->xattri_da_state;
6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1225 =
 	struct xfs_da_state_blk		*blk;
5d954cc09f6bae fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-26  1226 =
 	int				error;
6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1227  =

6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1228 =
 	trace_xfs_attr_node_addname(args);
6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1229  =

6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12 @1230 =
 	blk =3D &state->path.blk[state->path.active-1];
6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1231 =
 	ASSERT(blk->magic =3D=3D XFS_ATTR_LEAF_MAGIC);
6ca5a4a1f52952 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-12  1232  =

5d954cc09f6bae fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-26  1233 =
 	error =3D xfs_attr3_leaf_add(blk->bp, state->args);
5d954cc09f6bae fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-04-26  1234 =
 	if (error =3D=3D -ENOSPC) {
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1235 =
 		if (state->path.active =3D=3D 1) {
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1236 =
 			/*
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1237 =
 			 * Its really a single leaf node, but it had
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1238 =
 			 * out-of-line values so it looked like it *might*
138c77e4e08cf8 fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-05  1239 =
 			 * have been a b-tree. Let the caller deal with this.
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1240 =
 			 */
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1241 =
 			xfs_da_state_free(state);
138c77e4e08cf8 fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-05  1242 =
 			return -ENOSPC;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1243 =
 		}
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1244  =

^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1245 =
 		/*
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1246 =
 		 * Split as many Btree elements as required.
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1247 =
 		 * This code tracks the new and old attr's location
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1248 =
 		 * in the index/blkno/rmtblkno/rmtblkcnt fields and
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1249 =
 		 * in the index2/blkno2/rmtblkno2/rmtblkcnt2 fields.
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1250 =
 		 */
f5ea110044fa85 fs/xfs/xfs_attr.c        Dave Chinner      2013-04-24  1251 =
 		error =3D xfs_da3_split(state);
8ad7c629b18695 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2017-08-28  1252 =
 		if (error)
d5a2e2893da0d6 fs/xfs/libxfs/xfs_attr.c Brian Foster      2018-09-29  1253 =
 			goto out;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1254 =
 	} else {
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1255 =
 		/*
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1256 =
 		 * Addition succeeded, update Btree hashvals.
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1257 =
 		 */
f5ea110044fa85 fs/xfs/xfs_attr.c        Dave Chinner      2013-04-24  1258 =
 		xfs_da3_fixhashpath(state, &state->path);
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1259 =
 	}
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1260  =

f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18  1261 =
 out:
f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18 @1262 =
 	if (state)
f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18  1263 =
 		xfs_da_state_free(state);
f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18  1264 =
 	return error;
f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18  1265 =
 }
f0f7c502c728d0 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-02-18  1266  =


:::::: The code at line 1262 was first introduced by commit
:::::: f0f7c502c728d0c6947219739631bad101f8737b xfs: Separate xfs_attr_node=
_addname and xfs_attr_node_addname_clear_incomplete

:::::: TO: Allison Henderson <allison.henderson@oracle.com>
:::::: CC: Allison Henderson <allison.henderson@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7397388386352763404==--

