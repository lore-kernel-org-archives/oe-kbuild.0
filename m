Content-Type: multipart/mixed; boundary="===============2807428874757122693=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC 5/6] ext4: Refactor ext4_free_blocks() to pull out ext4_mb_clear_bb()
Date: Tue, 01 Feb 2022 21:46:13 +0800
Message-ID: <202202012149.imqMREPx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2807428874757122693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <426fd12a24d7876e445aea3f14a6e09c2eba8fe3.1643642105.git.rites=
hh@linux.ibm.com>
References: <426fd12a24d7876e445aea3f14a6e09c2eba8fe3.1643642105.git.ritesh=
h@linux.ibm.com>
TO: Ritesh Harjani <riteshh@linux.ibm.com>

Hi Ritesh,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v5.17-rc2 next-20220131]
[cannot apply to tytso-fscrypt/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ritesh-Harjani/ext4-Fixes-=
ext4_mb_mark_bb-with-flex_bg-with-fast_commit/20220201-001713
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-m021-20220131 (https://download.01.org/0day-ci/arch=
ive/20220201/202202012149.imqMREPx-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ext4/mballoc.c:6033 ext4_mb_clear_bb() warn: should 'count_clusters << s=
bi->s_cluster_bits' be a 64 bit type?

Old smatch warnings:
fs/ext4/mballoc.c:1820 mb_free_blocks() warn: should 'block << sbi->s_clust=
er_bits' be a 64 bit type?
fs/ext4/mballoc.c:5420 ext4_mb_release_context() warn: should '(ac->ac_b_ex=
.fe_len) << sbi->s_cluster_bits' be a 64 bit type?
fs/ext4/mballoc.c:5565 ext4_mb_new_blocks() warn: should '(ar->len) << sbi-=
>s_cluster_bits' be a 64 bit type?
fs/ext4/mballoc.c:5569 ext4_mb_new_blocks() warn: should '(ar->len) << sbi-=
>s_cluster_bits' be a 64 bit type?
fs/ext4/mballoc.c:5569 ext4_mb_new_blocks() warn: should '(ar->len) << sbi-=
>s_cluster_bits' be a 64 bit type?
fs/ext4/mballoc.c:5654 ext4_mb_new_blocks() warn: should '(inquota - ar->le=
n) << sbi->s_cluster_bits' be a 64 bit type?

vim +6033 fs/ext4/mballoc.c

8016e29f4362e2 Harshad Shirwadkar    2020-10-15  5871  =

4433871130f365 Theodore Ts'o         2009-11-22  5872  /**
46785ca2322cbe Ritesh Harjani        2022-01-31  5873   * ext4_mb_clear_bb(=
) -- helper function for freeing blocks.
46785ca2322cbe Ritesh Harjani        2022-01-31  5874   * 			Used by ext4_f=
ree_blocks()
4433871130f365 Theodore Ts'o         2009-11-22  5875   * @handle:		handle =
for this transaction
4433871130f365 Theodore Ts'o         2009-11-22  5876   * @inode:		inode
c60990b361cc0a Theodore Ts'o         2019-06-19  5877   * @bh:			optional b=
uffer of the block to be freed
c60990b361cc0a Theodore Ts'o         2019-06-19  5878   * @block:		starting=
 physical block to be freed
c60990b361cc0a Theodore Ts'o         2019-06-19  5879   * @count:		number o=
f blocks to be freed
5def1360252b97 Yongqiang Yang        2011-06-05  5880   * @flags:		flags us=
ed by ext4_free_blocks
c9de560ded61fa Alex Tomas            2008-01-29  5881   */
46785ca2322cbe Ritesh Harjani        2022-01-31  5882  static void ext4_mb_=
clear_bb(handle_t *handle, struct inode *inode,
46785ca2322cbe Ritesh Harjani        2022-01-31  5883  			       ext4_fsblk=
_t block, unsigned long count,
46785ca2322cbe Ritesh Harjani        2022-01-31  5884  			       int flags)
c9de560ded61fa Alex Tomas            2008-01-29  5885  {
26346ff681cb42 Aneesh Kumar K.V      2008-02-10  5886  	struct buffer_head =
*bitmap_bh =3D NULL;
c9de560ded61fa Alex Tomas            2008-01-29  5887  	struct super_block =
*sb =3D inode->i_sb;
c9de560ded61fa Alex Tomas            2008-01-29  5888  	struct ext4_group_d=
esc *gdp;
498e5f24158da7 Theodore Ts'o         2008-11-05  5889  	unsigned int overfl=
ow;
c9de560ded61fa Alex Tomas            2008-01-29  5890  	ext4_grpblk_t bit;
c9de560ded61fa Alex Tomas            2008-01-29  5891  	struct buffer_head =
*gd_bh;
c9de560ded61fa Alex Tomas            2008-01-29  5892  	ext4_group_t block_=
group;
c9de560ded61fa Alex Tomas            2008-01-29  5893  	struct ext4_sb_info=
 *sbi;
c9de560ded61fa Alex Tomas            2008-01-29  5894  	struct ext4_buddy e=
4b;
84130193e0e656 Theodore Ts'o         2011-09-09  5895  	unsigned int count_=
clusters;
c9de560ded61fa Alex Tomas            2008-01-29  5896  	int err =3D 0;
c9de560ded61fa Alex Tomas            2008-01-29  5897  	int ret;
c9de560ded61fa Alex Tomas            2008-01-29  5898  =

8016e29f4362e2 Harshad Shirwadkar    2020-10-15  5899  	sbi =3D EXT4_SB(sb);
8016e29f4362e2 Harshad Shirwadkar    2020-10-15  5900  =

c9de560ded61fa Alex Tomas            2008-01-29  5901  do_more:
c9de560ded61fa Alex Tomas            2008-01-29  5902  	overflow =3D 0;
c9de560ded61fa Alex Tomas            2008-01-29  5903  	ext4_get_group_no_a=
nd_offset(sb, block, &block_group, &bit);
c9de560ded61fa Alex Tomas            2008-01-29  5904  =

163a203ddb36c3 Darrick J. Wong       2013-08-28  5905  	if (unlikely(EXT4_M=
B_GRP_BBITMAP_CORRUPT(
163a203ddb36c3 Darrick J. Wong       2013-08-28  5906  			ext4_get_group_in=
fo(sb, block_group))))
163a203ddb36c3 Darrick J. Wong       2013-08-28  5907  		return;
163a203ddb36c3 Darrick J. Wong       2013-08-28  5908  =

c9de560ded61fa Alex Tomas            2008-01-29  5909  	/*
c9de560ded61fa Alex Tomas            2008-01-29  5910  	 * Check to see if =
we are freeing blocks across a group
c9de560ded61fa Alex Tomas            2008-01-29  5911  	 * boundary.
c9de560ded61fa Alex Tomas            2008-01-29  5912  	 */
84130193e0e656 Theodore Ts'o         2011-09-09  5913  	if (EXT4_C2B(sbi, b=
it) + count > EXT4_BLOCKS_PER_GROUP(sb)) {
84130193e0e656 Theodore Ts'o         2011-09-09  5914  		overflow =3D EXT4_=
C2B(sbi, bit) + count -
84130193e0e656 Theodore Ts'o         2011-09-09  5915  			EXT4_BLOCKS_PER_G=
ROUP(sb);
c9de560ded61fa Alex Tomas            2008-01-29  5916  		count -=3D overflo=
w;
c9de560ded61fa Alex Tomas            2008-01-29  5917  	}
810da240f221d6 Lukas Czerner         2013-03-02  5918  	count_clusters =3D =
EXT4_NUM_B2C(sbi, count);
574ca174c97f79 Theodore Ts'o         2008-07-11  5919  	bitmap_bh =3D ext4_=
read_block_bitmap(sb, block_group);
9008a58e5dcee0 Darrick J. Wong       2015-10-17  5920  	if (IS_ERR(bitmap_b=
h)) {
9008a58e5dcee0 Darrick J. Wong       2015-10-17  5921  		err =3D PTR_ERR(bi=
tmap_bh);
9008a58e5dcee0 Darrick J. Wong       2015-10-17  5922  		bitmap_bh =3D NULL;
c9de560ded61fa Alex Tomas            2008-01-29  5923  		goto error_return;
ce89f46cb833f8 Aneesh Kumar K.V      2008-07-23  5924  	}
c9de560ded61fa Alex Tomas            2008-01-29  5925  	gdp =3D ext4_get_gr=
oup_desc(sb, block_group, &gd_bh);
ce89f46cb833f8 Aneesh Kumar K.V      2008-07-23  5926  	if (!gdp) {
ce89f46cb833f8 Aneesh Kumar K.V      2008-07-23  5927  		err =3D -EIO;
c9de560ded61fa Alex Tomas            2008-01-29  5928  		goto error_return;
ce89f46cb833f8 Aneesh Kumar K.V      2008-07-23  5929  	}
c9de560ded61fa Alex Tomas            2008-01-29  5930  =

dabd76de38a67b Ritesh Harjani        2022-01-31  5931  	if (!ext4_group_blo=
ck_valid(sb, block_group, block, count)) {
12062dddda4509 Eric Sandeen          2010-02-15  5932  		ext4_error(sb, "Fr=
eeing blocks in system zone - "
0610b6e9993982 Theodore Ts'o         2009-06-15  5933  			   "Block =3D %ll=
u, count =3D %lu", block, count);
519deca0496a4d Aneesh Kumar K.V      2008-05-15  5934  		/* err =3D 0. ext4=
_std_error should be a no op */
519deca0496a4d Aneesh Kumar K.V      2008-05-15  5935  		goto error_return;
c9de560ded61fa Alex Tomas            2008-01-29  5936  	}
c9de560ded61fa Alex Tomas            2008-01-29  5937  =

c9de560ded61fa Alex Tomas            2008-01-29  5938  	BUFFER_TRACE(bitmap=
_bh, "getting write access");
188c299e2a26cc Jan Kara              2021-08-16  5939  	err =3D ext4_journa=
l_get_write_access(handle, sb, bitmap_bh,
188c299e2a26cc Jan Kara              2021-08-16  5940  					    EXT4_JTR_NO=
NE);
c9de560ded61fa Alex Tomas            2008-01-29  5941  	if (err)
c9de560ded61fa Alex Tomas            2008-01-29  5942  		goto error_return;
c9de560ded61fa Alex Tomas            2008-01-29  5943  =

c9de560ded61fa Alex Tomas            2008-01-29  5944  	/*
c9de560ded61fa Alex Tomas            2008-01-29  5945  	 * We are about to =
modify some metadata.  Call the journal APIs
c9de560ded61fa Alex Tomas            2008-01-29  5946  	 * to unshare ->b_d=
ata if a currently-committing transaction is
c9de560ded61fa Alex Tomas            2008-01-29  5947  	 * using it
c9de560ded61fa Alex Tomas            2008-01-29  5948  	 */
c9de560ded61fa Alex Tomas            2008-01-29  5949  	BUFFER_TRACE(gd_bh,=
 "get_write_access");
188c299e2a26cc Jan Kara              2021-08-16  5950  	err =3D ext4_journa=
l_get_write_access(handle, sb, gd_bh, EXT4_JTR_NONE);
c9de560ded61fa Alex Tomas            2008-01-29  5951  	if (err)
c9de560ded61fa Alex Tomas            2008-01-29  5952  		goto error_return;
c9de560ded61fa Alex Tomas            2008-01-29  5953  #ifdef AGGRESSIVE_CH=
ECK
c9de560ded61fa Alex Tomas            2008-01-29  5954  	{
c9de560ded61fa Alex Tomas            2008-01-29  5955  		int i;
84130193e0e656 Theodore Ts'o         2011-09-09  5956  		for (i =3D 0; i < =
count_clusters; i++)
c9de560ded61fa Alex Tomas            2008-01-29  5957  			BUG_ON(!mb_test_b=
it(bit + i, bitmap_bh->b_data));
c9de560ded61fa Alex Tomas            2008-01-29  5958  	}
c9de560ded61fa Alex Tomas            2008-01-29  5959  #endif
84130193e0e656 Theodore Ts'o         2011-09-09  5960  	trace_ext4_mballoc_=
free(sb, inode, block_group, bit, count_clusters);
c9de560ded61fa Alex Tomas            2008-01-29  5961  =

adb7ef600cc9d9 Konstantin Khlebnikov 2016-03-13  5962  	/* __GFP_NOFAIL: re=
try infinitely, ignore TIF_MEMDIE and memcg limit. */
adb7ef600cc9d9 Konstantin Khlebnikov 2016-03-13  5963  	err =3D ext4_mb_loa=
d_buddy_gfp(sb, block_group, &e4b,
adb7ef600cc9d9 Konstantin Khlebnikov 2016-03-13  5964  				     GFP_NOFS|__=
GFP_NOFAIL);
920313a726e04f Aneesh Kumar K.V      2009-01-05  5965  	if (err)
920313a726e04f Aneesh Kumar K.V      2009-01-05  5966  		goto error_return;
e6362609b6c71c Theodore Ts'o         2009-11-23  5967  =

f96c450dabf549 Daeho Jeong           2016-02-21  5968  	/*
f96c450dabf549 Daeho Jeong           2016-02-21  5969  	 * We need to make =
sure we don't reuse the freed block until after the
f96c450dabf549 Daeho Jeong           2016-02-21  5970  	 * transaction is c=
ommitted. We make an exception if the inode is to be
f96c450dabf549 Daeho Jeong           2016-02-21  5971  	 * written in write=
back mode since writeback mode has weak data
f96c450dabf549 Daeho Jeong           2016-02-21  5972  	 * consistency guar=
antees.
f96c450dabf549 Daeho Jeong           2016-02-21  5973  	 */
f96c450dabf549 Daeho Jeong           2016-02-21  5974  	if (ext4_handle_val=
id(handle) &&
f96c450dabf549 Daeho Jeong           2016-02-21  5975  	    ((flags & EXT4_=
FREE_BLOCKS_METADATA) ||
f96c450dabf549 Daeho Jeong           2016-02-21  5976  	     !ext4_should_w=
riteback_data(inode))) {
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5977  		struct ext4_free_d=
ata *new_entry;
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5978  		/*
7444a072c387a9 Michal Hocko          2015-07-05  5979  		 * We use __GFP_NO=
FAIL because ext4_free_blocks() is not allowed
7444a072c387a9 Michal Hocko          2015-07-05  5980  		 * to fail.
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5981  		 */
7444a072c387a9 Michal Hocko          2015-07-05  5982  		new_entry =3D kmem=
_cache_alloc(ext4_free_data_cachep,
7444a072c387a9 Michal Hocko          2015-07-05  5983  				GFP_NOFS|__GFP_N=
OFAIL);
18aadd47f88464 Bobi Jam              2012-02-20  5984  		new_entry->efd_sta=
rt_cluster =3D bit;
18aadd47f88464 Bobi Jam              2012-02-20  5985  		new_entry->efd_gro=
up =3D block_group;
18aadd47f88464 Bobi Jam              2012-02-20  5986  		new_entry->efd_cou=
nt =3D count_clusters;
18aadd47f88464 Bobi Jam              2012-02-20  5987  		new_entry->efd_tid=
 =3D handle->h_transaction->t_tid;
955ce5f5be67df Aneesh Kumar K.V      2009-05-02  5988  =

7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5989  		ext4_lock_group(sb=
, block_group);
84130193e0e656 Theodore Ts'o         2011-09-09  5990  		mb_clear_bits(bitm=
ap_bh->b_data, bit, count_clusters);
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5991  		ext4_mb_free_metad=
ata(handle, &e4b, new_entry);
c9de560ded61fa Alex Tomas            2008-01-29  5992  	} else {
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5993  		/* need to update =
group_info->bb_free and bitmap
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5994  		 * with group lock=
 held. generate_buddy look at
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5995  		 * them with group=
 lock_held
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  5996  		 */
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  5997  		if (test_opt(sb, D=
ISCARD)) {
a015434480dcdb Daeho Jeong           2017-06-22  5998  			err =3D ext4_issu=
e_discard(sb, block_group, bit, count,
a015434480dcdb Daeho Jeong           2017-06-22  5999  						 NULL);
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  6000  			if (err && err !=
=3D -EOPNOTSUPP)
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  6001  				ext4_msg(sb, KER=
N_WARNING, "discard request in"
dabd76de38a67b Ritesh Harjani        2022-01-31  6002  					 " group:%u blo=
ck:%d count:%lu failed"
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  6003  					 " with %d", bl=
ock_group, bit, count,
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  6004  					 err);
8f9ff189205a68 Lukas Czerner         2013-10-30  6005  		} else
8f9ff189205a68 Lukas Czerner         2013-10-30  6006  			EXT4_MB_GRP_CLEAR=
_TRIMMED(e4b.bd_info);
d71c1ae23aa3e7 Lukas Czerner         2012-11-08  6007  =

955ce5f5be67df Aneesh Kumar K.V      2009-05-02  6008  		ext4_lock_group(sb=
, block_group);
84130193e0e656 Theodore Ts'o         2011-09-09  6009  		mb_clear_bits(bitm=
ap_bh->b_data, bit, count_clusters);
84130193e0e656 Theodore Ts'o         2011-09-09  6010  		mb_free_blocks(ino=
de, &e4b, bit, count_clusters);
c9de560ded61fa Alex Tomas            2008-01-29  6011  	}
c9de560ded61fa Alex Tomas            2008-01-29  6012  =

021b65bb1e4e4b Theodore Ts'o         2011-09-09  6013  	ret =3D ext4_free_g=
roup_clusters(sb, gdp) + count_clusters;
021b65bb1e4e4b Theodore Ts'o         2011-09-09  6014  	ext4_free_group_clu=
sters_set(sb, gdp, ret);
79f1ba49569e5a Tao Ma                2012-10-22  6015  	ext4_block_bitmap_c=
sum_set(sb, block_group, gdp, bitmap_bh);
feb0ab32a57e4e Darrick J. Wong       2012-04-29  6016  	ext4_group_desc_csu=
m_set(sb, block_group, gdp);
955ce5f5be67df Aneesh Kumar K.V      2009-05-02  6017  	ext4_unlock_group(s=
b, block_group);
c9de560ded61fa Alex Tomas            2008-01-29  6018  =

772cb7c83ba256 Jose R. Santos        2008-07-11  6019  	if (sbi->s_log_grou=
ps_per_flex) {
772cb7c83ba256 Jose R. Santos        2008-07-11  6020  		ext4_group_t flex_=
group =3D ext4_flex_group(sbi, block_group);
90ba983f6889e6 Theodore Ts'o         2013-03-11  6021  		atomic64_add(count=
_clusters,
7c990728b99ed6 Suraj Jitindar Singh  2020-02-18  6022  			     &sbi_array_r=
cu_deref(sbi, s_flex_groups,
7c990728b99ed6 Suraj Jitindar Singh  2020-02-18  6023  						  flex_group)-=
>free_clusters);
772cb7c83ba256 Jose R. Santos        2008-07-11  6024  	}
772cb7c83ba256 Jose R. Santos        2008-07-11  6025  =

9fe671496b6c28 Eric Whitney          2018-10-01  6026  	/*
9fe671496b6c28 Eric Whitney          2018-10-01  6027  	 * on a bigalloc fi=
le system, defer the s_freeclusters_counter
9fe671496b6c28 Eric Whitney          2018-10-01  6028  	 * update to the ca=
ller (ext4_remove_space and friends) so they
9fe671496b6c28 Eric Whitney          2018-10-01  6029  	 * can determine if=
 a cluster freed here should be rereserved
9fe671496b6c28 Eric Whitney          2018-10-01  6030  	 */
9fe671496b6c28 Eric Whitney          2018-10-01  6031  	if (!(flags & EXT4_=
FREE_BLOCKS_RERESERVE_CLUSTER)) {
7b415bf60f6afb Aditya Kali           2011-09-09  6032  		if (!(flags & EXT4=
_FREE_BLOCKS_NO_QUOT_UPDATE))
7b415bf60f6afb Aditya Kali           2011-09-09 @6033  			dquot_free_block(=
inode, EXT4_C2B(sbi, count_clusters));
9fe671496b6c28 Eric Whitney          2018-10-01  6034  		percpu_counter_add=
(&sbi->s_freeclusters_counter,
9fe671496b6c28 Eric Whitney          2018-10-01  6035  				   count_cluster=
s);
9fe671496b6c28 Eric Whitney          2018-10-01  6036  	}
7d7345322d60ed Jan Kara              2013-08-17  6037  =

7d7345322d60ed Jan Kara              2013-08-17  6038  	ext4_mb_unload_budd=
y(&e4b);
7b415bf60f6afb Aditya Kali           2011-09-09  6039  =

7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6040  	/* We dirtied the b=
itmap block */
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6041  	BUFFER_TRACE(bitmap=
_bh, "dirtied bitmap block");
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6042  	err =3D ext4_handle=
_dirty_metadata(handle, NULL, bitmap_bh);
7a2fcbf7f85737 Aneesh Kumar K.V      2009-01-05  6043  =

c9de560ded61fa Alex Tomas            2008-01-29  6044  	/* And the group de=
scriptor block */
c9de560ded61fa Alex Tomas            2008-01-29  6045  	BUFFER_TRACE(gd_bh,=
 "dirtied group descriptor block");
0390131ba84fd3 Frank Mayhar          2009-01-07  6046  	ret =3D ext4_handle=
_dirty_metadata(handle, NULL, gd_bh);
c9de560ded61fa Alex Tomas            2008-01-29  6047  	if (!err)
c9de560ded61fa Alex Tomas            2008-01-29  6048  		err =3D ret;
c9de560ded61fa Alex Tomas            2008-01-29  6049  =

c9de560ded61fa Alex Tomas            2008-01-29  6050  	if (overflow && !er=
r) {
c9de560ded61fa Alex Tomas            2008-01-29  6051  		block +=3D count;
c9de560ded61fa Alex Tomas            2008-01-29  6052  		count =3D overflow;
c9de560ded61fa Alex Tomas            2008-01-29  6053  		put_bh(bitmap_bh);
c9de560ded61fa Alex Tomas            2008-01-29  6054  		goto do_more;
c9de560ded61fa Alex Tomas            2008-01-29  6055  	}
c9de560ded61fa Alex Tomas            2008-01-29  6056  error_return:
c9de560ded61fa Alex Tomas            2008-01-29  6057  	brelse(bitmap_bh);
c9de560ded61fa Alex Tomas            2008-01-29  6058  	ext4_std_error(sb, =
err);
c9de560ded61fa Alex Tomas            2008-01-29  6059  	return;
c9de560ded61fa Alex Tomas            2008-01-29  6060  }
7360d1731e5dc7 Lukas Czerner         2010-10-27  6061  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2807428874757122693==--

