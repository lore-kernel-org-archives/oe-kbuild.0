Content-Type: multipart/mixed; boundary="===============7104342491141256441=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 224/327] fs/xfs/xfs_trace.c:52 xfs_btree_crack_agno_opdev() warn: bitwise AND condition is false here
Date: Sat, 01 Jan 2022 16:02:18 +0800
Message-ID: <202201011542.eNvmpkrU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7104342491141256441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   7bd5ed813c460c39b9ed735852970905ad0a633b
commit: fd8343d07120e92935e46b6fcad1301377c0219f [224/327] xfs: widen xfs_r=
map_irec fields to handle realtime rmapbt
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-m001-20220101 (https://download.01.org/0day-ci/ar=
chive/20220101/202201011542.eNvmpkrU-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/xfs/xfs_trace.c:52 xfs_btree_crack_agno_opdev() warn: bitwise AND condit=
ion is false here

vim +52 fs/xfs/xfs_trace.c

0b1b213fcf3a84 fs/xfs/linux-2.6/xfs_trace.c Christoph Hellwig 2009-12-14  4=
5  =

fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  4=
6  static inline void
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  4=
7  xfs_btree_crack_agno_opdev(
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  4=
8  	struct xfs_btree_cur	*cur,
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  4=
9  	xfs_agnumber_t		*agno,
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  5=
0  	dev_t			*opdev)
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  5=
1  {
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01 @5=
2  	if (cur->bc_flags & XFS_BTREE_IN_MEMORY) {
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  5=
3  		*agno =3D 0;
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  5=
4  		*opdev =3D xfbtree_target(cur->bc_mem.xfbtree)->bt_dev;
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  5=
5  	} else if (cur->bc_flags & XFS_BTREE_ROOT_IN_INODE) {
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  5=
6  		*agno =3D 0;
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  5=
7  		*opdev =3D cur->bc_mp->m_rtdev_targp->bt_dev;
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  5=
8  	} else {
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  5=
9  		*agno =3D cur->bc_ag.pag->pag_agno;
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  6=
0  		*opdev =3D cur->bc_mp->m_super->s_dev;
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  6=
1  	}
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  6=
2  }
fd8343d07120e9 fs/xfs/xfs_trace.c           Darrick J. Wong   2021-09-01  6=
3  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7104342491141256441==--

