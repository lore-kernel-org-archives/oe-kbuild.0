Content-Type: multipart/mixed; boundary="===============2903225480302101755=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 115/346] fs/xfs/xfs_buf.h:393 xfs_buftarg_bdev() warn: bitwise AND condition is false here
Date: Fri, 18 Mar 2022 19:59:29 +0800
Message-ID: <202203181900.w3G758Hv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2903225480302101755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   37f1eaa855b8115b247530a5e8081189a09db2de
commit: d60a1df8d9dfa54d473d840dc1d573b404eccd39 [115/346] xfs: support in-=
memory buffer cache targets
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: openrisc-randconfig-m031-20220317 (https://download.01.org/0day-ci/=
archive/20220318/202203181900.w3G758Hv-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/xfs_buf.h:393 xfs_buftarg_bdev() warn: bitwise AND condition is fals=
e here
fs/xfs/xfs_buf.h:430 xfs_buftarg_zeroout() warn: bitwise AND condition is f=
alse here
fs/xfs/xfs_buf.c:863 xfs_buf_readahead_map() warn: bitwise AND condition is=
 false here
fs/xfs/xfs_buf.c:1605 _xfs_buf_ioapply() warn: bitwise AND condition is fal=
se here
fs/xfs/xfs_buf.c:1962 xfs_free_buftarg() warn: bitwise AND condition is fal=
se here
fs/xfs/xfs_buf.h:417 xfs_buftarg_flush() warn: bitwise AND condition is fal=
se here
fs/xfs/xfs_buf.h:401 xfs_getsize_buftarg() warn: bitwise AND condition is f=
alse here
fs/xfs/xfs_buf.h:409 xfs_readonly_buftarg() warn: bitwise AND condition is =
false here
fs/xfs/xfs_buf.h:393 xfs_buftarg_bdev() warn: bitwise AND condition is fals=
e here
fs/xfs/xfs_buf.h:409 xfs_readonly_buftarg() warn: bitwise AND condition is =
false here
fs/xfs/xfs_buf.h:393 xfs_buftarg_bdev() warn: bitwise AND condition is fals=
e here
fs/xfs/xfs_buf.h:417 xfs_buftarg_flush() warn: bitwise AND condition is fal=
se here
fs/xfs/xfs_buf.h:393 xfs_buftarg_bdev() warn: bitwise AND condition is fals=
e here
fs/xfs/xfs_buf.h:409 xfs_readonly_buftarg() warn: bitwise AND condition is =
false here

Old smatch warnings:
fs/xfs/xfs_log_cil.c:608 xlog_discard_busy_extents() warn: should '(busyp->=
length) << mp->m_blkbb_log' be a 64 bit type?
fs/xfs/xfs_log.c:1938 xlog_write_iclog() warn: inconsistent returns '&iclog=
->ic_sema'.
fs/xfs/xfs_log.c:3344 xfs_log_force() warn: inconsistent returns '&log->l_i=
cloglock'.
fs/xfs/xfs_log.c:3442 xlog_force_lsn() warn: inconsistent returns '&log->l_=
icloglock'.
fs/xfs/xfs_log.c:3703 xlog_verify_tail_lsn() warn: inconsistent indenting

vim +393 fs/xfs/xfs_buf.h

d808f617ad00a4 fs/xfs/linux-2.6/xfs_buf.h Dave Chinner    2010-02-02  389  =

d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  390  =
static inline struct block_device *
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  391  =
xfs_buftarg_bdev(struct xfs_buftarg *btp)
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  392  {
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06 @393  =
	if (btp->bt_flags & XFS_BUFTARG_IN_MEMORY)
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  394  =
		return NULL;
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  395  =
	return btp->bt_bdev;
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  396  }
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  397  =

d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  398  =
static inline unsigned int
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  399  =
xfs_getsize_buftarg(struct xfs_buftarg *btp)
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  400  {
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06 @401  =
	if (btp->bt_flags & XFS_BUFTARG_IN_MEMORY)
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  402  =
		return SECTOR_SIZE;
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  403  =
	return block_size(btp->bt_bdev);
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  404  }
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  405  =

d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  406  =
static inline bool
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  407  =
xfs_readonly_buftarg(struct xfs_buftarg *btp)
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  408  {
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06 @409  =
	if (btp->bt_flags & XFS_BUFTARG_IN_MEMORY)
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  410  =
		return false;
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  411  =
	return bdev_read_only(btp->bt_bdev);
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  412  }
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  413  =

d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  414  =
static inline int
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  415  =
xfs_buftarg_flush(struct xfs_buftarg *btp)
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  416  {
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06 @417  =
	if (btp->bt_flags & XFS_BUFTARG_IN_MEMORY)
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  418  =
		return 0;
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  419  =
	return blkdev_issue_flush(btp->bt_bdev);
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  420  }
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  421  =

d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  422  =
static inline int
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  423  =
xfs_buftarg_zeroout(
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  424  =
	struct xfs_buftarg	*btp,
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  425  =
	sector_t		sector,
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  426  =
	sector_t		nr_sects,
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  427  =
	gfp_t			gfp_mask,
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  428  =
	unsigned		flags)
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  429  {
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06 @430  =
	if (btp->bt_flags & XFS_BUFTARG_IN_MEMORY)
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  431  =
		return -EOPNOTSUPP;
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  432  =
	return blkdev_issue_zeroout(btp->bt_bdev, sector, nr_sects, gfp_mask,
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  433  =
			flags);
d60a1df8d9dfa5 fs/xfs/xfs_buf.h           Darrick J. Wong 2022-01-06  434  }
ce8e922c0e79c8 fs/xfs/linux-2.6/xfs_buf.h Nathan Scott    2006-01-11  435  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2903225480302101755==--

