Content-Type: multipart/mixed; boundary="===============7887298834275272750=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:dax-block-cleanup 24/29] fs/ext4/inode.c:3353 ext4_iomap_alloc() warn: bitwise AND condition is false here
Date: Wed, 08 Dec 2021 01:31:21 +0800
Message-ID: <202112080112.YMSgKEpb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7887298834275272750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git dax-block-cleanup
head:   85eeeba6accd7ba7457ab6c8905863a74458f063
commit: 22a4392ec217ca818e4d3f851d1f8887cce98de9 [24/29] iomap: add a IOMAP=
_DAX flag
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-m001-20211201 (https://download.01.org/0day-ci/ar=
chive/20211208/202112080112.YMSgKEpb-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/ext4/inode.c:3353 ext4_iomap_alloc() warn: bitwise AND condition is fals=
e here
fs/xfs/xfs_iomap.c:233 xfs_iomap_write_direct() warn: bitwise AND condition=
 is false here
fs/xfs/xfs_iomap.c:624 imap_needs_alloc() warn: bitwise AND condition is fa=
lse here

Old smatch warnings:
fs/ext4/inode.c:381 ext4_da_update_reserve_space() warn: should 'used << sb=
i->s_cluster_bits' be a 64 bit type?
fs/ext4/inode.c:388 ext4_da_update_reserve_space() warn: should 'used << sb=
i->s_cluster_bits' be a 64 bit type?
fs/ext4/inode.c:1469 ext4_da_reserve_space() warn: should '(1) << sbi->s_cl=
uster_bits' be a 64 bit type?
fs/ext4/inode.c:1476 ext4_da_reserve_space() warn: should '(1) << sbi->s_cl=
uster_bits' be a 64 bit type?
fs/ext4/inode.c:1518 ext4_da_release_space() warn: should 'to_free << sbi->=
s_cluster_bits' be a 64 bit type?
fs/ext4/inode.c:2590 mpage_prepare_extent_to_map() warn: missing error code=
 'err'
fs/ext4/inode.c:5575 ext4_file_getattr() warn: should '(()->i_reserved_data=
_blocks) << (EXT4_SB(inode->i_sb))->s_cluster_bits' be a 64 bit type?
fs/ext4/inode.c:6115 ext4_page_mkwrite() error: uninitialized symbol 'get_b=
lock'.

vim +3353 fs/ext4/inode.c

c8fdfe294187455 Matthew Bobrowski 2019-11-05  3321  =

f063db5ee989aaf Matthew Bobrowski 2019-11-05  3322  static int ext4_iomap_a=
lloc(struct inode *inode, struct ext4_map_blocks *map,
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3323  			    unsigned int fla=
gs)
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3324  {
776722e85d3b093 Jan Kara          2016-11-20  3325  	handle_t *handle;
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3326  	u8 blkbits =3D inode->=
i_blkbits;
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3327  	int ret, dio_credits, =
m_flags =3D 0, retries =3D 0;
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3328  =

f063db5ee989aaf Matthew Bobrowski 2019-11-05  3329  	/*
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3330  	 * Trim the mapping re=
quest to the maximum value that we can map at
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3331  	 * once for direct I/O.
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3332  	 */
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3333  	if (map->m_len > DIO_M=
AX_BLOCKS)
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3334  		map->m_len =3D DIO_MA=
X_BLOCKS;
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3335  	dio_credits =3D ext4_c=
hunk_trans_blocks(inode, map->m_len);
776722e85d3b093 Jan Kara          2016-11-20  3336  =

776722e85d3b093 Jan Kara          2016-11-20  3337  retry:
776722e85d3b093 Jan Kara          2016-11-20  3338  	/*
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3339  	 * Either we allocate =
blocks and then don't get an unwritten extent, so
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3340  	 * in that case we hav=
e reserved enough credits. Or, the blocks are
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3341  	 * already allocated a=
nd unwritten. In that case, the extent conversion
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3342  	 * fits into the credi=
ts as well.
776722e85d3b093 Jan Kara          2016-11-20  3343  	 */
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3344  	handle =3D ext4_journa=
l_start(inode, EXT4_HT_MAP_BLOCKS, dio_credits);
776722e85d3b093 Jan Kara          2016-11-20  3345  	if (IS_ERR(handle))
776722e85d3b093 Jan Kara          2016-11-20  3346  		return PTR_ERR(handle=
);
776722e85d3b093 Jan Kara          2016-11-20  3347  =

378f32bab3714f0 Matthew Bobrowski 2019-11-05  3348  	/*
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3349  	 * DAX and direct I/O =
are the only two operations that are currently
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3350  	 * supported with IOMA=
P_WRITE.
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3351  	 */
22a4392ec217ca8 Christoph Hellwig 2021-11-02  3352  	WARN_ON(!(flags & (IOM=
AP_DAX | IOMAP_DIRECT)));
22a4392ec217ca8 Christoph Hellwig 2021-11-02 @3353  	if (flags & IOMAP_DAX)
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3354  		m_flags =3D EXT4_GET_=
BLOCKS_CREATE_ZERO;
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3355  	/*
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3356  	 * We use i_size inste=
ad of i_disksize here because delalloc writeback
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3357  	 * can complete at any=
 point during the I/O and subsequently push the
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3358  	 * i_disksize out to i=
_size. This could be beyond where direct I/O is
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3359  	 * happening and thus =
expose allocated blocks to direct I/O reads.
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3360  	 */
d0b040f5f2557b2 Jan Kara          2021-04-12  3361  	else if (((loff_t)map-=
>m_lblk << blkbits) >=3D i_size_read(inode))
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3362  		m_flags =3D EXT4_GET_=
BLOCKS_CREATE;
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3363  	else if (ext4_test_ino=
de_flag(inode, EXT4_INODE_EXTENTS))
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3364  		m_flags =3D EXT4_GET_=
BLOCKS_IO_CREATE_EXT;
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3365  =

378f32bab3714f0 Matthew Bobrowski 2019-11-05  3366  	ret =3D ext4_map_block=
s(handle, inode, map, m_flags);
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3367  =

378f32bab3714f0 Matthew Bobrowski 2019-11-05  3368  	/*
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3369  	 * We cannot fill hole=
s in indirect tree based inodes as that could
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3370  	 * expose stale data i=
n the case of a crash. Use the magic error code
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3371  	 * to fallback to buff=
ered I/O.
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3372  	 */
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3373  	if (!m_flags && !ret)
378f32bab3714f0 Matthew Bobrowski 2019-11-05  3374  		ret =3D -ENOTBLK;
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3375  =

776722e85d3b093 Jan Kara          2016-11-20  3376  	ext4_journal_stop(hand=
le);
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3377  	if (ret =3D=3D -ENOSPC=
 && ext4_should_retry_alloc(inode->i_sb, &retries))
776722e85d3b093 Jan Kara          2016-11-20  3378  		goto retry;
f063db5ee989aaf Matthew Bobrowski 2019-11-05  3379  =

776722e85d3b093 Jan Kara          2016-11-20  3380  	return ret;
776722e85d3b093 Jan Kara          2016-11-20  3381  }
776722e85d3b093 Jan Kara          2016-11-20  3382  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7887298834275272750==--

