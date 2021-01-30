Content-Type: multipart/mixed; boundary="===============1687818509263907923=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:for-next-20210129 14817/14851] fs/btrfs/tree-log.c:3318:1-7: preceding lock on line 3156
Date: Sat, 30 Jan 2021 16:55:27 +0800
Message-ID: <202101301616.2MuLttO5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1687818509263907923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Naohiro Aota <naohiro.aota@wdc.com>
CC: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://github.com/kdave/btrfs-devel.git for-next-20210129
head:   6e043613b2c4377ce095ea826160d42031156d35
commit: 122cfba0d2eb42d0a31161cf2139be0ead18afb7 [14817/14851] btrfs: reord=
er log node allocation
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: powerpc64-randconfig-c003-20210129 (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


"coccinelle warnings: (new ones prefixed by >>)"
>> fs/btrfs/tree-log.c:3318:1-7: preceding lock on line 3156

vim +3318 fs/btrfs/tree-log.c

8b050d350c7846 Miao Xie       2014-02-20  3039  =

e02119d5a7b439 Chris Mason    2008-09-05  3040  /*
e02119d5a7b439 Chris Mason    2008-09-05  3041   * btrfs_sync_log does send=
s a given tree log down to the disk and
e02119d5a7b439 Chris Mason    2008-09-05  3042   * updates the super blocks=
 to record it.  When this call is done,
12fcfd22fe5bf4 Chris Mason    2009-03-24  3043   * you know that any inodes=
 previously logged are safely on disk only
12fcfd22fe5bf4 Chris Mason    2009-03-24  3044   * if it returns 0.
12fcfd22fe5bf4 Chris Mason    2009-03-24  3045   *
12fcfd22fe5bf4 Chris Mason    2009-03-24  3046   * Any other return value m=
eans you need to call btrfs_commit_transaction.
12fcfd22fe5bf4 Chris Mason    2009-03-24  3047   * Some of the edge cases f=
or fsyncing directories that have had unlinks
12fcfd22fe5bf4 Chris Mason    2009-03-24  3048   * or renames done in the p=
ast mean that sometimes the only safe
12fcfd22fe5bf4 Chris Mason    2009-03-24  3049   * fsync is to commit the w=
hole FS.  When btrfs_sync_log returns -EAGAIN,
12fcfd22fe5bf4 Chris Mason    2009-03-24  3050   * that has happened.
e02119d5a7b439 Chris Mason    2008-09-05  3051   */
e02119d5a7b439 Chris Mason    2008-09-05  3052  int btrfs_sync_log(struct b=
trfs_trans_handle *trans,
8b050d350c7846 Miao Xie       2014-02-20  3053  		   struct btrfs_root *roo=
t, struct btrfs_log_ctx *ctx)
e02119d5a7b439 Chris Mason    2008-09-05  3054  {
7237f1833601dc Yan Zheng      2009-01-21  3055  	int index1;
7237f1833601dc Yan Zheng      2009-01-21  3056  	int index2;
8cef4e160d7492 Yan, Zheng     2009-11-12  3057  	int mark;
e02119d5a7b439 Chris Mason    2008-09-05  3058  	int ret;
0b246afa62b0cf Jeff Mahoney   2016-06-22  3059  	struct btrfs_fs_info *fs_i=
nfo =3D root->fs_info;
e02119d5a7b439 Chris Mason    2008-09-05  3060  	struct btrfs_root *log =3D=
 root->log_root;
0b246afa62b0cf Jeff Mahoney   2016-06-22  3061  	struct btrfs_root *log_roo=
t_tree =3D fs_info->log_root_tree;
4203e968947071 Josef Bacik    2019-09-30  3062  	struct btrfs_root_item new=
_root_item;
bb14a59b619d3a Miao Xie       2014-02-20  3063  	int log_transid =3D 0;
8b050d350c7846 Miao Xie       2014-02-20  3064  	struct btrfs_log_ctx root_=
log_ctx;
c6adc9cc082e3c Miao Xie       2013-05-28  3065  	struct blk_plug plug;
47876f7ceffa0e Filipe Manana  2020-11-25  3066  	u64 log_root_start;
47876f7ceffa0e Filipe Manana  2020-11-25  3067  	u64 log_root_level;
e02119d5a7b439 Chris Mason    2008-09-05  3068  =

7237f1833601dc Yan Zheng      2009-01-21  3069  	mutex_lock(&root->log_mute=
x);
d1433debe7f434 Miao Xie       2014-02-20  3070  	log_transid =3D ctx->log_t=
ransid;
d1433debe7f434 Miao Xie       2014-02-20  3071  	if (root->log_transid_comm=
itted >=3D log_transid) {
d1433debe7f434 Miao Xie       2014-02-20  3072  		mutex_unlock(&root->log_m=
utex);
d1433debe7f434 Miao Xie       2014-02-20  3073  		return ctx->log_ret;
d1433debe7f434 Miao Xie       2014-02-20  3074  	}
d1433debe7f434 Miao Xie       2014-02-20  3075  =

d1433debe7f434 Miao Xie       2014-02-20  3076  	index1 =3D log_transid % 2;
7237f1833601dc Yan Zheng      2009-01-21  3077  	if (atomic_read(&root->log=
_commit[index1])) {
60d53eb3107c8e Zhaolei        2015-08-17  3078  		wait_log_commit(root, log=
_transid);
7237f1833601dc Yan Zheng      2009-01-21  3079  		mutex_unlock(&root->log_m=
utex);
8b050d350c7846 Miao Xie       2014-02-20  3080  		return ctx->log_ret;
e02119d5a7b439 Chris Mason    2008-09-05  3081  	}
d1433debe7f434 Miao Xie       2014-02-20  3082  	ASSERT(log_transid =3D=3D =
root->log_transid);
7237f1833601dc Yan Zheng      2009-01-21  3083  	atomic_set(&root->log_comm=
it[index1], 1);
7237f1833601dc Yan Zheng      2009-01-21  3084  =

7237f1833601dc Yan Zheng      2009-01-21  3085  	/* wait for previous tree =
log sync to complete */
7237f1833601dc Yan Zheng      2009-01-21  3086  	if (atomic_read(&root->log=
_commit[(index1 + 1) % 2]))
60d53eb3107c8e Zhaolei        2015-08-17  3087  		wait_log_commit(root, log=
_transid - 1);
48cab2e0714913 Miao Xie       2014-02-20  3088  =

86df7eb921a009 Yan, Zheng     2009-10-14  3089  	while (1) {
2ecb79239bcd04 Miao Xie       2012-09-06  3090  		int batch =3D atomic_read=
(&root->log_batch);
cd354ad613a393 Chris Mason    2011-10-20  3091  		/* when we're on an ssd, =
just kick the log commit out */
0b246afa62b0cf Jeff Mahoney   2016-06-22  3092  		if (!btrfs_test_opt(fs_in=
fo, SSD) &&
27cdeb7096b86f Miao Xie       2014-04-02  3093  		    test_bit(BTRFS_ROOT_M=
ULTI_LOG_TASKS, &root->state)) {
7237f1833601dc Yan Zheng      2009-01-21  3094  			mutex_unlock(&root->log_=
mutex);
e02119d5a7b439 Chris Mason    2008-09-05  3095  			schedule_timeout_uninter=
ruptible(1);
7237f1833601dc Yan Zheng      2009-01-21  3096  			mutex_lock(&root->log_mu=
tex);
86df7eb921a009 Yan, Zheng     2009-10-14  3097  		}
60d53eb3107c8e Zhaolei        2015-08-17  3098  		wait_for_writer(root);
2ecb79239bcd04 Miao Xie       2012-09-06  3099  		if (batch =3D=3D atomic_r=
ead(&root->log_batch))
e02119d5a7b439 Chris Mason    2008-09-05  3100  			break;
e02119d5a7b439 Chris Mason    2008-09-05  3101  	}
e02119d5a7b439 Chris Mason    2008-09-05  3102  =

12fcfd22fe5bf4 Chris Mason    2009-03-24  3103  	/* bail out if we need to =
do a full commit */
4884b8e8ebf54e David Sterba   2019-03-20  3104  	if (btrfs_need_log_full_co=
mmit(trans)) {
12fcfd22fe5bf4 Chris Mason    2009-03-24  3105  		ret =3D -EAGAIN;
12fcfd22fe5bf4 Chris Mason    2009-03-24  3106  		mutex_unlock(&root->log_m=
utex);
12fcfd22fe5bf4 Chris Mason    2009-03-24  3107  		goto out;
12fcfd22fe5bf4 Chris Mason    2009-03-24  3108  	}
12fcfd22fe5bf4 Chris Mason    2009-03-24  3109  =

8cef4e160d7492 Yan, Zheng     2009-11-12  3110  	if (log_transid % 2 =3D=3D=
 0)
8cef4e160d7492 Yan, Zheng     2009-11-12  3111  		mark =3D EXTENT_DIRTY;
8cef4e160d7492 Yan, Zheng     2009-11-12  3112  	else
8cef4e160d7492 Yan, Zheng     2009-11-12  3113  		mark =3D EXTENT_NEW;
8cef4e160d7492 Yan, Zheng     2009-11-12  3114  =

690587d109ffe1 Chris Mason    2009-10-13  3115  	/* we start IO on  all the=
 marked extents here, but we don't actually
690587d109ffe1 Chris Mason    2009-10-13  3116  	 * wait for them until lat=
er.
690587d109ffe1 Chris Mason    2009-10-13  3117  	 */
c6adc9cc082e3c Miao Xie       2013-05-28  3118  	blk_start_plug(&plug);
2ff7e61e0d30ff Jeff Mahoney   2016-06-22  3119  	ret =3D btrfs_write_marked=
_extents(fs_info, &log->dirty_log_pages, mark);
79787eaab46121 Jeff Mahoney   2012-03-12  3120  	if (ret) {
c6adc9cc082e3c Miao Xie       2013-05-28  3121  		blk_finish_plug(&plug);
66642832f06a43 Jeff Mahoney   2016-06-10  3122  		btrfs_abort_transaction(t=
rans, ret);
907877664e2d85 David Sterba   2019-03-20  3123  		btrfs_set_log_full_commit=
(trans);
79787eaab46121 Jeff Mahoney   2012-03-12  3124  		mutex_unlock(&root->log_m=
utex);
79787eaab46121 Jeff Mahoney   2012-03-12  3125  		goto out;
79787eaab46121 Jeff Mahoney   2012-03-12  3126  	}
7237f1833601dc Yan Zheng      2009-01-21  3127  =

4203e968947071 Josef Bacik    2019-09-30  3128  	/*
4203e968947071 Josef Bacik    2019-09-30  3129  	 * We _must_ update under =
the root->log_mutex in order to make sure we
4203e968947071 Josef Bacik    2019-09-30  3130  	 * have a consistent view =
of the log root we are trying to commit at
4203e968947071 Josef Bacik    2019-09-30  3131  	 * this moment.
4203e968947071 Josef Bacik    2019-09-30  3132  	 *
4203e968947071 Josef Bacik    2019-09-30  3133  	 * We _must_ copy this int=
o a local copy, because we are not holding the
4203e968947071 Josef Bacik    2019-09-30  3134  	 * log_root_tree->log_mute=
x yet.  This is important because when we
4203e968947071 Josef Bacik    2019-09-30  3135  	 * commit the log_root_tre=
e we must have a consistent view of the
4203e968947071 Josef Bacik    2019-09-30  3136  	 * log_root_tree when we u=
pdate the super block to point at the
4203e968947071 Josef Bacik    2019-09-30  3137  	 * log_root_tree bytenr.  =
If we update the log_root_tree here we'll race
4203e968947071 Josef Bacik    2019-09-30  3138  	 * with the commit and pos=
sibly point at the new block which we may not
4203e968947071 Josef Bacik    2019-09-30  3139  	 * have written out.
4203e968947071 Josef Bacik    2019-09-30  3140  	 */
5d4f98a28c7d33 Yan Zheng      2009-06-10  3141  	btrfs_set_root_node(&log->=
root_item, log->node);
4203e968947071 Josef Bacik    2019-09-30  3142  	memcpy(&new_root_item, &lo=
g->root_item, sizeof(new_root_item));
7237f1833601dc Yan Zheng      2009-01-21  3143  =

7237f1833601dc Yan Zheng      2009-01-21  3144  	root->log_transid++;
7237f1833601dc Yan Zheng      2009-01-21  3145  	log->log_transid =3D root-=
>log_transid;
ff782e0a131c7f Josef Bacik    2009-10-08  3146  	root->log_start_pid =3D 0;
7237f1833601dc Yan Zheng      2009-01-21  3147  	/*
8cef4e160d7492 Yan, Zheng     2009-11-12  3148  	 * IO has been started, bl=
ocks of the log tree have WRITTEN flag set
8cef4e160d7492 Yan, Zheng     2009-11-12  3149  	 * in their headers. new m=
odifications of the log will be written to
8cef4e160d7492 Yan, Zheng     2009-11-12  3150  	 * new positions. so it's =
safe to allow log writers to go in.
7237f1833601dc Yan Zheng      2009-01-21  3151  	 */
7237f1833601dc Yan Zheng      2009-01-21  3152  	mutex_unlock(&root->log_mu=
tex);
7237f1833601dc Yan Zheng      2009-01-21  3153  =

28a235931b56d4 Filipe Manana  2016-08-23  3154  	btrfs_init_log_ctx(&root_l=
og_ctx, NULL);
d1433debe7f434 Miao Xie       2014-02-20  3155  =

7237f1833601dc Yan Zheng      2009-01-21 @3156  	mutex_lock(&log_root_tree-=
>log_mutex);
d1433debe7f434 Miao Xie       2014-02-20  3157  =

d1433debe7f434 Miao Xie       2014-02-20  3158  	index2 =3D log_root_tree->=
log_transid % 2;
d1433debe7f434 Miao Xie       2014-02-20  3159  	list_add_tail(&root_log_ct=
x.list, &log_root_tree->log_ctxs[index2]);
d1433debe7f434 Miao Xie       2014-02-20  3160  	root_log_ctx.log_transid =
=3D log_root_tree->log_transid;
d1433debe7f434 Miao Xie       2014-02-20  3161  =

122cfba0d2eb42 Naohiro Aota   2021-01-26  3162  	mutex_lock(&fs_info->tree_=
log_mutex);
122cfba0d2eb42 Naohiro Aota   2021-01-26  3163  	if (!log_root_tree->node) {
122cfba0d2eb42 Naohiro Aota   2021-01-26  3164  		ret =3D btrfs_alloc_log_t=
ree_node(trans, log_root_tree);
122cfba0d2eb42 Naohiro Aota   2021-01-26  3165  		if (ret) {
122cfba0d2eb42 Naohiro Aota   2021-01-26  3166  			mutex_unlock(&fs_info->t=
ree_log_mutex);
122cfba0d2eb42 Naohiro Aota   2021-01-26  3167  			goto out;
122cfba0d2eb42 Naohiro Aota   2021-01-26  3168  		}
122cfba0d2eb42 Naohiro Aota   2021-01-26  3169  	}
122cfba0d2eb42 Naohiro Aota   2021-01-26  3170  	mutex_unlock(&fs_info->tre=
e_log_mutex);
122cfba0d2eb42 Naohiro Aota   2021-01-26  3171  =

4203e968947071 Josef Bacik    2019-09-30  3172  	/*
4203e968947071 Josef Bacik    2019-09-30  3173  	 * Now we are safe to upda=
te the log_root_tree because we're under the
4203e968947071 Josef Bacik    2019-09-30  3174  	 * log_mutex, and we're a =
current writer so we're holding the commit
4203e968947071 Josef Bacik    2019-09-30  3175  	 * open until we drop the =
log_mutex.
4203e968947071 Josef Bacik    2019-09-30  3176  	 */
4203e968947071 Josef Bacik    2019-09-30  3177  	ret =3D update_log_root(tr=
ans, log, &new_root_item);
4a500fd178c89b Yan, Zheng     2010-05-16  3178  	if (ret) {
d1433debe7f434 Miao Xie       2014-02-20  3179  		if (!list_empty(&root_log=
_ctx.list))
d1433debe7f434 Miao Xie       2014-02-20  3180  			list_del_init(&root_log_=
ctx.list);
d1433debe7f434 Miao Xie       2014-02-20  3181  =

c6adc9cc082e3c Miao Xie       2013-05-28  3182  		blk_finish_plug(&plug);
907877664e2d85 David Sterba   2019-03-20  3183  		btrfs_set_log_full_commit=
(trans);
995946dd296177 Miao Xie       2014-04-02  3184  =

79787eaab46121 Jeff Mahoney   2012-03-12  3185  		if (ret !=3D -ENOSPC) {
66642832f06a43 Jeff Mahoney   2016-06-10  3186  			btrfs_abort_transaction(=
trans, ret);
79787eaab46121 Jeff Mahoney   2012-03-12  3187  			mutex_unlock(&log_root_t=
ree->log_mutex);
79787eaab46121 Jeff Mahoney   2012-03-12  3188  			goto out;
79787eaab46121 Jeff Mahoney   2012-03-12  3189  		}
bf89d38febaadd Jeff Mahoney   2016-09-09  3190  		btrfs_wait_tree_log_exten=
ts(log, mark);
4a500fd178c89b Yan, Zheng     2010-05-16  3191  		mutex_unlock(&log_root_tr=
ee->log_mutex);
4a500fd178c89b Yan, Zheng     2010-05-16  3192  		ret =3D -EAGAIN;
4a500fd178c89b Yan, Zheng     2010-05-16  3193  		goto out;
4a500fd178c89b Yan, Zheng     2010-05-16  3194  	}
4a500fd178c89b Yan, Zheng     2010-05-16  3195  =

d1433debe7f434 Miao Xie       2014-02-20  3196  	if (log_root_tree->log_tra=
nsid_committed >=3D root_log_ctx.log_transid) {
3da5ab56482f32 Forrest Liu    2015-01-30  3197  		blk_finish_plug(&plug);
cbd60aa7cd17d8 Chris Mason    2016-09-06  3198  		list_del_init(&root_log_c=
tx.list);
d1433debe7f434 Miao Xie       2014-02-20  3199  		mutex_unlock(&log_root_tr=
ee->log_mutex);
d1433debe7f434 Miao Xie       2014-02-20  3200  		ret =3D root_log_ctx.log_=
ret;
d1433debe7f434 Miao Xie       2014-02-20  3201  		goto out;
d1433debe7f434 Miao Xie       2014-02-20  3202  	}
8b050d350c7846 Miao Xie       2014-02-20  3203  =

d1433debe7f434 Miao Xie       2014-02-20  3204  	index2 =3D root_log_ctx.lo=
g_transid % 2;
7237f1833601dc Yan Zheng      2009-01-21  3205  	if (atomic_read(&log_root_=
tree->log_commit[index2])) {
c6adc9cc082e3c Miao Xie       2013-05-28  3206  		blk_finish_plug(&plug);
bf89d38febaadd Jeff Mahoney   2016-09-09  3207  		ret =3D btrfs_wait_tree_l=
og_extents(log, mark);
60d53eb3107c8e Zhaolei        2015-08-17  3208  		wait_log_commit(log_root_=
tree,
d1433debe7f434 Miao Xie       2014-02-20  3209  				root_log_ctx.log_transi=
d);
7237f1833601dc Yan Zheng      2009-01-21  3210  		mutex_unlock(&log_root_tr=
ee->log_mutex);
5ab5e44a36164f Filipe Manana  2014-11-13  3211  		if (!ret)
8b050d350c7846 Miao Xie       2014-02-20  3212  			ret =3D root_log_ctx.log=
_ret;
7237f1833601dc Yan Zheng      2009-01-21  3213  		goto out;
7237f1833601dc Yan Zheng      2009-01-21  3214  	}
d1433debe7f434 Miao Xie       2014-02-20  3215  	ASSERT(root_log_ctx.log_tr=
ansid =3D=3D log_root_tree->log_transid);
7237f1833601dc Yan Zheng      2009-01-21  3216  	atomic_set(&log_root_tree-=
>log_commit[index2], 1);
7237f1833601dc Yan Zheng      2009-01-21  3217  =

12fcfd22fe5bf4 Chris Mason    2009-03-24  3218  	if (atomic_read(&log_root_=
tree->log_commit[(index2 + 1) % 2])) {
60d53eb3107c8e Zhaolei        2015-08-17  3219  		wait_log_commit(log_root_=
tree,
d1433debe7f434 Miao Xie       2014-02-20  3220  				root_log_ctx.log_transi=
d - 1);
12fcfd22fe5bf4 Chris Mason    2009-03-24  3221  	}
7237f1833601dc Yan Zheng      2009-01-21  3222  =

12fcfd22fe5bf4 Chris Mason    2009-03-24  3223  	/*
12fcfd22fe5bf4 Chris Mason    2009-03-24  3224  	 * now that we've moved on=
 to the tree of log tree roots,
12fcfd22fe5bf4 Chris Mason    2009-03-24  3225  	 * check the full commit f=
lag again
12fcfd22fe5bf4 Chris Mason    2009-03-24  3226  	 */
4884b8e8ebf54e David Sterba   2019-03-20  3227  	if (btrfs_need_log_full_co=
mmit(trans)) {
c6adc9cc082e3c Miao Xie       2013-05-28  3228  		blk_finish_plug(&plug);
bf89d38febaadd Jeff Mahoney   2016-09-09  3229  		btrfs_wait_tree_log_exten=
ts(log, mark);
12fcfd22fe5bf4 Chris Mason    2009-03-24  3230  		mutex_unlock(&log_root_tr=
ee->log_mutex);
12fcfd22fe5bf4 Chris Mason    2009-03-24  3231  		ret =3D -EAGAIN;
12fcfd22fe5bf4 Chris Mason    2009-03-24  3232  		goto out_wake_log_root;
12fcfd22fe5bf4 Chris Mason    2009-03-24  3233  	}
7237f1833601dc Yan Zheng      2009-01-21  3234  =

2ff7e61e0d30ff Jeff Mahoney   2016-06-22  3235  	ret =3D btrfs_write_marked=
_extents(fs_info,
8cef4e160d7492 Yan, Zheng     2009-11-12  3236  					 &log_root_tree->dirty=
_log_pages,
8cef4e160d7492 Yan, Zheng     2009-11-12  3237  					 EXTENT_DIRTY | EXTENT=
_NEW);
c6adc9cc082e3c Miao Xie       2013-05-28  3238  	blk_finish_plug(&plug);
79787eaab46121 Jeff Mahoney   2012-03-12  3239  	if (ret) {
907877664e2d85 David Sterba   2019-03-20  3240  		btrfs_set_log_full_commit=
(trans);
66642832f06a43 Jeff Mahoney   2016-06-10  3241  		btrfs_abort_transaction(t=
rans, ret);
79787eaab46121 Jeff Mahoney   2012-03-12  3242  		mutex_unlock(&log_root_tr=
ee->log_mutex);
79787eaab46121 Jeff Mahoney   2012-03-12  3243  		goto out_wake_log_root;
79787eaab46121 Jeff Mahoney   2012-03-12  3244  	}
bf89d38febaadd Jeff Mahoney   2016-09-09  3245  	ret =3D btrfs_wait_tree_lo=
g_extents(log, mark);
5ab5e44a36164f Filipe Manana  2014-11-13  3246  	if (!ret)
bf89d38febaadd Jeff Mahoney   2016-09-09  3247  		ret =3D btrfs_wait_tree_l=
og_extents(log_root_tree,
c6adc9cc082e3c Miao Xie       2013-05-28  3248  						  EXTENT_NEW | EXTENT=
_DIRTY);
5ab5e44a36164f Filipe Manana  2014-11-13  3249  	if (ret) {
907877664e2d85 David Sterba   2019-03-20  3250  		btrfs_set_log_full_commit=
(trans);
5ab5e44a36164f Filipe Manana  2014-11-13  3251  		mutex_unlock(&log_root_tr=
ee->log_mutex);
5ab5e44a36164f Filipe Manana  2014-11-13  3252  		goto out_wake_log_root;
5ab5e44a36164f Filipe Manana  2014-11-13  3253  	}
e02119d5a7b439 Chris Mason    2008-09-05  3254  =

47876f7ceffa0e Filipe Manana  2020-11-25  3255  	log_root_start =3D log_roo=
t_tree->node->start;
47876f7ceffa0e Filipe Manana  2020-11-25  3256  	log_root_level =3D btrfs_h=
eader_level(log_root_tree->node);
7237f1833601dc Yan Zheng      2009-01-21  3257  	log_root_tree->log_transid=
++;
7237f1833601dc Yan Zheng      2009-01-21  3258  	mutex_unlock(&log_root_tre=
e->log_mutex);
7237f1833601dc Yan Zheng      2009-01-21  3259  =

7237f1833601dc Yan Zheng      2009-01-21  3260  	/*
47876f7ceffa0e Filipe Manana  2020-11-25  3261  	 * Here we are guaranteed =
that nobody is going to write the superblock
47876f7ceffa0e Filipe Manana  2020-11-25  3262  	 * for the current transac=
tion before us and that neither we do write
47876f7ceffa0e Filipe Manana  2020-11-25  3263  	 * our superblock before t=
he previous transaction finishes its commit
47876f7ceffa0e Filipe Manana  2020-11-25  3264  	 * and writes its superblo=
ck, because:
47876f7ceffa0e Filipe Manana  2020-11-25  3265  	 *
47876f7ceffa0e Filipe Manana  2020-11-25  3266  	 * 1) We are holding a han=
dle on the current transaction, so no body
47876f7ceffa0e Filipe Manana  2020-11-25  3267  	 *    can commit it until =
we release the handle;
47876f7ceffa0e Filipe Manana  2020-11-25  3268  	 *
47876f7ceffa0e Filipe Manana  2020-11-25  3269  	 * 2) Before writing our s=
uperblock we acquire the tree_log_mutex, so
47876f7ceffa0e Filipe Manana  2020-11-25  3270  	 *    if the previous tran=
saction is still committing, and hasn't yet
47876f7ceffa0e Filipe Manana  2020-11-25  3271  	 *    written its superblo=
ck, we wait for it to do it, because a
47876f7ceffa0e Filipe Manana  2020-11-25  3272  	 *    transaction commit a=
cquires the tree_log_mutex when the commit
47876f7ceffa0e Filipe Manana  2020-11-25  3273  	 *    begins and releases =
it only after writing its superblock.
7237f1833601dc Yan Zheng      2009-01-21  3274  	 */
47876f7ceffa0e Filipe Manana  2020-11-25  3275  	mutex_lock(&fs_info->tree_=
log_mutex);
47876f7ceffa0e Filipe Manana  2020-11-25  3276  	btrfs_set_super_log_root(f=
s_info->super_for_commit, log_root_start);
47876f7ceffa0e Filipe Manana  2020-11-25  3277  	btrfs_set_super_log_root_l=
evel(fs_info->super_for_commit, log_root_level);
eece6a9cf69140 David Sterba   2017-02-10  3278  	ret =3D write_all_supers(f=
s_info, 1);
47876f7ceffa0e Filipe Manana  2020-11-25  3279  	mutex_unlock(&fs_info->tre=
e_log_mutex);
5af3e8cce8b7ba Stefan Behrens 2012-08-01  3280  	if (ret) {
907877664e2d85 David Sterba   2019-03-20  3281  		btrfs_set_log_full_commit=
(trans);
66642832f06a43 Jeff Mahoney   2016-06-10  3282  		btrfs_abort_transaction(t=
rans, ret);
5af3e8cce8b7ba Stefan Behrens 2012-08-01  3283  		goto out_wake_log_root;
5af3e8cce8b7ba Stefan Behrens 2012-08-01  3284  	}
7237f1833601dc Yan Zheng      2009-01-21  3285  =

257c62e1bce03e Chris Mason    2009-10-13  3286  	mutex_lock(&root->log_mute=
x);
257c62e1bce03e Chris Mason    2009-10-13  3287  	if (root->last_log_commit =
< log_transid)
257c62e1bce03e Chris Mason    2009-10-13  3288  		root->last_log_commit =3D=
 log_transid;
257c62e1bce03e Chris Mason    2009-10-13  3289  	mutex_unlock(&root->log_mu=
tex);
257c62e1bce03e Chris Mason    2009-10-13  3290  =

12fcfd22fe5bf4 Chris Mason    2009-03-24  3291  out_wake_log_root:
570dd45042a7c8 Chris Mason    2016-10-27  3292  	mutex_lock(&log_root_tree-=
>log_mutex);
8b050d350c7846 Miao Xie       2014-02-20  3293  	btrfs_remove_all_log_ctxs(=
log_root_tree, index2, ret);
8b050d350c7846 Miao Xie       2014-02-20  3294  =

d1433debe7f434 Miao Xie       2014-02-20  3295  	log_root_tree->log_transid=
_committed++;
7237f1833601dc Yan Zheng      2009-01-21  3296  	atomic_set(&log_root_tree-=
>log_commit[index2], 0);
d1433debe7f434 Miao Xie       2014-02-20  3297  	mutex_unlock(&log_root_tre=
e->log_mutex);
d1433debe7f434 Miao Xie       2014-02-20  3298  =

33a9eca7e4a4c2 David Sterba   2015-10-10  3299  	/*
093258e6ebaf17 David Sterba   2018-02-26  3300  	 * The barrier before wait=
queue_active (in cond_wake_up) is needed so
093258e6ebaf17 David Sterba   2018-02-26  3301  	 * all the updates above a=
re seen by the woken threads. It might not be
093258e6ebaf17 David Sterba   2018-02-26  3302  	 * necessary, but proving =
that seems to be hard.
33a9eca7e4a4c2 David Sterba   2015-10-10  3303  	 */
093258e6ebaf17 David Sterba   2018-02-26  3304  	cond_wake_up(&log_root_tre=
e->log_commit_wait[index2]);
e02119d5a7b439 Chris Mason    2008-09-05  3305  out:
d1433debe7f434 Miao Xie       2014-02-20  3306  	mutex_lock(&root->log_mute=
x);
570dd45042a7c8 Chris Mason    2016-10-27  3307  	btrfs_remove_all_log_ctxs(=
root, index1, ret);
d1433debe7f434 Miao Xie       2014-02-20  3308  	root->log_transid_committe=
d++;
7237f1833601dc Yan Zheng      2009-01-21  3309  	atomic_set(&root->log_comm=
it[index1], 0);
d1433debe7f434 Miao Xie       2014-02-20  3310  	mutex_unlock(&root->log_mu=
tex);
8b050d350c7846 Miao Xie       2014-02-20  3311  =

33a9eca7e4a4c2 David Sterba   2015-10-10  3312  	/*
093258e6ebaf17 David Sterba   2018-02-26  3313  	 * The barrier before wait=
queue_active (in cond_wake_up) is needed so
093258e6ebaf17 David Sterba   2018-02-26  3314  	 * all the updates above a=
re seen by the woken threads. It might not be
093258e6ebaf17 David Sterba   2018-02-26  3315  	 * necessary, but proving =
that seems to be hard.
33a9eca7e4a4c2 David Sterba   2015-10-10  3316  	 */
093258e6ebaf17 David Sterba   2018-02-26  3317  	cond_wake_up(&root->log_co=
mmit_wait[index1]);
b31eabd86eb68d Chris Mason    2011-01-31 @3318  	return ret;
e02119d5a7b439 Chris Mason    2008-09-05  3319  }
e02119d5a7b439 Chris Mason    2008-09-05  3320  =


:::::: The code at line 3318 was first introduced by commit
:::::: b31eabd86eb68d3c217e6821078249bc045e698a Btrfs: catch errors from bt=
rfs_sync_log

:::::: TO: Chris Mason <chris.mason@oracle.com>
:::::: CC: Chris Mason <chris.mason@oracle.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1687818509263907923==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICHQTFWAAAy5jb25maWcAjFxdd9s20r7fX6GT3uxepPVHkibnPb6ASFBCRRIMQEq2b3AUW0l8
1rG8ktI2//6dAfgxAEGnPbttNAMMvgYzzwyG+eVfv8zY99P+2/b0cLd9fPwx+7J72h22p9397PPD
4+7/ZqmclbKe8VTUv0Lj/OHp+9+/Pe//2h2e72Zvfz0///Xs9eHu7Wy1OzztHmfJ/unzw5fvIOFh
//SvX/6VyDITC5MkZs2VFrI0Nb+ur161Et69edy9fkSZr7/c3c3+vUiS/8w+/Hr569kr0lVoA4yr
Hx1pMYi7+nB2eXbWMfK0p19cvjmz//RyclYuevbQhfQ5I2MumTZMF2YhazmMTBiizEXJCUuWulZN
UkulB6pQH81GqtVAmTciT2tRcFOzec6NlqoeuPVScZaC8EzCv6CJxq6wkb/MFvZkHmfH3en787C1
ohS14eXaMAWrEYWory4voHk/raISMEzNdT17OM6e9ieU0C9fJizv1v/qVYxsWEO3wM7faJbXpP2S
rblZcVXy3CxuRTU0p5zr24HuN+6n27eMzDXlGWvy2q6YjN2Rl1LXJSv41at/P+2fdv/pG+gNIxPS
N3otqmREwP8mdT7QN6xOluZjwxt6ykpqbQpeSHVjWF2zZEmn32iei3lk7nYbmAKBrIGrhGOxPO+O
FrRkdvz+6fjjeNp9G452wUuuRGKVSC/lhtyAgGNyvuZ5nF+IhWI1nm+ULco/eOKzl0ylwNKwc0Zx
zcvUV+hUFkyUPk2LItbILAVXuO6b8eiFFthykhEdJ5Mq4Wl7T0S5IOdYMaV5XKKVxufNItP2uHZP
97P952Dfw072kq6HowrYCVySFWx7WZP7bo8YTUQtkpWZK8nShOn6xd4vNiukNk2Vspp3ylI/fNsd
jjF9sWPKkoNGEFGlNMtbtAOFPeNeV4FYwRgyFQlV2J7v+ok05xF9dsysoRsD/0HjbmrFkpU7GmKG
fJ47xynB3jTFYolaaI9DaX+q7TmOtqSTVinOi6oGqdZU90I7+lrmTVkzdRPdgbYV5dkTSKrmt3p7
/O/sBOPOtjCH42l7Os62d3f770+nh6cvw5mshaoNdDAsSSSM5alshIkn72u8VcNYb2tTdLKE68DW
i1bx+8nPdQoLkAkHewW96/gKtYhu6D9YYX/qMH2hZd6ZGLtDKmlmOqKgsKEGeHSe8NPwa9DEmHvS
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
M2jh+7bOzmsQTqtcXf8ABpglcCGZAQA=
--===============1687818509263907923==--

