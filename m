Content-Type: multipart/mixed; boundary="===============2316960887934634093=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4134/5845] fs/btrfs/ctree.c:1412:7: warning: Local variable 'unlock_up' shadows outer function [shadowFunction]
Date: Sat, 23 Apr 2022 23:17:32 +0800
Message-ID: <202204232332.132zb8EA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2316960887934634093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e7d6987e09a328d4a949701db40ef63fbb970670
commit: 9b423bb93b064aeda9449de08212dc938b863afd [4134/5845] btrfs: release=
 upper nodes when reading stale btree node from disk
:::::: branch date: 33 hours ago
:::::: commit date: 4 days ago
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 9b423bb93b064aeda9449de08212dc938b863afd
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/btrfs/ctree.c:1412:7: warning: Local variable 'unlock_up' shadows out=
er function [shadowFunction]
    bool unlock_up;
         ^
   fs/btrfs/ctree.c:1348:22: note: Shadowed declaration
   static noinline void unlock_up(struct btrfs_path *path, int level,
                        ^
   fs/btrfs/ctree.c:1412:7: note: Shadow variable
    bool unlock_up;
         ^
>> fs/btrfs/send.c:6857:13: warning: Either the condition '*level=3D=3D0' i=
s redundant or the array 'path->nodes[8]' is accessed at index -1, which is=
 out of bounds. [negativeIndex]
    path->nodes[*level - 1] =3D eb;
               ^
   fs/btrfs/send.c:6861:13: note: Assuming that condition '*level=3D=3D0' i=
s not redundant
    if (*level =3D=3D 0)
               ^
   fs/btrfs/send.c:6857:13: note: Negative array index
    path->nodes[*level - 1] =3D eb;
               ^
>> fs/btrfs/send.c:6858:13: warning: Either the condition '*level=3D=3D0' i=
s redundant or the array 'path->slots[8]' is accessed at index -1, which is=
 out of bounds. [negativeIndex]
    path->slots[*level - 1] =3D 0;
               ^
   fs/btrfs/send.c:6861:13: note: Assuming that condition '*level=3D=3D0' i=
s not redundant
    if (*level =3D=3D 0)
               ^
   fs/btrfs/send.c:6858:13: note: Negative array index
    path->slots[*level - 1] =3D 0;
               ^
   fs/btrfs/send.c:2094:12: warning: Uninitialized variable: cur->ino [unin=
itvar]
     if (cur->ino =3D=3D ino && cur->gen =3D=3D gen)
              ^
   fs/btrfs/send.c:2090:6: note: Assuming condition is false
    if (!nce_head)
        ^
   fs/btrfs/send.c:2094:12: note: Uninitialized variable: cur->ino
     if (cur->ino =3D=3D ino && cur->gen =3D=3D gen)
              ^
   fs/btrfs/send.c:3130:17: warning: Uninitialized variables: cur.list, cur=
.name, cur.full_path, cur.dir, cur.dir_gen, cur.name_len [uninitvar]
     ret =3D dup_ref(cur, &pm->update_refs);
                   ^
   fs/btrfs/send.c:3107:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3107:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3107:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3107:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3107:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3107:6: note: Assuming condition is false
    if (!pm)
        ^
   fs/btrfs/send.c:3130:17: note: Uninitialized variables: cur.list, cur.na=
me, cur.full_path, cur.dir, cur.dir_gen, cur.name_len
     ret =3D dup_ref(cur, &pm->update_refs);
                   ^

vim +/unlock_up +1412 fs/btrfs/ctree.c

925baeddc5b0764a Chris Mason     2008-06-25  1391  =

c8c42864f6193638 Chris Mason     2009-04-03  1392  /*
c8c42864f6193638 Chris Mason     2009-04-03  1393   * helper function for b=
trfs_search_slot.  The goal is to find a block
c8c42864f6193638 Chris Mason     2009-04-03  1394   * in cache without sett=
ing the path to blocking.  If we find the block
c8c42864f6193638 Chris Mason     2009-04-03  1395   * we return zero and th=
e path is unchanged.
c8c42864f6193638 Chris Mason     2009-04-03  1396   *
c8c42864f6193638 Chris Mason     2009-04-03  1397   * If we can't find the =
block, we set the path blocking and do some
c8c42864f6193638 Chris Mason     2009-04-03  1398   * reada.  -EAGAIN is re=
turned and the search must be repeated.
c8c42864f6193638 Chris Mason     2009-04-03  1399   */
c8c42864f6193638 Chris Mason     2009-04-03  1400  static int
d07b85284f83dee7 Liu Bo          2017-01-30  1401  read_block_for_search(st=
ruct btrfs_root *root, struct btrfs_path *p,
c8c42864f6193638 Chris Mason     2009-04-03  1402  		      struct extent_bu=
ffer **eb_ret, int level, int slot,
cda79c545ead7e00 David Sterba    2017-02-10  1403  		      const struct btr=
fs_key *key)
c8c42864f6193638 Chris Mason     2009-04-03  1404  {
0b246afa62b0cf5b Jeff Mahoney    2016-06-22  1405  	struct btrfs_fs_info *f=
s_info =3D root->fs_info;
c8c42864f6193638 Chris Mason     2009-04-03  1406  	u64 blocknr;
c8c42864f6193638 Chris Mason     2009-04-03  1407  	u64 gen;
c8c42864f6193638 Chris Mason     2009-04-03  1408  	struct extent_buffer *t=
mp;
581c1760415c48cc Qu Wenruo       2018-03-29  1409  	struct btrfs_key first_=
key;
76a05b35a320e8c9 Chris Mason     2009-05-14  1410  	int ret;
581c1760415c48cc Qu Wenruo       2018-03-29  1411  	int parent_level;
9b423bb93b064aed Filipe Manana   2022-03-11 @1412  	bool unlock_up;
c8c42864f6193638 Chris Mason     2009-04-03  1413  =

9b423bb93b064aed Filipe Manana   2022-03-11  1414  	unlock_up =3D ((level +=
 1 < BTRFS_MAX_LEVEL) && p->locks[level + 1]);
213ff4b72a9c7509 Nikolay Borisov 2020-05-27  1415  	blocknr =3D btrfs_node_=
blockptr(*eb_ret, slot);
213ff4b72a9c7509 Nikolay Borisov 2020-05-27  1416  	gen =3D btrfs_node_ptr_=
generation(*eb_ret, slot);
213ff4b72a9c7509 Nikolay Borisov 2020-05-27  1417  	parent_level =3D btrfs_=
header_level(*eb_ret);
213ff4b72a9c7509 Nikolay Borisov 2020-05-27  1418  	btrfs_node_key_to_cpu(*=
eb_ret, &first_key, slot);
c8c42864f6193638 Chris Mason     2009-04-03  1419  =

9b423bb93b064aed Filipe Manana   2022-03-11  1420  	/*
9b423bb93b064aed Filipe Manana   2022-03-11  1421  	 * If we need to read a=
n extent buffer from disk and we are holding locks
9b423bb93b064aed Filipe Manana   2022-03-11  1422  	 * on upper level nodes=
, we unlock all the upper nodes before reading the
9b423bb93b064aed Filipe Manana   2022-03-11  1423  	 * extent buffer, and t=
hen return -EAGAIN to the caller as it needs to
9b423bb93b064aed Filipe Manana   2022-03-11  1424  	 * restart the search. =
We don't release the lock on the current level
9b423bb93b064aed Filipe Manana   2022-03-11  1425  	 * because we need to w=
alk this node to figure out which blocks to read.
9b423bb93b064aed Filipe Manana   2022-03-11  1426  	 */
0b246afa62b0cf5b Jeff Mahoney    2016-06-22  1427  	tmp =3D find_extent_buf=
fer(fs_info, blocknr);
cb44921a09221f0a Chris Mason     2010-10-24  1428  	if (tmp) {
ace75066ced9b9ab Filipe Manana   2021-03-31  1429  		if (p->reada =3D=3D RE=
ADA_FORWARD_ALWAYS)
ace75066ced9b9ab Filipe Manana   2021-03-31  1430  			reada_for_search(fs_i=
nfo, p, level, slot, key->objectid);
ace75066ced9b9ab Filipe Manana   2021-03-31  1431  =

b9fab919b748c7b3 Chris Mason     2012-05-06  1432  		/* first we do an atom=
ic uptodate check */
b9fab919b748c7b3 Chris Mason     2012-05-06  1433  		if (btrfs_buffer_uptod=
ate(tmp, gen, 1) > 0) {
448de471cd4cab0c Qu Wenruo       2019-03-12  1434  			/*
448de471cd4cab0c Qu Wenruo       2019-03-12  1435  			 * Do extra check for=
 first_key, eb can be stale due to
448de471cd4cab0c Qu Wenruo       2019-03-12  1436  			 * being cached, read=
 from scrub, or have multiple
448de471cd4cab0c Qu Wenruo       2019-03-12  1437  			 * parents (shared tr=
ee blocks).
448de471cd4cab0c Qu Wenruo       2019-03-12  1438  			 */
e064d5e9f0a00041 David Sterba    2019-03-20  1439  			if (btrfs_verify_leve=
l_key(tmp,
448de471cd4cab0c Qu Wenruo       2019-03-12  1440  					parent_level - 1, &=
first_key, gen)) {
448de471cd4cab0c Qu Wenruo       2019-03-12  1441  				free_extent_buffer(t=
mp);
448de471cd4cab0c Qu Wenruo       2019-03-12  1442  				return -EUCLEAN;
448de471cd4cab0c Qu Wenruo       2019-03-12  1443  			}
c8c42864f6193638 Chris Mason     2009-04-03  1444  			*eb_ret =3D tmp;
c8c42864f6193638 Chris Mason     2009-04-03  1445  			return 0;
c8c42864f6193638 Chris Mason     2009-04-03  1446  		}
bdf7c00e8f56386d Josef Bacik     2013-06-17  1447  =

9b423bb93b064aed Filipe Manana   2022-03-11  1448  		if (unlock_up)
9b423bb93b064aed Filipe Manana   2022-03-11  1449  			btrfs_unlock_up_safe(=
p, level + 1);
9b423bb93b064aed Filipe Manana   2022-03-11  1450  =

b9fab919b748c7b3 Chris Mason     2012-05-06  1451  		/* now we're allowed t=
o do a blocking uptodate check */
581c1760415c48cc Qu Wenruo       2018-03-29  1452  		ret =3D btrfs_read_buf=
fer(tmp, gen, parent_level - 1, &first_key);
9a4ffa1bd629c7c5 Qu Wenruo       2022-02-22  1453  		if (ret) {
cb44921a09221f0a Chris Mason     2010-10-24  1454  			free_extent_buffer(tm=
p);
b3b4aa74b58bded9 David Sterba    2011-04-21  1455  			btrfs_release_path(p);
cb44921a09221f0a Chris Mason     2010-10-24  1456  			return -EIO;
cb44921a09221f0a Chris Mason     2010-10-24  1457  		}
9b423bb93b064aed Filipe Manana   2022-03-11  1458  =

9b423bb93b064aed Filipe Manana   2022-03-11  1459  		if (unlock_up)
9b423bb93b064aed Filipe Manana   2022-03-11  1460  			ret =3D -EAGAIN;
9b423bb93b064aed Filipe Manana   2022-03-11  1461  =

9b423bb93b064aed Filipe Manana   2022-03-11  1462  		goto out;
9a4ffa1bd629c7c5 Qu Wenruo       2022-02-22  1463  	}
c8c42864f6193638 Chris Mason     2009-04-03  1464  =

9b423bb93b064aed Filipe Manana   2022-03-11  1465  	if (unlock_up) {
8c594ea81d7abbbf Chris Mason     2009-04-20  1466  		btrfs_unlock_up_safe(p=
, level + 1);
bbb6542952125d69 Filipe Manana   2022-03-11  1467  		ret =3D -EAGAIN;
bbb6542952125d69 Filipe Manana   2022-03-11  1468  	} else {
bbb6542952125d69 Filipe Manana   2022-03-11  1469  		ret =3D 0;
bbb6542952125d69 Filipe Manana   2022-03-11  1470  	}
8c594ea81d7abbbf Chris Mason     2009-04-20  1471  =

e4058b54d1e442b6 David Sterba    2015-11-27  1472  	if (p->reada !=3D READA=
_NONE)
2ff7e61e0d30ff16 Jeff Mahoney    2016-06-22  1473  		reada_for_search(fs_in=
fo, p, level, slot, key->objectid);
c8c42864f6193638 Chris Mason     2009-04-03  1474  =

1b7ec85ef4905789 Josef Bacik     2020-11-05  1475  	tmp =3D read_tree_block=
(fs_info, blocknr, root->root_key.objectid,
1b7ec85ef4905789 Josef Bacik     2020-11-05  1476  			      gen, parent_lev=
el - 1, &first_key);
4eb150d6122bf517 Qu Wenruo       2022-02-22  1477  	if (IS_ERR(tmp)) {
4eb150d6122bf517 Qu Wenruo       2022-02-22  1478  		btrfs_release_path(p);
4eb150d6122bf517 Qu Wenruo       2022-02-22  1479  		return PTR_ERR(tmp);
4eb150d6122bf517 Qu Wenruo       2022-02-22  1480  	}
76a05b35a320e8c9 Chris Mason     2009-05-14  1481  	/*
76a05b35a320e8c9 Chris Mason     2009-05-14  1482  	 * If the read above di=
dn't mark this buffer up to date,
76a05b35a320e8c9 Chris Mason     2009-05-14  1483  	 * it will never end up=
 being up to date.  Set ret to EIO now
76a05b35a320e8c9 Chris Mason     2009-05-14  1484  	 * and give up so that =
our caller doesn't loop forever
76a05b35a320e8c9 Chris Mason     2009-05-14  1485  	 * on our EAGAINs.
76a05b35a320e8c9 Chris Mason     2009-05-14  1486  	 */
e6a1d6fd276965db Liu Bo          2018-05-18  1487  	if (!extent_buffer_upto=
date(tmp))
76a05b35a320e8c9 Chris Mason     2009-05-14  1488  		ret =3D -EIO;
02a3307aa9c20b4f Liu Bo          2018-05-16  1489  =

9b423bb93b064aed Filipe Manana   2022-03-11  1490  out:
bbb6542952125d69 Filipe Manana   2022-03-11  1491  	if (ret =3D=3D 0) {
bbb6542952125d69 Filipe Manana   2022-03-11  1492  		*eb_ret =3D tmp;
bbb6542952125d69 Filipe Manana   2022-03-11  1493  	} else {
bbb6542952125d69 Filipe Manana   2022-03-11  1494  		free_extent_buffer(tmp=
);
02a3307aa9c20b4f Liu Bo          2018-05-16  1495  		btrfs_release_path(p);
bbb6542952125d69 Filipe Manana   2022-03-11  1496  	}
bbb6542952125d69 Filipe Manana   2022-03-11  1497  =

76a05b35a320e8c9 Chris Mason     2009-05-14  1498  	return ret;
c8c42864f6193638 Chris Mason     2009-04-03  1499  }
c8c42864f6193638 Chris Mason     2009-04-03  1500  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2316960887934634093==--

