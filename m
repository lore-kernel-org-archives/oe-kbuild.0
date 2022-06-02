Content-Type: multipart/mixed; boundary="===============7972079280965500138=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 321/401] fs/xfs/scrub/rtrmap.c:114 xchk_rtrmap_mergeable() warn: impossible condition '(r1->rm_blockcount + r2->rm_blockcount > (~0)) => (0-u64max > u64max)'
Date: Fri, 03 Jun 2022 05:02:18 +0800
Message-ID: <202206030432.tbR1R87C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7972079280965500138==
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
head:   1fcd9cea011a657d62ee332d161966c1ec92ffd5
commit: 4e21f42d6ab0dbc3fedbd0a56895302d363f17ac [321/401] xfs: scrub the r=
ealtime rmapbt
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: microblaze-randconfig-m031-20220601 (https://download.01.org/0day-c=
i/archive/20220603/202206030432.tbR1R87C-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/xfs/scrub/rtrmap.c:114 xchk_rtrmap_mergeable() warn: impossible conditio=
n '(r1->rm_blockcount + r2->rm_blockcount > (~0)) =3D> (0-u64max > u64max)'

vim +114 fs/xfs/scrub/rtrmap.c

4e21f42d6ab0db Darrick J. Wong 2022-01-06   96  =

4e21f42d6ab0db Darrick J. Wong 2022-01-06   97  /* Decide if two reverse-ma=
pping records can be merged. */
4e21f42d6ab0db Darrick J. Wong 2022-01-06   98  static inline bool
4e21f42d6ab0db Darrick J. Wong 2022-01-06   99  xchk_rtrmap_mergeable(
4e21f42d6ab0db Darrick J. Wong 2022-01-06  100  	struct xchk_rtrmap		*cr,
4e21f42d6ab0db Darrick J. Wong 2022-01-06  101  	const struct xfs_rmap_irec=
	*r2)
4e21f42d6ab0db Darrick J. Wong 2022-01-06  102  {
4e21f42d6ab0db Darrick J. Wong 2022-01-06  103  	const struct xfs_rmap_irec=
	*r1 =3D &cr->prev_rec;
4e21f42d6ab0db Darrick J. Wong 2022-01-06  104  =

4e21f42d6ab0db Darrick J. Wong 2022-01-06  105  	/* Ignore if prev_rec is n=
ot yet initialized. */
4e21f42d6ab0db Darrick J. Wong 2022-01-06  106  	if (cr->prev_rec.rm_blockc=
ount =3D=3D 0)
4e21f42d6ab0db Darrick J. Wong 2022-01-06  107  		return false;
4e21f42d6ab0db Darrick J. Wong 2022-01-06  108  =

4e21f42d6ab0db Darrick J. Wong 2022-01-06  109  	if (r1->rm_owner !=3D r2->=
rm_owner)
4e21f42d6ab0db Darrick J. Wong 2022-01-06  110  		return false;
4e21f42d6ab0db Darrick J. Wong 2022-01-06  111  	if (r1->rm_startblock + r1=
->rm_blockcount !=3D r2->rm_startblock)
4e21f42d6ab0db Darrick J. Wong 2022-01-06  112  		return false;
4e21f42d6ab0db Darrick J. Wong 2022-01-06  113  	if ((unsigned long long)r1=
->rm_blockcount + r2->rm_blockcount >
4e21f42d6ab0db Darrick J. Wong 2022-01-06 @114  	    XFS_RTRMAP_LEN_MAX)
4e21f42d6ab0db Darrick J. Wong 2022-01-06  115  		return false;
4e21f42d6ab0db Darrick J. Wong 2022-01-06  116  	if (r1->rm_flags !=3D r2->=
rm_flags)
4e21f42d6ab0db Darrick J. Wong 2022-01-06  117  		return false;
4e21f42d6ab0db Darrick J. Wong 2022-01-06  118  	return r1->rm_offset + r1-=
>rm_blockcount =3D=3D r2->rm_offset;
4e21f42d6ab0db Darrick J. Wong 2022-01-06  119  }
4e21f42d6ab0db Darrick J. Wong 2022-01-06  120  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7972079280965500138==--

