Content-Type: multipart/mixed; boundary="===============1731756229269852022=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/8] xfs: pass a CIL context to xlog_write()
Date: Sun, 27 Jun 2021 07:10:53 +0800
Message-ID: <202106270717.0cDJhbXU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1731756229269852022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210617082617.971602-5-david@fromorbit.com>
References: <20210617082617.971602-5-david@fromorbit.com>
TO: Dave Chinner <david@fromorbit.com>
TO: linux-xfs(a)vger.kernel.org

Hi Dave,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[cannot apply to v5.13-rc7 next-20210625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dave-Chinner/xfs-log-fixes=
-for-for-next/20210617-162640
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: h8300-randconfig-m031-20210625 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/xfs_log_cil.c:1130 xlog_cil_push_work() error: uninitialized symbol =
'commit_lsn'.

Old smatch warnings:
fs/xfs/xfs_log_cil.c:644 xlog_discard_busy_extents() warn: should '(busyp->=
length) << mp->m_blkbb_log' be a 64 bit type?

vim +/commit_lsn +1130 fs/xfs/xfs_log_cil.c

be05dd0e68ac99 Dave Chinner      2021-06-08   846  =

71e330b593905e Dave Chinner      2010-05-21   847  /*
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   848   * Push the Committed It=
em List to the log.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   849   *
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   850   * If the current sequen=
ce is the same as xc_push_seq we need to do a flush. If
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   851   * xc_push_seq is less t=
han the current sequence, then it has already been
a44f13edf0ebb4 Dave Chinner      2010-08-24   852   * flushed and we don't =
need to do anything - the caller will wait for it to
a44f13edf0ebb4 Dave Chinner      2010-08-24   853   * complete if necessary.
a44f13edf0ebb4 Dave Chinner      2010-08-24   854   *
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   855   * xc_push_seq is checke=
d unlocked against the sequence number for a match.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   856   * Hence we can allow lo=
g forces to run racily and not issue pushes for the
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   857   * same sequence twice. =
 If we get a race between multiple pushes for the same
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   858   * sequence they will bl=
ock on the first one and then abort, hence avoiding
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   859   * needless pushes.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   860   */
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   861  static void
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   862  xlog_cil_push_work(
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   863  	struct work_struct	*wor=
k)
71e330b593905e Dave Chinner      2010-05-21   864  {
facd77e4e38b8f Dave Chinner      2021-06-04   865  	struct xfs_cil_ctx	*ctx=
 =3D
facd77e4e38b8f Dave Chinner      2021-06-04   866  		container_of(work, str=
uct xfs_cil_ctx, push_work);
facd77e4e38b8f Dave Chinner      2021-06-04   867  	struct xfs_cil		*cil =
=3D ctx->cil;
c7cc296ddd1f6d Christoph Hellwig 2020-03-20   868  	struct xlog		*log =3D c=
il->xc_log;
71e330b593905e Dave Chinner      2010-05-21   869  	struct xfs_log_vec	*lv;
71e330b593905e Dave Chinner      2010-05-21   870  	struct xfs_cil_ctx	*new=
_ctx;
71e330b593905e Dave Chinner      2010-05-21   871  	struct xlog_in_core	*co=
mmit_iclog;
66fc9ffa8638be Dave Chinner      2021-06-04   872  	int			num_iovecs =3D 0;
66fc9ffa8638be Dave Chinner      2021-06-04   873  	int			num_bytes =3D 0;
71e330b593905e Dave Chinner      2010-05-21   874  	int			error =3D 0;
877cf3473914ae Dave Chinner      2021-06-04   875  	struct xlog_cil_trans_h=
dr thdr;
a47518453bf958 Dave Chinner      2021-06-08   876  	struct xfs_log_vec	lvhd=
r =3D {};
71e330b593905e Dave Chinner      2010-05-21   877  	xfs_lsn_t		commit_lsn;
4c2d542f2e7865 Dave Chinner      2012-04-23   878  	xfs_lsn_t		push_seq;
0279bbbbc03f2c Dave Chinner      2021-06-03   879  	struct bio		bio;
0279bbbbc03f2c Dave Chinner      2021-06-03   880  	DECLARE_COMPLETION_ONST=
ACK(bdev_flush);
e12213ba5d909a Dave Chinner      2021-06-04   881  	bool			push_commit_stab=
le;
e469cbe84f4ade Dave Chinner      2021-06-08   882  	struct xlog_ticket	*tic=
ket;
71e330b593905e Dave Chinner      2010-05-21   883  =

facd77e4e38b8f Dave Chinner      2021-06-04   884  	new_ctx =3D xlog_cil_ct=
x_alloc();
71e330b593905e Dave Chinner      2010-05-21   885  	new_ctx->ticket =3D xlo=
g_cil_ticket_alloc(log);
71e330b593905e Dave Chinner      2010-05-21   886  =

71e330b593905e Dave Chinner      2010-05-21   887  	down_write(&cil->xc_ctx=
_lock);
71e330b593905e Dave Chinner      2010-05-21   888  =

4bb928cdb900d0 Dave Chinner      2013-08-12   889  	spin_lock(&cil->xc_push=
_lock);
4c2d542f2e7865 Dave Chinner      2012-04-23   890  	push_seq =3D cil->xc_pu=
sh_seq;
4c2d542f2e7865 Dave Chinner      2012-04-23   891  	ASSERT(push_seq <=3D ct=
x->sequence);
e12213ba5d909a Dave Chinner      2021-06-04   892  	push_commit_stable =3D =
cil->xc_push_commit_stable;
e12213ba5d909a Dave Chinner      2021-06-04   893  	cil->xc_push_commit_sta=
ble =3D false;
71e330b593905e Dave Chinner      2010-05-21   894  =

0e7ab7efe77451 Dave Chinner      2020-03-24   895  	/*
3682277520d6f4 Dave Chinner      2021-06-04   896  	 * As we are about to s=
witch to a new, empty CIL context, we no longer
3682277520d6f4 Dave Chinner      2021-06-04   897  	 * need to throttle tas=
ks on CIL space overruns. Wake any waiters that
3682277520d6f4 Dave Chinner      2021-06-04   898  	 * the hard push thrott=
le may have caught so they can start committing
3682277520d6f4 Dave Chinner      2021-06-04   899  	 * to the new context. =
The ctx->xc_push_lock provides the serialisation
3682277520d6f4 Dave Chinner      2021-06-04   900  	 * necessary for safely=
 using the lockless waitqueue_active() check in
3682277520d6f4 Dave Chinner      2021-06-04   901  	 * this context.
3682277520d6f4 Dave Chinner      2021-06-04   902  	 */
3682277520d6f4 Dave Chinner      2021-06-04   903  	if (waitqueue_active(&c=
il->xc_push_wait))
c7f87f3984cfa1 Dave Chinner      2020-06-16   904  		wake_up_all(&cil->xc_p=
ush_wait);
0e7ab7efe77451 Dave Chinner      2020-03-24   905  =

4c2d542f2e7865 Dave Chinner      2012-04-23   906  	/*
4c2d542f2e7865 Dave Chinner      2012-04-23   907  	 * Check if we've anyth=
ing to push. If there is nothing, then we don't
4c2d542f2e7865 Dave Chinner      2012-04-23   908  	 * move on to a new seq=
uence number and so we have to be able to push
4c2d542f2e7865 Dave Chinner      2012-04-23   909  	 * this sequence again =
later.
4c2d542f2e7865 Dave Chinner      2012-04-23   910  	 */
0d11bae4bcf4aa Dave Chinner      2021-06-04   911  	if (test_bit(XLOG_CIL_E=
MPTY, &cil->xc_flags)) {
4c2d542f2e7865 Dave Chinner      2012-04-23   912  		cil->xc_push_seq =3D 0;
4bb928cdb900d0 Dave Chinner      2013-08-12   913  		spin_unlock(&cil->xc_p=
ush_lock);
a44f13edf0ebb4 Dave Chinner      2010-08-24   914  		goto out_skip;
4c2d542f2e7865 Dave Chinner      2012-04-23   915  	}
4c2d542f2e7865 Dave Chinner      2012-04-23   916  =

a44f13edf0ebb4 Dave Chinner      2010-08-24   917  =

cf085a1b5d2214 Joe Perches       2019-11-07   918  	/* check for a previous=
ly pushed sequence */
facd77e4e38b8f Dave Chinner      2021-06-04   919  	if (push_seq < ctx->seq=
uence) {
8af3dcd3c89aef Dave Chinner      2014-09-23   920  		spin_unlock(&cil->xc_p=
ush_lock);
df806158b0f6eb Dave Chinner      2010-05-17   921  		goto out_skip;
8af3dcd3c89aef Dave Chinner      2014-09-23   922  	}
8af3dcd3c89aef Dave Chinner      2014-09-23   923  =

8af3dcd3c89aef Dave Chinner      2014-09-23   924  	/*
8af3dcd3c89aef Dave Chinner      2014-09-23   925  	 * We are now going to =
push this context, so add it to the committing
8af3dcd3c89aef Dave Chinner      2014-09-23   926  	 * list before we do an=
ything else. This ensures that anyone waiting on
8af3dcd3c89aef Dave Chinner      2014-09-23   927  	 * this push can easily=
 detect the difference between a "push in
8af3dcd3c89aef Dave Chinner      2014-09-23   928  	 * progress" and "CIL i=
s empty, nothing to do".
8af3dcd3c89aef Dave Chinner      2014-09-23   929  	 *
8af3dcd3c89aef Dave Chinner      2014-09-23   930  	 * IOWs, a wait loop ca=
n now check for:
8af3dcd3c89aef Dave Chinner      2014-09-23   931  	 *	the current sequence=
 not being found on the committing list;
8af3dcd3c89aef Dave Chinner      2014-09-23   932  	 *	an empty CIL; and
8af3dcd3c89aef Dave Chinner      2014-09-23   933  	 *	an unchanged sequenc=
e number
8af3dcd3c89aef Dave Chinner      2014-09-23   934  	 * to detect a push tha=
t had nothing to do and therefore does not need
8af3dcd3c89aef Dave Chinner      2014-09-23   935  	 * waiting on. If the C=
IL is not empty, we get put on the committing
8af3dcd3c89aef Dave Chinner      2014-09-23   936  	 * list before emptying=
 the CIL and bumping the sequence number. Hence
8af3dcd3c89aef Dave Chinner      2014-09-23   937  	 * an empty CIL and an =
unchanged sequence number means we jumped out
8af3dcd3c89aef Dave Chinner      2014-09-23   938  	 * above after doing no=
thing.
8af3dcd3c89aef Dave Chinner      2014-09-23   939  	 *
8af3dcd3c89aef Dave Chinner      2014-09-23   940  	 * Hence the waiter wil=
l either find the commit sequence on the
8af3dcd3c89aef Dave Chinner      2014-09-23   941  	 * committing list or t=
he sequence number will be unchanged and the CIL
8af3dcd3c89aef Dave Chinner      2014-09-23   942  	 * still dirty. In that=
 latter case, the push has not yet started, and
8af3dcd3c89aef Dave Chinner      2014-09-23   943  	 * so the waiter will h=
ave to continue trying to check the CIL
8af3dcd3c89aef Dave Chinner      2014-09-23   944  	 * committing list unti=
l it is found. In extreme cases of delay, the
8af3dcd3c89aef Dave Chinner      2014-09-23   945  	 * sequence may fully c=
ommit between the attempts the wait makes to wait
8af3dcd3c89aef Dave Chinner      2014-09-23   946  	 * on the commit sequen=
ce.
8af3dcd3c89aef Dave Chinner      2014-09-23   947  	 */
8af3dcd3c89aef Dave Chinner      2014-09-23   948  	list_add(&ctx->committi=
ng, &cil->xc_committing);
8af3dcd3c89aef Dave Chinner      2014-09-23   949  	spin_unlock(&cil->xc_pu=
sh_lock);
df806158b0f6eb Dave Chinner      2010-05-17   950  =

71e330b593905e Dave Chinner      2010-05-21   951  	/*
0279bbbbc03f2c Dave Chinner      2021-06-03   952  	 * The CIL is stable at=
 this point - nothing new will be added to it
0279bbbbc03f2c Dave Chinner      2021-06-03   953  	 * because we hold the =
flush lock exclusively. Hence we can now issue
0279bbbbc03f2c Dave Chinner      2021-06-03   954  	 * a cache flush to ens=
ure all the completed metadata in the journal we
0279bbbbc03f2c Dave Chinner      2021-06-03   955  	 * are about to overwri=
te is on stable storage.
0279bbbbc03f2c Dave Chinner      2021-06-03   956  	 */
0279bbbbc03f2c Dave Chinner      2021-06-03   957  	xfs_flush_bdev_async(&b=
io, log->l_mp->m_ddev_targp->bt_bdev,
0279bbbbc03f2c Dave Chinner      2021-06-03   958  				&bdev_flush);
0279bbbbc03f2c Dave Chinner      2021-06-03   959  =

a8613836d99e62 Dave Chinner      2021-06-08   960  	xlog_cil_pcp_aggregate(=
cil, ctx);
a8613836d99e62 Dave Chinner      2021-06-08   961  =

1f18c0c4b78cfb Dave Chinner      2021-06-08   962  	while (!list_empty(&ctx=
->log_items)) {
71e330b593905e Dave Chinner      2010-05-21   963  		struct xfs_log_item	*i=
tem;
71e330b593905e Dave Chinner      2010-05-21   964  =

1f18c0c4b78cfb Dave Chinner      2021-06-08   965  		item =3D list_first_en=
try(&ctx->log_items,
71e330b593905e Dave Chinner      2010-05-21   966  					struct xfs_log_item=
, li_cil);
a47518453bf958 Dave Chinner      2021-06-08   967  		lv =3D item->li_lv;
a1785f597c8b06 Dave Chinner      2021-06-08   968  		lv->lv_order_id =3D it=
em->li_order_id;
a47518453bf958 Dave Chinner      2021-06-08   969  		num_iovecs +=3D lv->lv=
_niovecs;
66fc9ffa8638be Dave Chinner      2021-06-04   970  		/* we don't write orde=
red log vectors */
66fc9ffa8638be Dave Chinner      2021-06-04   971  		if (lv->lv_buf_len !=
=3D XFS_LOG_VEC_ORDERED)
66fc9ffa8638be Dave Chinner      2021-06-04   972  			num_bytes +=3D lv->lv=
_bytes;
a47518453bf958 Dave Chinner      2021-06-08   973  =

a47518453bf958 Dave Chinner      2021-06-08   974  		list_add_tail(&lv->lv_=
list, &ctx->lv_chain);
a1785f597c8b06 Dave Chinner      2021-06-08   975  		list_del_init(&item->l=
i_cil);
a1785f597c8b06 Dave Chinner      2021-06-08   976  		item->li_order_id =3D =
0;
a1785f597c8b06 Dave Chinner      2021-06-08   977  		item->li_lv =3D NULL;
71e330b593905e Dave Chinner      2010-05-21   978  	}
71e330b593905e Dave Chinner      2010-05-21   979  =

71e330b593905e Dave Chinner      2010-05-21   980  	/*
facd77e4e38b8f Dave Chinner      2021-06-04   981  	 * Switch the contexts =
so we can drop the context lock and move out
71e330b593905e Dave Chinner      2010-05-21   982  	 * of a shared context.=
 We can't just go straight to the commit record,
71e330b593905e Dave Chinner      2010-05-21   983  	 * though - we need to =
synchronise with previous and future commits so
71e330b593905e Dave Chinner      2010-05-21   984  	 * that the commit reco=
rds are correctly ordered in the log to ensure
71e330b593905e Dave Chinner      2010-05-21   985  	 * that we process item=
s during log IO completion in the correct order.
71e330b593905e Dave Chinner      2010-05-21   986  	 *
71e330b593905e Dave Chinner      2010-05-21   987  	 * For example, if we g=
et an EFI in one checkpoint and the EFD in the
71e330b593905e Dave Chinner      2010-05-21   988  	 * next (e.g. due to lo=
g forces), we do not want the checkpoint with
71e330b593905e Dave Chinner      2010-05-21   989  	 * the EFD to be commit=
ted before the checkpoint with the EFI.  Hence
71e330b593905e Dave Chinner      2010-05-21   990  	 * we must strictly ord=
er the commit records of the checkpoints so
71e330b593905e Dave Chinner      2010-05-21   991  	 * that: a) the checkpo=
int callbacks are attached to the iclogs in the
71e330b593905e Dave Chinner      2010-05-21   992  	 * correct order; and b=
) the checkpoints are replayed in correct order
71e330b593905e Dave Chinner      2010-05-21   993  	 * in log recovery.
71e330b593905e Dave Chinner      2010-05-21   994  	 *
71e330b593905e Dave Chinner      2010-05-21   995  	 * Hence we need to add=
 this context to the committing context list so
71e330b593905e Dave Chinner      2010-05-21   996  	 * that higher sequence=
s will wait for us to write out a commit record
71e330b593905e Dave Chinner      2010-05-21   997  	 * before they do.
f876e44603ad09 Dave Chinner      2014-02-27   998  	 *
f39ae5297c5ce2 Dave Chinner      2021-06-04   999  	 * xfs_log_force_seq re=
quires us to mirror the new sequence into the cil
f876e44603ad09 Dave Chinner      2014-02-27  1000  	 * structure atomically=
 with the addition of this sequence to the
f876e44603ad09 Dave Chinner      2014-02-27  1001  	 * committing list. Thi=
s also ensures that we can do unlocked checks
f876e44603ad09 Dave Chinner      2014-02-27  1002  	 * against the current =
sequence in log forces without risking
f876e44603ad09 Dave Chinner      2014-02-27  1003  	 * deferencing a freed =
context pointer.
71e330b593905e Dave Chinner      2010-05-21  1004  	 */
4bb928cdb900d0 Dave Chinner      2013-08-12  1005  	spin_lock(&cil->xc_push=
_lock);
facd77e4e38b8f Dave Chinner      2021-06-04  1006  	xlog_cil_ctx_switch(cil=
, new_ctx);
4bb928cdb900d0 Dave Chinner      2013-08-12  1007  	spin_unlock(&cil->xc_pu=
sh_lock);
71e330b593905e Dave Chinner      2010-05-21  1008  	up_write(&cil->xc_ctx_l=
ock);
71e330b593905e Dave Chinner      2010-05-21  1009  =

a1785f597c8b06 Dave Chinner      2021-06-08  1010  	/*
a1785f597c8b06 Dave Chinner      2021-06-08  1011  	 * Sort the log vector =
chain before we add the transaction headers.
a1785f597c8b06 Dave Chinner      2021-06-08  1012  	 * This ensures we alwa=
ys have the transaction headers at the start
a1785f597c8b06 Dave Chinner      2021-06-08  1013  	 * of the chain.
a1785f597c8b06 Dave Chinner      2021-06-08  1014  	 */
a1785f597c8b06 Dave Chinner      2021-06-08  1015  	list_sort(NULL, &ctx->l=
v_chain, xlog_cil_order_cmp);
a1785f597c8b06 Dave Chinner      2021-06-08  1016  =

71e330b593905e Dave Chinner      2010-05-21  1017  	/*
71e330b593905e Dave Chinner      2010-05-21  1018  	 * Build a checkpoint t=
ransaction header and write it to the log to
71e330b593905e Dave Chinner      2010-05-21  1019  	 * begin the transactio=
n. We need to account for the space used by the
71e330b593905e Dave Chinner      2010-05-21  1020  	 * transaction header h=
ere as it is not accounted for in xlog_write().
a47518453bf958 Dave Chinner      2021-06-08  1021  	 * Add the lvhdr to the=
 head of the lv chain we pass to xlog_write() so
a47518453bf958 Dave Chinner      2021-06-08  1022  	 * it gets written into=
 the iclog first.
71e330b593905e Dave Chinner      2010-05-21  1023  	 */
877cf3473914ae Dave Chinner      2021-06-04  1024  	xlog_cil_build_trans_hd=
r(ctx, &thdr, &lvhdr, num_iovecs);
66fc9ffa8638be Dave Chinner      2021-06-04  1025  	num_bytes +=3D lvhdr.lv=
_bytes;
a47518453bf958 Dave Chinner      2021-06-08  1026  	list_add(&lvhdr.lv_list=
, &ctx->lv_chain);
71e330b593905e Dave Chinner      2010-05-21  1027  =

0279bbbbc03f2c Dave Chinner      2021-06-03  1028  	/*
0279bbbbc03f2c Dave Chinner      2021-06-03  1029  	 * Before we format and=
 submit the first iclog, we have to ensure that
0279bbbbc03f2c Dave Chinner      2021-06-03  1030  	 * the metadata writeba=
ck ordering cache flush is complete.
0279bbbbc03f2c Dave Chinner      2021-06-03  1031  	 */
0279bbbbc03f2c Dave Chinner      2021-06-03  1032  	wait_for_completion(&bd=
ev_flush);
0279bbbbc03f2c Dave Chinner      2021-06-03  1033  =

877cf3473914ae Dave Chinner      2021-06-04  1034  	/*
877cf3473914ae Dave Chinner      2021-06-04  1035  	 * The LSN we need to p=
ass to the log items on transaction commit is the
877cf3473914ae Dave Chinner      2021-06-04  1036  	 * LSN reported by the =
first log vector write, not the commit lsn. If we
877cf3473914ae Dave Chinner      2021-06-04  1037  	 * use the commit recor=
d lsn then we can move the tail beyond the grant
877cf3473914ae Dave Chinner      2021-06-04  1038  	 * write head.
877cf3473914ae Dave Chinner      2021-06-04  1039  	 */
fc3370002b56bc Dave Chinner      2021-06-17  1040  	error =3D xlog_write(lo=
g, ctx, &ctx->lv_chain, ctx->ticket,
a47518453bf958 Dave Chinner      2021-06-08  1041  				NULL, num_bytes);
a47518453bf958 Dave Chinner      2021-06-08  1042  =

a47518453bf958 Dave Chinner      2021-06-08  1043  	/*
a47518453bf958 Dave Chinner      2021-06-08  1044  	 * Take the lvhdr back =
off the lv_chain as it should not be passed
a47518453bf958 Dave Chinner      2021-06-08  1045  	 * to log IO completion.
a47518453bf958 Dave Chinner      2021-06-08  1046  	 */
a47518453bf958 Dave Chinner      2021-06-08  1047  	list_del(&lvhdr.lv_list=
);
71e330b593905e Dave Chinner      2010-05-21  1048  	if (error)
7db37c5e6575b2 Dave Chinner      2011-01-27  1049  		goto out_abort_free_ti=
cket;
71e330b593905e Dave Chinner      2010-05-21  1050  =

71e330b593905e Dave Chinner      2010-05-21  1051  	/*
71e330b593905e Dave Chinner      2010-05-21  1052  	 * now that we've writt=
en the checkpoint into the log, strictly
71e330b593905e Dave Chinner      2010-05-21  1053  	 * order the commit rec=
ords so replay will get them in the right order.
71e330b593905e Dave Chinner      2010-05-21  1054  	 */
71e330b593905e Dave Chinner      2010-05-21  1055  restart:
4bb928cdb900d0 Dave Chinner      2013-08-12  1056  	spin_lock(&cil->xc_push=
_lock);
71e330b593905e Dave Chinner      2010-05-21  1057  	list_for_each_entry(new=
_ctx, &cil->xc_committing, committing) {
ac983517ec5941 Dave Chinner      2014-05-07  1058  		/*
ac983517ec5941 Dave Chinner      2014-05-07  1059  		 * Avoid getting stuck=
 in this loop because we were woken by the
ac983517ec5941 Dave Chinner      2014-05-07  1060  		 * shutdown, but then =
went back to sleep once already in the
ac983517ec5941 Dave Chinner      2014-05-07  1061  		 * shutdown state.
ac983517ec5941 Dave Chinner      2014-05-07  1062  		 */
ac983517ec5941 Dave Chinner      2014-05-07  1063  		if (XLOG_FORCED_SHUTDO=
WN(log)) {
ac983517ec5941 Dave Chinner      2014-05-07  1064  			spin_unlock(&cil->xc_=
push_lock);
ac983517ec5941 Dave Chinner      2014-05-07  1065  			goto out_abort_free_t=
icket;
ac983517ec5941 Dave Chinner      2014-05-07  1066  		}
ac983517ec5941 Dave Chinner      2014-05-07  1067  =

71e330b593905e Dave Chinner      2010-05-21  1068  		/*
71e330b593905e Dave Chinner      2010-05-21  1069  		 * Higher sequences wi=
ll wait for this one so skip them.
ac983517ec5941 Dave Chinner      2014-05-07  1070  		 * Don't wait for our =
own sequence, either.
71e330b593905e Dave Chinner      2010-05-21  1071  		 */
71e330b593905e Dave Chinner      2010-05-21  1072  		if (new_ctx->sequence =
>=3D ctx->sequence)
71e330b593905e Dave Chinner      2010-05-21  1073  			continue;
71e330b593905e Dave Chinner      2010-05-21  1074  		if (!new_ctx->commit_l=
sn) {
71e330b593905e Dave Chinner      2010-05-21  1075  			/*
71e330b593905e Dave Chinner      2010-05-21  1076  			 * It is still being =
pushed! Wait for the push to
71e330b593905e Dave Chinner      2010-05-21  1077  			 * complete, then sta=
rt again from the beginning.
71e330b593905e Dave Chinner      2010-05-21  1078  			 */
4bb928cdb900d0 Dave Chinner      2013-08-12  1079  			xlog_wait(&cil->xc_co=
mmit_wait, &cil->xc_push_lock);
71e330b593905e Dave Chinner      2010-05-21  1080  			goto restart;
71e330b593905e Dave Chinner      2010-05-21  1081  		}
71e330b593905e Dave Chinner      2010-05-21  1082  	}
4bb928cdb900d0 Dave Chinner      2013-08-12  1083  	spin_unlock(&cil->xc_pu=
sh_lock);
71e330b593905e Dave Chinner      2010-05-21  1084  =

fc3370002b56bc Dave Chinner      2021-06-17  1085  	error =3D xlog_cil_writ=
e_commit_record(ctx, &commit_iclog);
dd401770b0ff68 Dave Chinner      2020-03-25  1086  	if (error)
dd401770b0ff68 Dave Chinner      2020-03-25  1087  		goto out_abort_free_ti=
cket;
dd401770b0ff68 Dave Chinner      2020-03-25  1088  =

89ae379d564c5d Christoph Hellwig 2019-06-28  1089  	spin_lock(&commit_iclog=
->ic_callback_lock);
1858bb0bec612d Christoph Hellwig 2019-10-14  1090  	if (commit_iclog->ic_st=
ate =3D=3D XLOG_STATE_IOERROR) {
89ae379d564c5d Christoph Hellwig 2019-06-28  1091  		spin_unlock(&commit_ic=
log->ic_callback_lock);
e469cbe84f4ade Dave Chinner      2021-06-08  1092  		goto out_abort_free_ti=
cket;
89ae379d564c5d Christoph Hellwig 2019-06-28  1093  	}
89ae379d564c5d Christoph Hellwig 2019-06-28  1094  	ASSERT_ALWAYS(commit_ic=
log->ic_state =3D=3D XLOG_STATE_ACTIVE ||
89ae379d564c5d Christoph Hellwig 2019-06-28  1095  		      commit_iclog->ic=
_state =3D=3D XLOG_STATE_WANT_SYNC);
89ae379d564c5d Christoph Hellwig 2019-06-28  1096  	list_add_tail(&ctx->icl=
og_entry, &commit_iclog->ic_callbacks);
89ae379d564c5d Christoph Hellwig 2019-06-28  1097  	spin_unlock(&commit_icl=
og->ic_callback_lock);
71e330b593905e Dave Chinner      2010-05-21  1098  =

71e330b593905e Dave Chinner      2010-05-21  1099  	/*
71e330b593905e Dave Chinner      2010-05-21  1100  	 * now the checkpoint c=
ommit is complete and we've attached the
71e330b593905e Dave Chinner      2010-05-21  1101  	 * callbacks to the icl=
og we can assign the commit LSN to the context
71e330b593905e Dave Chinner      2010-05-21  1102  	 * and wake up anyone w=
ho is waiting for the commit to complete.
71e330b593905e Dave Chinner      2010-05-21  1103  	 */
4bb928cdb900d0 Dave Chinner      2013-08-12  1104  	spin_lock(&cil->xc_push=
_lock);
eb40a87500ac2f Dave Chinner      2010-12-21  1105  	wake_up_all(&cil->xc_co=
mmit_wait);
4bb928cdb900d0 Dave Chinner      2013-08-12  1106  	spin_unlock(&cil->xc_pu=
sh_lock);
71e330b593905e Dave Chinner      2010-05-21  1107  =

e469cbe84f4ade Dave Chinner      2021-06-08  1108  	/*
e469cbe84f4ade Dave Chinner      2021-06-08  1109  	 * Pull the ticket off =
the ctx so we can ungrant it after releasing the
e469cbe84f4ade Dave Chinner      2021-06-08  1110  	 * commit_iclog. The ct=
x may be freed by the time we return from
e469cbe84f4ade Dave Chinner      2021-06-08  1111  	 * releasing the commit=
_iclog (i.e. checkpoint has been completed and
e469cbe84f4ade Dave Chinner      2021-06-08  1112  	 * callback run) so we =
can't reference the ctx after the call to
e469cbe84f4ade Dave Chinner      2021-06-08  1113  	 * xlog_state_release_i=
clog().
e469cbe84f4ade Dave Chinner      2021-06-08  1114  	 */
e469cbe84f4ade Dave Chinner      2021-06-08  1115  	ticket =3D ctx->ticket;
e469cbe84f4ade Dave Chinner      2021-06-08  1116  =

5fd9256ce156ef Dave Chinner      2021-06-03  1117  	/*
815753dc16bbca Dave Chinner      2021-06-17  1118  	 * If the checkpoint sp=
ans multiple iclogs, wait for all previous iclogs
815753dc16bbca Dave Chinner      2021-06-17  1119  	 * to complete before w=
e submit the commit_iclog. We can't use state
815753dc16bbca Dave Chinner      2021-06-17  1120  	 * checks for this - AC=
TIVE can be either a past completed iclog or a
815753dc16bbca Dave Chinner      2021-06-17  1121  	 * future iclog being f=
illed, while WANT_SYNC through SYNC_DONE can be a
815753dc16bbca Dave Chinner      2021-06-17  1122  	 * past or future iclog=
 awaiting IO or ordered IO completion to be run.
815753dc16bbca Dave Chinner      2021-06-17  1123  	 * In the latter case, =
if it's a future iclog and we wait on it, the we
815753dc16bbca Dave Chinner      2021-06-17  1124  	 * will hang because it=
 won't get processed through to ic_force_wait
815753dc16bbca Dave Chinner      2021-06-17  1125  	 * wakeup until this co=
mmit_iclog is written to disk.  Hence we use the
815753dc16bbca Dave Chinner      2021-06-17  1126  	 * iclog header lsn and=
 compare it to the commit lsn to determine if we
815753dc16bbca Dave Chinner      2021-06-17  1127  	 * need to wait on iclo=
gs or not.
5fd9256ce156ef Dave Chinner      2021-06-03  1128  	 */
5fd9256ce156ef Dave Chinner      2021-06-03  1129  	spin_lock(&log->l_iclog=
lock);
cb1acb3f324636 Dave Chinner      2021-06-04 @1130  	if (ctx->start_lsn !=3D=
 commit_lsn) {
815753dc16bbca Dave Chinner      2021-06-17  1131  		struct xlog_in_core	*i=
clog;
815753dc16bbca Dave Chinner      2021-06-17  1132  =

815753dc16bbca Dave Chinner      2021-06-17  1133  		for (iclog =3D commit_=
iclog->ic_prev;
815753dc16bbca Dave Chinner      2021-06-17  1134  		     iclog !=3D commit=
_iclog;
815753dc16bbca Dave Chinner      2021-06-17  1135  		     iclog =3D iclog->=
ic_prev) {
815753dc16bbca Dave Chinner      2021-06-17  1136  			xfs_lsn_t	hlsn;
815753dc16bbca Dave Chinner      2021-06-17  1137  =

815753dc16bbca Dave Chinner      2021-06-17  1138  			/*
815753dc16bbca Dave Chinner      2021-06-17  1139  			 * If the LSN of the =
iclog is zero or in the future it
815753dc16bbca Dave Chinner      2021-06-17  1140  			 * means it has passe=
d through IO completion and
815753dc16bbca Dave Chinner      2021-06-17  1141  			 * activation and hen=
ce all previous iclogs have also
815753dc16bbca Dave Chinner      2021-06-17  1142  			 * done so. We do not=
 need to wait at all in this case.
815753dc16bbca Dave Chinner      2021-06-17  1143  			 */
815753dc16bbca Dave Chinner      2021-06-17  1144  			hlsn =3D be64_to_cpu(=
iclog->ic_header.h_lsn);
815753dc16bbca Dave Chinner      2021-06-17  1145  			if (!hlsn || XFS_LSN_=
CMP(hlsn, commit_lsn) > 0)
815753dc16bbca Dave Chinner      2021-06-17  1146  				break;
815753dc16bbca Dave Chinner      2021-06-17  1147  =

815753dc16bbca Dave Chinner      2021-06-17  1148  			/*
815753dc16bbca Dave Chinner      2021-06-17  1149  			 * If the LSN of the =
iclog is older than the commit lsn,
815753dc16bbca Dave Chinner      2021-06-17  1150  			 * we have to wait on=
 it. Waiting on this via the
815753dc16bbca Dave Chinner      2021-06-17  1151  			 * ic_force_wait shou=
ld also order the completion of all
815753dc16bbca Dave Chinner      2021-06-17  1152  			 * older iclogs, too,=
 but we leave checking that to the
815753dc16bbca Dave Chinner      2021-06-17  1153  			 * next loop iteratio=
n.
815753dc16bbca Dave Chinner      2021-06-17  1154  			 */
815753dc16bbca Dave Chinner      2021-06-17  1155  			ASSERT(XFS_LSN_CMP(hl=
sn, commit_lsn) < 0);
815753dc16bbca Dave Chinner      2021-06-17  1156  			xlog_wait_on_iclog(ic=
log);
cb1acb3f324636 Dave Chinner      2021-06-04  1157  			spin_lock(&log->l_icl=
oglock);
815753dc16bbca Dave Chinner      2021-06-17  1158  		}
815753dc16bbca Dave Chinner      2021-06-17  1159  =

815753dc16bbca Dave Chinner      2021-06-17  1160  		/*
815753dc16bbca Dave Chinner      2021-06-17  1161  		 * Regardless of wheth=
er we need to wait or not, the the
815753dc16bbca Dave Chinner      2021-06-17  1162  		 * commit_iclog write =
needs to issue a pre-flush so that the
815753dc16bbca Dave Chinner      2021-06-17  1163  		 * ordering for this c=
heckpoint is correctly preserved down to
815753dc16bbca Dave Chinner      2021-06-17  1164  		 * stable storage.
815753dc16bbca Dave Chinner      2021-06-17  1165  		 */
cb1acb3f324636 Dave Chinner      2021-06-04  1166  		commit_iclog->ic_flags=
 |=3D XLOG_ICL_NEED_FLUSH;
5fd9256ce156ef Dave Chinner      2021-06-03  1167  	}
5fd9256ce156ef Dave Chinner      2021-06-03  1168  =

cb1acb3f324636 Dave Chinner      2021-06-04  1169  	/*
cb1acb3f324636 Dave Chinner      2021-06-04  1170  	 * The commit iclog mus=
t be written to stable storage to guarantee
cb1acb3f324636 Dave Chinner      2021-06-04  1171  	 * journal IO vs metada=
ta writeback IO is correctly ordered on stable
cb1acb3f324636 Dave Chinner      2021-06-04  1172  	 * storage.
e12213ba5d909a Dave Chinner      2021-06-04  1173  	 *
e12213ba5d909a Dave Chinner      2021-06-04  1174  	 * If the push caller n=
eeds the commit to be immediately stable and the
e12213ba5d909a Dave Chinner      2021-06-04  1175  	 * commit_iclog is not =
yet marked as XLOG_STATE_WANT_SYNC to indicate it
e12213ba5d909a Dave Chinner      2021-06-04  1176  	 * will be written when=
 released, switch it's state to WANT_SYNC right
e12213ba5d909a Dave Chinner      2021-06-04  1177  	 * now.
cb1acb3f324636 Dave Chinner      2021-06-04  1178  	 */
cb1acb3f324636 Dave Chinner      2021-06-04  1179  	commit_iclog->ic_flags =
|=3D XLOG_ICL_NEED_FUA;
e12213ba5d909a Dave Chinner      2021-06-04  1180  	if (push_commit_stable =
&& commit_iclog->ic_state =3D=3D XLOG_STATE_ACTIVE)
e12213ba5d909a Dave Chinner      2021-06-04  1181  		xlog_state_switch_iclo=
gs(log, commit_iclog, 0);
e469cbe84f4ade Dave Chinner      2021-06-08  1182  	xlog_state_release_iclo=
g(log, commit_iclog, ticket);
cb1acb3f324636 Dave Chinner      2021-06-04  1183  	spin_unlock(&log->l_icl=
oglock);
e469cbe84f4ade Dave Chinner      2021-06-08  1184  =

e469cbe84f4ade Dave Chinner      2021-06-08  1185  	xfs_log_ticket_ungrant(=
log, ticket);
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1186  	return;
71e330b593905e Dave Chinner      2010-05-21  1187  =

71e330b593905e Dave Chinner      2010-05-21  1188  out_skip:
71e330b593905e Dave Chinner      2010-05-21  1189  	up_write(&cil->xc_ctx_l=
ock);
71e330b593905e Dave Chinner      2010-05-21  1190  	xfs_log_ticket_put(new_=
ctx->ticket);
71e330b593905e Dave Chinner      2010-05-21  1191  	kmem_free(new_ctx);
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1192  	return;
71e330b593905e Dave Chinner      2010-05-21  1193  =

7db37c5e6575b2 Dave Chinner      2011-01-27  1194  out_abort_free_ticket:
877cf3473914ae Dave Chinner      2021-06-04  1195  	xfs_log_ticket_ungrant(=
log, ctx->ticket);
12e6a0f449d585 Christoph Hellwig 2020-03-20  1196  	ASSERT(XLOG_FORCED_SHUT=
DOWN(log));
12e6a0f449d585 Christoph Hellwig 2020-03-20  1197  	xlog_cil_committed(ctx);
4c2d542f2e7865 Dave Chinner      2012-04-23  1198  }
4c2d542f2e7865 Dave Chinner      2012-04-23  1199  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1731756229269852022==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1731756229269852022==--

