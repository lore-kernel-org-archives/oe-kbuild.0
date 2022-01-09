Content-Type: multipart/mixed; boundary="===============7421361233599150424=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] ext4: fast commit may not fallback for ineligible commit
Date: Sun, 09 Jan 2022 15:41:08 +0800
Message-ID: <202201091544.W5HHEXAp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7421361233599150424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220107121215.1912-2-yinxin.x@bytedance.com>
References: <20220107121215.1912-2-yinxin.x@bytedance.com>
TO: Xin Yin <yinxin.x@bytedance.com>
TO: harshadshirwadkar(a)gmail.com
TO: tytso(a)mit.edu
TO: adilger.kernel(a)dilger.ca
CC: linux-ext4(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Xin Yin <yinxin.x@bytedance.com>

Hi Xin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on next-20220107]
[cannot apply to linus/master v5.16-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Xin-Yin/ext4-fix-issues-wh=
en-fast-commit-work-with-jbd/20220107-201314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20220107 (https://download.01.org/0day-ci/ar=
chive/20220109/202201091544.W5HHEXAp-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ext4/inode.c:340 ext4_evict_inode() error: uninitialized symbol 'handle'.

Old smatch warnings:
fs/ext4/inode.c:380 ext4_da_update_reserve_space() warn: should 'used << sb=
i->s_cluster_bits' be a 64 bit type?
fs/ext4/inode.c:387 ext4_da_update_reserve_space() warn: should 'used << sb=
i->s_cluster_bits' be a 64 bit type?
fs/ext4/inode.c:1469 ext4_da_reserve_space() warn: should '(1) << sbi->s_cl=
uster_bits' be a 64 bit type?
fs/ext4/inode.c:1476 ext4_da_reserve_space() warn: should '(1) << sbi->s_cl=
uster_bits' be a 64 bit type?
fs/ext4/inode.c:1518 ext4_da_release_space() warn: should 'to_free << sbi->=
s_cluster_bits' be a 64 bit type?
fs/ext4/inode.c:2571 mpage_prepare_extent_to_map() warn: missing error code=
 'err'
fs/ext4/inode.c:5550 ext4_file_getattr() warn: should '(()->i_reserved_data=
_blocks) << (EXT4_SB(inode->i_sb))->s_cluster_bits' be a 64 bit type?
fs/ext4/inode.c:6090 ext4_page_mkwrite() error: uninitialized symbol 'get_b=
lock'.

vim +/handle +340 fs/ext4/inode.c

ac27a0ec112a08 Dave Kleikamp      2006-10-11  163  =

ac27a0ec112a08 Dave Kleikamp      2006-10-11  164  /*
ac27a0ec112a08 Dave Kleikamp      2006-10-11  165   * Called at the last ip=
ut() if i_nlink is zero.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  166   */
0930fcc1ee2f0a Al Viro            2010-06-07  167  void ext4_evict_inode(st=
ruct inode *inode)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  168  {
ac27a0ec112a08 Dave Kleikamp      2006-10-11  169  	handle_t *handle;
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  170  	int err;
65db869c754e7c Jan Kara           2019-11-05  171  	/*
65db869c754e7c Jan Kara           2019-11-05  172  	 * Credits for final in=
ode cleanup and freeing:
65db869c754e7c Jan Kara           2019-11-05  173  	 * sb + inode (ext4_orp=
han_del()), block bitmap, group descriptor
65db869c754e7c Jan Kara           2019-11-05  174  	 * (xattr block freeing=
), bitmap, group descriptor (inode freeing)
65db869c754e7c Jan Kara           2019-11-05  175  	 */
65db869c754e7c Jan Kara           2019-11-05  176  	int extra_credits =3D 6;
0421a189bc8cde Tahsin Erdogan     2017-06-22  177  	struct ext4_xattr_inode=
_array *ea_inode_array =3D NULL;
46e294efc355c4 Jan Kara           2020-11-27  178  	bool freeze_protected =
=3D false;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  179  =

7ff9c073dd4d72 Theodore Ts'o      2010-11-08  180  	trace_ext4_evict_inode(=
inode);
2581fdc810889f Jiaying Zhang      2011-08-13  181  =

0930fcc1ee2f0a Al Viro            2010-06-07  182  	if (inode->i_nlink) {
2d859db3e4a82a Jan Kara           2011-07-26  183  		/*
2d859db3e4a82a Jan Kara           2011-07-26  184  		 * When journalling da=
ta dirty buffers are tracked only in the
2d859db3e4a82a Jan Kara           2011-07-26  185  		 * journal. So althoug=
h mm thinks everything is clean and
2d859db3e4a82a Jan Kara           2011-07-26  186  		 * ready for reaping t=
he inode might still have some pages to
2d859db3e4a82a Jan Kara           2011-07-26  187  		 * write in the runnin=
g transaction or waiting to be
2d859db3e4a82a Jan Kara           2011-07-26  188  		 * checkpointed. Thus =
calling jbd2_journal_invalidatepage()
2d859db3e4a82a Jan Kara           2011-07-26  189  		 * (via truncate_inode=
_pages()) to discard these buffers can
2d859db3e4a82a Jan Kara           2011-07-26  190  		 * cause data loss. Al=
so even if we did not discard these
2d859db3e4a82a Jan Kara           2011-07-26  191  		 * buffers, we would h=
ave no way to find them after the inode
2d859db3e4a82a Jan Kara           2011-07-26  192  		 * is reaped and thus =
user could see stale data if he tries to
2d859db3e4a82a Jan Kara           2011-07-26  193  		 * read them before th=
e transaction is checkpointed. So be
2d859db3e4a82a Jan Kara           2011-07-26  194  		 * careful and force e=
verything to disk here... We use
2d859db3e4a82a Jan Kara           2011-07-26  195  		 * ei->i_datasync_tid =
to store the newest transaction
2d859db3e4a82a Jan Kara           2011-07-26  196  		 * containing inode's =
data.
2d859db3e4a82a Jan Kara           2011-07-26  197  		 *
2d859db3e4a82a Jan Kara           2011-07-26  198  		 * Note that directori=
es do not have this problem because they
2d859db3e4a82a Jan Kara           2011-07-26  199  		 * don't use page cach=
e.
2d859db3e4a82a Jan Kara           2011-07-26  200  		 */
6a7fd522a7c94c Vegard Nossum      2016-07-04  201  		if (inode->i_ino !=3D =
EXT4_JOURNAL_INO &&
6a7fd522a7c94c Vegard Nossum      2016-07-04  202  		    ext4_should_journa=
l_data(inode) &&
3abb1a0fc2871f Jan Kara           2017-06-22  203  		    (S_ISLNK(inode->i_=
mode) || S_ISREG(inode->i_mode)) &&
3abb1a0fc2871f Jan Kara           2017-06-22  204  		    inode->i_data.nrpa=
ges) {
2d859db3e4a82a Jan Kara           2011-07-26  205  			journal_t *journal =
=3D EXT4_SB(inode->i_sb)->s_journal;
2d859db3e4a82a Jan Kara           2011-07-26  206  			tid_t commit_tid =3D =
EXT4_I(inode)->i_datasync_tid;
2d859db3e4a82a Jan Kara           2011-07-26  207  =

d76a3a77113db0 Theodore Ts'o      2013-04-03  208  			jbd2_complete_transac=
tion(journal, commit_tid);
2d859db3e4a82a Jan Kara           2011-07-26  209  			filemap_write_and_wai=
t(&inode->i_data);
2d859db3e4a82a Jan Kara           2011-07-26  210  		}
91b0abe36a7b2b Johannes Weiner    2014-04-03  211  		truncate_inode_pages_f=
inal(&inode->i_data);
5dc23bdd5f846e Jan Kara           2013-06-04  212  =

0930fcc1ee2f0a Al Viro            2010-06-07  213  		goto no_delete;
0930fcc1ee2f0a Al Viro            2010-06-07  214  	}
0930fcc1ee2f0a Al Viro            2010-06-07  215  =

e2bfb088fac03c Theodore Ts'o      2014-10-05  216  	if (is_bad_inode(inode))
e2bfb088fac03c Theodore Ts'o      2014-10-05  217  		goto no_delete;
871a293155a245 Christoph Hellwig  2010-03-03  218  	dquot_initialize(inode);
907f4554e2521c Christoph Hellwig  2010-03-03  219  =

678aaf481496b0 Jan Kara           2008-07-11  220  	if (ext4_should_order_d=
ata(inode))
678aaf481496b0 Jan Kara           2008-07-11  221  		ext4_begin_ordered_tru=
ncate(inode, 0);
91b0abe36a7b2b Johannes Weiner    2014-04-03  222  	truncate_inode_pages_fi=
nal(&inode->i_data);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  223  =

ceff86fddae874 Jan Kara           2020-04-21  224  	/*
ceff86fddae874 Jan Kara           2020-04-21  225  	 * For inodes with jour=
nalled data, transaction commit could have
ceff86fddae874 Jan Kara           2020-04-21  226  	 * dirtied the inode. F=
lush worker is ignoring it because of I_FREEING
ceff86fddae874 Jan Kara           2020-04-21  227  	 * flag but we still ne=
ed to remove the inode from the writeback lists.
ceff86fddae874 Jan Kara           2020-04-21  228  	 */
ceff86fddae874 Jan Kara           2020-04-21  229  	if (!list_empty_careful=
(&inode->i_io_list)) {
ceff86fddae874 Jan Kara           2020-04-21  230  		WARN_ON_ONCE(!ext4_sho=
uld_journal_data(inode));
ceff86fddae874 Jan Kara           2020-04-21  231  		inode_io_list_del(inod=
e);
ceff86fddae874 Jan Kara           2020-04-21  232  	}
ceff86fddae874 Jan Kara           2020-04-21  233  =

8e8ad8a57c75f3 Jan Kara           2012-06-12  234  	/*
8e8ad8a57c75f3 Jan Kara           2012-06-12  235  	 * Protect us against f=
reezing - iput() caller didn't have to have any
46e294efc355c4 Jan Kara           2020-11-27  236  	 * protection against i=
t. When we are in a running transaction though,
46e294efc355c4 Jan Kara           2020-11-27  237  	 * we are already prote=
cted against freezing and we cannot grab further
46e294efc355c4 Jan Kara           2020-11-27  238  	 * protection due to lo=
ck ordering constraints.
8e8ad8a57c75f3 Jan Kara           2012-06-12  239  	 */
46e294efc355c4 Jan Kara           2020-11-27  240  	if (!ext4_journal_curre=
nt_handle()) {
8e8ad8a57c75f3 Jan Kara           2012-06-12  241  		sb_start_intwrite(inod=
e->i_sb);
46e294efc355c4 Jan Kara           2020-11-27  242  		freeze_protected =3D t=
rue;
46e294efc355c4 Jan Kara           2020-11-27  243  	}
e50e5129f384ae Andreas Dilger     2017-06-21  244  =

30a7eb970c3aae Tahsin Erdogan     2017-06-22  245  	if (!IS_NOQUOTA(inode))
30a7eb970c3aae Tahsin Erdogan     2017-06-22  246  		extra_credits +=3D EXT=
4_MAXQUOTAS_DEL_BLOCKS(inode->i_sb);
30a7eb970c3aae Tahsin Erdogan     2017-06-22  247  =

65db869c754e7c Jan Kara           2019-11-05  248  	/*
65db869c754e7c Jan Kara           2019-11-05  249  	 * Block bitmap, group =
descriptor, and inode are accounted in both
65db869c754e7c Jan Kara           2019-11-05  250  	 * ext4_blocks_for_trun=
cate() and extra_credits. So subtract 3.
65db869c754e7c Jan Kara           2019-11-05  251  	 */
30a7eb970c3aae Tahsin Erdogan     2017-06-22  252  	handle =3D ext4_journal=
_start(inode, EXT4_HT_TRUNCATE,
65db869c754e7c Jan Kara           2019-11-05  253  			 ext4_blocks_for_trun=
cate(inode) + extra_credits - 3);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  254  	if (IS_ERR(handle)) {
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  255  		ext4_std_error(inode->=
i_sb, PTR_ERR(handle));
ac27a0ec112a08 Dave Kleikamp      2006-10-11  256  		/*
ac27a0ec112a08 Dave Kleikamp      2006-10-11  257  		 * If we're going to s=
kip the normal cleanup, we still need to
ac27a0ec112a08 Dave Kleikamp      2006-10-11  258  		 * make sure that the =
in-core orphan linked list is properly
ac27a0ec112a08 Dave Kleikamp      2006-10-11  259  		 * cleaned up.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  260  		 */
617ba13b31fbf5 Mingming Cao       2006-10-11  261  		ext4_orphan_del(NULL, =
inode);
46e294efc355c4 Jan Kara           2020-11-27  262  		if (freeze_protected)
8e8ad8a57c75f3 Jan Kara           2012-06-12  263  			sb_end_intwrite(inode=
->i_sb);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  264  		goto no_delete;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  265  	}
30a7eb970c3aae Tahsin Erdogan     2017-06-22  266  =

ac27a0ec112a08 Dave Kleikamp      2006-10-11  267  	if (IS_SYNC(inode))
0390131ba84fd3 Frank Mayhar       2009-01-07  268  		ext4_handle_sync(handl=
e);
407cd7fb83c0eb Tahsin Erdogan     2017-07-04  269  =

407cd7fb83c0eb Tahsin Erdogan     2017-07-04  270  	/*
407cd7fb83c0eb Tahsin Erdogan     2017-07-04  271  	 * Set inode->i_size to=
 0 before calling ext4_truncate(). We need
407cd7fb83c0eb Tahsin Erdogan     2017-07-04  272  	 * special handling of =
symlinks here because i_size is used to
407cd7fb83c0eb Tahsin Erdogan     2017-07-04  273  	 * determine whether ex=
t4_inode_info->i_data contains symlink data or
407cd7fb83c0eb Tahsin Erdogan     2017-07-04  274  	 * block mappings. Sett=
ing i_size to 0 will remove its fast symlink
407cd7fb83c0eb Tahsin Erdogan     2017-07-04  275  	 * status. Erase i_data=
 so that it becomes a valid empty block map.
407cd7fb83c0eb Tahsin Erdogan     2017-07-04  276  	 */
407cd7fb83c0eb Tahsin Erdogan     2017-07-04  277  	if (ext4_inode_is_fast_=
symlink(inode))
407cd7fb83c0eb Tahsin Erdogan     2017-07-04  278  		memset(EXT4_I(inode)->=
i_data, 0, sizeof(EXT4_I(inode)->i_data));
ac27a0ec112a08 Dave Kleikamp      2006-10-11  279  	inode->i_size =3D 0;
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  280  	err =3D ext4_mark_inode=
_dirty(handle, inode);
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  281  	if (err) {
12062dddda4509 Eric Sandeen       2010-02-15  282  		ext4_warning(inode->i_=
sb,
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  283  			     "couldn't mark i=
node dirty (err %d)", err);
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  284  		goto stop_handle;
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  285  	}
2c98eb5ea24976 Theodore Ts'o      2016-11-13  286  	if (inode->i_blocks) {
2c98eb5ea24976 Theodore Ts'o      2016-11-13  287  		err =3D ext4_truncate(=
inode);
2c98eb5ea24976 Theodore Ts'o      2016-11-13  288  		if (err) {
54d3adbc29f0c7 Theodore Ts'o      2020-03-28  289  			ext4_error_err(inode-=
>i_sb, -err,
2c98eb5ea24976 Theodore Ts'o      2016-11-13  290  				       "couldn't tru=
ncate inode %lu (err %d)",
2c98eb5ea24976 Theodore Ts'o      2016-11-13  291  				       inode->i_ino,=
 err);
2c98eb5ea24976 Theodore Ts'o      2016-11-13  292  			goto stop_handle;
2c98eb5ea24976 Theodore Ts'o      2016-11-13  293  		}
2c98eb5ea24976 Theodore Ts'o      2016-11-13  294  	}
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  295  =

30a7eb970c3aae Tahsin Erdogan     2017-06-22  296  	/* Remove xattr referen=
ces. */
30a7eb970c3aae Tahsin Erdogan     2017-06-22  297  	err =3D ext4_xattr_dele=
te_inode(handle, inode, &ea_inode_array,
30a7eb970c3aae Tahsin Erdogan     2017-06-22  298  				      extra_credits);
30a7eb970c3aae Tahsin Erdogan     2017-06-22  299  	if (err) {
30a7eb970c3aae Tahsin Erdogan     2017-06-22  300  		ext4_warning(inode->i_=
sb, "xattr delete (err %d)", err);
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  301  stop_handle:
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  302  		ext4_journal_stop(hand=
le);
4538821993f448 Theodore Ts'o      2010-07-29  303  		ext4_orphan_del(NULL, =
inode);
46e294efc355c4 Jan Kara           2020-11-27  304  		if (freeze_protected)
8e8ad8a57c75f3 Jan Kara           2012-06-12  305  			sb_end_intwrite(inode=
->i_sb);
30a7eb970c3aae Tahsin Erdogan     2017-06-22  306  		ext4_xattr_inode_array=
_free(ea_inode_array);
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  307  		goto no_delete;
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  308  	}
bc965ab3f2b4b7 Theodore Ts'o      2008-08-02  309  =

ac27a0ec112a08 Dave Kleikamp      2006-10-11  310  	/*
617ba13b31fbf5 Mingming Cao       2006-10-11  311  	 * Kill off the orphan =
record which ext4_truncate created.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  312  	 * AKPM: I think this c=
an be inside the above `if'.
617ba13b31fbf5 Mingming Cao       2006-10-11  313  	 * Note that ext4_orpha=
n_del() has to be able to cope with the
ac27a0ec112a08 Dave Kleikamp      2006-10-11  314  	 * deletion of a non-ex=
istent orphan - this is because we don't
617ba13b31fbf5 Mingming Cao       2006-10-11  315  	 * know if ext4_truncat=
e() actually created an orphan record.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  316  	 * (Well, we could do t=
his if we need to, but heck - it works)
ac27a0ec112a08 Dave Kleikamp      2006-10-11  317  	 */
617ba13b31fbf5 Mingming Cao       2006-10-11  318  	ext4_orphan_del(handle,=
 inode);
5ffff834322281 Arnd Bergmann      2018-07-29  319  	EXT4_I(inode)->i_dtime	=
=3D (__u32)ktime_get_real_seconds();
ac27a0ec112a08 Dave Kleikamp      2006-10-11  320  =

ac27a0ec112a08 Dave Kleikamp      2006-10-11  321  	/*
ac27a0ec112a08 Dave Kleikamp      2006-10-11  322  	 * One subtle ordering =
requirement: if anything has gone wrong
ac27a0ec112a08 Dave Kleikamp      2006-10-11  323  	 * (transaction abort, =
IO errors, whatever), then we can still
ac27a0ec112a08 Dave Kleikamp      2006-10-11  324  	 * do these next steps =
(the fs will already have been marked as
ac27a0ec112a08 Dave Kleikamp      2006-10-11  325  	 * having errors), but =
we can't free the inode if the mark_dirty
ac27a0ec112a08 Dave Kleikamp      2006-10-11  326  	 * fails.
ac27a0ec112a08 Dave Kleikamp      2006-10-11  327  	 */
617ba13b31fbf5 Mingming Cao       2006-10-11  328  	if (ext4_mark_inode_dir=
ty(handle, inode))
ac27a0ec112a08 Dave Kleikamp      2006-10-11  329  		/* If that failed, jus=
t do the required in-core inode clear. */
0930fcc1ee2f0a Al Viro            2010-06-07  330  		ext4_clear_inode(inode=
);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  331  	else
617ba13b31fbf5 Mingming Cao       2006-10-11  332  		ext4_free_inode(handle=
, inode);
617ba13b31fbf5 Mingming Cao       2006-10-11  333  	ext4_journal_stop(handl=
e);
46e294efc355c4 Jan Kara           2020-11-27  334  	if (freeze_protected)
8e8ad8a57c75f3 Jan Kara           2012-06-12  335  		sb_end_intwrite(inode-=
>i_sb);
0421a189bc8cde Tahsin Erdogan     2017-06-22  336  	ext4_xattr_inode_array_=
free(ea_inode_array);
ac27a0ec112a08 Dave Kleikamp      2006-10-11  337  	return;
ac27a0ec112a08 Dave Kleikamp      2006-10-11  338  no_delete:
b21ebf143af219 Harshad Shirwadkar 2020-11-05  339  	if (!list_empty(&EXT4_I=
(inode)->i_fc_list))
db40129f85538a Xin Yin            2022-01-07 @340  		ext4_fc_mark_ineligibl=
e(inode->i_sb, EXT4_FC_REASON_NOMEM, handle);
0930fcc1ee2f0a Al Viro            2010-06-07  341  	ext4_clear_inode(inode)=
;	/* We must guarantee clearing of inode... */
9d0be50230b333 Theodore Ts'o      2010-01-01  342  }
ac27a0ec112a08 Dave Kleikamp      2006-10-11  343  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7421361233599150424==--

