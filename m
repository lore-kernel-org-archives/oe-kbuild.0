Content-Type: multipart/mixed; boundary="===============8072660447298390713=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 6/9] fs/ext4/ialloc.c:296 ext4_free_inode() error: we previously assumed '&(grp->bb_state)' could be null (see line 296)
Date: Mon, 27 Jun 2022 03:04:29 +0000
Message-ID: <202206261031.IsA8gYRe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8072660447298390713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Marco Elver <elver@google.com>

tree:   https://github.com/alobakin/linux bitops
head:   3d9705b33014389e95ff8ac2eeadd081934aa571
commit: e9cfd713a4977a015d0bec5f26abb0ad7111e202 [6/9] bitops: let optimize=
 out non-atomic bitops on compile-time constants
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-rhel-8.3-kselftests
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ext4/ialloc.c:296 ext4_free_inode() error: we previously assumed '&(grp-=
>bb_state)' could be null (see line 296)
fs/ext4/mballoc.c:1500 ext4_mb_load_buddy_gfp() error: we previously assume=
d '&(grp->bb_state)' could be null (see line 1500)
fs/ext4/mballoc.c:1792 mb_free_blocks() error: we previously assumed '&((e4=
b->bd_info)->bb_state)' could be null (see line 1792)
fs/ext4/mballoc.c:2211 ext4_mb_find_by_goal() error: we previously assumed =
'&((e4b->bd_info)->bb_state)' could be null (see line 2211)
fs/ext4/mballoc.c:2426 ext4_mb_good_group() error: we previously assumed '&=
(grp->bb_state)' could be null (see line 2426)
fs/ext4/mballoc.c:2882 ext4_mb_seq_groups_show() error: we previously assum=
ed '&(grinfo->bb_state)' could be null (see line 2882)
fs/ext4/mballoc.c:6529 ext4_trim_fs() error: we previously assumed '&(grp->=
bb_state)' could be null (see line 6529)

Old smatch warnings:
include/asm-generic/bitops/generic-non-atomic.h:158 const_test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/generic-non-atomic.h:98 generic___test_and_clear=
_bit() warn: ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:114 ___test_and_clear_=
bit() warn: ignoring unreachable code.
include/asm-generic/bitops/generic-non-atomic.h:78 generic___test_and_set_b=
it() warn: ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:99 ___test_and_set_bit=
() warn: ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:141 _test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/generic-non-atomic.h:158 const_test_bit() warn: =
ignoring unreachable code.
include/asm-generic/bitops/generic-non-atomic.h:98 generic___test_and_clear=
_bit() warn: ignoring unreachable code.
include/asm-generic/bitops/instrumented-non-atomic.h:114 ___test_and_clear_=
bit() warn: ignoring unreachable code.
fs/ext4/mballoc.c:3994 ext4_mb_mark_bb() error: uninitialized symbol 'err'.
fs/ext4/mballoc.c:4625 ext4_mb_put_pa() warn: inconsistent returns '&pa->pa=
_lock'.

vim +296 fs/ext4/ialloc.c

ac27a0ec112a08 Dave Kleikamp        2006-10-11  218  =

ac27a0ec112a08 Dave Kleikamp        2006-10-11  219  /*
ac27a0ec112a08 Dave Kleikamp        2006-10-11  220   * NOTE! When we get t=
he inode, we're the only people
ac27a0ec112a08 Dave Kleikamp        2006-10-11  221   * that have access to=
 it, and as such there are no
ac27a0ec112a08 Dave Kleikamp        2006-10-11  222   * race conditions we =
have to worry about. The inode
ac27a0ec112a08 Dave Kleikamp        2006-10-11  223   * is not on the hash-=
lists, and it cannot be reached
ac27a0ec112a08 Dave Kleikamp        2006-10-11  224   * through the filesys=
tem because the directory entry
ac27a0ec112a08 Dave Kleikamp        2006-10-11  225   * has been deleted ea=
rlier.
ac27a0ec112a08 Dave Kleikamp        2006-10-11  226   *
ac27a0ec112a08 Dave Kleikamp        2006-10-11  227   * HOWEVER: we must ma=
ke sure that we get no aliases,
ac27a0ec112a08 Dave Kleikamp        2006-10-11  228   * which means that we=
 have to call "clear_inode()"
ac27a0ec112a08 Dave Kleikamp        2006-10-11  229   * _before_ we mark th=
e inode not in use in the inode
ac27a0ec112a08 Dave Kleikamp        2006-10-11  230   * bitmaps. Otherwise =
a newly created file might use
ac27a0ec112a08 Dave Kleikamp        2006-10-11  231   * the same inode numb=
er (not actually the same pointer
ac27a0ec112a08 Dave Kleikamp        2006-10-11  232   * though), and then w=
e'd have two inodes sharing the
ac27a0ec112a08 Dave Kleikamp        2006-10-11  233   * same inode number a=
nd space on the harddisk.
ac27a0ec112a08 Dave Kleikamp        2006-10-11  234   */
617ba13b31fbf5 Mingming Cao         2006-10-11  235  void ext4_free_inode(h=
andle_t *handle, struct inode *inode)
ac27a0ec112a08 Dave Kleikamp        2006-10-11  236  {
ac27a0ec112a08 Dave Kleikamp        2006-10-11  237  	struct super_block *s=
b =3D inode->i_sb;
ac27a0ec112a08 Dave Kleikamp        2006-10-11  238  	int is_directory;
ac27a0ec112a08 Dave Kleikamp        2006-10-11  239  	unsigned long ino;
ac27a0ec112a08 Dave Kleikamp        2006-10-11  240  	struct buffer_head *b=
itmap_bh =3D NULL;
ac27a0ec112a08 Dave Kleikamp        2006-10-11  241  	struct buffer_head *b=
h2;
fd2d42912f9f09 Avantika Mathur      2008-01-28  242  	ext4_group_t block_gr=
oup;
ac27a0ec112a08 Dave Kleikamp        2006-10-11  243  	unsigned long bit;
617ba13b31fbf5 Mingming Cao         2006-10-11  244  	struct ext4_group_des=
c *gdp;
617ba13b31fbf5 Mingming Cao         2006-10-11  245  	struct ext4_super_blo=
ck *es;
617ba13b31fbf5 Mingming Cao         2006-10-11  246  	struct ext4_sb_info *=
sbi;
7ce9d5d1f3c873 Eric Sandeen         2009-03-04  247  	int fatal =3D 0, err,=
 count, cleared;
87a39389be3e3b Darrick J. Wong      2013-08-28  248  	struct ext4_group_inf=
o *grp;
ac27a0ec112a08 Dave Kleikamp        2006-10-11  249  =

92b9781658dba2 Theodore Ts'o        2012-03-19  250  	if (!sb) {
92b9781658dba2 Theodore Ts'o        2012-03-19  251  		printk(KERN_ERR "EXT=
4-fs: %s:%d: inode on "
92b9781658dba2 Theodore Ts'o        2012-03-19  252  		       "nonexistent =
device\n", __func__, __LINE__);
92b9781658dba2 Theodore Ts'o        2012-03-19  253  		return;
92b9781658dba2 Theodore Ts'o        2012-03-19  254  	}
ac27a0ec112a08 Dave Kleikamp        2006-10-11  255  	if (atomic_read(&inod=
e->i_count) > 1) {
92b9781658dba2 Theodore Ts'o        2012-03-19  256  		ext4_msg(sb, KERN_ER=
R, "%s:%d: inode #%lu: count=3D%d",
92b9781658dba2 Theodore Ts'o        2012-03-19  257  			 __func__, __LINE__=
, inode->i_ino,
ac27a0ec112a08 Dave Kleikamp        2006-10-11  258  			 atomic_read(&inode=
->i_count));
ac27a0ec112a08 Dave Kleikamp        2006-10-11  259  		return;
ac27a0ec112a08 Dave Kleikamp        2006-10-11  260  	}
ac27a0ec112a08 Dave Kleikamp        2006-10-11  261  	if (inode->i_nlink) {
92b9781658dba2 Theodore Ts'o        2012-03-19  262  		ext4_msg(sb, KERN_ER=
R, "%s:%d: inode #%lu: nlink=3D%d\n",
92b9781658dba2 Theodore Ts'o        2012-03-19  263  			 __func__, __LINE__=
, inode->i_ino, inode->i_nlink);
ac27a0ec112a08 Dave Kleikamp        2006-10-11  264  		return;
ac27a0ec112a08 Dave Kleikamp        2006-10-11  265  	}
617ba13b31fbf5 Mingming Cao         2006-10-11  266  	sbi =3D EXT4_SB(sb);
ac27a0ec112a08 Dave Kleikamp        2006-10-11  267  =

ac27a0ec112a08 Dave Kleikamp        2006-10-11  268  	ino =3D inode->i_ino;
617ba13b31fbf5 Mingming Cao         2006-10-11  269  	ext4_debug("freeing i=
node %lu\n", ino);
9bffad1ed2a003 Theodore Ts'o        2009-06-17  270  	trace_ext4_free_inode=
(inode);
ac27a0ec112a08 Dave Kleikamp        2006-10-11  271  =

871a293155a245 Christoph Hellwig    2010-03-03  272  	dquot_initialize(inod=
e);
63936ddaa16b94 Christoph Hellwig    2010-03-03  273  	dquot_free_inode(inod=
e);
ac27a0ec112a08 Dave Kleikamp        2006-10-11  274  =

ac27a0ec112a08 Dave Kleikamp        2006-10-11  275  	is_directory =3D S_IS=
DIR(inode->i_mode);
ac27a0ec112a08 Dave Kleikamp        2006-10-11  276  =

ac27a0ec112a08 Dave Kleikamp        2006-10-11  277  	/* Do this BEFORE mar=
king the inode not in use or returning an error */
0930fcc1ee2f0a Al Viro              2010-06-07  278  	ext4_clear_inode(inod=
e);
ac27a0ec112a08 Dave Kleikamp        2006-10-11  279  =

49598e04b5a1c3 Jun Piao             2018-01-11  280  	es =3D sbi->s_es;
617ba13b31fbf5 Mingming Cao         2006-10-11  281  	if (ino < EXT4_FIRST_=
INO(sb) || ino > le32_to_cpu(es->s_inodes_count)) {
12062dddda4509 Eric Sandeen         2010-02-15  282  		ext4_error(sb, "rese=
rved or nonexistent inode %lu", ino);
ac27a0ec112a08 Dave Kleikamp        2006-10-11  283  		goto error_return;
ac27a0ec112a08 Dave Kleikamp        2006-10-11  284  	}
617ba13b31fbf5 Mingming Cao         2006-10-11  285  	block_group =3D (ino =
- 1) / EXT4_INODES_PER_GROUP(sb);
617ba13b31fbf5 Mingming Cao         2006-10-11  286  	bit =3D (ino - 1) % E=
XT4_INODES_PER_GROUP(sb);
e29d1cde63be0b Eric Sandeen         2008-08-02  287  	bitmap_bh =3D ext4_re=
ad_inode_bitmap(sb, block_group);
87a39389be3e3b Darrick J. Wong      2013-08-28  288  	/* Don't bother if th=
e inode bitmap is corrupt. */
9008a58e5dcee0 Darrick J. Wong      2015-10-17  289  	if (IS_ERR(bitmap_bh)=
) {
9008a58e5dcee0 Darrick J. Wong      2015-10-17  290  		fatal =3D PTR_ERR(bi=
tmap_bh);
9008a58e5dcee0 Darrick J. Wong      2015-10-17  291  		bitmap_bh =3D NULL;
9008a58e5dcee0 Darrick J. Wong      2015-10-17  292  		goto error_return;
9008a58e5dcee0 Darrick J. Wong      2015-10-17  293  	}
8016e29f4362e2 Harshad Shirwadkar   2020-10-15  294  	if (!(sbi->s_mount_st=
ate & EXT4_FC_REPLAY)) {
8016e29f4362e2 Harshad Shirwadkar   2020-10-15  295  		grp =3D ext4_get_gro=
up_info(sb, block_group);
9008a58e5dcee0 Darrick J. Wong      2015-10-17 @296  		if (unlikely(EXT4_MB=
_GRP_IBITMAP_CORRUPT(grp))) {
9008a58e5dcee0 Darrick J. Wong      2015-10-17  297  			fatal =3D -EFSCORRU=
PTED;
ac27a0ec112a08 Dave Kleikamp        2006-10-11  298  			goto error_return;
9008a58e5dcee0 Darrick J. Wong      2015-10-17  299  		}
8016e29f4362e2 Harshad Shirwadkar   2020-10-15  300  	}
ac27a0ec112a08 Dave Kleikamp        2006-10-11  301  =

ac27a0ec112a08 Dave Kleikamp        2006-10-11  302  	BUFFER_TRACE(bitmap_b=
h, "get_write_access");
188c299e2a26cc Jan Kara             2021-08-16  303  	fatal =3D ext4_journa=
l_get_write_access(handle, sb, bitmap_bh,
188c299e2a26cc Jan Kara             2021-08-16  304  					      EXT4_JTR_NO=
NE);
ac27a0ec112a08 Dave Kleikamp        2006-10-11  305  	if (fatal)
ac27a0ec112a08 Dave Kleikamp        2006-10-11  306  		goto error_return;
ac27a0ec112a08 Dave Kleikamp        2006-10-11  307  =

d17413c08cd2b1 Dmitry Monakhov      2010-05-16  308  	fatal =3D -ESRCH;
617ba13b31fbf5 Mingming Cao         2006-10-11  309  	gdp =3D ext4_get_grou=
p_desc(sb, block_group, &bh2);
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  310  	if (gdp) {
ac27a0ec112a08 Dave Kleikamp        2006-10-11  311  		BUFFER_TRACE(bh2, "g=
et_write_access");
188c299e2a26cc Jan Kara             2021-08-16  312  		fatal =3D ext4_journ=
al_get_write_access(handle, sb, bh2,
188c299e2a26cc Jan Kara             2021-08-16  313  						      EXT4_JTR_N=
ONE);
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  314  	}
955ce5f5be67df Aneesh Kumar K.V     2009-05-02  315  	ext4_lock_group(sb, b=
lock_group);
597d508c17a6dc Akinobu Mita         2011-12-28  316  	cleared =3D ext4_test=
_and_clear_bit(bit, bitmap_bh->b_data);
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  317  	if (fatal || !cleared=
) {
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  318  		ext4_unlock_group(sb=
, block_group);
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  319  		goto out;
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  320  	}
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  321  =

560671a0d3c9ad Aneesh Kumar K.V     2009-01-05  322  	count =3D ext4_free_i=
nodes_count(sb, gdp) + 1;
560671a0d3c9ad Aneesh Kumar K.V     2009-01-05  323  	ext4_free_inodes_set(=
sb, gdp, count);
560671a0d3c9ad Aneesh Kumar K.V     2009-01-05  324  	if (is_directory) {
560671a0d3c9ad Aneesh Kumar K.V     2009-01-05  325  		count =3D ext4_used_=
dirs_count(sb, gdp) - 1;
560671a0d3c9ad Aneesh Kumar K.V     2009-01-05  326  		ext4_used_dirs_set(s=
b, gdp, count);
b45f189a19b38e Ritesh Harjani       2021-04-29  327  		if (percpu_counter_i=
nitialized(&sbi->s_dirs_counter))
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  328  			percpu_counter_dec(=
&sbi->s_dirs_counter);
560671a0d3c9ad Aneesh Kumar K.V     2009-01-05  329  	}
41a246d1ff75a9 Darrick J. Wong      2012-04-29  330  	ext4_inode_bitmap_csu=
m_set(sb, block_group, gdp, bitmap_bh,
41a246d1ff75a9 Darrick J. Wong      2012-04-29  331  				   EXT4_INODES_PER=
_GROUP(sb) / 8);
feb0ab32a57e4e Darrick J. Wong      2012-04-29  332  	ext4_group_desc_csum_=
set(sb, block_group, gdp);
955ce5f5be67df Aneesh Kumar K.V     2009-05-02  333  	ext4_unlock_group(sb,=
 block_group);
ac27a0ec112a08 Dave Kleikamp        2006-10-11  334  =

b45f189a19b38e Ritesh Harjani       2021-04-29  335  	if (percpu_counter_in=
itialized(&sbi->s_freeinodes_counter))
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  336  		percpu_counter_inc(&=
sbi->s_freeinodes_counter);
772cb7c83ba256 Jose R. Santos       2008-07-11  337  	if (sbi->s_log_groups=
_per_flex) {
7c990728b99ed6 Suraj Jitindar Singh 2020-02-18  338  		struct flex_groups *=
fg;
9f24e4208f7ee2 Theodore Ts'o        2009-03-04  339  =

7c990728b99ed6 Suraj Jitindar Singh 2020-02-18  340  		fg =3D sbi_array_rcu=
_deref(sbi, s_flex_groups,
7c990728b99ed6 Suraj Jitindar Singh 2020-02-18  341  					 ext4_flex_group(=
sbi, block_group));
7c990728b99ed6 Suraj Jitindar Singh 2020-02-18  342  		atomic_inc(&fg->free=
_inodes);
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  343  		if (is_directory)
7c990728b99ed6 Suraj Jitindar Singh 2020-02-18  344  			atomic_dec(&fg->use=
d_dirs);
ac27a0ec112a08 Dave Kleikamp        2006-10-11  345  	}
0390131ba84fd3 Frank Mayhar         2009-01-07  346  	BUFFER_TRACE(bh2, "ca=
ll ext4_handle_dirty_metadata");
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  347  	fatal =3D ext4_handle=
_dirty_metadata(handle, NULL, bh2);
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  348  out:
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  349  	if (cleared) {
0390131ba84fd3 Frank Mayhar         2009-01-07  350  		BUFFER_TRACE(bitmap_=
bh, "call ext4_handle_dirty_metadata");
0390131ba84fd3 Frank Mayhar         2009-01-07  351  		err =3D ext4_handle_=
dirty_metadata(handle, NULL, bitmap_bh);
ac27a0ec112a08 Dave Kleikamp        2006-10-11  352  		if (!fatal)
ac27a0ec112a08 Dave Kleikamp        2006-10-11  353  			fatal =3D err;
87a39389be3e3b Darrick J. Wong      2013-08-28  354  	} else {
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  355  		ext4_error(sb, "bit =
already cleared for inode %lu", ino);
db79e6d1fb1f71 Wang Shilong         2018-05-12  356  		ext4_mark_group_bitm=
ap_corrupted(sb, block_group,
db79e6d1fb1f71 Wang Shilong         2018-05-12  357  					EXT4_GROUP_INFO_I=
BITMAP_CORRUPT);
87a39389be3e3b Darrick J. Wong      2013-08-28  358  	}
d17413c08cd2b1 Dmitry Monakhov      2010-05-16  359  =

ac27a0ec112a08 Dave Kleikamp        2006-10-11  360  error_return:
ac27a0ec112a08 Dave Kleikamp        2006-10-11  361  	brelse(bitmap_bh);
617ba13b31fbf5 Mingming Cao         2006-10-11  362  	ext4_std_error(sb, fa=
tal);
ac27a0ec112a08 Dave Kleikamp        2006-10-11  363  }
ac27a0ec112a08 Dave Kleikamp        2006-10-11  364  =


:::::: The code at line 296 was first introduced by commit
:::::: 9008a58e5dcee014f5de69d154e2620870f9224e ext4: make the bitmap read =
routines return real error codes

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8072660447298390713==--

