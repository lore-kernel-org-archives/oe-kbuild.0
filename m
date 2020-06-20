Content-Type: multipart/mixed; boundary="===============7304220759312921106=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/xfs/libxfs/xfs_bmap.c:5563 __xfs_bunmapi() warn: Function too hairy. No more merges.
Date: Sun, 21 Jun 2020 04:03:02 +0800
Message-ID: <202006210453.AJzaq6rh%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7304220759312921106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4333a9b0b67bb4e8bcd91bdd80da80b0ec151162
commit: b0dff466c00975a3e3ec97e6b0266bfd3e4805d6 xfs: separate read-only va=
riables in struct xfs_mount
date:   3 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-m021-20200621 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/libxfs/xfs_bmap.c:5563 __xfs_bunmapi() warn: Function too hairy.  No=
 more merges.

Old smatch warnings:
fs/xfs/libxfs/xfs_bmap.c:5450 __xfs_bunmapi() error: we previously assumed =
'tp' could be null (see line 5290)
fs/xfs/libxfs/xfs_bmap.c:6123 __xfs_bmap_add() error: potential null derefe=
rence 'bi'.  (kmem_alloc returns null)

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Db0dff466c00975a3e3ec97e6b0266bfd3e4805d6
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout b0dff466c00975a3e3ec97e6b0266bfd3e4805d6
vim +5563 fs/xfs/libxfs/xfs_bmap.c

^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5234  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5235 =
 /*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5236 =
  * Unmap (remove) blocks from a file.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5237 =
  * If nexts is nonzero then the number of extents to remove is limited to
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5238 =
  * that value.  If not all extents in the block range can be removed then
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5239 =
  * *done is set.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5240 =
  */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5241 =
 int						/* error */
4453593be6c54e fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-10-03  5242 =
 __xfs_bunmapi(
ccd9d91148780a fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5243 =
 	struct xfs_trans	*tp,		/* transaction pointer */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5244 =
 	struct xfs_inode	*ip,		/* incore inode */
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5245 =
 	xfs_fileoff_t		start,		/* first file offset deleted */
4453593be6c54e fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-10-03  5246 =
 	xfs_filblks_t		*rlen,		/* i/o: amount remaining */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5247 =
 	int			flags,		/* misc flags */
2af528425342dc fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5248 =
 	xfs_extnum_t		nexts)		/* number of extents max */
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5249 =
 {
ccd9d91148780a fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5250 =
 	struct xfs_btree_cur	*cur;		/* bmap btree cursor */
ccd9d91148780a fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5251 =
 	struct xfs_bmbt_irec	del;		/* extent being deleted */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5252 =
 	int			error;		/* error return value */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5253 =
 	xfs_extnum_t		extno;		/* extent number in list */
ccd9d91148780a fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5254 =
 	struct xfs_bmbt_irec	got;		/* current extent record */
3ba738df25239f fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2018-07-17  5255 =
 	struct xfs_ifork	*ifp;		/* inode fork pointer */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5256 =
 	int			isrt;		/* freeing in rt area */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5257 =
 	int			logflags;	/* transaction logging flags */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5258 =
 	xfs_extlen_t		mod;		/* rt extent offset */
a71895c5dad1ab fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2019-11-11  5259 =
 	struct xfs_mount	*mp =3D ip->i_mount;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5260 =
 	int			tmp_logflags;	/* partial logging flags */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5261 =
 	int			wasdel;		/* was a delayed alloc extent */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5262 =
 	int			whichfork;	/* data or attribute fork */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5263 =
 	xfs_fsblock_t		sum;
4453593be6c54e fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-10-03  5264 =
 	xfs_filblks_t		len =3D *rlen;	/* length to unmap in file */
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5265 =
 	xfs_fileoff_t		max_len;
5b094d6dac0451 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-07-18  5266 =
 	xfs_agnumber_t		prev_agno =3D NULLAGNUMBER, agno;
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5267 =
 	xfs_fileoff_t		end;
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5268 =
 	struct xfs_iext_cursor	icur;
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5269 =
 	bool			done =3D false;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5270  =

8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5271 =
 	trace_xfs_bunmap(ip, start, len, flags, _RET_IP_);
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5272  =

3993baeb3c52f4 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-10-03  5273 =
 	whichfork =3D xfs_bmapi_whichfork(flags);
3993baeb3c52f4 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-10-03  5274 =
 	ASSERT(whichfork !=3D XFS_COW_FORK);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5275 =
 	ifp =3D XFS_IFORK_PTR(ip, whichfork);
f7e67b20ecbbcb fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2020-05-18  5276 =
 	if (XFS_IS_CORRUPT(mp, !xfs_ifork_has_extents(ifp)))
2451337dd04390 fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2014-06-25  5277 =
 		return -EFSCORRUPTED;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5278 =
 	if (XFS_FORCED_SHUTDOWN(mp))
2451337dd04390 fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2014-06-25  5279 =
 		return -EIO;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5280  =

eef334e5776c8e fs/xfs/xfs_bmap.c        Christoph Hellwig 2013-12-06  5281 =
 	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5282 =
 	ASSERT(len > 0);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5283 =
 	ASSERT(nexts >=3D 0);
e98c414f9a3134 fs/xfs/xfs_bmap.c        Christoph Hellwig 2010-06-23  5284  =

e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5285 =
 	/*
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5286 =
 	 * Guesstimate how many blocks we can unmap without running the risk of
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5287 =
 	 * blowing out the transaction with a mix of EFIs and reflink
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5288 =
 	 * adjustments.
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5289 =
 	 */
8c57b88637d78a fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-12-10  5290 =
 	if (tp && xfs_is_reflink_inode(ip) && whichfork =3D=3D XFS_DATA_FORK)
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5291 =
 		max_len =3D min(len, xfs_refcount_max_unmap(tp->t_log_res));
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5292 =
 	else
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5293 =
 		max_len =3D len;
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5294  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5295 =
 	if (!(ifp->if_flags & XFS_IFEXTENTS) &&
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5296 =
 	    (error =3D xfs_iread_extents(tp, ip, whichfork)))
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5297 =
 		return error;
5d829300bee000 fs/xfs/libxfs/xfs_bmap.c Eric Sandeen      2016-11-08  5298 =
 	if (xfs_iext_count(ifp) =3D=3D 0) {
4453593be6c54e fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-10-03  5299 =
 		*rlen =3D 0;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5300 =
 		return 0;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5301 =
 	}
ff6d6af2351cae fs/xfs/libxfs/xfs_bmap.c Bill O'Donnell    2015-10-12  5302 =
 	XFS_STATS_INC(mp, xs_blk_unmap);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5303 =
 	isrt =3D (whichfork =3D=3D XFS_DATA_FORK) && XFS_IS_REALTIME_INODE(ip);
dc56015faff1bc fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-23  5304 =
 	end =3D start + len;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5305  =

b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5306 =
 	if (!xfs_iext_lookup_extent_before(ip, ifp, &end, &icur, &got)) {
dc56015faff1bc fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-23  5307 =
 		*rlen =3D 0;
dc56015faff1bc fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-23  5308 =
 		return 0;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5309 =
 	}
dc56015faff1bc fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-23  5310 =
 	end--;
7efc794561f6bf fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2016-11-24  5311  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5312 =
 	logflags =3D 0;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5313 =
 	if (ifp->if_flags & XFS_IFBROOT) {
f7e67b20ecbbcb fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2020-05-18  5314 =
 		ASSERT(ifp->if_format =3D=3D XFS_DINODE_FMT_BTREE);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5315 =
 		cur =3D xfs_bmbt_init_cursor(mp, tp, ip, whichfork);
92219c292af8dd fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2020-03-10  5316 =
 		cur->bc_ino.flags =3D 0;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5317 =
 	} else
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5318 =
 		cur =3D NULL;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5319  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5320 =
 	if (isrt) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5321 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5322 =
 		 * Synchronize by locking the bitmap inode.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5323 =
 		 */
f4a0660de34451 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-08-03  5324 =
 		xfs_ilock(mp->m_rbmip, XFS_ILOCK_EXCL|XFS_ILOCK_RTBITMAP);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5325 =
 		xfs_trans_ijoin(tp, mp->m_rbmip, XFS_ILOCK_EXCL);
f4a0660de34451 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-08-03  5326 =
 		xfs_ilock(mp->m_rsumip, XFS_ILOCK_EXCL|XFS_ILOCK_RTSUM);
f4a0660de34451 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-08-03  5327 =
 		xfs_trans_ijoin(tp, mp->m_rsumip, XFS_ILOCK_EXCL);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5328 =
 	}
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5329  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5330 =
 	extno =3D 0;
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5331 =
 	while (end !=3D (xfs_fileoff_t)-1 && end >=3D start &&
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5332 =
 	       (nexts =3D=3D 0 || extno < nexts) && max_len > 0) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5333 =
 		/*
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5334 =
 		 * Is the found extent after a hole in which end lives?
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5335 =
 		 * Just back up to the previous extent, if so.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5336 =
 		 */
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5337 =
 		if (got.br_startoff > end &&
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5338 =
 		    !xfs_iext_prev_extent(ifp, &icur, &got)) {
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5339 =
 			done =3D true;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5340 =
 			break;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5341 =
 		}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5342 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5343 =
 		 * Is the last block of this extent before the range
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5344 =
 		 * we're supposed to delete?  If so, we're done.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5345 =
 		 */
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5346 =
 		end =3D XFS_FILEOFF_MIN(end,
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5347 =
 			got.br_startoff + got.br_blockcount - 1);
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5348 =
 		if (end < start)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5349 =
 			break;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5350 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5351 =
 		 * Then deal with the (possibly delayed) allocated space
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5352 =
 		 * we found.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5353 =
 		 */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5354 =
 		del =3D got;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5355 =
 		wasdel =3D isnullstartblock(del.br_startblock);
5b094d6dac0451 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-07-18  5356  =

5b094d6dac0451 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-07-18  5357 =
 		/*
5b094d6dac0451 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-07-18  5358 =
 		 * Make sure we don't touch multiple AGF headers out of order
5b094d6dac0451 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-07-18  5359 =
 		 * in a single transaction, as that could cause AB-BA deadlocks.
5b094d6dac0451 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-07-18  5360 =
 		 */
69ffe5960df169 fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5361 =
 		if (!wasdel && !isrt) {
5b094d6dac0451 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-07-18  5362 =
 			agno =3D XFS_FSB_TO_AGNO(mp, del.br_startblock);
5b094d6dac0451 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-07-18  5363 =
 			if (prev_agno !=3D NULLAGNUMBER && prev_agno > agno)
5b094d6dac0451 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-07-18  5364 =
 				break;
5b094d6dac0451 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-07-18  5365 =
 			prev_agno =3D agno;
5b094d6dac0451 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-07-18  5366 =
 		}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5367 =
 		if (got.br_startoff < start) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5368 =
 			del.br_startoff =3D start;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5369 =
 			del.br_blockcount -=3D start - got.br_startoff;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5370 =
 			if (!wasdel)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5371 =
 				del.br_startblock +=3D start - got.br_startoff;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5372 =
 		}
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5373 =
 		if (del.br_startoff + del.br_blockcount > end + 1)
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5374 =
 			del.br_blockcount =3D end + 1 - del.br_startoff;
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5375  =

e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5376 =
 		/* How much can we safely unmap? */
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5377 =
 		if (max_len < del.br_blockcount) {
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5378 =
 			del.br_startoff +=3D del.br_blockcount - max_len;
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5379 =
 			if (!wasdel)
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5380 =
 				del.br_startblock +=3D del.br_blockcount - max_len;
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5381 =
 			del.br_blockcount =3D max_len;
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5382 =
 		}
e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5383  =

0703a8e1c17e2c fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2018-06-08  5384 =
 		if (!isrt)
0703a8e1c17e2c fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2018-06-08  5385 =
 			goto delete;
0703a8e1c17e2c fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2018-06-08  5386  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5387 =
 		sum =3D del.br_startblock + del.br_blockcount;
0703a8e1c17e2c fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2018-06-08  5388 =
 		div_u64_rem(sum, mp->m_sb.sb_rextsize, &mod);
0703a8e1c17e2c fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2018-06-08  5389 =
 		if (mod) {
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5390 =
 			/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5391 =
 			 * Realtime extent not lined up at the end.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5392 =
 			 * The extent could have been split into written
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5393 =
 			 * and unwritten pieces, or we could just be
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5394 =
 			 * unmapping part of it.  But we can't really
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5395 =
 			 * get rid of part of a realtime extent.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5396 =
 			 */
daa79baefc4729 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2018-10-18  5397 =
 			if (del.br_state =3D=3D XFS_EXT_UNWRITTEN) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5398 =
 				/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5399 =
 				 * This piece is unwritten, or we're not
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5400 =
 				 * using unwritten extents.  Skip over it.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5401 =
 				 */
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5402 =
 				ASSERT(end >=3D mod);
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5403 =
 				end -=3D mod > del.br_blockcount ?
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5404 =
 					del.br_blockcount : mod;
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5405 =
 				if (end < got.br_startoff &&
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5406 =
 				    !xfs_iext_prev_extent(ifp, &icur, &got)) {
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5407 =
 					done =3D true;
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5408 =
 					break;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5409 =
 				}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5410 =
 				continue;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5411 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5412 =
 			/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5413 =
 			 * It's written, turn it unwritten.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5414 =
 			 * This is better than zeroing it.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5415 =
 			 */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5416 =
 			ASSERT(del.br_state =3D=3D XFS_EXT_NORM);
a7e5d03ba8882a fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2016-03-02  5417 =
 			ASSERT(tp->t_blk_res > 0);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5418 =
 			/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5419 =
 			 * If this spans a realtime extent boundary,
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5420 =
 			 * chop it back to the start of the one we end at.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5421 =
 			 */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5422 =
 			if (del.br_blockcount > mod) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5423 =
 				del.br_startoff +=3D del.br_blockcount - mod;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5424 =
 				del.br_startblock +=3D del.br_blockcount - mod;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5425 =
 				del.br_blockcount =3D mod;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5426 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5427 =
 			del.br_state =3D XFS_EXT_UNWRITTEN;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5428 =
 			error =3D xfs_bmap_add_extent_unwritten_real(tp, ip,
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5429 =
 					whichfork, &icur, &cur, &del,
92f9da30f57bdb fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5430 =
 					&logflags);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5431 =
 			if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5432 =
 				goto error0;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5433 =
 			goto nodelete;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5434 =
 		}
0703a8e1c17e2c fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2018-06-08  5435 =
 		div_u64_rem(del.br_startblock, mp->m_sb.sb_rextsize, &mod);
0703a8e1c17e2c fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2018-06-08  5436 =
 		if (mod) {
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5437 =
 			xfs_extlen_t off =3D mp->m_sb.sb_rextsize - mod;
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5438  =

^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5439 =
 			/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5440 =
 			 * Realtime extent is lined up at the end but not
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5441 =
 			 * at the front.  We'll get rid of full extents if
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5442 =
 			 * we can.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5443 =
 			 */
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5444 =
 			if (del.br_blockcount > off) {
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5445 =
 				del.br_blockcount -=3D off;
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5446 =
 				del.br_startoff +=3D off;
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5447 =
 				del.br_startblock +=3D off;
daa79baefc4729 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2018-10-18  5448 =
 			} else if (del.br_startoff =3D=3D start &&
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5449 =
 				   (del.br_state =3D=3D XFS_EXT_UNWRITTEN ||
daa79baefc4729 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2018-10-18  5450 =
 				    tp->t_blk_res =3D=3D 0)) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5451 =
 				/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5452 =
 				 * Can't make it unwritten.  There isn't
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5453 =
 				 * a full extent here so just skip it.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5454 =
 				 */
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5455 =
 				ASSERT(end >=3D del.br_blockcount);
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5456 =
 				end -=3D del.br_blockcount;
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5457 =
 				if (got.br_startoff > end &&
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5458 =
 				    !xfs_iext_prev_extent(ifp, &icur, &got)) {
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5459 =
 					done =3D true;
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5460 =
 					break;
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5461 =
 				}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5462 =
 				continue;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5463 =
 			} else if (del.br_state =3D=3D XFS_EXT_UNWRITTEN) {
7efc794561f6bf fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2016-11-24  5464 =
 				struct xfs_bmbt_irec	prev;
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5465 =
 				xfs_fileoff_t		unwrite_start;
7efc794561f6bf fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2016-11-24  5466  =

^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5467 =
 				/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5468 =
 				 * This one is already unwritten.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5469 =
 				 * It must have a written left neighbor.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5470 =
 				 * Unwrite the killed part of that one and
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5471 =
 				 * try again.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5472 =
 				 */
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5473 =
 				if (!xfs_iext_prev_extent(ifp, &icur, &prev))
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5474 =
 					ASSERT(0);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5475 =
 				ASSERT(prev.br_state =3D=3D XFS_EXT_NORM);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5476 =
 				ASSERT(!isnullstartblock(prev.br_startblock));
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5477 =
 				ASSERT(del.br_startblock =3D=3D
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5478 =
 				       prev.br_startblock + prev.br_blockcount);
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5479 =
 				unwrite_start =3D max3(start,
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5480 =
 						     del.br_startoff - mod,
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5481 =
 						     prev.br_startoff);
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5482 =
 				mod =3D unwrite_start - prev.br_startoff;
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5483 =
 				prev.br_startoff =3D unwrite_start;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5484 =
 				prev.br_startblock +=3D mod;
0c4da70c83d41a fs/xfs/libxfs/xfs_bmap.c Omar Sandoval     2019-11-26  5485 =
 				prev.br_blockcount -=3D mod;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5486 =
 				prev.br_state =3D XFS_EXT_UNWRITTEN;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5487 =
 				error =3D xfs_bmap_add_extent_unwritten_real(tp,
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5488 =
 						ip, whichfork, &icur, &cur,
92f9da30f57bdb fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5489 =
 						&prev, &logflags);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5490 =
 				if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5491 =
 					goto error0;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5492 =
 				goto nodelete;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5493 =
 			} else {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5494 =
 				ASSERT(del.br_state =3D=3D XFS_EXT_NORM);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5495 =
 				del.br_state =3D XFS_EXT_UNWRITTEN;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5496 =
 				error =3D xfs_bmap_add_extent_unwritten_real(tp,
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5497 =
 						ip, whichfork, &icur, &cur,
92f9da30f57bdb fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5498 =
 						&del, &logflags);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5499 =
 				if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5500 =
 					goto error0;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5501 =
 				goto nodelete;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5502 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5503 =
 		}
576039cf3c668d fs/xfs/xfs_bmap.c        Christoph Hellwig 2006-09-28  5504  =

0703a8e1c17e2c fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2018-06-08  5505 =
 delete:
e1d7553faf3979 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5506 =
 		if (wasdel) {
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5507 =
 			error =3D xfs_bmap_del_extent_delay(ip, whichfork, &icur,
e1d7553faf3979 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5508 =
 					&got, &del);
e1d7553faf3979 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5509 =
 		} else {
81ba8f3e947c3c fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5510 =
 			error =3D xfs_bmap_del_extent_real(ip, tp, &icur, cur,
81ba8f3e947c3c fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5511 =
 					&del, &tmp_logflags, whichfork,
e1d7553faf3979 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5512 =
 					flags);
e1d7553faf3979 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5513 =
 			logflags |=3D tmp_logflags;
b213d69293cf00 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5514 =
 		}
b2706a05bad36c fs/xfs/libxfs/xfs_bmap.c Brian Foster      2016-03-15  5515  =

3d3e6f64e22c94 fs/xfs/xfs_bmap.c        Dave Chinner      2012-11-12  5516 =
 		if (error)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5517 =
 			goto error0;
b2706a05bad36c fs/xfs/libxfs/xfs_bmap.c Brian Foster      2016-03-15  5518  =

e1a4e37cc7b665 fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2017-06-14  5519 =
 		max_len -=3D del.br_blockcount;
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5520 =
 		end =3D del.br_startoff - 1;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5521 =
 nodelete:
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5522 =
 		/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5523 =
 		 * If not done go on to the next (previous) record.
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5524 =
 		 */
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5525 =
 		if (end !=3D (xfs_fileoff_t)-1 && end >=3D start) {
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5526 =
 			if (!xfs_iext_get_extent(ifp, &icur, &got) ||
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5527 =
 			    (got.br_startoff > end &&
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5528 =
 			     !xfs_iext_prev_extent(ifp, &icur, &got))) {
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5529 =
 				done =3D true;
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5530 =
 				break;
3d3e6f64e22c94 fs/xfs/xfs_bmap.c        Dave Chinner      2012-11-12  5531 =
 			}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5532 =
 			extno++;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5533 =
 		}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5534 =
 	}
b2b1712a640824 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-11-03  5535 =
 	if (done || end =3D=3D (xfs_fileoff_t)-1 || end < start)
4453593be6c54e fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-10-03  5536 =
 		*rlen =3D 0;
4453593be6c54e fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2016-10-03  5537 =
 	else
8280f6ed464554 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2017-10-17  5538 =
 		*rlen =3D end - start + 1;
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5539  =

^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5540 =
 	/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5541 =
 	 * Convert to a btree if necessary.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5542 =
 	 */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5543 =
 	if (xfs_bmap_needs_btree(ip, whichfork)) {
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5544 =
 		ASSERT(cur =3D=3D NULL);
280253d213fb73 fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5545 =
 		error =3D xfs_bmap_extents_to_btree(tp, ip, &cur, 0,
280253d213fb73 fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5546 =
 				&tmp_logflags, whichfork);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5547 =
 		logflags |=3D tmp_logflags;
b101e3342a3440 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2019-02-15  5548 =
 	} else {
b101e3342a3440 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2019-02-15  5549 =
 		error =3D xfs_bmap_btree_to_extents(tp, ip, cur, &logflags,
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5550 =
 			whichfork);
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5551 =
 	}
b101e3342a3440 fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2019-02-15  5552  =

9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5553 =
 error0:
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5554 =
 	/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5555 =
 	 * Log everything.  Do this after conversion, there's no point in
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5556 =
 	 * logging the extent records if we've converted to btree format.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5557 =
 	 */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5558 =
 	if ((logflags & xfs_ilog_fext(whichfork)) &&
f7e67b20ecbbcb fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2020-05-18  5559 =
 	    ifp->if_format !=3D XFS_DINODE_FMT_EXTENTS)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5560 =
 		logflags &=3D ~xfs_ilog_fext(whichfork);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5561 =
 	else if ((logflags & xfs_ilog_fbroot(whichfork)) &&
f7e67b20ecbbcb fs/xfs/libxfs/xfs_bmap.c Christoph Hellwig 2020-05-18  5562 =
 		 ifp->if_format !=3D XFS_DINODE_FMT_BTREE)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25 @5563 =
 		logflags &=3D ~xfs_ilog_fbroot(whichfork);
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5564 =
 	/*
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5565 =
 	 * Log inode even in the error case, if the transaction
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5566 =
 	 * is dirty we'll need to shut down the filesystem.
^1da177e4c3f41 fs/xfs/xfs_bmap.c        Linus Torvalds    2005-04-16  5567 =
 	 */
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5568 =
 	if (logflags)
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5569 =
 		xfs_trans_log_inode(tp, ip, logflags);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5570 =
 	if (cur) {
cf612de732cb6e fs/xfs/libxfs/xfs_bmap.c Brian Foster      2018-07-11  5571 =
 		if (!error)
92219c292af8dd fs/xfs/libxfs/xfs_bmap.c Dave Chinner      2020-03-10  5572 =
 			cur->bc_ino.allocated =3D 0;
0b04b6b875b32f fs/xfs/libxfs/xfs_bmap.c Darrick J. Wong   2018-07-19  5573 =
 		xfs_btree_del_cursor(cur, error);
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5574 =
 	}
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5575 =
 	return error;
9e5987a7792194 fs/xfs/xfs_bmap.c        Dave Chinner      2013-02-25  5576 =
 }
e1d8fb88a64c1f fs/xfs/xfs_bmap.c        Namjae Jeon       2014-02-24  5577  =


:::::: The code at line 5563 was first introduced by commit
:::::: 9e5987a7792194ec338f53643237150c0db5f5e0 xfs: rearrange some code in=
 xfs_bmap for better locality

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Ben Myers <bpm@sgi.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7304220759312921106==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
mSBfCzw0AzzFlZYOTqgXfqDs+/8DSHg2/OrUAQA=
--===============7304220759312921106==--

