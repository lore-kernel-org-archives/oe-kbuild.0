Content-Type: multipart/mixed; boundary="===============3935852370789702419=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 25/36] xfs: combine __xfs_alloc_vextent_this_ag and xfs_alloc_ag_vextent
Date: Sat, 04 Dec 2021 12:41:45 +0800
Message-ID: <202112041242.73kkIRHp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3935852370789702419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211203000111.2800982-26-david@fromorbit.com>
References: <20211203000111.2800982-26-david@fromorbit.com>
TO: Dave Chinner <david@fromorbit.com>
TO: linux-xfs(a)vger.kernel.org

Hi Dave,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dave-Chinner/xfs-more-work=
-towards-shrinking/20211203-080331
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-m001-20211203 (https://download.01.org/0day-ci/ar=
chive/20211204/202112041242.73kkIRHp-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/libxfs/xfs_alloc.c:2746 xfs_alloc_fix_freelist() error: we previousl=
y assumed 'agbp' could be null (see line 2640)

Old smatch warnings:
fs/xfs/libxfs/xfs_alloc.c:2737 xfs_alloc_fix_freelist() warn: missing error=
 code 'error'

vim +/agbp +2746 fs/xfs/libxfs/xfs_alloc.c

301519674699aa fs/xfs/libxfs/xfs_alloc.c Chandan Babu R    2021-01-22  2586=
  =

^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2587=
  /*
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2588=
   * Decide whether to use this allocation group for this allocation.
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2589=
   * If so, fix up the btree freelist's size.
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2590=
   */
2e9101da604779 fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-01-04  2591=
  int			/* error */
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2592=
  xfs_alloc_fix_freelist(
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2593=
  	struct xfs_alloc_arg	*args,	/* allocation argument structure */
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2594=
  	int			flags)	/* XFS_ALLOC_FLAG_... */
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2595=
  {
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2596=
  	struct xfs_mount	*mp =3D args->mp;
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2597=
  	struct xfs_perag	*pag =3D args->pag;
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2598=
  	struct xfs_trans	*tp =3D args->tp;
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2599=
  	struct xfs_buf		*agbp =3D NULL;
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2600=
  	struct xfs_buf		*agflbp =3D NULL;
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2601=
  	struct xfs_alloc_arg	targs;	/* local allocation arguments */
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2602=
  	xfs_agblock_t		bno;	/* freelist block */
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2603=
  	xfs_extlen_t		need;	/* total blocks needed in freelist */
c184f855c48342 fs/xfs/libxfs/xfs_alloc.c Jan Kara          2015-08-25  2604=
  	int			error =3D 0;
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2605=
  =

362f5e745ae2ee fs/xfs/libxfs/xfs_alloc.c Brian Foster      2019-04-23  2606=
  	/* deferred ops (AGFL block frees) require permanent transactions */
362f5e745ae2ee fs/xfs/libxfs/xfs_alloc.c Brian Foster      2019-04-23  2607=
  	ASSERT(tp->t_flags & XFS_TRANS_PERM_LOG_RES);
362f5e745ae2ee fs/xfs/libxfs/xfs_alloc.c Brian Foster      2019-04-23  2608=
  =

26473009ed961c fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2609=
  	if (!xfs_perag_initialised_agf(pag)) {
bf14ac7fff281f fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2610=
  		error =3D xfs_alloc_read_agf(pag, tp, flags, &agbp);
f48e2df8a877ca fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2020-01-23  2611=
  		if (error) {
f48e2df8a877ca fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2020-01-23  2612=
  			/* Couldn't lock the AGF so skip this AG. */
f48e2df8a877ca fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2020-01-23  2613=
  			if (error =3D=3D -EAGAIN)
f48e2df8a877ca fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2020-01-23  2614=
  				error =3D 0;
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2615=
  			goto out_no_agbp;
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2616=
  		}
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2617=
  	}
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2618=
  =

0e1edbd9999427 fs/xfs/xfs_alloc.c        Nathan Scott      2006-08-10  2619=
  	/*
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2620=
  	 * If this is a metadata preferred pag and we are user data then try
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2621=
  	 * somewhere else if we are not being asked to try harder at this
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2622=
  	 * point
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2623=
  	 */
26473009ed961c fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2624=
  	if (xfs_perag_prefers_metadata(pag) &&
26473009ed961c fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2625=
  	    (args->datatype & XFS_ALLOC_USERDATA) &&
0e1edbd9999427 fs/xfs/xfs_alloc.c        Nathan Scott      2006-08-10  2626=
  	    (flags & XFS_ALLOC_FLAG_TRYLOCK)) {
0e1edbd9999427 fs/xfs/xfs_alloc.c        Nathan Scott      2006-08-10  2627=
  		ASSERT(!(flags & XFS_ALLOC_FLAG_FREEING));
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2628=
  		goto out_agbp_relse;
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2629=
  	}
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2630=
  =

496817b4befced fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2631=
  	need =3D xfs_alloc_min_freelist(mp, pag);
54fee133ad59c8 fs/xfs/libxfs/xfs_alloc.c Christoph Hellwig 2017-01-09  2632=
  	if (!xfs_alloc_space_available(args, need, flags |
54fee133ad59c8 fs/xfs/libxfs/xfs_alloc.c Christoph Hellwig 2017-01-09  2633=
  			XFS_ALLOC_FLAG_CHECK))
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2634=
  		goto out_agbp_relse;
0e1edbd9999427 fs/xfs/xfs_alloc.c        Nathan Scott      2006-08-10  2635=
  =

^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2636=
  	/*
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2637=
  	 * Get the a.g. freespace buffer.
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2638=
  	 * Can fail if we're not blocking on locks, and it's held.
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2639=
  	 */
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22 @2640=
  	if (!agbp) {
bf14ac7fff281f fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2641=
  		error =3D xfs_alloc_read_agf(pag, tp, flags, &agbp);
f48e2df8a877ca fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2020-01-23  2642=
  		if (error) {
f48e2df8a877ca fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2020-01-23  2643=
  			/* Couldn't lock the AGF so skip this AG. */
f48e2df8a877ca fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2020-01-23  2644=
  			if (error =3D=3D -EAGAIN)
f48e2df8a877ca fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2020-01-23  2645=
  				error =3D 0;
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2646=
  			goto out_no_agbp;
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2647=
  		}
0e1edbd9999427 fs/xfs/xfs_alloc.c        Nathan Scott      2006-08-10  2648=
  	}
50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2649=
  =

a27ba2607e6031 fs/xfs/libxfs/xfs_alloc.c Brian Foster      2018-03-15  2650=
  	/* reset a padding mismatched agfl before final free space check */
26473009ed961c fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2651=
  	if (xfs_perag_agfl_needs_reset(pag))
a27ba2607e6031 fs/xfs/libxfs/xfs_alloc.c Brian Foster      2018-03-15  2652=
  		xfs_agfl_reset(tp, agbp, pag);
a27ba2607e6031 fs/xfs/libxfs/xfs_alloc.c Brian Foster      2018-03-15  2653=
  =

50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2654=
  	/* If there isn't enough total space or single-extent, reject it. */
496817b4befced fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2655=
  	need =3D xfs_alloc_min_freelist(mp, pag);
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2656=
  	if (!xfs_alloc_space_available(args, need, flags))
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2657=
  		goto out_agbp_relse;
72d552854b96b3 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2658=
  =

301519674699aa fs/xfs/libxfs/xfs_alloc.c Chandan Babu R    2021-01-22  2659=
  #ifdef DEBUG
301519674699aa fs/xfs/libxfs/xfs_alloc.c Chandan Babu R    2021-01-22  2660=
  	if (args->alloc_minlen_only) {
301519674699aa fs/xfs/libxfs/xfs_alloc.c Chandan Babu R    2021-01-22  2661=
  		int stat;
301519674699aa fs/xfs/libxfs/xfs_alloc.c Chandan Babu R    2021-01-22  2662=
  =

301519674699aa fs/xfs/libxfs/xfs_alloc.c Chandan Babu R    2021-01-22  2663=
  		error =3D xfs_exact_minlen_extent_available(args, agbp, &stat);
301519674699aa fs/xfs/libxfs/xfs_alloc.c Chandan Babu R    2021-01-22  2664=
  		if (error || !stat)
301519674699aa fs/xfs/libxfs/xfs_alloc.c Chandan Babu R    2021-01-22  2665=
  			goto out_agbp_relse;
301519674699aa fs/xfs/libxfs/xfs_alloc.c Chandan Babu R    2021-01-22  2666=
  	}
301519674699aa fs/xfs/libxfs/xfs_alloc.c Chandan Babu R    2021-01-22  2667=
  #endif
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2668=
  	/*
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2669=
  	 * Make the freelist shorter if it's too long.
50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2670=
  	 *
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2671=
  	 * Note that from this point onwards, we will always release the agf and
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2672=
  	 * agfl buffers on error. This handles the case where we error out and
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2673=
  	 * the buffers are clean or may not have been joined to the transaction
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2674=
  	 * and hence need to be released manually. If they have been joined to
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2675=
  	 * the transaction, then xfs_trans_brelse() will handle them
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2676=
  	 * appropriately based on the recursion count and dirty state of the
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2677=
  	 * buffer.
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2678=
  	 *
50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2679=
  	 * XXX (dgc): When we have lots of free space, does this buy us
50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2680=
  	 * anything other than extra overhead when we need to put more blocks
50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2681=
  	 * back on the free list? Maybe we should only do this when space is
50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2682=
  	 * getting low or the AGFL is more than half full?
04f130605ff6fb fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-08-03  2683=
  	 *
04f130605ff6fb fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-08-03  2684=
  	 * The NOSHRINK flag prevents the AGFL from being shrunk if it's too
04f130605ff6fb fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-08-03  2685=
  	 * big; the NORMAP flag prevents AGFL expand/shrink operations from
04f130605ff6fb fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-08-03  2686=
  	 * updating the rmapbt.  Both flags are used in xfs_repair while we're
04f130605ff6fb fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-08-03  2687=
  	 * rebuilding the rmapbt, and neither are used by the kernel.  They're
04f130605ff6fb fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-08-03  2688=
  	 * both required to ensure that rmaps are correctly recorded for the
04f130605ff6fb fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-08-03  2689=
  	 * regenerated AGFL, bnobt, and cntbt.  See repair/phase5.c and
04f130605ff6fb fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-08-03  2690=
  	 * repair/rmap.c in xfsprogs for details.
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2691=
  	 */
04f130605ff6fb fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-08-03  2692=
  	memset(&targs, 0, sizeof(targs));
7280fedaf3a0f9 fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2018-12-12  2693=
  	/* struct copy below */
04f130605ff6fb fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-08-03  2694=
  	if (flags & XFS_ALLOC_FLAG_NORMAP)
7280fedaf3a0f9 fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2018-12-12  2695=
  		targs.oinfo =3D XFS_RMAP_OINFO_SKIP_UPDATE;
04f130605ff6fb fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-08-03  2696=
  	else
7280fedaf3a0f9 fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2018-12-12  2697=
  		targs.oinfo =3D XFS_RMAP_OINFO_AG;
04f130605ff6fb fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-08-03  2698=
  	while (!(flags & XFS_ALLOC_FLAG_NOSHRINK) && pag->pagf_flcount > need) {
7b2d9261752e37 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2699=
  		error =3D xfs_alloc_get_freelist(pag, tp, agbp, &bno, 0);
92821e2ba4ae26 fs/xfs/xfs_alloc.c        David Chinner     2007-05-24  2700=
  		if (error)
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2701=
  			goto out_agbp_relse;
4223f659dd3edd fs/xfs/libxfs/xfs_alloc.c Brian Foster      2018-05-07  2702=
  =

c03edc9e49b6a3 fs/xfs/libxfs/xfs_alloc.c Brian Foster      2018-08-01  2703=
  		/* defer agfl frees */
0f37d1780c3d86 fs/xfs/libxfs/xfs_alloc.c Brian Foster      2018-08-01  2704=
  		xfs_defer_agfl_block(tp, args->agno, bno, &targs.oinfo);
f8f2835a9cf300 fs/xfs/libxfs/xfs_alloc.c Brian Foster      2018-05-07  2705=
  	}
50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2706=
  =

^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2707=
  	targs.tp =3D tp;
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2708=
  	targs.mp =3D mp;
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2709=
  	targs.agbp =3D agbp;
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2710=
  	targs.agno =3D args->agno;
3fd129b63fd062 fs/xfs/libxfs/xfs_alloc.c Darrick J. Wong   2016-09-19  2711=
  	targs.alignment =3D targs.minlen =3D targs.prod =3D 1;
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2712=
  	targs.type =3D XFS_ALLOCTYPE_THIS_AG;
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2713=
  	targs.pag =3D pag;
b2da748aa3281d fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2714=
  	error =3D xfs_alloc_read_agfl(pag, tp, &agflbp);
50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2715=
  	if (error)
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2716=
  		goto out_agbp_relse;
50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2717=
  =

50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2718=
  	/* Make the freelist longer if it's too short. */
50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2719=
  	while (pag->pagf_flcount < need) {
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2720=
  		targs.agbno =3D 0;
50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2721=
  		targs.maxlen =3D need - pag->pagf_flcount;
0ab32086d0bece fs/xfs/libxfs/xfs_alloc.c Brian Foster      2018-03-09  2722=
  		targs.resv =3D XFS_AG_RESV_AGFL;
50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2723=
  =

50adbcb4c4e6c9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2724=
  		/* Allocate as many blocks as possible at once. */
8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2725=
  		error =3D xfs_alloc_ag_vextent_size(&targs);
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2726=
  		if (error)
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2727=
  			goto out_agflbp_relse;
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2728=
  =

^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2729=
  		/*
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2730=
  		 * Stop if we run out.  Won't happen if callers are obeying
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2731=
  		 * the restrictions correctly.  Can happen for free calls
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2732=
  		 * on a completely full ag.
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2733=
  		 */
d210a28cd85108 fs/xfs/xfs_alloc.c        Yingping Lu       2006-06-09  2734=
  		if (targs.agbno =3D=3D NULLAGBLOCK) {
0e1edbd9999427 fs/xfs/xfs_alloc.c        Nathan Scott      2006-08-10  2735=
  			if (flags & XFS_ALLOC_FLAG_FREEING)
0e1edbd9999427 fs/xfs/xfs_alloc.c        Nathan Scott      2006-08-10  2736=
  				break;
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2737=
  			goto out_agflbp_relse;
d210a28cd85108 fs/xfs/xfs_alloc.c        Yingping Lu       2006-06-09  2738=
  		}
8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2739=
  =

8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2740=
  		if (!xfs_rmap_should_skip_owner_update(&targs.oinfo)) {
8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2741=
  			error =3D xfs_rmap_alloc(tp, agbp, pag,
8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2742=
  				       targs.agbno, targs.len, &targs.oinfo);
8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2743=
  			if (error)
8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2744=
  				goto out_agflbp_relse;
8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2745=
  		}
8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03 @2746=
  		error =3D xfs_alloc_update_counters(tp, agbp,
8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2747=
  						  -((long)(targs.len)));
8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2748=
  		if (error)
8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2749=
  			goto out_agflbp_relse;
8a78d222858874 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2750=
  =

^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2751=
  		/*
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2752=
  		 * Put each allocated block on the list.
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2753=
  		 */
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2754=
  		for (bno =3D targs.agbno; bno < targs.agbno + targs.len; bno++) {
dc38193218d34d fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2021-12-03  2755=
  			error =3D xfs_alloc_put_freelist(pag, tp, agbp,
92821e2ba4ae26 fs/xfs/xfs_alloc.c        David Chinner     2007-05-24  2756=
  							agflbp, bno, 0);
92821e2ba4ae26 fs/xfs/xfs_alloc.c        David Chinner     2007-05-24  2757=
  			if (error)
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2758=
  				goto out_agflbp_relse;
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2759=
  		}
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2760=
  	}
e63a3690013a47 fs/xfs/xfs_alloc.c        Nathan Scott      2006-05-08  2761=
  	xfs_trans_brelse(tp, agflbp);
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2762=
  	args->agbp =3D agbp;
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2763=
  	return 0;
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2764=
  =

396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2765=
  out_agflbp_relse:
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2766=
  	xfs_trans_brelse(tp, agflbp);
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2767=
  out_agbp_relse:
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2768=
  	if (agbp)
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2769=
  		xfs_trans_brelse(tp, agbp);
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2770=
  out_no_agbp:
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2771=
  	args->agbp =3D NULL;
396503fc8397e9 fs/xfs/libxfs/xfs_alloc.c Dave Chinner      2015-06-22  2772=
  	return error;
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2773=
  }
^1da177e4c3f41 fs/xfs/xfs_alloc.c        Linus Torvalds    2005-04-16  2774=
  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3935852370789702419==--

