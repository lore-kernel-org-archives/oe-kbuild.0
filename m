Content-Type: multipart/mixed; boundary="===============0028452400289058849=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 224/401] fs/xfs/scrub/nlinks_repair.c:181 xrep_nlinks_repair_and_relink_inode() warn: missing error code 'error'
Date: Fri, 03 Jun 2022 02:48:53 +0800
Message-ID: <202206030214.gyg6sS63-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0028452400289058849==
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
commit: a8d4ca3b7da1be34e97bc3003e962d14c0a30b5a [224/401] xfs: move files =
to orphanage instead of letting nlinks drop to zero
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: microblaze-randconfig-m031-20220601 (https://download.01.org/0day-c=
i/archive/20220603/202206030214.gyg6sS63-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/scrub/nlinks_repair.c:181 xrep_nlinks_repair_and_relink_inode() warn=
: missing error code 'error'

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: u=
ninitialized symbol 'sp'.
fs/xfs/scrub/nlinks_repair.c:338 xrep_nlinks_repair_inode() warn: missing e=
rror code 'error'

vim +/error +181 fs/xfs/scrub/nlinks_repair.c

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  109  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  110  /*
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  111   * Correct the link count o=
f the given inode or move it to the orphanage.
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  112   * Because we have to grab =
locks and resources in a certain order, it's
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  113   * possible that this will =
be a no-op.
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  114   */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  115  STATIC int
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  116  xrep_nlinks_repair_and_reli=
nk_inode(
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  117  	struct xchk_nlink_ctrs		*x=
nc)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  118  {
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  119  	struct xchk_nlink		obs;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  120  	struct xfs_scrub		*sc =3D =
xnc->sc;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  121  	struct xrep_orphanage_req	=
*orph =3D xrep_nlinks_orphanage_req(sc);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  122  	struct xfs_mount		*mp =3D =
sc->mp;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  123  	struct xfs_inode		*ip =3D =
sc->ip;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  124  	uint64_t			total_links;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  125  	unsigned int			actual_nlin=
k;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  126  	bool				orphan =3D false;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  127  	int				error;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  128  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  129  	/*
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  130  	 * Ignore temporary files =
being used to stage repairs, since we assume
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  131  	 * they're correct for non=
-directories, and the directory repair code
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  132  	 * doesn't bump the link c=
ounts for the children.
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  133  	 */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  134  	if (xrep_is_tempfile(ip))
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  135  		return 0;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  136  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  137  	/* Grab the IOLOCK of the =
orphanage and the child directory. */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  138  	error =3D xrep_orphanage_i=
olock_two(sc);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  139  	if (error)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  140  		return error;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  141  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  142  	/*
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  143  	 * Allocate a transaction =
for the adoption.  We'll reserve space for
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  144  	 * the transaction in the =
adoption preparation step.
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  145  	 */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  146  	xrep_orphanage_compute_blk=
res(sc, orph);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  147  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  148  	error =3D xfs_trans_alloc(=
mp, &M_RES(mp)->tr_link, 0, 0, 0, &sc->tp);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  149  	if (error)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  150  		goto out_iolock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  151  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  152  	/*
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  153  	 * Before we take the ILOC=
Ks, compute the name of the potential
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  154  	 * orphanage directory ent=
ry.
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  155  	 */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  156  	error =3D xrep_orphanage_c=
ompute_name(orph, xrep_nlinks_namebuf(sc));
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  157  	if (error)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  158  		goto out_trans;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  159  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  160  	error =3D xrep_orphanage_a=
doption_prep(orph);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  161  	if (error)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  162  		goto out_trans;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  163  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  164  	mutex_lock(&xnc->lock);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  165  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  166  	if (xchk_iscan_aborted(&xn=
c->collect_iscan)) {
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  167  		error =3D -ECANCELED;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  168  		goto out_scanlock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  169  	}
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  170  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  171  	error =3D xfarray_load_spa=
rse(xnc->nlinks, ip->i_ino, &obs);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  172  	if (error)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  173  		goto out_scanlock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  174  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  175  	total_links =3D xchk_nlink=
_total(&obs);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  176  	actual_nlink =3D VFS_I(ip)=
->i_nlink;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  177  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  178  	/* Cannot set more than th=
e maxiumum possible link count. */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  179  	if (total_links > U32_MAX)=
 {
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  180  		trace_xrep_nlinks_unfixab=
le_inode(mp, ip, &obs);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06 @181  		goto out_scanlock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  182  	}
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  183  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  184  	/*
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  185  	 * Linked directories shou=
ld have at least one "child" (the dot entry)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  186  	 * pointing up to them.
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  187  	 */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  188  	if (S_ISDIR(VFS_I(ip)->i_m=
ode) && actual_nlink > 0 &&
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  189  					  obs.children =3D=3D =
0) {
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  190  		trace_xrep_nlinks_unfixab=
le_inode(mp, ip, &obs);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  191  		goto out_scanlock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  192  	}
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  193  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  194  	/* Non-directories cannot =
have directories pointing up to them. */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  195  	if (!S_ISDIR(VFS_I(ip)->i_=
mode) && obs.children > 0) {
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  196  		trace_xrep_nlinks_unfixab=
le_inode(mp, ip, &obs);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  197  		goto out_scanlock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  198  	}
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  199  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  200  	/*
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  201  	 * Decide if we're going t=
o move this file to the orphanage, and fix
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  202  	 * up the incore link coun=
ts if we are.
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  203  	 */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  204  	if (xrep_nlinks_is_orphane=
d(sc, ip, actual_nlink, &obs)) {
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  205  		obs.parents++;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  206  		total_links++;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  207  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  208  		error =3D xrep_nlinks_set=
_record(xnc, ip->i_ino, &obs);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  209  		if (error)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  210  			goto out_scanlock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  211  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  212  		orphan =3D true;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  213  	}
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  214  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  215  	/*
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  216  	 * We did not find any lin=
ks to this inode and we're not planning to
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  217  	 * move it to the orphanag=
e.  If the inode link count is also zero, we
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  218  	 * have nothing further to=
 do.  Otherwise, the situation is unfixable.
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  219  	 */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  220  	if (total_links =3D=3D 0) {
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  221  		if (actual_nlink !=3D 0)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  222  			trace_xrep_nlinks_unfixa=
ble_inode(mp, ip, &obs);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  223  		goto out_scanlock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  224  	}
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  225  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  226  	/* If the inode has the co=
rrect link count and isn't orphaned, exit. */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  227  	if (total_links =3D=3D act=
ual_nlink && !orphan)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  228  		goto out_scanlock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  229  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  230  	/* Commit the new link cou=
nt. */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  231  	trace_xrep_nlinks_update_i=
node(mp, ip, &obs);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  232  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  233  	/*
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  234  	 * If this is an orphan, c=
reate the new name in the orphanage, and bump
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  235  	 * the link count of the o=
rphanage if we just added a directory.  Then
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  236  	 * we can set the correct =
nlink.
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  237  	 */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  238  	if (orphan) {
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  239  		error =3D xrep_orphanage_=
adopt(orph);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  240  		if (error)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  241  			goto out_scanlock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  242  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  243  		/*
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  244  		 * If the child is a dire=
ctory, we need to bump the incore link
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  245  		 * count of the orphanage=
 to account for the new orphan's
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  246  		 * child subdirectory ent=
ry.
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  247  		 */
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  248  		if (S_ISDIR(VFS_I(ip)->i_=
mode)) {
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  249  			error =3D xfarray_load_s=
parse(xnc->nlinks,
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  250  					sc->orphanage->i_ino, =
&obs);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  251  			if (error)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  252  				goto out_scanlock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  253  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  254  			obs.flags |=3D XCHK_NLIN=
K_WRITTEN;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  255  			obs.children++;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  256  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  257  			error =3D xrep_nlinks_se=
t_record(xnc,
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  258  					sc->orphanage->i_ino, =
&obs);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  259  			if (error)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  260  				goto out_scanlock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  261  		}
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  262  	}
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  263  	set_nlink(VFS_I(ip), total=
_links);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  264  	xfs_trans_log_inode(sc->tp=
, ip, XFS_ILOG_CORE);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  265  	mutex_unlock(&xnc->lock);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  266  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  267  	error =3D xrep_trans_commi=
t(sc);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  268  	if (error)
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  269  		goto out_ilock;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  270  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  271  	xchk_iunlock(sc, XFS_ILOCK=
_EXCL | XFS_IOLOCK_EXCL);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  272  	xrep_orphanage_iunlock(sc,=
 XFS_ILOCK_EXCL | XFS_IOLOCK_EXCL);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  273  	return 0;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  274  =

a8d4ca3b7da1be Darrick J. Wong 2022-01-06  275  out_scanlock:
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  276  	mutex_unlock(&xnc->lock);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  277  out_trans:
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  278  	xchk_trans_cancel(sc);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  279  out_ilock:
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  280  	xchk_iunlock(sc, XFS_ILOCK=
_EXCL);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  281  	xrep_orphanage_iunlock(sc,=
 XFS_ILOCK_EXCL);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  282  out_iolock:
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  283  	xchk_iunlock(sc, XFS_IOLOC=
K_EXCL);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  284  	xrep_orphanage_iunlock(sc,=
 XFS_IOLOCK_EXCL);
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  285  	return error;
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  286  }
a8d4ca3b7da1be Darrick J. Wong 2022-01-06  287  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0028452400289058849==--

