Content-Type: multipart/mixed; boundary="===============0106643978761529307=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:misc-next 115/154] fs/btrfs/ctree.c:1412:7: warning: Local variable unlock_up shadows outer function [shadowFunction]
Date: Thu, 24 Mar 2022 19:50:14 +0800
Message-ID: <202203241921.xLOR4zI9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0106643978761529307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   0b8e516958cef9d98b145847e17a8cad1cdb357f
commit: bd24aee6477aef699590632cfb5e79e6d576a63b [115/154] btrfs: release u=
pper nodes when reading stale btree node from disk
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/btrfs/ordered-data.c:
>> fs/btrfs/ordered-data.c:314:7: warning: Local variable entry_end shadows=
 outer function [shadowFunction]
     u64 entry_end;
         ^
   fs/btrfs/ordered-data.c:23:12: note: Shadowed declaration
   static u64 entry_end(struct btrfs_ordered_extent *entry)
              ^
   fs/btrfs/ordered-data.c:314:7: note: Shadow variable
     u64 entry_end;
         ^
>> fs/btrfs/ctree.c:1412:7: warning: Local variable unlock_up shadows outer=
 function [shadowFunction]
    bool unlock_up;
         ^
   fs/btrfs/ctree.c:1348:22: note: Shadowed declaration
   static noinline void unlock_up(struct btrfs_path *path, int level,
                        ^
   fs/btrfs/ctree.c:1412:7: note: Shadow variable
    bool unlock_up;
         ^
>> fs/btrfs/extent-tree.c:2960:6: warning: Local variable found_extent shad=
ows outer function [shadowFunction]
    int found_extent =3D 0;
        ^
   fs/btrfs/extent-tree.c:3957:13: note: Shadowed declaration
   static void found_extent(struct find_free_extent_ctl *ffe_ctl,
               ^
   fs/btrfs/extent-tree.c:2960:6: note: Shadow variable
    int found_extent =3D 0;
        ^

vim +1412 fs/btrfs/ctree.c

925baeddc5b076 Chris Mason     2008-06-25  1391  =

c8c42864f61936 Chris Mason     2009-04-03  1392  /*
c8c42864f61936 Chris Mason     2009-04-03  1393   * helper function for btr=
fs_search_slot.  The goal is to find a block
c8c42864f61936 Chris Mason     2009-04-03  1394   * in cache without settin=
g the path to blocking.  If we find the block
c8c42864f61936 Chris Mason     2009-04-03  1395   * we return zero and the =
path is unchanged.
c8c42864f61936 Chris Mason     2009-04-03  1396   *
c8c42864f61936 Chris Mason     2009-04-03  1397   * If we can't find the bl=
ock, we set the path blocking and do some
c8c42864f61936 Chris Mason     2009-04-03  1398   * reada.  -EAGAIN is retu=
rned and the search must be repeated.
c8c42864f61936 Chris Mason     2009-04-03  1399   */
c8c42864f61936 Chris Mason     2009-04-03  1400  static int
d07b85284f83de Liu Bo          2017-01-30  1401  read_block_for_search(stru=
ct btrfs_root *root, struct btrfs_path *p,
c8c42864f61936 Chris Mason     2009-04-03  1402  		      struct extent_buff=
er **eb_ret, int level, int slot,
cda79c545ead7e David Sterba    2017-02-10  1403  		      const struct btrfs=
_key *key)
c8c42864f61936 Chris Mason     2009-04-03  1404  {
0b246afa62b0cf Jeff Mahoney    2016-06-22  1405  	struct btrfs_fs_info *fs_=
info =3D root->fs_info;
c8c42864f61936 Chris Mason     2009-04-03  1406  	u64 blocknr;
c8c42864f61936 Chris Mason     2009-04-03  1407  	u64 gen;
c8c42864f61936 Chris Mason     2009-04-03  1408  	struct extent_buffer *tmp;
581c1760415c48 Qu Wenruo       2018-03-29  1409  	struct btrfs_key first_ke=
y;
76a05b35a320e8 Chris Mason     2009-05-14  1410  	int ret;
581c1760415c48 Qu Wenruo       2018-03-29  1411  	int parent_level;
bd24aee6477aef Filipe Manana   2022-03-11 @1412  	bool unlock_up;
c8c42864f61936 Chris Mason     2009-04-03  1413  =

bd24aee6477aef Filipe Manana   2022-03-11  1414  	unlock_up =3D ((level + 1=
 < BTRFS_MAX_LEVEL) && p->locks[level + 1]);
213ff4b72a9c75 Nikolay Borisov 2020-05-27  1415  	blocknr =3D btrfs_node_bl=
ockptr(*eb_ret, slot);
213ff4b72a9c75 Nikolay Borisov 2020-05-27  1416  	gen =3D btrfs_node_ptr_ge=
neration(*eb_ret, slot);
213ff4b72a9c75 Nikolay Borisov 2020-05-27  1417  	parent_level =3D btrfs_he=
ader_level(*eb_ret);
213ff4b72a9c75 Nikolay Borisov 2020-05-27  1418  	btrfs_node_key_to_cpu(*eb=
_ret, &first_key, slot);
c8c42864f61936 Chris Mason     2009-04-03  1419  =

bd24aee6477aef Filipe Manana   2022-03-11  1420  	/*
bd24aee6477aef Filipe Manana   2022-03-11  1421  	 * If we need to read an =
extent buffer from disk and we are holding locks
bd24aee6477aef Filipe Manana   2022-03-11  1422  	 * on upper level nodes, =
we unlock all the upper nodes before reading the
bd24aee6477aef Filipe Manana   2022-03-11  1423  	 * extent buffer, and the=
n return -EAGAIN to the caller as it needs to
bd24aee6477aef Filipe Manana   2022-03-11  1424  	 * restart the search. We=
 don't release the lock on the current level
bd24aee6477aef Filipe Manana   2022-03-11  1425  	 * because we need to wal=
k this node to figure out which blocks to read.
bd24aee6477aef Filipe Manana   2022-03-11  1426  	 */
0b246afa62b0cf Jeff Mahoney    2016-06-22  1427  	tmp =3D find_extent_buffe=
r(fs_info, blocknr);
cb44921a09221f Chris Mason     2010-10-24  1428  	if (tmp) {
ace75066ced9b9 Filipe Manana   2021-03-31  1429  		if (p->reada =3D=3D READ=
A_FORWARD_ALWAYS)
ace75066ced9b9 Filipe Manana   2021-03-31  1430  			reada_for_search(fs_inf=
o, p, level, slot, key->objectid);
ace75066ced9b9 Filipe Manana   2021-03-31  1431  =

b9fab919b748c7 Chris Mason     2012-05-06  1432  		/* first we do an atomic=
 uptodate check */
b9fab919b748c7 Chris Mason     2012-05-06  1433  		if (btrfs_buffer_uptodat=
e(tmp, gen, 1) > 0) {
448de471cd4cab Qu Wenruo       2019-03-12  1434  			/*
448de471cd4cab Qu Wenruo       2019-03-12  1435  			 * Do extra check for f=
irst_key, eb can be stale due to
448de471cd4cab Qu Wenruo       2019-03-12  1436  			 * being cached, read f=
rom scrub, or have multiple
448de471cd4cab Qu Wenruo       2019-03-12  1437  			 * parents (shared tree=
 blocks).
448de471cd4cab Qu Wenruo       2019-03-12  1438  			 */
e064d5e9f0a000 David Sterba    2019-03-20  1439  			if (btrfs_verify_level_=
key(tmp,
448de471cd4cab Qu Wenruo       2019-03-12  1440  					parent_level - 1, &fi=
rst_key, gen)) {
448de471cd4cab Qu Wenruo       2019-03-12  1441  				free_extent_buffer(tmp=
);
448de471cd4cab Qu Wenruo       2019-03-12  1442  				return -EUCLEAN;
448de471cd4cab Qu Wenruo       2019-03-12  1443  			}
c8c42864f61936 Chris Mason     2009-04-03  1444  			*eb_ret =3D tmp;
c8c42864f61936 Chris Mason     2009-04-03  1445  			return 0;
c8c42864f61936 Chris Mason     2009-04-03  1446  		}
bdf7c00e8f5638 Josef Bacik     2013-06-17  1447  =

bd24aee6477aef Filipe Manana   2022-03-11  1448  		if (unlock_up)
bd24aee6477aef Filipe Manana   2022-03-11  1449  			btrfs_unlock_up_safe(p,=
 level + 1);
bd24aee6477aef Filipe Manana   2022-03-11  1450  =

b9fab919b748c7 Chris Mason     2012-05-06  1451  		/* now we're allowed to =
do a blocking uptodate check */
581c1760415c48 Qu Wenruo       2018-03-29  1452  		ret =3D btrfs_read_buffe=
r(tmp, gen, parent_level - 1, &first_key);
9a4ffa1bd629c7 Qu Wenruo       2022-02-22  1453  		if (ret) {
cb44921a09221f Chris Mason     2010-10-24  1454  			free_extent_buffer(tmp);
b3b4aa74b58bde David Sterba    2011-04-21  1455  			btrfs_release_path(p);
cb44921a09221f Chris Mason     2010-10-24  1456  			return -EIO;
cb44921a09221f Chris Mason     2010-10-24  1457  		}
bd24aee6477aef Filipe Manana   2022-03-11  1458  =

bd24aee6477aef Filipe Manana   2022-03-11  1459  		if (unlock_up)
bd24aee6477aef Filipe Manana   2022-03-11  1460  			ret =3D -EAGAIN;
bd24aee6477aef Filipe Manana   2022-03-11  1461  =

bd24aee6477aef Filipe Manana   2022-03-11  1462  		goto out;
9a4ffa1bd629c7 Qu Wenruo       2022-02-22  1463  	}
c8c42864f61936 Chris Mason     2009-04-03  1464  =

bd24aee6477aef Filipe Manana   2022-03-11  1465  	if (unlock_up) {
8c594ea81d7abb Chris Mason     2009-04-20  1466  		btrfs_unlock_up_safe(p, =
level + 1);
ae79ff3c67dc2f Filipe Manana   2022-03-11  1467  		ret =3D -EAGAIN;
ae79ff3c67dc2f Filipe Manana   2022-03-11  1468  	} else {
ae79ff3c67dc2f Filipe Manana   2022-03-11  1469  		ret =3D 0;
ae79ff3c67dc2f Filipe Manana   2022-03-11  1470  	}
8c594ea81d7abb Chris Mason     2009-04-20  1471  =

e4058b54d1e442 David Sterba    2015-11-27  1472  	if (p->reada !=3D READA_N=
ONE)
2ff7e61e0d30ff Jeff Mahoney    2016-06-22  1473  		reada_for_search(fs_info=
, p, level, slot, key->objectid);
c8c42864f61936 Chris Mason     2009-04-03  1474  =

1b7ec85ef49057 Josef Bacik     2020-11-05  1475  	tmp =3D read_tree_block(f=
s_info, blocknr, root->root_key.objectid,
1b7ec85ef49057 Josef Bacik     2020-11-05  1476  			      gen, parent_level=
 - 1, &first_key);
4eb150d6122bf5 Qu Wenruo       2022-02-22  1477  	if (IS_ERR(tmp)) {
4eb150d6122bf5 Qu Wenruo       2022-02-22  1478  		btrfs_release_path(p);
4eb150d6122bf5 Qu Wenruo       2022-02-22  1479  		return PTR_ERR(tmp);
4eb150d6122bf5 Qu Wenruo       2022-02-22  1480  	}
76a05b35a320e8 Chris Mason     2009-05-14  1481  	/*
76a05b35a320e8 Chris Mason     2009-05-14  1482  	 * If the read above didn=
't mark this buffer up to date,
76a05b35a320e8 Chris Mason     2009-05-14  1483  	 * it will never end up b=
eing up to date.  Set ret to EIO now
76a05b35a320e8 Chris Mason     2009-05-14  1484  	 * and give up so that ou=
r caller doesn't loop forever
76a05b35a320e8 Chris Mason     2009-05-14  1485  	 * on our EAGAINs.
76a05b35a320e8 Chris Mason     2009-05-14  1486  	 */
e6a1d6fd276965 Liu Bo          2018-05-18  1487  	if (!extent_buffer_uptoda=
te(tmp))
76a05b35a320e8 Chris Mason     2009-05-14  1488  		ret =3D -EIO;
02a3307aa9c20b Liu Bo          2018-05-16  1489  =

bd24aee6477aef Filipe Manana   2022-03-11  1490  out:
ae79ff3c67dc2f Filipe Manana   2022-03-11  1491  	if (ret =3D=3D 0) {
ae79ff3c67dc2f Filipe Manana   2022-03-11  1492  		*eb_ret =3D tmp;
ae79ff3c67dc2f Filipe Manana   2022-03-11  1493  	} else {
ae79ff3c67dc2f Filipe Manana   2022-03-11  1494  		free_extent_buffer(tmp);
02a3307aa9c20b Liu Bo          2018-05-16  1495  		btrfs_release_path(p);
ae79ff3c67dc2f Filipe Manana   2022-03-11  1496  	}
ae79ff3c67dc2f Filipe Manana   2022-03-11  1497  =

76a05b35a320e8 Chris Mason     2009-05-14  1498  	return ret;
c8c42864f61936 Chris Mason     2009-04-03  1499  }
c8c42864f61936 Chris Mason     2009-04-03  1500  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0106643978761529307==--

