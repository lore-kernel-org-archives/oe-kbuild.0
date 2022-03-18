Content-Type: multipart/mixed; boundary="===============5123275631720223671=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 242/346] fs/xfs/xfs_trace.c:52 xfs_btree_crack_agno_opdev() warn: bitwise AND condition is false here
Date: Sat, 19 Mar 2022 01:46:05 +0800
Message-ID: <202203190133.RsXMt3pF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5123275631720223671==
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
commit: c42b1a06786a60b83b0a4eff298255977355329b [242/346] xfs: widen xfs_r=
map_irec fields to handle realtime rmapbt
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: openrisc-randconfig-m031-20220317 (https://download.01.org/0day-ci/=
archive/20220319/202203190133.RsXMt3pF-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/xfs/xfs_trace.c:52 xfs_btree_crack_agno_opdev() warn: bitwise AND condit=
ion is false here

vim +52 fs/xfs/xfs_trace.c

0b1b213fcf3a84 fs/xfs/linux-2.6/xfs_trace.c Christoph Hellwig 2009-12-14  4=
5  =

c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  4=
6  static inline void
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  4=
7  xfs_btree_crack_agno_opdev(
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  4=
8  	struct xfs_btree_cur	*cur,
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  4=
9  	xfs_agnumber_t		*agno,
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  5=
0  	dev_t			*opdev)
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  5=
1  {
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06 @5=
2  	if (cur->bc_flags & XFS_BTREE_IN_MEMORY) {
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  5=
3  		*agno =3D 0;
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  5=
4  		*opdev =3D xfbtree_target(cur->bc_mem.xfbtree)->bt_dev;
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  5=
5  	} else if (cur->bc_flags & XFS_BTREE_ROOT_IN_INODE) {
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  5=
6  		*agno =3D 0;
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  5=
7  		*opdev =3D cur->bc_mp->m_rtdev_targp->bt_dev;
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  5=
8  	} else {
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  5=
9  		*agno =3D cur->bc_ag.pag->pag_agno;
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  6=
0  		*opdev =3D cur->bc_mp->m_super->s_dev;
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  6=
1  	}
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  6=
2  }
c42b1a06786a60 fs/xfs/xfs_trace.c           Darrick J. Wong   2022-01-06  6=
3  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5123275631720223671==--

