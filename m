Content-Type: multipart/mixed; boundary="===============1452874216054234571=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [djwong-xfs:refactor-log-recovery 235/314] fs/xfs/xfs_dquot.c:1210:30: warning: Label '__here' is not used. [unusedLabel]
Date: Mon, 13 Apr 2020 13:19:24 +0800
Message-ID: <202004131315.PrVKgo16%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1452874216054234571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t refactor-log-recovery
head:   2dcdc305cfc2b8b1beee483cf8ae5c674d9fac86
commit: 66666ad3b019f5433ae32bb3bb62bb6f2a2e4497 [235/314] xfs: enable bigt=
ime for quota timers
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/xfs/xfs_dquot.c:1210:30: warning: Label '__here' is not used. [unused=
Label]
       be32_to_cpu(ddqp->d_id), __this_address);
                                ^
   fs/xfs/xfs_buf.h:278:38: warning: Clarify calculation precedence for '&'=
 and '?'. [clarifyCalculation]
    bool wait =3D bp->b_flags & XBF_ASYNC ? false : true;
                                        ^
   fs/xfs/xfs_dquot.c:281:28: warning: Clarify calculation precedence for '=
&' and '?'. [clarifyCalculation]
          (type & XFS_DQ_USER ? XFS_BLF_UDQUOT_BUF :
                              ^
   fs/xfs/xfs_dquot.c:539:43: warning: 'bp->b_addr' is of type 'void *'. Wh=
en using void pointers in calculations, the behaviour is undefined. [arithO=
perationsOnVoidPointer]
    struct xfs_disk_dquot *ddqp =3D bp->b_addr + dqp->q_bufoffset;
                                             ^
   fs/xfs/xfs_dquot.c:1183:19: warning: 'bp->b_addr' is of type 'void *'. W=
hen using void pointers in calculations, the behaviour is undefined. [arith=
OperationsOnVoidPointer]
    dqb =3D bp->b_addr + dqp->q_bufoffset;
                     ^
>> fs/xfs/xfs_dquot.c:1210:30: warning: Variable '__here' is not assigned a=
 value. [unassignedVariable]
       be32_to_cpu(ddqp->d_id), __this_address);
                                ^
   nofile:0:0: warning: Too many #ifdef configurations - cppcheck only chec=
ks 12 configurations. Use --force to check all configurations. For more det=
ails, use --enable=3Dinformation. [toomanyconfigs]
   =


# https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/comm=
it/?id=3D66666ad3b019f5433ae32bb3bb62bb6f2a2e4497
git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/d=
jwong/xfs-linux.git
git remote update djwong-xfs
git checkout 66666ad3b019f5433ae32bb3bb62bb6f2a2e4497
vim +/__here +1210 fs/xfs/xfs_dquot.c

^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  112=
1  =

^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  112=
2  /*
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  112=
3   * Write a modified dquot to disk.
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  112=
4   * The dquot must be locked and the flush lock too taken by caller.
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  112=
5   * The flush lock will not be unlocked until the dquot reaches the disk,
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  112=
6   * but the dquot is free to be unlocked and modified by the caller
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  112=
7   * in the interim. Dquot is still locked on return. This behavior is
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  112=
8   * identical to that of inodes.
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  112=
9   */
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  113=
0  int
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  113=
1  xfs_qm_dqflush(
fe7257fd4b8ae9 fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  113=
2  	struct xfs_dquot	*dqp,
fe7257fd4b8ae9 fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  113=
3  	struct xfs_buf		**bpp)
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  113=
4  {
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  113=
5  	struct xfs_mount	*mp =3D dqp->q_mount;
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  113=
6  	struct xfs_buf		*bp;
7224fa482a6daa fs/xfs/xfs_dquot.c       Eric Sandeen        2018-05-07  113=
7  	struct xfs_dqblk	*dqb;
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  113=
8  	struct xfs_disk_dquot	*ddqp;
eebf3cab9c5eac fs/xfs/xfs_dquot.c       Darrick J. Wong     2018-01-08  113=
9  	xfs_failaddr_t		fa;
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  114=
0  	int			error;
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  114=
1  =

^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  114=
2  	ASSERT(XFS_DQ_IS_LOCKED(dqp));
e1f49cf20cea18 fs/xfs/quota/xfs_dquot.c David Chinner       2008-08-13  114=
3  	ASSERT(!completion_done(&dqp->q_flush));
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  114=
4  =

0b1b213fcf3a84 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2009-12-14  114=
5  	trace_xfs_dqflush(dqp);
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  114=
6  =

fe7257fd4b8ae9 fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  114=
7  	*bpp =3D NULL;
fe7257fd4b8ae9 fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  114=
8  =

^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  114=
9  	xfs_qm_dqunpin_wait(dqp);
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  115=
0  =

^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  115=
1  	/*
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  115=
2  	 * This may have been unpinned because the filesystem is shutting
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  115=
3  	 * down forcibly. If that's the case we must not write this dquot
dea9609527a55b fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  115=
4  	 * to disk, because the log record didn't make it to disk.
dea9609527a55b fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  115=
5  	 *
dea9609527a55b fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  115=
6  	 * We also have to remove the log item from the AIL in this case,
dea9609527a55b fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  115=
7  	 * as we wait for an emptry AIL as part of the unmount process.
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  115=
8  	 */
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  115=
9  	if (XFS_FORCED_SHUTDOWN(mp)) {
dea9609527a55b fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  116=
0  		struct xfs_log_item	*lip =3D &dqp->q_logitem.qli_item;
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  116=
1  		dqp->dq_flags &=3D ~XFS_DQ_DIRTY;
dea9609527a55b fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  116=
2  =

146e54b71ea4b9 fs/xfs/xfs_dquot.c       Brian Foster        2015-08-19  116=
3  		xfs_trans_ail_remove(lip, SHUTDOWN_CORRUPT_INCORE);
146e54b71ea4b9 fs/xfs/xfs_dquot.c       Brian Foster        2015-08-19  116=
4  =

2451337dd04390 fs/xfs/xfs_dquot.c       Dave Chinner        2014-06-25  116=
5  		error =3D -EIO;
fe7257fd4b8ae9 fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  116=
6  		goto out_unlock;
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  116=
7  	}
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  116=
8  =

^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  116=
9  	/*
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  117=
0  	 * Get the buffer containing the on-disk dquot
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  117=
1  	 */
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  117=
2  	error =3D xfs_trans_read_buf(mp, NULL, mp->m_ddev_targp, dqp->q_blkno,
2abd3d3dc09e58 fs/xfs/xfs_dquot.c       Brian Foster        2020-04-03  117=
3  				   mp->m_quotainfo->qi_dqchunklen, XBF_TRYLOCK,
2abd3d3dc09e58 fs/xfs/xfs_dquot.c       Brian Foster        2020-04-03  117=
4  				   &bp, &xfs_dquot_buf_ops);
bbf9cbafcf73b3 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  117=
5  	if (xfs_metadata_is_sick(error))
bbf9cbafcf73b3 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  117=
6  		xfs_quota_mark_sick(mp, dqp->dq_flags);
fe7257fd4b8ae9 fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  117=
7  	if (error)
fe7257fd4b8ae9 fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  117=
8  		goto out_unlock;
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  117=
9  =

acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  118=
0  	/*
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  118=
1  	 * Calculate the location of the dquot inside the buffer.
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  118=
2  	 */
7224fa482a6daa fs/xfs/xfs_dquot.c       Eric Sandeen        2018-05-07  118=
3  	dqb =3D bp->b_addr + dqp->q_bufoffset;
7224fa482a6daa fs/xfs/xfs_dquot.c       Eric Sandeen        2018-05-07  118=
4  	ddqp =3D &dqb->dd_diskdq;
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  118=
5  =

acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  118=
6  	/*
7224fa482a6daa fs/xfs/xfs_dquot.c       Eric Sandeen        2018-05-07  118=
7  	 * A simple sanity check in case we got a corrupted dquot.
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  118=
8  	 */
7224fa482a6daa fs/xfs/xfs_dquot.c       Eric Sandeen        2018-05-07  118=
9  	fa =3D xfs_dqblk_verify(mp, dqb, be32_to_cpu(ddqp->d_id), 0);
eebf3cab9c5eac fs/xfs/xfs_dquot.c       Darrick J. Wong     2018-01-08  119=
0  	if (fa) {
eebf3cab9c5eac fs/xfs/xfs_dquot.c       Darrick J. Wong     2018-01-08  119=
1  		xfs_alert(mp, "corrupt dquot ID 0x%x in memory at %pS",
eebf3cab9c5eac fs/xfs/xfs_dquot.c       Darrick J. Wong     2018-01-08  119=
2  				be32_to_cpu(ddqp->d_id), fa);
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  119=
3  		xfs_buf_relse(bp);
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  119=
4  		xfs_dqfunlock(dqp);
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  119=
5  		xfs_force_shutdown(mp, SHUTDOWN_CORRUPT_INCORE);
bbf9cbafcf73b3 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  119=
6  		xfs_quota_mark_sick(mp, dqp->dq_flags);
c2414ad6e66ab9 fs/xfs/xfs_dquot.c       Darrick J. Wong     2019-10-28  119=
7  		return -EFSCORRUPTED;
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  119=
8  	}
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  119=
9  =

^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  120=
0  	/* This is the only portion of data that needs to persist */
aefe69a45d8490 fs/xfs/xfs_dquot.c       Pavel Reichl        2019-11-12  120=
1  	memcpy(ddqp, &dqp->q_core, sizeof(struct xfs_disk_dquot));
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  120=
2  =

66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  120=
3  	/*
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  120=
4  	 * We should never write non-bigtime dquots to a bigtime fs, except for
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  120=
5  	 * the root dquot.
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  120=
6  	 */
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  120=
7  	if (!(dqp->q_core.d_flags & XFS_DQ_BIGTIME) && dqp->q_core.d_id &&
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  120=
8  	    xfs_sb_version_hasbigtime(&mp->m_sb)) {
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  120=
9  		xfs_alert(mp, "corrupt dquot ID 0x%x in memory at %pS",
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19 @121=
0  				be32_to_cpu(ddqp->d_id), __this_address);
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  121=
1  		xfs_buf_relse(bp);
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  121=
2  		xfs_dqfunlock(dqp);
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  121=
3  		xfs_force_shutdown(mp, SHUTDOWN_CORRUPT_INCORE);
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  121=
4  		xfs_quota_mark_sick(mp, dqp->dq_flags);
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  121=
5  		return -EFSCORRUPTED;
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  121=
6  	}
66666ad3b019f5 fs/xfs/xfs_dquot.c       Darrick J. Wong     2020-02-19  121=
7  =

^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  121=
8  	/*
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  121=
9  	 * Clear the dirty field and remember the flush lsn for later use.
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  122=
0  	 */
acecf1b5d8a846 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-09-06  122=
1  	dqp->dq_flags &=3D ~XFS_DQ_DIRTY;
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  122=
2  =

7b2e2a31f5c23b fs/xfs/quota/xfs_dquot.c David Chinner       2008-10-30  122=
3  	xfs_trans_ail_copy_lsn(mp->m_ail, &dqp->q_logitem.qli_flush_lsn,
7b2e2a31f5c23b fs/xfs/quota/xfs_dquot.c David Chinner       2008-10-30  122=
4  					&dqp->q_logitem.qli_item.li_lsn);
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  122=
5  =

3fe58f30b4fc3f fs/xfs/xfs_dquot.c       Christoph Hellwig   2013-04-03  122=
6  	/*
3fe58f30b4fc3f fs/xfs/xfs_dquot.c       Christoph Hellwig   2013-04-03  122=
7  	 * copy the lsn into the on-disk dquot now while we have the in memory
3fe58f30b4fc3f fs/xfs/xfs_dquot.c       Christoph Hellwig   2013-04-03  122=
8  	 * dquot here. This can't be done later in the write verifier as we
3fe58f30b4fc3f fs/xfs/xfs_dquot.c       Christoph Hellwig   2013-04-03  122=
9  	 * can't get access to the log item at that point in time.
6fcdc59de28817 fs/xfs/xfs_dquot.c       Dave Chinner        2013-06-03  123=
0  	 *
6fcdc59de28817 fs/xfs/xfs_dquot.c       Dave Chinner        2013-06-03  123=
1  	 * We also calculate the CRC here so that the on-disk dquot in the
6fcdc59de28817 fs/xfs/xfs_dquot.c       Dave Chinner        2013-06-03  123=
2  	 * buffer always has a valid CRC. This ensures there is no possibility
6fcdc59de28817 fs/xfs/xfs_dquot.c       Dave Chinner        2013-06-03  123=
3  	 * of a dquot without an up-to-date CRC getting to disk.
3fe58f30b4fc3f fs/xfs/xfs_dquot.c       Christoph Hellwig   2013-04-03  123=
4  	 */
3fe58f30b4fc3f fs/xfs/xfs_dquot.c       Christoph Hellwig   2013-04-03  123=
5  	if (xfs_sb_version_hascrc(&mp->m_sb)) {
3fe58f30b4fc3f fs/xfs/xfs_dquot.c       Christoph Hellwig   2013-04-03  123=
6  		dqb->dd_lsn =3D cpu_to_be64(dqp->q_logitem.qli_item.li_lsn);
6fcdc59de28817 fs/xfs/xfs_dquot.c       Dave Chinner        2013-06-03  123=
7  		xfs_update_cksum((char *)dqb, sizeof(struct xfs_dqblk),
6fcdc59de28817 fs/xfs/xfs_dquot.c       Dave Chinner        2013-06-03  123=
8  				 XFS_DQUOT_CRC_OFF);
3fe58f30b4fc3f fs/xfs/xfs_dquot.c       Christoph Hellwig   2013-04-03  123=
9  	}
3fe58f30b4fc3f fs/xfs/xfs_dquot.c       Christoph Hellwig   2013-04-03  124=
0  =

^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  124=
1  	/*
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  124=
2  	 * Attach an iodone routine so that we can remove this dquot from the
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  124=
3  	 * AIL and release the flush lock once the dquot is synced to disk.
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  124=
4  	 */
ca30b2a7b7ac89 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-06-23  124=
5  	xfs_buf_attach_iodone(bp, xfs_qm_dqflush_done,
ca30b2a7b7ac89 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-06-23  124=
6  				  &dqp->q_logitem.qli_item);
ca30b2a7b7ac89 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-06-23  124=
7  =

^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  124=
8  	/*
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  124=
9  	 * If the buffer is pinned then push on the log so we won't
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  125=
0  	 * get stuck waiting in the write for too long.
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  125=
1  	 */
811e64c7169bb5 fs/xfs/quota/xfs_dquot.c Chandra Seetharaman 2011-07-22  125=
2  	if (xfs_buf_ispinned(bp)) {
0b1b213fcf3a84 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2009-12-14  125=
3  		trace_xfs_dqflush_force(dqp);
a14a348bff2f99 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2010-01-19  125=
4  		xfs_log_force(mp, 0);
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  125=
5  	}
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  125=
6  =

0b1b213fcf3a84 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2009-12-14  125=
7  	trace_xfs_dqflush_done(dqp);
fe7257fd4b8ae9 fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  125=
8  	*bpp =3D bp;
fe7257fd4b8ae9 fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  125=
9  	return 0;
0b1b213fcf3a84 fs/xfs/quota/xfs_dquot.c Christoph Hellwig   2009-12-14  126=
0  =

fe7257fd4b8ae9 fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  126=
1  out_unlock:
fe7257fd4b8ae9 fs/xfs/xfs_dquot.c       Christoph Hellwig   2012-04-23  126=
2  	xfs_dqfunlock(dqp);
2abd3d3dc09e58 fs/xfs/xfs_dquot.c       Brian Foster        2020-04-03  126=
3  	return error;
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  126=
4  }
^1da177e4c3f41 fs/xfs/quota/xfs_dquot.c Linus Torvalds      2005-04-16  126=
5  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1452874216054234571==--

