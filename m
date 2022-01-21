Content-Type: multipart/mixed; boundary="===============8549194116036156709=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 6/6] btrfs: use single variable to track return value at btrfs_log_inode()
Date: Fri, 21 Jan 2022 23:06:39 +0800
Message-ID: <202201212314.Rhdh3748-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8549194116036156709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <35bfc17e94d10d179574a47550a4fdcfa4e4fe9a.1642676248.git.fdman=
ana@suse.com>
References: <35bfc17e94d10d179574a47550a4fdcfa4e4fe9a.1642676248.git.fdmana=
na@suse.com>
TO: fdmanana(a)kernel.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20220121]
[cannot apply to v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/fdmanana-kernel-org/btrfs-=
speedup-and-avoid-inode-logging-during-rename-link/20220120-190150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220121/202201212314.Rhdh3748-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/tree-log.c:5940 btrfs_log_inode() warn: inconsistent returns '&ino=
de->log_mutex'.

Old smatch warnings:
fs/btrfs/tree-log.c:3279 btrfs_sync_log() error: we previously assumed 'log=
_root_tree->node' could be null (see line 3168)

vim +5940 fs/btrfs/tree-log.c

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
d5c4823408c725 Filipe Manana   2022-01-20  5681  	int ret;
5dc562c541e102 Josef Bacik     2012-08-17  5682  	bool fast_search =3D fals=
e;
a59108a73f347d Nikolay Borisov 2017-01-18  5683  	u64 ino =3D btrfs_ino(ino=
de);
a59108a73f347d Nikolay Borisov 2017-01-18  5684  	struct extent_map_tree *e=
m_tree =3D &inode->extent_tree;
1a4bcf470c886b Filipe Manana   2015-02-13  5685  	u64 logged_isize =3D 0;
e4545de5b035c7 Filipe Manana   2015-06-17  5686  	bool need_log_inode_item =
=3D true;
9a8fca62aacc15 Filipe Manana   2018-05-11  5687  	bool xattrs_logged =3D fa=
lse;
a3baaf0d786e22 Filipe Manana   2019-02-13  5688  	bool recursive_logging =
=3D false;
2ac691d8b3b1dd Filipe Manana   2021-07-20  5689  	bool inode_item_dropped =
=3D true;
1aad8afed702d4 Filipe Manana   2022-01-20  5690  	const bool orig_logged_be=
fore =3D ctx->logged_before;
e02119d5a7b439 Chris Mason     2008-09-05  5691  =

e02119d5a7b439 Chris Mason     2008-09-05  5692  	path =3D btrfs_alloc_path=
();
5df67083488ccb Tsutomu Itoh    2011-02-01  5693  	if (!path)
5df67083488ccb Tsutomu Itoh    2011-02-01  5694  		return -ENOMEM;
e02119d5a7b439 Chris Mason     2008-09-05  5695  	dst_path =3D btrfs_alloc_=
path();
5df67083488ccb Tsutomu Itoh    2011-02-01  5696  	if (!dst_path) {
5df67083488ccb Tsutomu Itoh    2011-02-01  5697  		btrfs_free_path(path);
5df67083488ccb Tsutomu Itoh    2011-02-01  5698  		return -ENOMEM;
5df67083488ccb Tsutomu Itoh    2011-02-01  5699  	}
e02119d5a7b439 Chris Mason     2008-09-05  5700  =

33345d01522f81 Li Zefan        2011-04-20  5701  	min_key.objectid =3D ino;
e02119d5a7b439 Chris Mason     2008-09-05  5702  	min_key.type =3D BTRFS_IN=
ODE_ITEM_KEY;
e02119d5a7b439 Chris Mason     2008-09-05  5703  	min_key.offset =3D 0;
e02119d5a7b439 Chris Mason     2008-09-05  5704  =

33345d01522f81 Li Zefan        2011-04-20  5705  	max_key.objectid =3D ino;
12fcfd22fe5bf4 Chris Mason     2009-03-24  5706  =

12fcfd22fe5bf4 Chris Mason     2009-03-24  5707  =

5dc562c541e102 Josef Bacik     2012-08-17  5708  	/* today the code can onl=
y do partial logging of directories */
a59108a73f347d Nikolay Borisov 2017-01-18  5709  	if (S_ISDIR(inode->vfs_in=
ode.i_mode) ||
5269b67e3d809d Miao Xie        2012-11-01  5710  	    (!test_bit(BTRFS_INOD=
E_NEEDS_FULL_SYNC,
a59108a73f347d Nikolay Borisov 2017-01-18  5711  		       &inode->runtime_f=
lags) &&
781feef7e6befa Liu Bo          2016-11-30  5712  	     inode_only >=3D LOG_=
INODE_EXISTS))
e02119d5a7b439 Chris Mason     2008-09-05  5713  		max_key.type =3D BTRFS_X=
ATTR_ITEM_KEY;
e02119d5a7b439 Chris Mason     2008-09-05  5714  	else
e02119d5a7b439 Chris Mason     2008-09-05  5715  		max_key.type =3D (u8)-1;
e02119d5a7b439 Chris Mason     2008-09-05  5716  	max_key.offset =3D (u64)-=
1;
e02119d5a7b439 Chris Mason     2008-09-05  5717  =

2c2c452b0cafdc Filipe Manana   2015-01-13  5718  	/*
5aa7d1a7f4a2f8 Filipe Manana   2020-07-02  5719  	 * Only run delayed items=
 if we are a directory. We want to make sure
5aa7d1a7f4a2f8 Filipe Manana   2020-07-02  5720  	 * all directory indexes =
hit the fs/subvolume tree so we can find them
5aa7d1a7f4a2f8 Filipe Manana   2020-07-02  5721  	 * and figure out which i=
ndex ranges have to be logged.
2c2c452b0cafdc Filipe Manana   2015-01-13  5722  	 */
f6df27dd2707b9 Filipe Manana   2021-08-31  5723  	if (S_ISDIR(inode->vfs_in=
ode.i_mode)) {
d5c4823408c725 Filipe Manana   2022-01-20  5724  		ret =3D btrfs_commit_ino=
de_delayed_items(trans, inode);
d5c4823408c725 Filipe Manana   2022-01-20  5725  		if (ret)
f6df27dd2707b9 Filipe Manana   2021-08-31  5726  			goto out;
16cdcec736cd21 Miao Xie        2011-04-22  5727  	}
16cdcec736cd21 Miao Xie        2011-04-22  5728  =

a3baaf0d786e22 Filipe Manana   2019-02-13  5729  	if (inode_only =3D=3D LOG=
_OTHER_INODE || inode_only =3D=3D LOG_OTHER_INODE_ALL) {
a3baaf0d786e22 Filipe Manana   2019-02-13  5730  		recursive_logging =3D tr=
ue;
a3baaf0d786e22 Filipe Manana   2019-02-13  5731  		if (inode_only =3D=3D LO=
G_OTHER_INODE)
781feef7e6befa Liu Bo          2016-11-30  5732  			inode_only =3D LOG_INOD=
E_EXISTS;
a3baaf0d786e22 Filipe Manana   2019-02-13  5733  		else
a3baaf0d786e22 Filipe Manana   2019-02-13  5734  			inode_only =3D LOG_INOD=
E_ALL;
a59108a73f347d Nikolay Borisov 2017-01-18  5735  		mutex_lock_nested(&inode=
->log_mutex, SINGLE_DEPTH_NESTING);
781feef7e6befa Liu Bo          2016-11-30  5736  	} else {
a59108a73f347d Nikolay Borisov 2017-01-18  5737  		mutex_lock(&inode->log_m=
utex);
781feef7e6befa Liu Bo          2016-11-30  5738  	}
e02119d5a7b439 Chris Mason     2008-09-05  5739  =

1aad8afed702d4 Filipe Manana   2022-01-20  5740  	/*
1aad8afed702d4 Filipe Manana   2022-01-20  5741  	 * Before logging the ino=
de item, cache the value returned by
1aad8afed702d4 Filipe Manana   2022-01-20  5742  	 * inode_logged(), becaus=
e after that we have the need to figure out if
1aad8afed702d4 Filipe Manana   2022-01-20  5743  	 * the inode was previous=
ly logged in this transaction.
1aad8afed702d4 Filipe Manana   2022-01-20  5744  	 */
1aad8afed702d4 Filipe Manana   2022-01-20  5745  	ret =3D inode_logged(tran=
s, inode, path);
d5c4823408c725 Filipe Manana   2022-01-20  5746  	if (ret < 0)
1aad8afed702d4 Filipe Manana   2022-01-20  5747  		goto out;
1aad8afed702d4 Filipe Manana   2022-01-20  5748  	ctx->logged_before =3D (r=
et =3D=3D 1);
d5c4823408c725 Filipe Manana   2022-01-20  5749  	ret =3D 0;
1aad8afed702d4 Filipe Manana   2022-01-20  5750  =

64d6b281ba4db0 Filipe Manana   2021-01-27  5751  	/*
64d6b281ba4db0 Filipe Manana   2021-01-27  5752  	 * This is for cases wher=
e logging a directory could result in losing a
64d6b281ba4db0 Filipe Manana   2021-01-27  5753  	 * a file after replaying=
 the log. For example, if we move a file from a
64d6b281ba4db0 Filipe Manana   2021-01-27  5754  	 * directory A to a direc=
tory B, then fsync directory A, we have no way
64d6b281ba4db0 Filipe Manana   2021-01-27  5755  	 * to known the file was =
moved from A to B, so logging just A would
64d6b281ba4db0 Filipe Manana   2021-01-27  5756  	 * result in losing the f=
ile after a log replay.
64d6b281ba4db0 Filipe Manana   2021-01-27  5757  	 */
64d6b281ba4db0 Filipe Manana   2021-01-27  5758  	if (S_ISDIR(inode->vfs_in=
ode.i_mode) &&
64d6b281ba4db0 Filipe Manana   2021-01-27  5759  	    inode_only =3D=3D LOG=
_INODE_ALL &&
64d6b281ba4db0 Filipe Manana   2021-01-27  5760  	    inode->last_unlink_tr=
ans >=3D trans->transid) {
64d6b281ba4db0 Filipe Manana   2021-01-27  5761  		btrfs_set_log_full_commi=
t(trans);
d5c4823408c725 Filipe Manana   2022-01-20  5762  		ret =3D 1;
64d6b281ba4db0 Filipe Manana   2021-01-27  5763  		goto out_unlock;
64d6b281ba4db0 Filipe Manana   2021-01-27  5764  	}
64d6b281ba4db0 Filipe Manana   2021-01-27  5765  =

e02119d5a7b439 Chris Mason     2008-09-05  5766  	/*
e02119d5a7b439 Chris Mason     2008-09-05  5767  	 * a brute force approach=
 to making sure we get the most uptodate
e02119d5a7b439 Chris Mason     2008-09-05  5768  	 * copies of everything.
e02119d5a7b439 Chris Mason     2008-09-05  5769  	 */
a59108a73f347d Nikolay Borisov 2017-01-18  5770  	if (S_ISDIR(inode->vfs_in=
ode.i_mode)) {
e02119d5a7b439 Chris Mason     2008-09-05  5771  		int max_key_type =3D BTR=
FS_DIR_LOG_INDEX_KEY;
e02119d5a7b439 Chris Mason     2008-09-05  5772  =

ab12313a9f56b9 Filipe Manana   2021-01-27  5773  		clear_bit(BTRFS_INODE_CO=
PY_EVERYTHING, &inode->runtime_flags);
4f764e5153616f Filipe Manana   2015-02-23  5774  		if (inode_only =3D=3D LO=
G_INODE_EXISTS)
4f764e5153616f Filipe Manana   2015-02-23  5775  			max_key_type =3D BTRFS_=
XATTR_ITEM_KEY;
1aad8afed702d4 Filipe Manana   2022-01-20  5776  		if (ctx->logged_before)
1aad8afed702d4 Filipe Manana   2022-01-20  5777  			ret =3D drop_inode_item=
s(trans, log, path, inode,
1aad8afed702d4 Filipe Manana   2022-01-20  5778  					       max_key_type);
e02119d5a7b439 Chris Mason     2008-09-05  5779  	} else {
1aad8afed702d4 Filipe Manana   2022-01-20  5780  		if (inode_only =3D=3D LO=
G_INODE_EXISTS && ctx->logged_before) {
1a4bcf470c886b Filipe Manana   2015-02-13  5781  			/*
1a4bcf470c886b Filipe Manana   2015-02-13  5782  			 * Make sure the new in=
ode item we write to the log has
1a4bcf470c886b Filipe Manana   2015-02-13  5783  			 * the same isize as th=
e current one (if it exists).
1a4bcf470c886b Filipe Manana   2015-02-13  5784  			 * This is necessary to=
 prevent data loss after log
1a4bcf470c886b Filipe Manana   2015-02-13  5785  			 * replay, and also to =
prevent doing a wrong expanding
1a4bcf470c886b Filipe Manana   2015-02-13  5786  			 * truncate - for e.g. =
create file, write 4K into offset
1a4bcf470c886b Filipe Manana   2015-02-13  5787  			 * 0, fsync, write 4K i=
nto offset 4096, add hard link,
1a4bcf470c886b Filipe Manana   2015-02-13  5788  			 * fsync some other fil=
e (to sync log), power fail - if
1a4bcf470c886b Filipe Manana   2015-02-13  5789  			 * we use the inode's c=
urrent i_size, after log replay
1a4bcf470c886b Filipe Manana   2015-02-13  5790  			 * we get a 8Kb file, w=
ith the last 4Kb extent as a hole
1a4bcf470c886b Filipe Manana   2015-02-13  5791  			 * (zeroes), as if an e=
xpanding truncate happened,
1a4bcf470c886b Filipe Manana   2015-02-13  5792  			 * instead of getting a=
 file of 4Kb only.
1a4bcf470c886b Filipe Manana   2015-02-13  5793  			 */
d5c4823408c725 Filipe Manana   2022-01-20  5794  			ret =3D logged_inode_si=
ze(log, inode, path, &logged_isize);
d5c4823408c725 Filipe Manana   2022-01-20  5795  			if (ret)
1a4bcf470c886b Filipe Manana   2015-02-13  5796  				goto out_unlock;
1a4bcf470c886b Filipe Manana   2015-02-13  5797  		}
a742994aa2e271 Filipe Manana   2015-02-13  5798  		if (test_bit(BTRFS_INODE=
_NEEDS_FULL_SYNC,
a59108a73f347d Nikolay Borisov 2017-01-18  5799  			     &inode->runtime_fl=
ags)) {
a742994aa2e271 Filipe Manana   2015-02-13  5800  			if (inode_only =3D=3D L=
OG_INODE_EXISTS) {
4f764e5153616f Filipe Manana   2015-02-23  5801  				max_key.type =3D BTRFS=
_XATTR_ITEM_KEY;
1aad8afed702d4 Filipe Manana   2022-01-20  5802  				if (ctx->logged_before)
1aad8afed702d4 Filipe Manana   2022-01-20  5803  					ret =3D drop_inode_it=
ems(trans, log, path,
1aad8afed702d4 Filipe Manana   2022-01-20  5804  							       inode, max_k=
ey.type);
a742994aa2e271 Filipe Manana   2015-02-13  5805  			} else {
a742994aa2e271 Filipe Manana   2015-02-13  5806  				clear_bit(BTRFS_INODE_=
NEEDS_FULL_SYNC,
a59108a73f347d Nikolay Borisov 2017-01-18  5807  					  &inode->runtime_fla=
gs);
e99761514999f6 Josef Bacik     2012-10-11  5808  				clear_bit(BTRFS_INODE_=
COPY_EVERYTHING,
a59108a73f347d Nikolay Borisov 2017-01-18  5809  					  &inode->runtime_fla=
gs);
1aad8afed702d4 Filipe Manana   2022-01-20  5810  				if (ctx->logged_before)
4934a8150214c3 Filipe Manana   2021-08-31  5811  					ret =3D truncate_inod=
e_items(trans, log,
4934a8150214c3 Filipe Manana   2021-08-31  5812  								   inode, 0, 0);
a742994aa2e271 Filipe Manana   2015-02-13  5813  			}
4f764e5153616f Filipe Manana   2015-02-23  5814  		} else if (test_and_clea=
r_bit(BTRFS_INODE_COPY_EVERYTHING,
a59108a73f347d Nikolay Borisov 2017-01-18  5815  					      &inode->runtime=
_flags) ||
6cfab851f42edc Josef Bacik     2013-11-12  5816  			   inode_only =3D=3D LO=
G_INODE_EXISTS) {
4f764e5153616f Filipe Manana   2015-02-23  5817  			if (inode_only =3D=3D L=
OG_INODE_ALL)
5dc562c541e102 Josef Bacik     2012-08-17  5818  				fast_search =3D true;
5dc562c541e102 Josef Bacik     2012-08-17  5819  			max_key.type =3D BTRFS_=
XATTR_ITEM_KEY;
1aad8afed702d4 Filipe Manana   2022-01-20  5820  			if (ctx->logged_before)
88e221cdacc528 Filipe Manana   2021-08-31  5821  				ret =3D drop_inode_ite=
ms(trans, log, path, inode,
e99761514999f6 Josef Bacik     2012-10-11  5822  						       max_key.type);
a95249b392c3ab Josef Bacik     2012-10-11  5823  		} else {
a95249b392c3ab Josef Bacik     2012-10-11  5824  			if (inode_only =3D=3D L=
OG_INODE_ALL)
a95249b392c3ab Josef Bacik     2012-10-11  5825  				fast_search =3D true;
2ac691d8b3b1dd Filipe Manana   2021-07-20  5826  			inode_item_dropped =3D =
false;
a95249b392c3ab Josef Bacik     2012-10-11  5827  			goto log_extents;
a95249b392c3ab Josef Bacik     2012-10-11  5828  		}
a95249b392c3ab Josef Bacik     2012-10-11  5829  =

e02119d5a7b439 Chris Mason     2008-09-05  5830  	}
d5c4823408c725 Filipe Manana   2022-01-20  5831  	if (ret)
4a500fd178c89b Yan, Zheng      2010-05-16  5832  		goto out_unlock;
e02119d5a7b439 Chris Mason     2008-09-05  5833  =

d5c4823408c725 Filipe Manana   2022-01-20  5834  	ret =3D copy_inode_items_=
to_log(trans, inode, &min_key, &max_key,
da447009a25609 Filipe Manana   2020-03-09  5835  				      path, dst_path, =
logged_isize,
7af597433d435b Filipe Manana   2020-04-07  5836  				      recursive_loggin=
g, inode_only, ctx,
7af597433d435b Filipe Manana   2020-04-07  5837  				      &need_log_inode_=
item);
d5c4823408c725 Filipe Manana   2022-01-20  5838  	if (ret)
44f714dae50a2e Filipe Manana   2016-06-06  5839  		goto out_unlock;
5dc562c541e102 Josef Bacik     2012-08-17  5840  =

36283bf777d963 Filipe Manana   2015-06-20  5841  	btrfs_release_path(path);
36283bf777d963 Filipe Manana   2015-06-20  5842  	btrfs_release_path(dst_pa=
th);
d5c4823408c725 Filipe Manana   2022-01-20  5843  	ret =3D btrfs_log_all_xat=
trs(trans, inode, path, dst_path);
d5c4823408c725 Filipe Manana   2022-01-20  5844  	if (ret)
36283bf777d963 Filipe Manana   2015-06-20  5845  		goto out_unlock;
9a8fca62aacc15 Filipe Manana   2018-05-11  5846  	xattrs_logged =3D true;
a89ca6f24ffe43 Filipe Manana   2015-06-25  5847  	if (max_key.type >=3D BTR=
FS_EXTENT_DATA_KEY && !fast_search) {
a89ca6f24ffe43 Filipe Manana   2015-06-25  5848  		btrfs_release_path(path);
a89ca6f24ffe43 Filipe Manana   2015-06-25  5849  		btrfs_release_path(dst_p=
ath);
d5c4823408c725 Filipe Manana   2022-01-20  5850  		ret =3D btrfs_log_holes(=
trans, inode, path);
d5c4823408c725 Filipe Manana   2022-01-20  5851  		if (ret)
a89ca6f24ffe43 Filipe Manana   2015-06-25  5852  			goto out_unlock;
a89ca6f24ffe43 Filipe Manana   2015-06-25  5853  	}
a95249b392c3ab Josef Bacik     2012-10-11  5854  log_extents:
f3b15ccdbb9a79 Josef Bacik     2013-07-22  5855  	btrfs_release_path(path);
5dc562c541e102 Josef Bacik     2012-08-17  5856  	btrfs_release_path(dst_pa=
th);
e4545de5b035c7 Filipe Manana   2015-06-17  5857  	if (need_log_inode_item) {
d5c4823408c725 Filipe Manana   2022-01-20  5858  		ret =3D log_inode_item(t=
rans, log, dst_path, inode, inode_item_dropped);
d5c4823408c725 Filipe Manana   2022-01-20  5859  		if (ret)
b590b839720cf4 Filipe Manana   2021-05-28  5860  			goto out_unlock;
b590b839720cf4 Filipe Manana   2021-05-28  5861  		/*
b590b839720cf4 Filipe Manana   2021-05-28  5862  		 * If we are doing a fas=
t fsync and the inode was logged before
b590b839720cf4 Filipe Manana   2021-05-28  5863  		 * in this transaction, =
we don't need to log the xattrs because
b590b839720cf4 Filipe Manana   2021-05-28  5864  		 * they were logged befo=
re. If xattrs were added, changed or
b590b839720cf4 Filipe Manana   2021-05-28  5865  		 * deleted since the las=
t time we logged the inode, then we have
b590b839720cf4 Filipe Manana   2021-05-28  5866  		 * already logged them b=
ecause the inode had the runtime flag
b590b839720cf4 Filipe Manana   2021-05-28  5867  		 * BTRFS_INODE_COPY_EVER=
YTHING set.
b590b839720cf4 Filipe Manana   2021-05-28  5868  		 */
b590b839720cf4 Filipe Manana   2021-05-28  5869  		if (!xattrs_logged && in=
ode->logged_trans < trans->transid) {
d5c4823408c725 Filipe Manana   2022-01-20  5870  			ret =3D btrfs_log_all_x=
attrs(trans, inode, path, dst_path);
d5c4823408c725 Filipe Manana   2022-01-20  5871  			if (ret)
e4545de5b035c7 Filipe Manana   2015-06-17  5872  				goto out_unlock;
b590b839720cf4 Filipe Manana   2021-05-28  5873  			btrfs_release_path(path=
);
b590b839720cf4 Filipe Manana   2021-05-28  5874  		}
e4545de5b035c7 Filipe Manana   2015-06-17  5875  	}
f3b15ccdbb9a79 Josef Bacik     2013-07-22  5876  	if (fast_search) {
90d04510a774a8 Filipe Manana   2021-09-16  5877  		ret =3D btrfs_log_change=
d_extents(trans, inode, dst_path, ctx);
d5c4823408c725 Filipe Manana   2022-01-20  5878  		if (ret)
5dc562c541e102 Josef Bacik     2012-08-17  5879  			goto out_unlock;
d006a04816a306 Josef Bacik     2013-11-12  5880  	} else if (inode_only =3D=
=3D LOG_INODE_ALL) {
06d3d22b456c2f Liu Bo          2012-08-27  5881  		struct extent_map *em, *=
n;
06d3d22b456c2f Liu Bo          2012-08-27  5882  =

49dae1bc1c6658 Filipe Manana   2014-09-06  5883  		write_lock(&em_tree->loc=
k);
487781796d3022 Filipe Manana   2020-08-11  5884  		list_for_each_entry_safe=
(em, n, &em_tree->modified_extents, list)
06d3d22b456c2f Liu Bo          2012-08-27  5885  			list_del_init(&em->list=
);
49dae1bc1c6658 Filipe Manana   2014-09-06  5886  		write_unlock(&em_tree->l=
ock);
5dc562c541e102 Josef Bacik     2012-08-17  5887  	}
5dc562c541e102 Josef Bacik     2012-08-17  5888  =

a59108a73f347d Nikolay Borisov 2017-01-18  5889  	if (inode_only =3D=3D LOG=
_INODE_ALL && S_ISDIR(inode->vfs_inode.i_mode)) {
90d04510a774a8 Filipe Manana   2021-09-16  5890  		ret =3D log_directory_ch=
anges(trans, inode, path, dst_path, ctx);
d5c4823408c725 Filipe Manana   2022-01-20  5891  		if (ret)
4a500fd178c89b Yan, Zheng      2010-05-16  5892  			goto out_unlock;
4a500fd178c89b Yan, Zheng      2010-05-16  5893  	}
49dae1bc1c6658 Filipe Manana   2014-09-06  5894  =

a59108a73f347d Nikolay Borisov 2017-01-18  5895  	spin_lock(&inode->lock);
a59108a73f347d Nikolay Borisov 2017-01-18  5896  	inode->logged_trans =3D t=
rans->transid;
75b463d2b47aef Filipe Manana   2020-08-11  5897  	/*
9acc8103ab594f Filipe Manana   2021-07-06  5898  	 * Don't update last_log_=
commit if we logged that an inode exists.
130341be7ffaed Filipe Manana   2021-08-31  5899  	 * We do this for three r=
easons:
9acc8103ab594f Filipe Manana   2021-07-06  5900  	 *
9acc8103ab594f Filipe Manana   2021-07-06  5901  	 * 1) We might have had b=
uffered writes to this inode that were
9acc8103ab594f Filipe Manana   2021-07-06  5902  	 *    flushed and had the=
ir ordered extents completed in this
9acc8103ab594f Filipe Manana   2021-07-06  5903  	 *    transaction, but we=
 did not previously log the inode with
9acc8103ab594f Filipe Manana   2021-07-06  5904  	 *    LOG_INODE_ALL. Late=
r the inode was evicted and after that
9acc8103ab594f Filipe Manana   2021-07-06  5905  	 *    it was loaded again=
 and this LOG_INODE_EXISTS log operation
9acc8103ab594f Filipe Manana   2021-07-06  5906  	 *    happened. We must m=
ake sure that if an explicit fsync against
9acc8103ab594f Filipe Manana   2021-07-06  5907  	 *    the inode is perfor=
med later, it logs the new extents, an
9acc8103ab594f Filipe Manana   2021-07-06  5908  	 *    updated inode item,=
 etc, and syncs the log. The same logic
9acc8103ab594f Filipe Manana   2021-07-06  5909  	 *    applies to direct I=
O writes instead of buffered writes.
9acc8103ab594f Filipe Manana   2021-07-06  5910  	 *
9acc8103ab594f Filipe Manana   2021-07-06  5911  	 * 2) When we log the ino=
de with LOG_INODE_EXISTS, its inode item
9acc8103ab594f Filipe Manana   2021-07-06  5912  	 *    is logged with an i=
_size of 0 or whatever value was logged
9acc8103ab594f Filipe Manana   2021-07-06  5913  	 *    before. If later th=
e i_size of the inode is increased by a
9acc8103ab594f Filipe Manana   2021-07-06  5914  	 *    truncate operation,=
 the log is synced through an fsync of
9acc8103ab594f Filipe Manana   2021-07-06  5915  	 *    some other inode an=
d then finally an explicit fsync against
9acc8103ab594f Filipe Manana   2021-07-06  5916  	 *    this inode is made,=
 we must make sure this fsync logs the
9acc8103ab594f Filipe Manana   2021-07-06  5917  	 *    inode with the new =
i_size, the hole between old i_size and
9acc8103ab594f Filipe Manana   2021-07-06  5918  	 *    the new i_size, and=
 syncs the log.
130341be7ffaed Filipe Manana   2021-08-31  5919  	 *
130341be7ffaed Filipe Manana   2021-08-31  5920  	 * 3) If we are logging t=
hat an ancestor inode exists as part of
130341be7ffaed Filipe Manana   2021-08-31  5921  	 *    logging a new name =
from a link or rename operation, don't update
130341be7ffaed Filipe Manana   2021-08-31  5922  	 *    its last_log_commit=
 - otherwise if an explicit fsync is made
130341be7ffaed Filipe Manana   2021-08-31  5923  	 *    against an ancestor=
, the fsync considers the inode in the log
130341be7ffaed Filipe Manana   2021-08-31  5924  	 *    and doesn't sync th=
e log, resulting in the ancestor missing after
130341be7ffaed Filipe Manana   2021-08-31  5925  	 *    a power failure unl=
ess the log was synced as part of an fsync
130341be7ffaed Filipe Manana   2021-08-31  5926  	 *    against any other u=
nrelated inode.
9acc8103ab594f Filipe Manana   2021-07-06  5927  	 */
9acc8103ab594f Filipe Manana   2021-07-06  5928  	if (inode_only !=3D LOG_I=
NODE_EXISTS)
a59108a73f347d Nikolay Borisov 2017-01-18  5929  		inode->last_log_commit =
=3D inode->last_sub_trans;
a59108a73f347d Nikolay Borisov 2017-01-18  5930  	spin_unlock(&inode->lock);
4a500fd178c89b Yan, Zheng      2010-05-16  5931  out_unlock:
a59108a73f347d Nikolay Borisov 2017-01-18  5932  	mutex_unlock(&inode->log_=
mutex);
f6df27dd2707b9 Filipe Manana   2021-08-31  5933  out:
e02119d5a7b439 Chris Mason     2008-09-05  5934  	btrfs_free_path(path);
e02119d5a7b439 Chris Mason     2008-09-05  5935  	btrfs_free_path(dst_path);
1aad8afed702d4 Filipe Manana   2022-01-20  5936  =

1aad8afed702d4 Filipe Manana   2022-01-20  5937  	if (recursive_logging)
1aad8afed702d4 Filipe Manana   2022-01-20  5938  		ctx->logged_before =3D o=
rig_logged_before;
1aad8afed702d4 Filipe Manana   2022-01-20  5939  =

d5c4823408c725 Filipe Manana   2022-01-20 @5940  	return ret;
e02119d5a7b439 Chris Mason     2008-09-05  5941  }
e02119d5a7b439 Chris Mason     2008-09-05  5942  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8549194116036156709==--

