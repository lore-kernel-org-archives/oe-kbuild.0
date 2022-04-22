Content-Type: multipart/mixed; boundary="===============5519753614298223490=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:for-next 144/164] fs/btrfs/delayed-inode.c:144:2-11: second lock on line 144
Date: Fri, 22 Apr 2022 13:30:38 +0800
Message-ID: <202204221356.cRkocciB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5519753614298223490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Gabriel Niebler <gniebler@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git for-next
head:   6a298ff0407012ed97f9464bf9bd37d91783ee95
commit: a8f70c56701d0f7d487b13baba02191423704a78 [144/164] btrfs: convert d=
elayed_nodes_tree into an xarray
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
422/202204221356.cRkocciB-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/delayed-inode.c:144:2-11: second lock on line 144

vim +144 fs/btrfs/delayed-inode.c

2f7e33d432d097a Miao Xie        2011-06-23  121  =

79787eaab46121d Jeff Mahoney    2012-03-12  122  /* Will return either the =
node or PTR_ERR(-ENOMEM) */
2f7e33d432d097a Miao Xie        2011-06-23  123  static struct btrfs_delaye=
d_node *btrfs_get_or_create_delayed_node(
e5517a7bffafdeb Nikolay Borisov 2017-01-10  124  		struct btrfs_inode *btrf=
s_inode)
2f7e33d432d097a Miao Xie        2011-06-23  125  {
2f7e33d432d097a Miao Xie        2011-06-23  126  	struct btrfs_delayed_node=
 *node;
2f7e33d432d097a Miao Xie        2011-06-23  127  	struct btrfs_root *root =
=3D btrfs_inode->root;
4a0cc7ca6c40b60 Nikolay Borisov 2017-01-10  128  	u64 ino =3D btrfs_ino(btr=
fs_inode);
2f7e33d432d097a Miao Xie        2011-06-23  129  	int ret;
2f7e33d432d097a Miao Xie        2011-06-23  130  =

a8f70c56701d0f7 Gabriel Niebler 2022-04-19  131  	do {
340c6ca9fd07703 Nikolay Borisov 2017-01-10  132  		node =3D btrfs_get_delay=
ed_node(btrfs_inode);
2f7e33d432d097a Miao Xie        2011-06-23  133  		if (node)
2f7e33d432d097a Miao Xie        2011-06-23  134  			return node;
2f7e33d432d097a Miao Xie        2011-06-23  135  =

352dd9c8d3b34e4 Alexandru Moise 2015-10-25  136  		node =3D kmem_cache_zall=
oc(delayed_node_cache, GFP_NOFS);
16cdcec736cd214 Miao Xie        2011-04-22  137  		if (!node)
16cdcec736cd214 Miao Xie        2011-04-22  138  			return ERR_PTR(-ENOMEM);
0d0ca30f1809062 Chris Mason     2011-05-22  139  		btrfs_init_delayed_node(=
node, root, ino);
16cdcec736cd214 Miao Xie        2011-04-22  140  =

a8f70c56701d0f7 Gabriel Niebler 2022-04-19  141  		/* Cached in the btrfs i=
node and can be accessed */
6de5f18e7b0da0c Elena Reshetova 2017-03-03  142  		refcount_set(&node->refs=
, 2);
16cdcec736cd214 Miao Xie        2011-04-22  143  =

16cdcec736cd214 Miao Xie        2011-04-22 @144  		spin_lock(&root->inode_l=
ock);
a8f70c56701d0f7 Gabriel Niebler 2022-04-19  145  		ret =3D xa_insert(&root-=
>delayed_nodes, ino, node, GFP_NOFS);
a8f70c56701d0f7 Gabriel Niebler 2022-04-19  146  		if (ret) {
16cdcec736cd214 Miao Xie        2011-04-22  147  			spin_unlock(&root->inod=
e_lock);
964930312aec583 Jeff Mahoney    2014-05-27  148  			kmem_cache_free(delayed=
_node_cache, node);
a8f70c56701d0f7 Gabriel Niebler 2022-04-19  149  			if (ret !=3D -EBUSY)
a8f70c56701d0f7 Gabriel Niebler 2022-04-19  150  				return ERR_PTR(ret);
16cdcec736cd214 Miao Xie        2011-04-22  151  		}
a8f70c56701d0f7 Gabriel Niebler 2022-04-19  152  	} while (ret);
16cdcec736cd214 Miao Xie        2011-04-22  153  	btrfs_inode->delayed_node=
 =3D node;
16cdcec736cd214 Miao Xie        2011-04-22  154  	spin_unlock(&root->inode_=
lock);
16cdcec736cd214 Miao Xie        2011-04-22  155  =

16cdcec736cd214 Miao Xie        2011-04-22  156  	return node;
16cdcec736cd214 Miao Xie        2011-04-22  157  }
16cdcec736cd214 Miao Xie        2011-04-22  158  =


:::::: The code at line 144 was first introduced by commit
:::::: 16cdcec736cd214350cdb591bf1091f8beedefa0 btrfs: implement delayed in=
ode items operation

:::::: TO: Miao Xie <miaox@cn.fujitsu.com>
:::::: CC: Chris Mason <chris.mason@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5519753614298223490==--

