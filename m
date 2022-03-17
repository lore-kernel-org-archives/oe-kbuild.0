Content-Type: multipart/mixed; boundary="===============1576747530417156460=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/7] xfs: xfs_ail_push_all_sync() stalls when racing with updates
Date: Thu, 17 Mar 2022 22:30:05 +0800
Message-ID: <202203172212.pRLbx3jA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1576747530417156460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220317053907.164160-4-david@fromorbit.com>
References: <20220317053907.164160-4-david@fromorbit.com>
TO: Dave Chinner <david@fromorbit.com>
TO: linux-xfs(a)vger.kernel.org

Hi Dave,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on v5.17-rc8 next-20220316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dave-Chinner/xfs-log-recov=
ery-fixes/20220317-141849
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: parisc-randconfig-m031-20220317 (https://download.01.org/0day-ci/ar=
chive/20220317/202203172212.pRLbx3jA-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/xfs/xfs_trans_ail.c:476 xfsaild_push() error: uninitialized symbol 'targ=
et'.

vim +/target +476 fs/xfs/xfs_trans_ail.c

7f4d01f36a3ac1 Brian Foster      2017-08-08  416  =

0030807c66f058 Christoph Hellwig 2011-10-11  417  static long
0030807c66f058 Christoph Hellwig 2011-10-11  418  xfsaild_push(
0030807c66f058 Christoph Hellwig 2011-10-11  419  	struct xfs_ail		*ailp)
249a8c1124653f David Chinner     2008-02-05  420  {
57e809561118a4 Matthew Wilcox    2018-03-07  421  	xfs_mount_t		*mp =3D ail=
p->ail_mount;
af3e40228fb2db Dave Chinner      2011-07-18  422  	struct xfs_ail_cursor	cu=
r;
efe2330fdc246a Christoph Hellwig 2019-06-28  423  	struct xfs_log_item	*lip;
9e7004e741de0b Dave Chinner      2011-05-06  424  	xfs_lsn_t		lsn;
fe0da767311933 Dave Chinner      2011-05-06  425  	xfs_lsn_t		target;
43ff2122e6492b Christoph Hellwig 2012-04-23  426  	long			tout;
9e7004e741de0b Dave Chinner      2011-05-06  427  	int			stuck =3D 0;
43ff2122e6492b Christoph Hellwig 2012-04-23  428  	int			flushing =3D 0;
9e7004e741de0b Dave Chinner      2011-05-06  429  	int			count =3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  430  =

670ce93fef93bb Dave Chinner      2011-09-30  431  	/*
43ff2122e6492b Christoph Hellwig 2012-04-23  432  	 * If we encountered pin=
ned items or did not finish writing out all
0020a190cf3eac Dave Chinner      2021-08-10  433  	 * buffers the last time=
 we ran, force a background CIL push to get the
0020a190cf3eac Dave Chinner      2021-08-10  434  	 * items unpinned in the=
 near future. We do not wait on the CIL push as
0020a190cf3eac Dave Chinner      2021-08-10  435  	 * that could stall us f=
or seconds if there is enough background IO
0020a190cf3eac Dave Chinner      2021-08-10  436  	 * load. Stalling for th=
at long when the tail of the log is pinned and
0020a190cf3eac Dave Chinner      2021-08-10  437  	 * needs flushing will h=
ard stop the transaction subsystem when log
0020a190cf3eac Dave Chinner      2021-08-10  438  	 * space runs out.
670ce93fef93bb Dave Chinner      2011-09-30  439  	 */
57e809561118a4 Matthew Wilcox    2018-03-07  440  	if (ailp->ail_log_flush =
&& ailp->ail_last_pushed_lsn =3D=3D 0 &&
57e809561118a4 Matthew Wilcox    2018-03-07  441  	    (!list_empty_careful=
(&ailp->ail_buf_list) ||
43ff2122e6492b Christoph Hellwig 2012-04-23  442  	     xfs_ail_min_lsn(ail=
p))) {
57e809561118a4 Matthew Wilcox    2018-03-07  443  		ailp->ail_log_flush =3D=
 0;
43ff2122e6492b Christoph Hellwig 2012-04-23  444  =

ff6d6af2351cae Bill O'Donnell    2015-10-12  445  		XFS_STATS_INC(mp, xs_pu=
sh_ail_flush);
0020a190cf3eac Dave Chinner      2021-08-10  446  		xlog_cil_flush(mp->m_lo=
g);
670ce93fef93bb Dave Chinner      2011-09-30  447  	}
670ce93fef93bb Dave Chinner      2011-09-30  448  =

57e809561118a4 Matthew Wilcox    2018-03-07  449  	spin_lock(&ailp->ail_loc=
k);
8375f922aaa6e7 Brian Foster      2012-06-28  450  =

29e90a4845ecee Dave Chinner      2022-03-17  451  	/*
29e90a4845ecee Dave Chinner      2022-03-17  452  	 * If we have a sync pus=
h waiter, we always have to push till the AIL is
29e90a4845ecee Dave Chinner      2022-03-17  453  	 * empty. Update the tar=
get to point to the end of the AIL so that
29e90a4845ecee Dave Chinner      2022-03-17  454  	 * capture updates that =
occur after the sync push waiter has gone to
29e90a4845ecee Dave Chinner      2022-03-17  455  	 * sleep.
29e90a4845ecee Dave Chinner      2022-03-17  456  	 */
29e90a4845ecee Dave Chinner      2022-03-17  457  	if (waitqueue_active(&ai=
lp->ail_empty)) {
29e90a4845ecee Dave Chinner      2022-03-17  458  		lip =3D xfs_ail_max(ail=
p);
29e90a4845ecee Dave Chinner      2022-03-17  459  		if (lip)
29e90a4845ecee Dave Chinner      2022-03-17  460  			target =3D lip->li_lsn;
29e90a4845ecee Dave Chinner      2022-03-17  461  	} else {
57e809561118a4 Matthew Wilcox    2018-03-07  462  		/* barrier matches the =
ail_target update in xfs_ail_push() */
8375f922aaa6e7 Brian Foster      2012-06-28  463  		smp_rmb();
57e809561118a4 Matthew Wilcox    2018-03-07  464  		target =3D ailp->ail_ta=
rget;
57e809561118a4 Matthew Wilcox    2018-03-07  465  		ailp->ail_target_prev =
=3D target;
29e90a4845ecee Dave Chinner      2022-03-17  466  	}
8375f922aaa6e7 Brian Foster      2012-06-28  467  =

f376b45e861d8b Brian Foster      2020-07-16  468  	/* we're done if the AIL=
 is empty or our push has reached the end */
57e809561118a4 Matthew Wilcox    2018-03-07  469  	lip =3D xfs_trans_ail_cu=
rsor_first(ailp, &cur, ailp->ail_last_pushed_lsn);
f376b45e861d8b Brian Foster      2020-07-16  470  	if (!lip)
9e7004e741de0b Dave Chinner      2011-05-06  471  		goto out_done;
^1da177e4c3f41 Linus Torvalds    2005-04-16  472  =

ff6d6af2351cae Bill O'Donnell    2015-10-12  473  	XFS_STATS_INC(mp, xs_pus=
h_ail);
^1da177e4c3f41 Linus Torvalds    2005-04-16  474  =

249a8c1124653f David Chinner     2008-02-05  475  	lsn =3D lip->li_lsn;
50e86686dfb287 Dave Chinner      2011-05-06 @476  	while ((XFS_LSN_CMP(lip-=
>li_lsn, target) <=3D 0)) {
249a8c1124653f David Chinner     2008-02-05  477  		int	lock_result;
43ff2122e6492b Christoph Hellwig 2012-04-23  478  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  479  		/*
904c17e6832845 Dave Chinner      2013-08-28  480  		 * Note that iop_push m=
ay unlock and reacquire the AIL lock.  We
43ff2122e6492b Christoph Hellwig 2012-04-23  481  		 * rely on the AIL curs=
or implementation to be able to deal with
43ff2122e6492b Christoph Hellwig 2012-04-23  482  		 * the dropped lock.
^1da177e4c3f41 Linus Torvalds    2005-04-16  483  		 */
7f4d01f36a3ac1 Brian Foster      2017-08-08  484  		lock_result =3D xfsaild=
_push_item(ailp, lip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  485  		switch (lock_result) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  486  		case XFS_ITEM_SUCCESS:
ff6d6af2351cae Bill O'Donnell    2015-10-12  487  			XFS_STATS_INC(mp, xs_p=
ush_ail_success);
9e4c109ac82239 Christoph Hellwig 2011-10-11  488  			trace_xfs_ail_push(lip=
);
9e4c109ac82239 Christoph Hellwig 2011-10-11  489  =

57e809561118a4 Matthew Wilcox    2018-03-07  490  			ailp->ail_last_pushed_=
lsn =3D lsn;
^1da177e4c3f41 Linus Torvalds    2005-04-16  491  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  492  =

43ff2122e6492b Christoph Hellwig 2012-04-23  493  		case XFS_ITEM_FLUSHING:
43ff2122e6492b Christoph Hellwig 2012-04-23  494  			/*
cf085a1b5d2214 Joe Perches       2019-11-07  495  			 * The item or its bac=
king buffer is already being
43ff2122e6492b Christoph Hellwig 2012-04-23  496  			 * flushed.  The typic=
al reason for that is that an
43ff2122e6492b Christoph Hellwig 2012-04-23  497  			 * inode buffer is loc=
ked because we already pushed the
43ff2122e6492b Christoph Hellwig 2012-04-23  498  			 * updates to it as pa=
rt of inode clustering.
43ff2122e6492b Christoph Hellwig 2012-04-23  499  			 *
b63da6c8dfa9b2 Randy Dunlap      2020-08-05  500  			 * We do not want to s=
top flushing just because lots
cf085a1b5d2214 Joe Perches       2019-11-07  501  			 * of items are alread=
y being flushed, but we need to
43ff2122e6492b Christoph Hellwig 2012-04-23  502  			 * re-try the flushing=
 relatively soon if most of the
cf085a1b5d2214 Joe Perches       2019-11-07  503  			 * AIL is being flushe=
d.
43ff2122e6492b Christoph Hellwig 2012-04-23  504  			 */
ff6d6af2351cae Bill O'Donnell    2015-10-12  505  			XFS_STATS_INC(mp, xs_p=
ush_ail_flushing);
43ff2122e6492b Christoph Hellwig 2012-04-23  506  			trace_xfs_ail_flushing=
(lip);
17b38471c3c07a Christoph Hellwig 2011-10-11  507  =

43ff2122e6492b Christoph Hellwig 2012-04-23  508  			flushing++;
57e809561118a4 Matthew Wilcox    2018-03-07  509  			ailp->ail_last_pushed_=
lsn =3D lsn;
^1da177e4c3f41 Linus Torvalds    2005-04-16  510  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  511  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  512  		case XFS_ITEM_PINNED:
ff6d6af2351cae Bill O'Donnell    2015-10-12  513  			XFS_STATS_INC(mp, xs_p=
ush_ail_pinned);
9e4c109ac82239 Christoph Hellwig 2011-10-11  514  			trace_xfs_ail_pinned(l=
ip);
9e4c109ac82239 Christoph Hellwig 2011-10-11  515  =

249a8c1124653f David Chinner     2008-02-05  516  			stuck++;
57e809561118a4 Matthew Wilcox    2018-03-07  517  			ailp->ail_log_flush++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  518  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  519  		case XFS_ITEM_LOCKED:
ff6d6af2351cae Bill O'Donnell    2015-10-12  520  			XFS_STATS_INC(mp, xs_p=
ush_ail_locked);
9e4c109ac82239 Christoph Hellwig 2011-10-11  521  			trace_xfs_ail_locked(l=
ip);
43ff2122e6492b Christoph Hellwig 2012-04-23  522  =

249a8c1124653f David Chinner     2008-02-05  523  			stuck++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  524  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  525  		default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  526  			ASSERT(0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  527  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  528  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  529  =

249a8c1124653f David Chinner     2008-02-05  530  		count++;
249a8c1124653f David Chinner     2008-02-05  531  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  532  		/*
249a8c1124653f David Chinner     2008-02-05  533  		 * Are there too many i=
tems we can't do anything with?
43ff2122e6492b Christoph Hellwig 2012-04-23  534  		 *
b63da6c8dfa9b2 Randy Dunlap      2020-08-05  535  		 * If we are skipping t=
oo many items because we can't flush
249a8c1124653f David Chinner     2008-02-05  536  		 * them or they are alr=
eady being flushed, we back off and
249a8c1124653f David Chinner     2008-02-05  537  		 * given them time to c=
omplete whatever operation is being
249a8c1124653f David Chinner     2008-02-05  538  		 * done. i.e. remove pr=
essure from the AIL while we can't make
249a8c1124653f David Chinner     2008-02-05  539  		 * progress so traversa=
ls don't slow down further inserts and
249a8c1124653f David Chinner     2008-02-05  540  		 * removals to/from the=
 AIL.
249a8c1124653f David Chinner     2008-02-05  541  		 *
249a8c1124653f David Chinner     2008-02-05  542  		 * The value of 100 is =
an arbitrary magic number based on
249a8c1124653f David Chinner     2008-02-05  543  		 * observation.
^1da177e4c3f41 Linus Torvalds    2005-04-16  544  		 */
249a8c1124653f David Chinner     2008-02-05  545  		if (stuck > 100)
249a8c1124653f David Chinner     2008-02-05  546  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  547  =

af3e40228fb2db Dave Chinner      2011-07-18  548  		lip =3D xfs_trans_ail_c=
ursor_next(ailp, &cur);
249a8c1124653f David Chinner     2008-02-05  549  		if (lip =3D=3D NULL)
249a8c1124653f David Chinner     2008-02-05  550  			break;
249a8c1124653f David Chinner     2008-02-05  551  		lsn =3D lip->li_lsn;
^1da177e4c3f41 Linus Torvalds    2005-04-16  552  	}
f376b45e861d8b Brian Foster      2020-07-16  553  =

f376b45e861d8b Brian Foster      2020-07-16  554  out_done:
e4a1e29cb0ace3 Eric Sandeen      2014-04-14  555  	xfs_trans_ail_cursor_don=
e(&cur);
57e809561118a4 Matthew Wilcox    2018-03-07  556  	spin_unlock(&ailp->ail_l=
ock);
^1da177e4c3f41 Linus Torvalds    2005-04-16  557  =

57e809561118a4 Matthew Wilcox    2018-03-07  558  	if (xfs_buf_delwri_submi=
t_nowait(&ailp->ail_buf_list))
57e809561118a4 Matthew Wilcox    2018-03-07  559  		ailp->ail_log_flush++;
d808f617ad00a4 Dave Chinner      2010-02-02  560  =

43ff2122e6492b Christoph Hellwig 2012-04-23  561  	if (!count || XFS_LSN_CM=
P(lsn, target) >=3D 0) {
249a8c1124653f David Chinner     2008-02-05  562  		/*
43ff2122e6492b Christoph Hellwig 2012-04-23  563  		 * We reached the targe=
t or the AIL is empty, so wait a bit
43ff2122e6492b Christoph Hellwig 2012-04-23  564  		 * longer for I/O to co=
mplete and remove pushed items from the
43ff2122e6492b Christoph Hellwig 2012-04-23  565  		 * AIL before we start =
the next scan from the start of the AIL.
249a8c1124653f David Chinner     2008-02-05  566  		 */
453eac8a9aa417 Dave Chinner      2010-01-11  567  		tout =3D 50;
57e809561118a4 Matthew Wilcox    2018-03-07  568  		ailp->ail_last_pushed_l=
sn =3D 0;
43ff2122e6492b Christoph Hellwig 2012-04-23  569  	} else if (((stuck + flu=
shing) * 100) / count > 90) {
249a8c1124653f David Chinner     2008-02-05  570  		/*
43ff2122e6492b Christoph Hellwig 2012-04-23  571  		 * Either there is a lo=
t of contention on the AIL or we are
43ff2122e6492b Christoph Hellwig 2012-04-23  572  		 * stuck due to operati=
ons in progress. "Stuck" in this case
43ff2122e6492b Christoph Hellwig 2012-04-23  573  		 * is defined as >90% o=
f the items we tried to push were stuck.
249a8c1124653f David Chinner     2008-02-05  574  		 *
249a8c1124653f David Chinner     2008-02-05  575  		 * Backoff a bit more t=
o allow some I/O to complete before
43ff2122e6492b Christoph Hellwig 2012-04-23  576  		 * restarting from the =
start of the AIL. This prevents us from
43ff2122e6492b Christoph Hellwig 2012-04-23  577  		 * spinning on the same=
 items, and if they are pinned will all
43ff2122e6492b Christoph Hellwig 2012-04-23  578  		 * the restart to issue=
 a log force to unpin the stuck items.
249a8c1124653f David Chinner     2008-02-05  579  		 */
453eac8a9aa417 Dave Chinner      2010-01-11  580  		tout =3D 20;
57e809561118a4 Matthew Wilcox    2018-03-07  581  		ailp->ail_last_pushed_l=
sn =3D 0;
43ff2122e6492b Christoph Hellwig 2012-04-23  582  	} else {
43ff2122e6492b Christoph Hellwig 2012-04-23  583  		/*
43ff2122e6492b Christoph Hellwig 2012-04-23  584  		 * Assume we have more =
work to do in a short while.
43ff2122e6492b Christoph Hellwig 2012-04-23  585  		 */
43ff2122e6492b Christoph Hellwig 2012-04-23  586  		tout =3D 10;
^1da177e4c3f41 Linus Torvalds    2005-04-16  587  	}
0bf6a5bd4b55b4 Dave Chinner      2011-04-08  588  =

0030807c66f058 Christoph Hellwig 2011-10-11  589  	return tout;
0030807c66f058 Christoph Hellwig 2011-10-11  590  }
0030807c66f058 Christoph Hellwig 2011-10-11  591  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1576747530417156460==--

