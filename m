Content-Type: multipart/mixed; boundary="===============5187905231057859028=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1574/1734] fs/btrfs/tree-log.c:5948:1-7: preceding lock on line 5738
Date: Tue, 25 Jan 2022 23:45:04 +0800
Message-ID: <202201252315.ngIuO5id-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5187905231057859028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d25ee88530253138d0b20d43511ca5acbda4e9f7
commit: e84a57a06098fdfc912508072ae0a1840d15eeca [1574/1734] btrfs: avoid i=
node logging during rename and link when possible
:::::: branch date: 11 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-c001-20220124 (https://download.01.org/0day-ci/arch=
ive/20220125/202201252315.ngIuO5id-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/tree-log.c:5948:1-7: preceding lock on line 5738

vim +5948 fs/btrfs/tree-log.c

da447009a25609 Filipe Manana   2020-03-09  5656  =

e02119d5a7b439 Chris Mason     2008-09-05  5657  /* log a single inode in t=
he tree log.
e02119d5a7b439 Chris Mason     2008-09-05  5658   * At least one parent dir=
ectory for this inode must exist in the tree
e02119d5a7b439 Chris Mason     2008-09-05  5659   * or be logged already.
e02119d5a7b439 Chris Mason     2008-09-05  5660   *
e02119d5a7b439 Chris Mason     2008-09-05  5661   * Any items from this ino=
de changed by the current transaction are copied
e02119d5a7b439 Chris Mason     2008-09-05  5662   * to the log tree.  An ex=
tra reference is taken on any extents in this
e02119d5a7b439 Chris Mason     2008-09-05  5663   * file, allowing us to av=
oid a whole pile of corner cases around logging
e02119d5a7b439 Chris Mason     2008-09-05  5664   * blocks that have been r=
emoved from the tree.
e02119d5a7b439 Chris Mason     2008-09-05  5665   *
e02119d5a7b439 Chris Mason     2008-09-05  5666   * See LOG_INODE_ALL and r=
elated defines for a description of what inode_only
e02119d5a7b439 Chris Mason     2008-09-05  5667   * does.
e02119d5a7b439 Chris Mason     2008-09-05  5668   *
e02119d5a7b439 Chris Mason     2008-09-05  5669   * This handles both files=
 and directories.
e02119d5a7b439 Chris Mason     2008-09-05  5670   */
12fcfd22fe5bf4 Chris Mason     2009-03-24  5671  static int btrfs_log_inode=
(struct btrfs_trans_handle *trans,
90d04510a774a8 Filipe Manana   2021-09-16  5672  			   struct btrfs_inode *=
inode,
49dae1bc1c6658 Filipe Manana   2014-09-06  5673  			   int inode_only,
8407f553268a46 Filipe Manana   2014-09-05  5674  			   struct btrfs_log_ctx=
 *ctx)
e02119d5a7b439 Chris Mason     2008-09-05  5675  {
e02119d5a7b439 Chris Mason     2008-09-05  5676  	struct btrfs_path *path;
e02119d5a7b439 Chris Mason     2008-09-05  5677  	struct btrfs_path *dst_pa=
th;
e02119d5a7b439 Chris Mason     2008-09-05  5678  	struct btrfs_key min_key;
e02119d5a7b439 Chris Mason     2008-09-05  5679  	struct btrfs_key max_key;
90d04510a774a8 Filipe Manana   2021-09-16  5680  	struct btrfs_root *log =
=3D inode->root->log_root;
4a500fd178c89b Yan, Zheng      2010-05-16  5681  	int err =3D 0;
8c8648dd1f6d62 Filipe Manana   2020-07-02  5682  	int ret =3D 0;
5dc562c541e102 Josef Bacik     2012-08-17  5683  	bool fast_search =3D fals=
e;
a59108a73f347d Nikolay Borisov 2017-01-18  5684  	u64 ino =3D btrfs_ino(ino=
de);
a59108a73f347d Nikolay Borisov 2017-01-18  5685  	struct extent_map_tree *e=
m_tree =3D &inode->extent_tree;
1a4bcf470c886b Filipe Manana   2015-02-13  5686  	u64 logged_isize =3D 0;
e4545de5b035c7 Filipe Manana   2015-06-17  5687  	bool need_log_inode_item =
=3D true;
9a8fca62aacc15 Filipe Manana   2018-05-11  5688  	bool xattrs_logged =3D fa=
lse;
a3baaf0d786e22 Filipe Manana   2019-02-13  5689  	bool recursive_logging =
=3D false;
2ac691d8b3b1dd Filipe Manana   2021-07-20  5690  	bool inode_item_dropped =
=3D true;
e84a57a06098fd Filipe Manana   2022-01-20  5691  	const bool orig_logged_be=
fore =3D ctx->logged_before;
e02119d5a7b439 Chris Mason     2008-09-05  5692  =

e02119d5a7b439 Chris Mason     2008-09-05  5693  	path =3D btrfs_alloc_path=
();
5df67083488ccb Tsutomu Itoh    2011-02-01  5694  	if (!path)
5df67083488ccb Tsutomu Itoh    2011-02-01  5695  		return -ENOMEM;
e02119d5a7b439 Chris Mason     2008-09-05  5696  	dst_path =3D btrfs_alloc_=
path();
5df67083488ccb Tsutomu Itoh    2011-02-01  5697  	if (!dst_path) {
5df67083488ccb Tsutomu Itoh    2011-02-01  5698  		btrfs_free_path(path);
5df67083488ccb Tsutomu Itoh    2011-02-01  5699  		return -ENOMEM;
5df67083488ccb Tsutomu Itoh    2011-02-01  5700  	}
e02119d5a7b439 Chris Mason     2008-09-05  5701  =

33345d01522f81 Li Zefan        2011-04-20  5702  	min_key.objectid =3D ino;
e02119d5a7b439 Chris Mason     2008-09-05  5703  	min_key.type =3D BTRFS_IN=
ODE_ITEM_KEY;
e02119d5a7b439 Chris Mason     2008-09-05  5704  	min_key.offset =3D 0;
e02119d5a7b439 Chris Mason     2008-09-05  5705  =

33345d01522f81 Li Zefan        2011-04-20  5706  	max_key.objectid =3D ino;
12fcfd22fe5bf4 Chris Mason     2009-03-24  5707  =

12fcfd22fe5bf4 Chris Mason     2009-03-24  5708  =

5dc562c541e102 Josef Bacik     2012-08-17  5709  	/* today the code can onl=
y do partial logging of directories */
a59108a73f347d Nikolay Borisov 2017-01-18  5710  	if (S_ISDIR(inode->vfs_in=
ode.i_mode) ||
5269b67e3d809d Miao Xie        2012-11-01  5711  	    (!test_bit(BTRFS_INOD=
E_NEEDS_FULL_SYNC,
a59108a73f347d Nikolay Borisov 2017-01-18  5712  		       &inode->runtime_f=
lags) &&
781feef7e6befa Liu Bo          2016-11-30  5713  	     inode_only >=3D LOG_=
INODE_EXISTS))
e02119d5a7b439 Chris Mason     2008-09-05  5714  		max_key.type =3D BTRFS_X=
ATTR_ITEM_KEY;
e02119d5a7b439 Chris Mason     2008-09-05  5715  	else
e02119d5a7b439 Chris Mason     2008-09-05  5716  		max_key.type =3D (u8)-1;
e02119d5a7b439 Chris Mason     2008-09-05  5717  	max_key.offset =3D (u64)-=
1;
e02119d5a7b439 Chris Mason     2008-09-05  5718  =

2c2c452b0cafdc Filipe Manana   2015-01-13  5719  	/*
5aa7d1a7f4a2f8 Filipe Manana   2020-07-02  5720  	 * Only run delayed items=
 if we are a directory. We want to make sure
5aa7d1a7f4a2f8 Filipe Manana   2020-07-02  5721  	 * all directory indexes =
hit the fs/subvolume tree so we can find them
5aa7d1a7f4a2f8 Filipe Manana   2020-07-02  5722  	 * and figure out which i=
ndex ranges have to be logged.
2c2c452b0cafdc Filipe Manana   2015-01-13  5723  	 */
f6df27dd2707b9 Filipe Manana   2021-08-31  5724  	if (S_ISDIR(inode->vfs_in=
ode.i_mode)) {
f6df27dd2707b9 Filipe Manana   2021-08-31  5725  		err =3D btrfs_commit_ino=
de_delayed_items(trans, inode);
f6df27dd2707b9 Filipe Manana   2021-08-31  5726  		if (err)
f6df27dd2707b9 Filipe Manana   2021-08-31  5727  			goto out;
16cdcec736cd21 Miao Xie        2011-04-22  5728  	}
16cdcec736cd21 Miao Xie        2011-04-22  5729  =

a3baaf0d786e22 Filipe Manana   2019-02-13  5730  	if (inode_only =3D=3D LOG=
_OTHER_INODE || inode_only =3D=3D LOG_OTHER_INODE_ALL) {
a3baaf0d786e22 Filipe Manana   2019-02-13  5731  		recursive_logging =3D tr=
ue;
a3baaf0d786e22 Filipe Manana   2019-02-13  5732  		if (inode_only =3D=3D LO=
G_OTHER_INODE)
781feef7e6befa Liu Bo          2016-11-30  5733  			inode_only =3D LOG_INOD=
E_EXISTS;
a3baaf0d786e22 Filipe Manana   2019-02-13  5734  		else
a3baaf0d786e22 Filipe Manana   2019-02-13  5735  			inode_only =3D LOG_INOD=
E_ALL;
a59108a73f347d Nikolay Borisov 2017-01-18  5736  		mutex_lock_nested(&inode=
->log_mutex, SINGLE_DEPTH_NESTING);
781feef7e6befa Liu Bo          2016-11-30  5737  	} else {
a59108a73f347d Nikolay Borisov 2017-01-18  5738  		mutex_lock(&inode->log_m=
utex);
781feef7e6befa Liu Bo          2016-11-30  5739  	}
e02119d5a7b439 Chris Mason     2008-09-05  5740  =

e84a57a06098fd Filipe Manana   2022-01-20  5741  	/*
e84a57a06098fd Filipe Manana   2022-01-20  5742  	 * Before logging the ino=
de item, cache the value returned by
e84a57a06098fd Filipe Manana   2022-01-20  5743  	 * inode_logged(), becaus=
e after that we have the need to figure out if
e84a57a06098fd Filipe Manana   2022-01-20  5744  	 * the inode was previous=
ly logged in this transaction.
e84a57a06098fd Filipe Manana   2022-01-20  5745  	 */
e84a57a06098fd Filipe Manana   2022-01-20  5746  	ret =3D inode_logged(tran=
s, inode, path);
e84a57a06098fd Filipe Manana   2022-01-20  5747  	if (ret < 0) {
e84a57a06098fd Filipe Manana   2022-01-20  5748  		err =3D ret;
e84a57a06098fd Filipe Manana   2022-01-20  5749  		goto out;
e84a57a06098fd Filipe Manana   2022-01-20  5750  	}
e84a57a06098fd Filipe Manana   2022-01-20  5751  	ctx->logged_before =3D (r=
et =3D=3D 1);
e84a57a06098fd Filipe Manana   2022-01-20  5752  =

64d6b281ba4db0 Filipe Manana   2021-01-27  5753  	/*
64d6b281ba4db0 Filipe Manana   2021-01-27  5754  	 * This is for cases wher=
e logging a directory could result in losing a
64d6b281ba4db0 Filipe Manana   2021-01-27  5755  	 * a file after replaying=
 the log. For example, if we move a file from a
64d6b281ba4db0 Filipe Manana   2021-01-27  5756  	 * directory A to a direc=
tory B, then fsync directory A, we have no way
64d6b281ba4db0 Filipe Manana   2021-01-27  5757  	 * to known the file was =
moved from A to B, so logging just A would
64d6b281ba4db0 Filipe Manana   2021-01-27  5758  	 * result in losing the f=
ile after a log replay.
64d6b281ba4db0 Filipe Manana   2021-01-27  5759  	 */
64d6b281ba4db0 Filipe Manana   2021-01-27  5760  	if (S_ISDIR(inode->vfs_in=
ode.i_mode) &&
64d6b281ba4db0 Filipe Manana   2021-01-27  5761  	    inode_only =3D=3D LOG=
_INODE_ALL &&
64d6b281ba4db0 Filipe Manana   2021-01-27  5762  	    inode->last_unlink_tr=
ans >=3D trans->transid) {
64d6b281ba4db0 Filipe Manana   2021-01-27  5763  		btrfs_set_log_full_commi=
t(trans);
64d6b281ba4db0 Filipe Manana   2021-01-27  5764  		err =3D 1;
64d6b281ba4db0 Filipe Manana   2021-01-27  5765  		goto out_unlock;
64d6b281ba4db0 Filipe Manana   2021-01-27  5766  	}
64d6b281ba4db0 Filipe Manana   2021-01-27  5767  =

e02119d5a7b439 Chris Mason     2008-09-05  5768  	/*
e02119d5a7b439 Chris Mason     2008-09-05  5769  	 * a brute force approach=
 to making sure we get the most uptodate
e02119d5a7b439 Chris Mason     2008-09-05  5770  	 * copies of everything.
e02119d5a7b439 Chris Mason     2008-09-05  5771  	 */
a59108a73f347d Nikolay Borisov 2017-01-18  5772  	if (S_ISDIR(inode->vfs_in=
ode.i_mode)) {
e02119d5a7b439 Chris Mason     2008-09-05  5773  		int max_key_type =3D BTR=
FS_DIR_LOG_INDEX_KEY;
e02119d5a7b439 Chris Mason     2008-09-05  5774  =

ab12313a9f56b9 Filipe Manana   2021-01-27  5775  		clear_bit(BTRFS_INODE_CO=
PY_EVERYTHING, &inode->runtime_flags);
4f764e5153616f Filipe Manana   2015-02-23  5776  		if (inode_only =3D=3D LO=
G_INODE_EXISTS)
4f764e5153616f Filipe Manana   2015-02-23  5777  			max_key_type =3D BTRFS_=
XATTR_ITEM_KEY;
e84a57a06098fd Filipe Manana   2022-01-20  5778  		if (ctx->logged_before)
e84a57a06098fd Filipe Manana   2022-01-20  5779  			ret =3D drop_inode_item=
s(trans, log, path, inode,
e84a57a06098fd Filipe Manana   2022-01-20  5780  					       max_key_type);
e02119d5a7b439 Chris Mason     2008-09-05  5781  	} else {
e84a57a06098fd Filipe Manana   2022-01-20  5782  		if (inode_only =3D=3D LO=
G_INODE_EXISTS && ctx->logged_before) {
1a4bcf470c886b Filipe Manana   2015-02-13  5783  			/*
1a4bcf470c886b Filipe Manana   2015-02-13  5784  			 * Make sure the new in=
ode item we write to the log has
1a4bcf470c886b Filipe Manana   2015-02-13  5785  			 * the same isize as th=
e current one (if it exists).
1a4bcf470c886b Filipe Manana   2015-02-13  5786  			 * This is necessary to=
 prevent data loss after log
1a4bcf470c886b Filipe Manana   2015-02-13  5787  			 * replay, and also to =
prevent doing a wrong expanding
1a4bcf470c886b Filipe Manana   2015-02-13  5788  			 * truncate - for e.g. =
create file, write 4K into offset
1a4bcf470c886b Filipe Manana   2015-02-13  5789  			 * 0, fsync, write 4K i=
nto offset 4096, add hard link,
1a4bcf470c886b Filipe Manana   2015-02-13  5790  			 * fsync some other fil=
e (to sync log), power fail - if
1a4bcf470c886b Filipe Manana   2015-02-13  5791  			 * we use the inode's c=
urrent i_size, after log replay
1a4bcf470c886b Filipe Manana   2015-02-13  5792  			 * we get a 8Kb file, w=
ith the last 4Kb extent as a hole
1a4bcf470c886b Filipe Manana   2015-02-13  5793  			 * (zeroes), as if an e=
xpanding truncate happened,
1a4bcf470c886b Filipe Manana   2015-02-13  5794  			 * instead of getting a=
 file of 4Kb only.
1a4bcf470c886b Filipe Manana   2015-02-13  5795  			 */
a59108a73f347d Nikolay Borisov 2017-01-18  5796  			err =3D logged_inode_si=
ze(log, inode, path, &logged_isize);
1a4bcf470c886b Filipe Manana   2015-02-13  5797  			if (err)
1a4bcf470c886b Filipe Manana   2015-02-13  5798  				goto out_unlock;
1a4bcf470c886b Filipe Manana   2015-02-13  5799  		}
a742994aa2e271 Filipe Manana   2015-02-13  5800  		if (test_bit(BTRFS_INODE=
_NEEDS_FULL_SYNC,
a59108a73f347d Nikolay Borisov 2017-01-18  5801  			     &inode->runtime_fl=
ags)) {
a742994aa2e271 Filipe Manana   2015-02-13  5802  			if (inode_only =3D=3D L=
OG_INODE_EXISTS) {
4f764e5153616f Filipe Manana   2015-02-23  5803  				max_key.type =3D BTRFS=
_XATTR_ITEM_KEY;
e84a57a06098fd Filipe Manana   2022-01-20  5804  				if (ctx->logged_before)
e84a57a06098fd Filipe Manana   2022-01-20  5805  					ret =3D drop_inode_it=
ems(trans, log, path,
e84a57a06098fd Filipe Manana   2022-01-20  5806  							       inode, max_k=
ey.type);
a742994aa2e271 Filipe Manana   2015-02-13  5807  			} else {
a742994aa2e271 Filipe Manana   2015-02-13  5808  				clear_bit(BTRFS_INODE_=
NEEDS_FULL_SYNC,
a59108a73f347d Nikolay Borisov 2017-01-18  5809  					  &inode->runtime_fla=
gs);
e99761514999f6 Josef Bacik     2012-10-11  5810  				clear_bit(BTRFS_INODE_=
COPY_EVERYTHING,
a59108a73f347d Nikolay Borisov 2017-01-18  5811  					  &inode->runtime_fla=
gs);
e84a57a06098fd Filipe Manana   2022-01-20  5812  				if (ctx->logged_before)
4934a8150214c3 Filipe Manana   2021-08-31  5813  					ret =3D truncate_inod=
e_items(trans, log,
4934a8150214c3 Filipe Manana   2021-08-31  5814  								   inode, 0, 0);
a742994aa2e271 Filipe Manana   2015-02-13  5815  			}
4f764e5153616f Filipe Manana   2015-02-23  5816  		} else if (test_and_clea=
r_bit(BTRFS_INODE_COPY_EVERYTHING,
a59108a73f347d Nikolay Borisov 2017-01-18  5817  					      &inode->runtime=
_flags) ||
6cfab851f42edc Josef Bacik     2013-11-12  5818  			   inode_only =3D=3D LO=
G_INODE_EXISTS) {
4f764e5153616f Filipe Manana   2015-02-23  5819  			if (inode_only =3D=3D L=
OG_INODE_ALL)
5dc562c541e102 Josef Bacik     2012-08-17  5820  				fast_search =3D true;
5dc562c541e102 Josef Bacik     2012-08-17  5821  			max_key.type =3D BTRFS_=
XATTR_ITEM_KEY;
e84a57a06098fd Filipe Manana   2022-01-20  5822  			if (ctx->logged_before)
88e221cdacc528 Filipe Manana   2021-08-31  5823  				ret =3D drop_inode_ite=
ms(trans, log, path, inode,
e99761514999f6 Josef Bacik     2012-10-11  5824  						       max_key.type);
a95249b392c3ab Josef Bacik     2012-10-11  5825  		} else {
a95249b392c3ab Josef Bacik     2012-10-11  5826  			if (inode_only =3D=3D L=
OG_INODE_ALL)
a95249b392c3ab Josef Bacik     2012-10-11  5827  				fast_search =3D true;
2ac691d8b3b1dd Filipe Manana   2021-07-20  5828  			inode_item_dropped =3D =
false;
a95249b392c3ab Josef Bacik     2012-10-11  5829  			goto log_extents;
a95249b392c3ab Josef Bacik     2012-10-11  5830  		}
a95249b392c3ab Josef Bacik     2012-10-11  5831  =

e02119d5a7b439 Chris Mason     2008-09-05  5832  	}
4a500fd178c89b Yan, Zheng      2010-05-16  5833  	if (ret) {
4a500fd178c89b Yan, Zheng      2010-05-16  5834  		err =3D ret;
4a500fd178c89b Yan, Zheng      2010-05-16  5835  		goto out_unlock;
4a500fd178c89b Yan, Zheng      2010-05-16  5836  	}
e02119d5a7b439 Chris Mason     2008-09-05  5837  =

da447009a25609 Filipe Manana   2020-03-09  5838  	err =3D copy_inode_items_=
to_log(trans, inode, &min_key, &max_key,
da447009a25609 Filipe Manana   2020-03-09  5839  				      path, dst_path, =
logged_isize,
7af597433d435b Filipe Manana   2020-04-07  5840  				      recursive_loggin=
g, inode_only, ctx,
7af597433d435b Filipe Manana   2020-04-07  5841  				      &need_log_inode_=
item);
44f714dae50a2e Filipe Manana   2016-06-06  5842  	if (err)
44f714dae50a2e Filipe Manana   2016-06-06  5843  		goto out_unlock;
5dc562c541e102 Josef Bacik     2012-08-17  5844  =

36283bf777d963 Filipe Manana   2015-06-20  5845  	btrfs_release_path(path);
36283bf777d963 Filipe Manana   2015-06-20  5846  	btrfs_release_path(dst_pa=
th);
90d04510a774a8 Filipe Manana   2021-09-16  5847  	err =3D btrfs_log_all_xat=
trs(trans, inode, path, dst_path);
36283bf777d963 Filipe Manana   2015-06-20  5848  	if (err)
36283bf777d963 Filipe Manana   2015-06-20  5849  		goto out_unlock;
9a8fca62aacc15 Filipe Manana   2018-05-11  5850  	xattrs_logged =3D true;
a89ca6f24ffe43 Filipe Manana   2015-06-25  5851  	if (max_key.type >=3D BTR=
FS_EXTENT_DATA_KEY && !fast_search) {
a89ca6f24ffe43 Filipe Manana   2015-06-25  5852  		btrfs_release_path(path);
a89ca6f24ffe43 Filipe Manana   2015-06-25  5853  		btrfs_release_path(dst_p=
ath);
90d04510a774a8 Filipe Manana   2021-09-16  5854  		err =3D btrfs_log_holes(=
trans, inode, path);
a89ca6f24ffe43 Filipe Manana   2015-06-25  5855  		if (err)
a89ca6f24ffe43 Filipe Manana   2015-06-25  5856  			goto out_unlock;
a89ca6f24ffe43 Filipe Manana   2015-06-25  5857  	}
a95249b392c3ab Josef Bacik     2012-10-11  5858  log_extents:
f3b15ccdbb9a79 Josef Bacik     2013-07-22  5859  	btrfs_release_path(path);
5dc562c541e102 Josef Bacik     2012-08-17  5860  	btrfs_release_path(dst_pa=
th);
e4545de5b035c7 Filipe Manana   2015-06-17  5861  	if (need_log_inode_item) {
2ac691d8b3b1dd Filipe Manana   2021-07-20  5862  		err =3D log_inode_item(t=
rans, log, dst_path, inode, inode_item_dropped);
b590b839720cf4 Filipe Manana   2021-05-28  5863  		if (err)
b590b839720cf4 Filipe Manana   2021-05-28  5864  			goto out_unlock;
b590b839720cf4 Filipe Manana   2021-05-28  5865  		/*
b590b839720cf4 Filipe Manana   2021-05-28  5866  		 * If we are doing a fas=
t fsync and the inode was logged before
b590b839720cf4 Filipe Manana   2021-05-28  5867  		 * in this transaction, =
we don't need to log the xattrs because
b590b839720cf4 Filipe Manana   2021-05-28  5868  		 * they were logged befo=
re. If xattrs were added, changed or
b590b839720cf4 Filipe Manana   2021-05-28  5869  		 * deleted since the las=
t time we logged the inode, then we have
b590b839720cf4 Filipe Manana   2021-05-28  5870  		 * already logged them b=
ecause the inode had the runtime flag
b590b839720cf4 Filipe Manana   2021-05-28  5871  		 * BTRFS_INODE_COPY_EVER=
YTHING set.
b590b839720cf4 Filipe Manana   2021-05-28  5872  		 */
b590b839720cf4 Filipe Manana   2021-05-28  5873  		if (!xattrs_logged && in=
ode->logged_trans < trans->transid) {
90d04510a774a8 Filipe Manana   2021-09-16  5874  			err =3D btrfs_log_all_x=
attrs(trans, inode, path, dst_path);
e4545de5b035c7 Filipe Manana   2015-06-17  5875  			if (err)
e4545de5b035c7 Filipe Manana   2015-06-17  5876  				goto out_unlock;
b590b839720cf4 Filipe Manana   2021-05-28  5877  			btrfs_release_path(path=
);
b590b839720cf4 Filipe Manana   2021-05-28  5878  		}
e4545de5b035c7 Filipe Manana   2015-06-17  5879  	}
f3b15ccdbb9a79 Josef Bacik     2013-07-22  5880  	if (fast_search) {
90d04510a774a8 Filipe Manana   2021-09-16  5881  		ret =3D btrfs_log_change=
d_extents(trans, inode, dst_path, ctx);
5dc562c541e102 Josef Bacik     2012-08-17  5882  		if (ret) {
5dc562c541e102 Josef Bacik     2012-08-17  5883  			err =3D ret;
5dc562c541e102 Josef Bacik     2012-08-17  5884  			goto out_unlock;
5dc562c541e102 Josef Bacik     2012-08-17  5885  		}
d006a04816a306 Josef Bacik     2013-11-12  5886  	} else if (inode_only =3D=
=3D LOG_INODE_ALL) {
06d3d22b456c2f Liu Bo          2012-08-27  5887  		struct extent_map *em, *=
n;
06d3d22b456c2f Liu Bo          2012-08-27  5888  =

49dae1bc1c6658 Filipe Manana   2014-09-06  5889  		write_lock(&em_tree->loc=
k);
487781796d3022 Filipe Manana   2020-08-11  5890  		list_for_each_entry_safe=
(em, n, &em_tree->modified_extents, list)
06d3d22b456c2f Liu Bo          2012-08-27  5891  			list_del_init(&em->list=
);
49dae1bc1c6658 Filipe Manana   2014-09-06  5892  		write_unlock(&em_tree->l=
ock);
5dc562c541e102 Josef Bacik     2012-08-17  5893  	}
5dc562c541e102 Josef Bacik     2012-08-17  5894  =

a59108a73f347d Nikolay Borisov 2017-01-18  5895  	if (inode_only =3D=3D LOG=
_INODE_ALL && S_ISDIR(inode->vfs_inode.i_mode)) {
90d04510a774a8 Filipe Manana   2021-09-16  5896  		ret =3D log_directory_ch=
anges(trans, inode, path, dst_path, ctx);
4a500fd178c89b Yan, Zheng      2010-05-16  5897  		if (ret) {
4a500fd178c89b Yan, Zheng      2010-05-16  5898  			err =3D ret;
4a500fd178c89b Yan, Zheng      2010-05-16  5899  			goto out_unlock;
4a500fd178c89b Yan, Zheng      2010-05-16  5900  		}
e02119d5a7b439 Chris Mason     2008-09-05  5901  	}
49dae1bc1c6658 Filipe Manana   2014-09-06  5902  =

a59108a73f347d Nikolay Borisov 2017-01-18  5903  	spin_lock(&inode->lock);
a59108a73f347d Nikolay Borisov 2017-01-18  5904  	inode->logged_trans =3D t=
rans->transid;
75b463d2b47aef Filipe Manana   2020-08-11  5905  	/*
9acc8103ab594f Filipe Manana   2021-07-06  5906  	 * Don't update last_log_=
commit if we logged that an inode exists.
130341be7ffaed Filipe Manana   2021-08-31  5907  	 * We do this for three r=
easons:
9acc8103ab594f Filipe Manana   2021-07-06  5908  	 *
9acc8103ab594f Filipe Manana   2021-07-06  5909  	 * 1) We might have had b=
uffered writes to this inode that were
9acc8103ab594f Filipe Manana   2021-07-06  5910  	 *    flushed and had the=
ir ordered extents completed in this
9acc8103ab594f Filipe Manana   2021-07-06  5911  	 *    transaction, but we=
 did not previously log the inode with
9acc8103ab594f Filipe Manana   2021-07-06  5912  	 *    LOG_INODE_ALL. Late=
r the inode was evicted and after that
9acc8103ab594f Filipe Manana   2021-07-06  5913  	 *    it was loaded again=
 and this LOG_INODE_EXISTS log operation
9acc8103ab594f Filipe Manana   2021-07-06  5914  	 *    happened. We must m=
ake sure that if an explicit fsync against
9acc8103ab594f Filipe Manana   2021-07-06  5915  	 *    the inode is perfor=
med later, it logs the new extents, an
9acc8103ab594f Filipe Manana   2021-07-06  5916  	 *    updated inode item,=
 etc, and syncs the log. The same logic
9acc8103ab594f Filipe Manana   2021-07-06  5917  	 *    applies to direct I=
O writes instead of buffered writes.
9acc8103ab594f Filipe Manana   2021-07-06  5918  	 *
9acc8103ab594f Filipe Manana   2021-07-06  5919  	 * 2) When we log the ino=
de with LOG_INODE_EXISTS, its inode item
9acc8103ab594f Filipe Manana   2021-07-06  5920  	 *    is logged with an i=
_size of 0 or whatever value was logged
9acc8103ab594f Filipe Manana   2021-07-06  5921  	 *    before. If later th=
e i_size of the inode is increased by a
9acc8103ab594f Filipe Manana   2021-07-06  5922  	 *    truncate operation,=
 the log is synced through an fsync of
9acc8103ab594f Filipe Manana   2021-07-06  5923  	 *    some other inode an=
d then finally an explicit fsync against
9acc8103ab594f Filipe Manana   2021-07-06  5924  	 *    this inode is made,=
 we must make sure this fsync logs the
9acc8103ab594f Filipe Manana   2021-07-06  5925  	 *    inode with the new =
i_size, the hole between old i_size and
9acc8103ab594f Filipe Manana   2021-07-06  5926  	 *    the new i_size, and=
 syncs the log.
130341be7ffaed Filipe Manana   2021-08-31  5927  	 *
130341be7ffaed Filipe Manana   2021-08-31  5928  	 * 3) If we are logging t=
hat an ancestor inode exists as part of
130341be7ffaed Filipe Manana   2021-08-31  5929  	 *    logging a new name =
from a link or rename operation, don't update
130341be7ffaed Filipe Manana   2021-08-31  5930  	 *    its last_log_commit=
 - otherwise if an explicit fsync is made
130341be7ffaed Filipe Manana   2021-08-31  5931  	 *    against an ancestor=
, the fsync considers the inode in the log
130341be7ffaed Filipe Manana   2021-08-31  5932  	 *    and doesn't sync th=
e log, resulting in the ancestor missing after
130341be7ffaed Filipe Manana   2021-08-31  5933  	 *    a power failure unl=
ess the log was synced as part of an fsync
130341be7ffaed Filipe Manana   2021-08-31  5934  	 *    against any other u=
nrelated inode.
9acc8103ab594f Filipe Manana   2021-07-06  5935  	 */
9acc8103ab594f Filipe Manana   2021-07-06  5936  	if (inode_only !=3D LOG_I=
NODE_EXISTS)
a59108a73f347d Nikolay Borisov 2017-01-18  5937  		inode->last_log_commit =
=3D inode->last_sub_trans;
a59108a73f347d Nikolay Borisov 2017-01-18  5938  	spin_unlock(&inode->lock);
4a500fd178c89b Yan, Zheng      2010-05-16  5939  out_unlock:
a59108a73f347d Nikolay Borisov 2017-01-18  5940  	mutex_unlock(&inode->log_=
mutex);
f6df27dd2707b9 Filipe Manana   2021-08-31  5941  out:
e02119d5a7b439 Chris Mason     2008-09-05  5942  	btrfs_free_path(path);
e02119d5a7b439 Chris Mason     2008-09-05  5943  	btrfs_free_path(dst_path);
e84a57a06098fd Filipe Manana   2022-01-20  5944  =

e84a57a06098fd Filipe Manana   2022-01-20  5945  	if (recursive_logging)
e84a57a06098fd Filipe Manana   2022-01-20  5946  		ctx->logged_before =3D o=
rig_logged_before;
e84a57a06098fd Filipe Manana   2022-01-20  5947  =

4a500fd178c89b Yan, Zheng      2010-05-16 @5948  	return err;
e02119d5a7b439 Chris Mason     2008-09-05  5949  }
e02119d5a7b439 Chris Mason     2008-09-05  5950  =


:::::: The code at line 5948 was first introduced by commit
:::::: 4a500fd178c89b96fa166a2d9e7855df33429841 Btrfs: Metadata ENOSPC hand=
ling for tree log

:::::: TO: Yan, Zheng <zheng.yan@oracle.com>
:::::: CC: Chris Mason <chris.mason@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5187905231057859028==--

