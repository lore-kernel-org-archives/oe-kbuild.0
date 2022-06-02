Content-Type: multipart/mixed; boundary="===============4888866609793892772=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 150/401] fs/xfs/scrub/nlinks_repair.c:80 xrep_nlinks_repair_inode() warn: missing error code 'error'
Date: Thu, 02 Jun 2022 22:04:45 +0800
Message-ID: <202206022146.2RgP2bEQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4888866609793892772==
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
commit: 75be7c3d8d488788289ec6e343e138db5a2b2440 [150/401] xfs: teach repai=
r to fix file nlinks
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: microblaze-randconfig-m031-20220601 (https://download.01.org/0day-c=
i/archive/20220602/202206022146.2RgP2bEQ-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/scrub/nlinks_repair.c:80 xrep_nlinks_repair_inode() warn: missing er=
ror code 'error'

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: u=
ninitialized symbol 'sp'.

vim +/error +80 fs/xfs/scrub/nlinks_repair.c

75be7c3d8d4887 Darrick J. Wong 2022-01-06   27  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   28  /*
75be7c3d8d4887 Darrick J. Wong 2022-01-06   29   * Live Inode Link Count Re=
pair
75be7c3d8d4887 Darrick J. Wong 2022-01-06   30   * =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
75be7c3d8d4887 Darrick J. Wong 2022-01-06   31   *
75be7c3d8d4887 Darrick J. Wong 2022-01-06   32   * Use the live inode link =
count information that we collected to replace the
75be7c3d8d4887 Darrick J. Wong 2022-01-06   33   * nlink values of the inco=
re inodes.  A scrub->repair cycle should have left
75be7c3d8d4887 Darrick J. Wong 2022-01-06   34   * the live data and hooks =
active, so this is safe so long as we make sure the
75be7c3d8d4887 Darrick J. Wong 2022-01-06   35   * inode is locked.
75be7c3d8d4887 Darrick J. Wong 2022-01-06   36   */
75be7c3d8d4887 Darrick J. Wong 2022-01-06   37  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   38  /*
75be7c3d8d4887 Darrick J. Wong 2022-01-06   39   * Correct the link count o=
f the given inode.  Because we have to grab locks
75be7c3d8d4887 Darrick J. Wong 2022-01-06   40   * and resources in a certa=
in order, it's possible that this will be a no-op.
75be7c3d8d4887 Darrick J. Wong 2022-01-06   41   */
75be7c3d8d4887 Darrick J. Wong 2022-01-06   42  STATIC int
75be7c3d8d4887 Darrick J. Wong 2022-01-06   43  xrep_nlinks_repair_inode(
75be7c3d8d4887 Darrick J. Wong 2022-01-06   44  	struct xchk_nlink_ctrs	*xn=
c)
75be7c3d8d4887 Darrick J. Wong 2022-01-06   45  {
75be7c3d8d4887 Darrick J. Wong 2022-01-06   46  	struct xchk_nlink	obs;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   47  	struct xfs_scrub	*sc =3D x=
nc->sc;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   48  	struct xfs_mount	*mp =3D s=
c->mp;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   49  	struct xfs_inode	*ip =3D s=
c->ip;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   50  	uint64_t		total_links;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   51  	unsigned int		actual_nlink;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   52  	int			error;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   53  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   54  	xfs_ilock(ip, XFS_IOLOCK_E=
XCL);
75be7c3d8d4887 Darrick J. Wong 2022-01-06   55  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   56  	error =3D xfs_trans_alloc(=
mp, &M_RES(mp)->tr_link, 0, 0, 0, &sc->tp);
75be7c3d8d4887 Darrick J. Wong 2022-01-06   57  	if (error)
75be7c3d8d4887 Darrick J. Wong 2022-01-06   58  		goto out_iolock;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   59  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   60  	xfs_ilock(ip, XFS_ILOCK_EX=
CL);
75be7c3d8d4887 Darrick J. Wong 2022-01-06   61  	xfs_trans_ijoin(sc->tp, ip=
, 0);
75be7c3d8d4887 Darrick J. Wong 2022-01-06   62  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   63  	mutex_lock(&xnc->lock);
75be7c3d8d4887 Darrick J. Wong 2022-01-06   64  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   65  	if (xchk_iscan_aborted(&xn=
c->collect_iscan)) {
75be7c3d8d4887 Darrick J. Wong 2022-01-06   66  		error =3D -ECANCELED;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   67  		goto out_scanlock;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   68  	}
75be7c3d8d4887 Darrick J. Wong 2022-01-06   69  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   70  	error =3D xfarray_load_spa=
rse(xnc->nlinks, ip->i_ino, &obs);
75be7c3d8d4887 Darrick J. Wong 2022-01-06   71  	if (error)
75be7c3d8d4887 Darrick J. Wong 2022-01-06   72  		goto out_scanlock;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   73  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   74  	total_links =3D xchk_nlink=
_total(&obs);
75be7c3d8d4887 Darrick J. Wong 2022-01-06   75  	actual_nlink =3D VFS_I(ip)=
->i_nlink;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   76  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   77  	/* Cannot set more than th=
e maxiumum possible link count. */
75be7c3d8d4887 Darrick J. Wong 2022-01-06   78  	if (total_links > U32_MAX)=
 {
75be7c3d8d4887 Darrick J. Wong 2022-01-06   79  		trace_xrep_nlinks_unfixab=
le_inode(mp, ip, &obs);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  @80  		goto out_scanlock;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   81  	}
75be7c3d8d4887 Darrick J. Wong 2022-01-06   82  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   83  	/*
75be7c3d8d4887 Darrick J. Wong 2022-01-06   84  	 * Linked directories shou=
ld have at least one "child" (the dot entry)
75be7c3d8d4887 Darrick J. Wong 2022-01-06   85  	 * pointing up to them.
75be7c3d8d4887 Darrick J. Wong 2022-01-06   86  	 */
75be7c3d8d4887 Darrick J. Wong 2022-01-06   87  	if (S_ISDIR(VFS_I(ip)->i_m=
ode) && actual_nlink > 0 &&
75be7c3d8d4887 Darrick J. Wong 2022-01-06   88  					  obs.children =3D=3D =
0) {
75be7c3d8d4887 Darrick J. Wong 2022-01-06   89  		trace_xrep_nlinks_unfixab=
le_inode(mp, ip, &obs);
75be7c3d8d4887 Darrick J. Wong 2022-01-06   90  		goto out_scanlock;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   91  	}
75be7c3d8d4887 Darrick J. Wong 2022-01-06   92  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   93  	/* Non-directories cannot =
have directories pointing up to them. */
75be7c3d8d4887 Darrick J. Wong 2022-01-06   94  	if (!S_ISDIR(VFS_I(ip)->i_=
mode) && obs.children !=3D 0) {
75be7c3d8d4887 Darrick J. Wong 2022-01-06   95  		trace_xrep_nlinks_unfixab=
le_inode(mp, ip, &obs);
75be7c3d8d4887 Darrick J. Wong 2022-01-06   96  		goto out_scanlock;
75be7c3d8d4887 Darrick J. Wong 2022-01-06   97  	}
75be7c3d8d4887 Darrick J. Wong 2022-01-06   98  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06   99  	/*
75be7c3d8d4887 Darrick J. Wong 2022-01-06  100  	 * We did not find any lin=
ks to this inode.  If the inode agrees, we
75be7c3d8d4887 Darrick J. Wong 2022-01-06  101  	 * have nothing further to=
 do.  If not, the inode has a nonzero link
75be7c3d8d4887 Darrick J. Wong 2022-01-06  102  	 * count and we don't have=
 anywhere to graft the child onto.  Dropping
75be7c3d8d4887 Darrick J. Wong 2022-01-06  103  	 * a live inode's link cou=
nt to zero can cause unexpected shutdowns in
75be7c3d8d4887 Darrick J. Wong 2022-01-06  104  	 * inactivation, so leave =
it alone.
75be7c3d8d4887 Darrick J. Wong 2022-01-06  105  	 */
75be7c3d8d4887 Darrick J. Wong 2022-01-06  106  	if (total_links =3D=3D 0) {
75be7c3d8d4887 Darrick J. Wong 2022-01-06  107  		if (actual_nlink !=3D 0)
75be7c3d8d4887 Darrick J. Wong 2022-01-06  108  			trace_xrep_nlinks_unfixa=
ble_inode(mp, ip, &obs);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  109  		goto out_scanlock;
75be7c3d8d4887 Darrick J. Wong 2022-01-06  110  	}
75be7c3d8d4887 Darrick J. Wong 2022-01-06  111  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06  112  	/* Perfect match means we'=
re done. */
75be7c3d8d4887 Darrick J. Wong 2022-01-06  113  	if (total_links =3D=3D act=
ual_nlink)
75be7c3d8d4887 Darrick J. Wong 2022-01-06  114  		goto out_scanlock;
75be7c3d8d4887 Darrick J. Wong 2022-01-06  115  	mutex_unlock(&xnc->lock);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  116  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06  117  	/* Commit the new link cou=
nt. */
75be7c3d8d4887 Darrick J. Wong 2022-01-06  118  	trace_xrep_nlinks_update_i=
node(mp, ip, &obs);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  119  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06  120  	set_nlink(VFS_I(ip), total=
_links);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  121  	xfs_trans_log_inode(sc->tp=
, ip, XFS_ILOG_CORE);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  122  	error =3D xfs_trans_commit=
(sc->tp);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  123  	sc->tp =3D NULL;
75be7c3d8d4887 Darrick J. Wong 2022-01-06  124  	if (error)
75be7c3d8d4887 Darrick J. Wong 2022-01-06  125  		goto out_ilock;
75be7c3d8d4887 Darrick J. Wong 2022-01-06  126  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06  127  	xfs_iunlock(ip, XFS_ILOCK_=
EXCL);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  128  	xfs_iunlock(ip, XFS_IOLOCK=
_EXCL);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  129  	return 0;
75be7c3d8d4887 Darrick J. Wong 2022-01-06  130  =

75be7c3d8d4887 Darrick J. Wong 2022-01-06  131  out_scanlock:
75be7c3d8d4887 Darrick J. Wong 2022-01-06  132  	mutex_unlock(&xnc->lock);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  133  	xchk_trans_cancel(sc);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  134  out_ilock:
75be7c3d8d4887 Darrick J. Wong 2022-01-06  135  	xfs_iunlock(ip, XFS_ILOCK_=
EXCL);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  136  out_iolock:
75be7c3d8d4887 Darrick J. Wong 2022-01-06  137  	xfs_iunlock(ip, XFS_IOLOCK=
_EXCL);
75be7c3d8d4887 Darrick J. Wong 2022-01-06  138  	return error;
75be7c3d8d4887 Darrick J. Wong 2022-01-06  139  }
75be7c3d8d4887 Darrick J. Wong 2022-01-06  140  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4888866609793892772==--

