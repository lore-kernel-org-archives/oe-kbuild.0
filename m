Content-Type: multipart/mixed; boundary="===============3371111891792021487=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [djwong-xfs:verifier-fixes 70/141] fs/xfs/xfs_icache.c:628 xfs_iget_cache_hit() warn: inconsistent returns 'spin_lock:&ip->i_flags_lock'.
Date: Sun, 27 Oct 2019 08:09:10 +0300
Message-ID: <20191027050910.GL23523@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3371111891792021487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t verifier-fixes
head:   789f4f4f1e144b5648c608d12771aefe85d36e61
commit: 3d361022d5b9c9a6a55270b99055788130d840ca [70/141] xfs: deferred ino=
de inactivation

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/xfs_icache.c:628 xfs_iget_cache_hit() warn: inconsistent returns 'sp=
in_lock:&ip->i_flags_lock'.
  Locked on:   line 601
  Unlocked on: line 623

Old smatch warnings:
include/linux/compiler.h:226 __write_once_size() warn: potential memory cor=
rupting cast 8 vs 4 bytes

# https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/comm=
it/?id=3D3d361022d5b9c9a6a55270b99055788130d840ca
git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/d=
jwong/xfs-linux.git
git remote update djwong-xfs
git checkout 3d361022d5b9c9a6a55270b99055788130d840ca
vim +628 fs/xfs/xfs_icache.c

33479e0542df06 Dave Chinner      2012-10-08  473  static int
33479e0542df06 Dave Chinner      2012-10-08  474  xfs_iget_cache_hit(
33479e0542df06 Dave Chinner      2012-10-08  475  	struct xfs_perag	*pag,
33479e0542df06 Dave Chinner      2012-10-08  476  	struct xfs_inode	*ip,
33479e0542df06 Dave Chinner      2012-10-08  477  	xfs_ino_t		ino,
33479e0542df06 Dave Chinner      2012-10-08  478  	int			flags,
33479e0542df06 Dave Chinner      2012-10-08  479  	int			lock_flags) __rele=
ases(RCU)
33479e0542df06 Dave Chinner      2012-10-08  480  {
33479e0542df06 Dave Chinner      2012-10-08  481  	struct inode		*inode =3D=
 VFS_I(ip);
33479e0542df06 Dave Chinner      2012-10-08  482  	struct xfs_mount	*mp =3D=
 ip->i_mount;
33479e0542df06 Dave Chinner      2012-10-08  483  	int			error;
33479e0542df06 Dave Chinner      2012-10-08  484  =

33479e0542df06 Dave Chinner      2012-10-08  485  	/*
33479e0542df06 Dave Chinner      2012-10-08  486  	 * check for re-use of a=
n inode within an RCU grace period due to the
33479e0542df06 Dave Chinner      2012-10-08  487  	 * radix tree nodes not =
being updated yet. We monitor for this by
33479e0542df06 Dave Chinner      2012-10-08  488  	 * setting the inode num=
ber to zero before freeing the inode structure.
33479e0542df06 Dave Chinner      2012-10-08  489  	 * If the inode has been=
 reallocated and set up, then the inode number
33479e0542df06 Dave Chinner      2012-10-08  490  	 * will not match, so ch=
eck for that, too.
33479e0542df06 Dave Chinner      2012-10-08  491  	 */
33479e0542df06 Dave Chinner      2012-10-08  492  	spin_lock(&ip->i_flags_l=
ock);
33479e0542df06 Dave Chinner      2012-10-08  493  	if (ip->i_ino !=3D ino) {
33479e0542df06 Dave Chinner      2012-10-08  494  		trace_xfs_iget_skip(ip);
ff6d6af2351cae Bill O'Donnell    2015-10-12  495  		XFS_STATS_INC(mp, xs_ig=
_frecycle);
2451337dd04390 Dave Chinner      2014-06-25  496  		error =3D -EAGAIN;
33479e0542df06 Dave Chinner      2012-10-08  497  		goto out_error;
33479e0542df06 Dave Chinner      2012-10-08  498  	}
33479e0542df06 Dave Chinner      2012-10-08  499  =

33479e0542df06 Dave Chinner      2012-10-08  500  =

33479e0542df06 Dave Chinner      2012-10-08  501  	/*
33479e0542df06 Dave Chinner      2012-10-08  502  	 * If we are racing with=
 another cache hit that is currently
33479e0542df06 Dave Chinner      2012-10-08  503  	 * instantiating this in=
ode or currently recycling it out of
3d361022d5b9c9 Darrick J. Wong   2019-08-30  504  	 * reclaimable state, wa=
it for the initialisation to complete
33479e0542df06 Dave Chinner      2012-10-08  505  	 * before continuing.
33479e0542df06 Dave Chinner      2012-10-08  506  	 *
33479e0542df06 Dave Chinner      2012-10-08  507  	 * XXX(hch): eventually =
we should do something equivalent to
33479e0542df06 Dave Chinner      2012-10-08  508  	 *	     wait_on_inode to=
 wait for these flags to be cleared
33479e0542df06 Dave Chinner      2012-10-08  509  	 *	     instead of polli=
ng for it.
33479e0542df06 Dave Chinner      2012-10-08  510  	 */
3d361022d5b9c9 Darrick J. Wong   2019-08-30  511  	if (ip->i_flags & (XFS_I=
NEW | XFS_IRECLAIM | XFS_INACTIVATING)) {
33479e0542df06 Dave Chinner      2012-10-08  512  		trace_xfs_iget_skip(ip);
ff6d6af2351cae Bill O'Donnell    2015-10-12  513  		XFS_STATS_INC(mp, xs_ig=
_frecycle);
2451337dd04390 Dave Chinner      2014-06-25  514  		error =3D -EAGAIN;
33479e0542df06 Dave Chinner      2012-10-08  515  		goto out_error;
33479e0542df06 Dave Chinner      2012-10-08  516  	}
33479e0542df06 Dave Chinner      2012-10-08  517  =

33479e0542df06 Dave Chinner      2012-10-08  518  	/*
afca6c5b2595fc Dave Chinner      2018-04-17  519  	 * Check the inode free =
state is valid. This also detects lookup
afca6c5b2595fc Dave Chinner      2018-04-17  520  	 * racing with unlinks.
33479e0542df06 Dave Chinner      2012-10-08  521  	 */
afca6c5b2595fc Dave Chinner      2018-04-17  522  	error =3D xfs_iget_check=
_free_state(ip, flags);
afca6c5b2595fc Dave Chinner      2018-04-17  523  	if (error)
33479e0542df06 Dave Chinner      2012-10-08  524  		goto out_error;
33479e0542df06 Dave Chinner      2012-10-08  525  =

33479e0542df06 Dave Chinner      2012-10-08  526  	/*
33479e0542df06 Dave Chinner      2012-10-08  527  	 * If IRECLAIMABLE is se=
t, we've torn down the VFS inode already.
33479e0542df06 Dave Chinner      2012-10-08  528  	 * Need to carefully get=
 it back into useable state.
33479e0542df06 Dave Chinner      2012-10-08  529  	 */
33479e0542df06 Dave Chinner      2012-10-08  530  	if (ip->i_flags & XFS_IR=
ECLAIMABLE) {
33479e0542df06 Dave Chinner      2012-10-08  531  		trace_xfs_iget_reclaim(=
ip);
33479e0542df06 Dave Chinner      2012-10-08  532  =

378f681c4b588c Darrick J. Wong   2017-06-19  533  		if (flags & XFS_IGET_IN=
CORE) {
378f681c4b588c Darrick J. Wong   2017-06-19  534  			error =3D -EAGAIN;
378f681c4b588c Darrick J. Wong   2017-06-19  535  			goto out_error;
378f681c4b588c Darrick J. Wong   2017-06-19  536  		}
378f681c4b588c Darrick J. Wong   2017-06-19  537  =

33479e0542df06 Dave Chinner      2012-10-08  538  		/*
33479e0542df06 Dave Chinner      2012-10-08  539  		 * We need to set XFS_I=
RECLAIM to prevent xfs_reclaim_inode
33479e0542df06 Dave Chinner      2012-10-08  540  		 * from stomping over u=
s while we recycle the inode.  We can't
33479e0542df06 Dave Chinner      2012-10-08  541  		 * clear the radix tree=
 reclaimable tag yet as it requires
33479e0542df06 Dave Chinner      2012-10-08  542  		 * pag_ici_lock to be h=
eld exclusive.
33479e0542df06 Dave Chinner      2012-10-08  543  		 */
33479e0542df06 Dave Chinner      2012-10-08  544  		ip->i_flags |=3D XFS_IR=
ECLAIM;
33479e0542df06 Dave Chinner      2012-10-08  545  =

33479e0542df06 Dave Chinner      2012-10-08  546  		spin_unlock(&ip->i_flag=
s_lock);
33479e0542df06 Dave Chinner      2012-10-08  547  		rcu_read_unlock();
33479e0542df06 Dave Chinner      2012-10-08  548  =

50997470ef95fd Dave Chinner      2016-02-09  549  		error =3D xfs_reinit_in=
ode(mp, inode);
33479e0542df06 Dave Chinner      2012-10-08  550  		if (error) {
756baca27fff3e Brian Foster      2017-04-26  551  			bool wake;
33479e0542df06 Dave Chinner      2012-10-08  552  			/*
33479e0542df06 Dave Chinner      2012-10-08  553  			 * Re-initializing the=
 inode failed, and we are in deep
33479e0542df06 Dave Chinner      2012-10-08  554  			 * trouble.  Try to re=
-add it to the reclaim list.
33479e0542df06 Dave Chinner      2012-10-08  555  			 */
33479e0542df06 Dave Chinner      2012-10-08  556  			rcu_read_lock();
33479e0542df06 Dave Chinner      2012-10-08  557  			spin_lock(&ip->i_flags=
_lock);
756baca27fff3e Brian Foster      2017-04-26  558  			wake =3D !!__xfs_iflag=
s_test(ip, XFS_INEW);
33479e0542df06 Dave Chinner      2012-10-08  559  			ip->i_flags &=3D ~(XFS=
_INEW | XFS_IRECLAIM);
756baca27fff3e Brian Foster      2017-04-26  560  			if (wake)
756baca27fff3e Brian Foster      2017-04-26  561  				wake_up_bit(&ip->i_fl=
ags, __XFS_INEW_BIT);
33479e0542df06 Dave Chinner      2012-10-08  562  			ASSERT(ip->i_flags & X=
FS_IRECLAIMABLE);
33479e0542df06 Dave Chinner      2012-10-08  563  			trace_xfs_iget_reclaim=
_fail(ip);
33479e0542df06 Dave Chinner      2012-10-08  564  			goto out_error;
33479e0542df06 Dave Chinner      2012-10-08  565  		}
33479e0542df06 Dave Chinner      2012-10-08  566  =

33479e0542df06 Dave Chinner      2012-10-08  567  		spin_lock(&pag->pag_ici=
_lock);
33479e0542df06 Dave Chinner      2012-10-08  568  		spin_lock(&ip->i_flags_=
lock);
33479e0542df06 Dave Chinner      2012-10-08  569  =

33479e0542df06 Dave Chinner      2012-10-08  570  		/*
33479e0542df06 Dave Chinner      2012-10-08  571  		 * Clear the per-lifeti=
me state in the inode as we are now
33479e0542df06 Dave Chinner      2012-10-08  572  		 * effectively a new in=
ode and need to return to the initial
33479e0542df06 Dave Chinner      2012-10-08  573  		 * state before reuse o=
ccurs.
33479e0542df06 Dave Chinner      2012-10-08  574  		 */
33479e0542df06 Dave Chinner      2012-10-08  575  		ip->i_flags &=3D ~XFS_I=
RECLAIM_RESET_FLAGS;
33479e0542df06 Dave Chinner      2012-10-08  576  		ip->i_flags |=3D XFS_IN=
EW;
545c0889d26d47 Dave Chinner      2016-05-18  577  		xfs_inode_clear_reclaim=
_tag(pag, ip->i_ino);
33479e0542df06 Dave Chinner      2012-10-08  578  		inode->i_state =3D I_NE=
W;
6772c1f11206f2 Darrick J. Wong   2019-04-12  579  		ip->i_sick =3D 0;
6772c1f11206f2 Darrick J. Wong   2019-04-12  580  		ip->i_checked =3D 0;
33479e0542df06 Dave Chinner      2012-10-08  581  =

6552321831dce8 Christoph Hellwig 2016-11-30  582  		ASSERT(!rwsem_is_locked=
(&inode->i_rwsem));
6552321831dce8 Christoph Hellwig 2016-11-30  583  		init_rwsem(&inode->i_rw=
sem);
33479e0542df06 Dave Chinner      2012-10-08  584  =

33479e0542df06 Dave Chinner      2012-10-08  585  		spin_unlock(&ip->i_flag=
s_lock);
33479e0542df06 Dave Chinner      2012-10-08  586  		spin_unlock(&pag->pag_i=
ci_lock);
3d361022d5b9c9 Darrick J. Wong   2019-08-30  587  	} else if (ip->i_flags &=
 XFS_NEED_INACTIVE) {
3d361022d5b9c9 Darrick J. Wong   2019-08-30  588  		/*
3d361022d5b9c9 Darrick J. Wong   2019-08-30  589  		 * If NEED_INACTIVE is =
set, we've torn down the VFS inode and
3d361022d5b9c9 Darrick J. Wong   2019-08-30  590  		 * need to carefully ge=
t it back into useable state.
3d361022d5b9c9 Darrick J. Wong   2019-08-30  591  		 */
3d361022d5b9c9 Darrick J. Wong   2019-08-30  592  		trace_xfs_iget_inactive=
(ip);
3d361022d5b9c9 Darrick J. Wong   2019-08-30  593  =

3d361022d5b9c9 Darrick J. Wong   2019-08-30  594  		if (flags & XFS_IGET_IN=
CORE) {
3d361022d5b9c9 Darrick J. Wong   2019-08-30  595  			error =3D -EAGAIN;
3d361022d5b9c9 Darrick J. Wong   2019-08-30  596  			goto out_error;
3d361022d5b9c9 Darrick J. Wong   2019-08-30  597  		}
3d361022d5b9c9 Darrick J. Wong   2019-08-30  598  =

3d361022d5b9c9 Darrick J. Wong   2019-08-30  599  		error =3D xfs_iget_inac=
tive(pag, ip);
3d361022d5b9c9 Darrick J. Wong   2019-08-30  600  		if (error)
3d361022d5b9c9 Darrick J. Wong   2019-08-30  601  			return error;

goto out_error;

33479e0542df06 Dave Chinner      2012-10-08  602  	} else {
33479e0542df06 Dave Chinner      2012-10-08  603  		/* If the VFS inode is =
being torn down, pause and try again. */
33479e0542df06 Dave Chinner      2012-10-08  604  		if (!igrab(inode)) {
33479e0542df06 Dave Chinner      2012-10-08  605  			trace_xfs_iget_skip(ip=
);
2451337dd04390 Dave Chinner      2014-06-25  606  			error =3D -EAGAIN;
33479e0542df06 Dave Chinner      2012-10-08  607  			goto out_error;
33479e0542df06 Dave Chinner      2012-10-08  608  		}
33479e0542df06 Dave Chinner      2012-10-08  609  =

33479e0542df06 Dave Chinner      2012-10-08  610  		/* We've got a live one=
. */
33479e0542df06 Dave Chinner      2012-10-08  611  		spin_unlock(&ip->i_flag=
s_lock);
33479e0542df06 Dave Chinner      2012-10-08  612  		rcu_read_unlock();
33479e0542df06 Dave Chinner      2012-10-08  613  		trace_xfs_iget_hit(ip);
33479e0542df06 Dave Chinner      2012-10-08  614  	}
33479e0542df06 Dave Chinner      2012-10-08  615  =

33479e0542df06 Dave Chinner      2012-10-08  616  	if (lock_flags !=3D 0)
33479e0542df06 Dave Chinner      2012-10-08  617  		xfs_ilock(ip, lock_flag=
s);
33479e0542df06 Dave Chinner      2012-10-08  618  =

378f681c4b588c Darrick J. Wong   2017-06-19  619  	if (!(flags & XFS_IGET_I=
NCORE))
33479e0542df06 Dave Chinner      2012-10-08  620  		xfs_iflags_clear(ip, XF=
S_ISTALE | XFS_IDONTCACHE);
ff6d6af2351cae Bill O'Donnell    2015-10-12  621  	XFS_STATS_INC(mp, xs_ig_=
found);
33479e0542df06 Dave Chinner      2012-10-08  622  =

33479e0542df06 Dave Chinner      2012-10-08  623  	return 0;
33479e0542df06 Dave Chinner      2012-10-08  624  =

33479e0542df06 Dave Chinner      2012-10-08  625  out_error:
33479e0542df06 Dave Chinner      2012-10-08  626  	spin_unlock(&ip->i_flags=
_lock);
33479e0542df06 Dave Chinner      2012-10-08  627  	rcu_read_unlock();
33479e0542df06 Dave Chinner      2012-10-08 @628  	return error;
33479e0542df06 Dave Chinner      2012-10-08  629  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============3371111891792021487==--

