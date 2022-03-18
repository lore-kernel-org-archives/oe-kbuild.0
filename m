Content-Type: multipart/mixed; boundary="===============1053822274237322349=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 118/346] fs/xfs/xfs_buf.c:2495 xfs_buftarg_nr_sectors() warn: bitwise AND condition is false here
Date: Fri, 18 Mar 2022 22:53:27 +0800
Message-ID: <202203182211.ZToeiUKO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1053822274237322349==
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
commit: d3f41663fd239d8c9cc08e903657993c7b230e49 [118/346] xfs: support in-=
memory btrees
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: openrisc-randconfig-m031-20220317 (https://download.01.org/0day-ci/=
archive/20220318/202203182211.ZToeiUKO-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/xfs_buf.c:2495 xfs_buftarg_nr_sectors() warn: bitwise AND condition =
is false here

Old smatch warnings:
fs/xfs/xfs_buf.c:863 xfs_buf_readahead_map() warn: bitwise AND condition is=
 false here
fs/xfs/xfs_buf.c:1605 _xfs_buf_ioapply() warn: bitwise AND condition is fal=
se here
fs/xfs/xfs_buf.c:1962 xfs_free_buftarg() warn: bitwise AND condition is fal=
se here

vim +2495 fs/xfs/xfs_buf.c

d3f41663fd239d Darrick J. Wong 2022-01-06  2489  =

d3f41663fd239d Darrick J. Wong 2022-01-06  2490  /* Return the number of se=
ctors for a buffer target. */
d3f41663fd239d Darrick J. Wong 2022-01-06  2491  xfs_daddr_t
d3f41663fd239d Darrick J. Wong 2022-01-06  2492  xfs_buftarg_nr_sectors(
d3f41663fd239d Darrick J. Wong 2022-01-06  2493  	struct xfs_buftarg	*btp)
d3f41663fd239d Darrick J. Wong 2022-01-06  2494  {
d3f41663fd239d Darrick J. Wong 2022-01-06 @2495  	if (btp->bt_flags & XFS_B=
UFTARG_IN_MEMORY)

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1053822274237322349==--

