Content-Type: multipart/mixed; boundary="===============1078207399930810426=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/6] xfs: merge xfs_buf_find() and xfs_buf_get_map()
Date: Tue, 28 Jun 2022 06:09:43 +0800
Message-ID: <202206280549.pN2aOPuA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1078207399930810426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220627060841.244226-4-david@fromorbit.com>
References: <20220627060841.244226-4-david@fromorbit.com>
TO: Dave Chinner <david@fromorbit.com>
TO: linux-xfs(a)vger.kernel.org

Hi Dave,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on linus/master v5.19-rc4 next-20220627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Chinner/xfs-loc=
kless-buffer-lookups/20220627-141053
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-m001-20220627 (https://download.01.org/0day-ci/ar=
chive/20220628/202206280549.pN2aOPuA-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/xfs/xfs_buf.c:703 xfs_buf_get_map() error: we previously assumed 'bp' co=
uld be null (see line 686)

vim +/bp +703 fs/xfs/xfs_buf.c

ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  651=
  =

ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  652=
  /*
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  653=
   * Assembles a buffer covering the specified range. The code is optimised=
 for
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  654=
   * cache hits, as metadata intensive workloads will see 3 orders of magni=
tude
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  655=
   * more hits than misses.
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  656=
   */
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  657=
  int
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  658=
  xfs_buf_get_map(
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  659=
  	struct xfs_buftarg	*btp,
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  660=
  	struct xfs_buf_map	*map,
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  661=
  	int			nmaps,
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  662=
  	xfs_buf_flags_t		flags,
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  663=
  	struct xfs_buf		**bpp)
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  664=
  {
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  665=
  	struct xfs_perag	*pag;
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  666=
  	struct xfs_buf		*bp =3D NULL;
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  667=
  	struct xfs_buf_map	cmap =3D { .bm_bn =3D map[0].bm_bn };
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  668=
  	int			error;
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  669=
  	int			i;
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  670=
  =

ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  671=
  	for (i =3D 0; i < nmaps; i++)
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  672=
  		cmap.bm_len +=3D map[i].bm_len;
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  673=
  =

ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  674=
  	error =3D xfs_buf_find_verify(btp, &cmap);
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  675=
  	if (error)
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  676=
  		return error;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  677=
  =

ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  678=
  	pag =3D xfs_perag_get(btp->bt_mount,
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  679=
  			    xfs_daddr_to_agno(btp->bt_mount, cmap.bm_bn));
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  680=
  =

ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  681=
  	error =3D xfs_buf_find_fast(pag, &cmap, flags, &bp);
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  682=
  	if (error && error !=3D -ENOENT)
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  683=
  		goto out_put_perag;
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  684=
  =

ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  685=
  	/* cache hits always outnumber misses by at least 10:1 */
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27 @686=
  	if (unlikely(!bp)) {
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  687=
  		XFS_STATS_INC(btp->bt_mount, xb_miss_locked);
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  688=
  =

ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  689=
  		if (flags & XBF_INCORE)
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  690=
  			goto out_put_perag;
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  691=
  =

ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  692=
  		/* xfs_buf_find_insert() consumes the perag reference. */
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  693=
  		error =3D xfs_buf_find_insert(btp, pag, &cmap, map, nmaps,
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  694=
  				flags, &bp);
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  695=
  		if (error)
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  696=
  			return error;
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  697=
  	} else {
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  698=
  		XFS_STATS_INC(btp->bt_mount, xb_get_locked);
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  699=
  		xfs_perag_put(pag);
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  700=
  	}
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  701=
  =

ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  702=
  	/* We do not hold a perag reference anymore. */
611c99468c7aa1 fs/xfs/xfs_buf.c           Dave Chinner      2012-04-23 @703=
  	if (!bp->b_addr) {
ce8e922c0e79c8 fs/xfs/linux-2.6/xfs_buf.c Nathan Scott      2006-01-11  704=
  		error =3D _xfs_buf_map_pages(bp, flags);
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  705=
  		if (unlikely(error)) {
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  706=
  			xfs_warn_ratelimited(btp->bt_mount,
93baa55af1a19a fs/xfs/xfs_buf.c           Darrick J. Wong   2020-02-21  707=
  				"%s: failed to map %u pages", __func__,
93baa55af1a19a fs/xfs/xfs_buf.c           Darrick J. Wong   2020-02-21  708=
  				bp->b_page_count);
a8acad70731e7d fs/xfs/xfs_buf.c           Dave Chinner      2012-04-23  709=
  			xfs_buf_relse(bp);
3848b5f6709221 fs/xfs/xfs_buf.c           Darrick J. Wong   2020-01-23  710=
  			return error;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  711=
  		}
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  712=
  	}
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  713=
  =

b79f4a1c68bb99 fs/xfs/xfs_buf.c           Dave Chinner      2016-01-12  714=
  	/*
b79f4a1c68bb99 fs/xfs/xfs_buf.c           Dave Chinner      2016-01-12  715=
  	 * Clear b_error if this is a lookup from a caller that doesn't expect
b79f4a1c68bb99 fs/xfs/xfs_buf.c           Dave Chinner      2016-01-12  716=
  	 * valid data to be found in the buffer.
b79f4a1c68bb99 fs/xfs/xfs_buf.c           Dave Chinner      2016-01-12  717=
  	 */
b79f4a1c68bb99 fs/xfs/xfs_buf.c           Dave Chinner      2016-01-12  718=
  	if (!(flags & XBF_READ))
b79f4a1c68bb99 fs/xfs/xfs_buf.c           Dave Chinner      2016-01-12  719=
  		xfs_buf_ioerror(bp, 0);
b79f4a1c68bb99 fs/xfs/xfs_buf.c           Dave Chinner      2016-01-12  720=
  =

ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  721=
  	XFS_STATS_INC(btp->bt_mount, xb_get);
0b1b213fcf3a84 fs/xfs/linux-2.6/xfs_buf.c Christoph Hellwig 2009-12-14  722=
  	trace_xfs_buf_get(bp, flags, _RET_IP_);
3848b5f6709221 fs/xfs/xfs_buf.c           Darrick J. Wong   2020-01-23  723=
  	*bpp =3D bp;
3848b5f6709221 fs/xfs/xfs_buf.c           Darrick J. Wong   2020-01-23  724=
  	return 0;
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  725=
  =

ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  726=
  out_put_perag:
ac3a2dcca9b378 fs/xfs/xfs_buf.c           Dave Chinner      2022-06-27  727=
  	xfs_perag_put(pag);
170041f71596da fs/xfs/xfs_buf.c           Christoph Hellwig 2021-06-07  728=
  	return error;
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  729=
  }
^1da177e4c3f41 fs/xfs/linux-2.6/xfs_buf.c Linus Torvalds    2005-04-16  730=
  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1078207399930810426==--

