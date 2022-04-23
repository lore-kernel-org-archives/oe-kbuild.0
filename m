Content-Type: multipart/mixed; boundary="===============2561072334847265417=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:btrfs-bio-cleanup-part3 149/174] fs/btrfs/delayed-inode.c:1885:24: warning: Uninitialized variables: delayed_node.inode_id, delayed_node.bytes_reserved, delayed_node.root, delayed_node.n_list, delayed_node.p_list, delayed_node.ins_root, delayed_node.del_root, delayed_node.mutex, delayed_...
Date: Sun, 24 Apr 2022 00:18:48 +0800
Message-ID: <202204240018.wqwQfwZK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2561072334847265417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: David Sterba <dsterba@suse.com>

tree:   git://git.infradead.org/users/hch/misc.git btrfs-bio-cleanup-part3
head:   50401c1bd218c77092656710b2fc11b3b246679f
commit: 7aa9b9c7184d8d2a72aef3ad09ecb628519f44a4 [149/174] btrfs: convert d=
elayed_nodes_tree into an xarray
:::::: branch date: 11 hours ago
:::::: commit date: 19 hours ago
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 7aa9b9c7184d8d2a72aef3ad09ecb628519f44a4
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/btrfs/delayed-inode.c:
   fs/btrfs/delayed-inode.c:1347:31: warning: Parameter 'disk_key' can be d=
eclared with const [constParameter]
          struct btrfs_disk_key *disk_key, u8 type,
                                 ^
   fs/btrfs/delayed-inode.c:1577:13: warning: Uninitialized variable: curr-=
>key [uninitvar]
     if (curr->key.offset > index)
               ^
   fs/btrfs/delayed-inode.c:1613:13: warning: Uninitialized variable: curr-=
>key [uninitvar]
     if (curr->key.offset < ctx->pos) {
               ^
   fs/btrfs/delayed-inode.c:1602:16: note: Assuming condition is false
    if (list_empty(ins_list))
                  ^
   fs/btrfs/delayed-inode.c:1613:13: note: Uninitialized variable: curr->key
     if (curr->key.offset < ctx->pos) {
               ^
>> fs/btrfs/delayed-inode.c:1885:24: warning: Uninitialized variables: dela=
yed_node.inode_id, delayed_node.bytes_reserved, delayed_node.root, delayed_=
node.n_list, delayed_node.p_list, delayed_node.ins_root, delayed_node.del_r=
oot, delayed_node.mutex, delayed_node.inode_item, delayed_node.index_cnt, d=
elayed_node.flags, delayed_node.count [uninitvar]
       delayed_nodes[n] =3D delayed_node;
                          ^
   fs/btrfs/delayed-inode.c:1873:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1873:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1873:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1873:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1873:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1873:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1873:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1873:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1873:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1873:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1873:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1873:15: note: Assuming condition is false
     if (xa_empty(&root->delayed_nodes)) {
                 ^
   fs/btrfs/delayed-inode.c:1885:24: note: Uninitialized variables: delayed=
_node.inode_id, delayed_node.bytes_reserved, delayed_node.root, delayed_nod=
e.n_list, delayed_node.p_list, delayed_node.ins_root, delayed_node.del_root=
, delayed_node.mutex, delayed_node.inode_item, delayed_node.index_cnt, dela=
yed_node.flags, delayed_node.count
       delayed_nodes[n] =3D delayed_node;
                          ^

vim +1885 fs/btrfs/delayed-inode.c

16cdcec736cd2143 Miao Xie        2011-04-22  1863  =

16cdcec736cd2143 Miao Xie        2011-04-22  1864  void btrfs_kill_all_dela=
yed_nodes(struct btrfs_root *root)
16cdcec736cd2143 Miao Xie        2011-04-22  1865  {
7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19  1866  	unsigned long index =3D=
 0;
7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19  1867  	struct btrfs_delayed_no=
de *delayed_node;
16cdcec736cd2143 Miao Xie        2011-04-22  1868  	struct btrfs_delayed_no=
de *delayed_nodes[8];
16cdcec736cd2143 Miao Xie        2011-04-22  1869  	int i, n;
16cdcec736cd2143 Miao Xie        2011-04-22  1870  =

16cdcec736cd2143 Miao Xie        2011-04-22  1871  	while (1) {
16cdcec736cd2143 Miao Xie        2011-04-22  1872  		spin_lock(&root->inode=
_lock);
7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19  1873  		if (xa_empty(&root->de=
layed_nodes)) {
16cdcec736cd2143 Miao Xie        2011-04-22  1874  			spin_unlock(&root->in=
ode_lock);
7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19  1875  			return;
16cdcec736cd2143 Miao Xie        2011-04-22  1876  		}
16cdcec736cd2143 Miao Xie        2011-04-22  1877  =

7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19  1878  		n =3D 0;
7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19  1879  		xa_for_each_start(&roo=
t->delayed_nodes, index, delayed_node, index) {
baf320b9d531f1cf Josef Bacik     2019-09-26  1880  			/*
baf320b9d531f1cf Josef Bacik     2019-09-26  1881  			 * Don't increase ref=
s in case the node is dead and
baf320b9d531f1cf Josef Bacik     2019-09-26  1882  			 * about to be remove=
d from the tree in the loop below
baf320b9d531f1cf Josef Bacik     2019-09-26  1883  			 */
7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19  1884  			if (refcount_inc_not_=
zero(&delayed_node->refs)) {
7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19 @1885  				delayed_nodes[n] =3D=
 delayed_node;
7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19  1886  				n++;
7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19  1887  			}
7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19  1888  			if (n >=3D ARRAY_SIZE=
(delayed_nodes))
7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19  1889  				break;
baf320b9d531f1cf Josef Bacik     2019-09-26  1890  		}
7aa9b9c7184d8d2a Gabriel Niebler 2022-04-19  1891  		index++;
16cdcec736cd2143 Miao Xie        2011-04-22  1892  		spin_unlock(&root->ino=
de_lock);
16cdcec736cd2143 Miao Xie        2011-04-22  1893  =

16cdcec736cd2143 Miao Xie        2011-04-22  1894  		for (i =3D 0; i < n; i=
++) {
baf320b9d531f1cf Josef Bacik     2019-09-26  1895  			if (!delayed_nodes[i])
baf320b9d531f1cf Josef Bacik     2019-09-26  1896  				continue;
16cdcec736cd2143 Miao Xie        2011-04-22  1897  			__btrfs_kill_delayed_=
node(delayed_nodes[i]);
16cdcec736cd2143 Miao Xie        2011-04-22  1898  			btrfs_release_delayed=
_node(delayed_nodes[i]);
16cdcec736cd2143 Miao Xie        2011-04-22  1899  		}
16cdcec736cd2143 Miao Xie        2011-04-22  1900  	}
16cdcec736cd2143 Miao Xie        2011-04-22  1901  }
67cde3448d951b55 Miao Xie        2012-06-14  1902  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2561072334847265417==--

