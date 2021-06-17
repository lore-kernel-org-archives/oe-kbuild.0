Content-Type: multipart/mixed; boundary="===============3602479564759843263=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6373/10489] fs/xfs/xfs_log_cil.c:897:1-10: second lock on line 900
Date: Thu, 17 Jun 2021 20:02:22 +0800
Message-ID: <202106172013.aa4jiheH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3602479564759843263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dave Chinner <dchinner@redhat.com>
CC: Chandan Babu R <chandanrlinux@gmail.com>
CC: "Darrick J. Wong" <djwong@kernel.org>
CC: Allison Henderson <allison.henderson@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   c7d4c1fd91ab4a6d2620497921a9c6bf54650ab8
commit: cb1acb3f324636856cb65bd4857c981a15b7f4d4 [6373/10489] xfs: journal =
IO cache flush reductions
:::::: branch date: 23 hours ago
:::::: commit date: 13 days ago
config: nds32-randconfig-c003-20210617 (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_log_cil.c:897:1-10: second lock on line 900

vim +897 fs/xfs/xfs_log_cil.c

89ae379d564c5d Christoph Hellwig 2019-06-28  625  =

71e330b593905e Dave Chinner      2010-05-21  626  /*
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  627   * Push the Committed Ite=
m List to the log.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  628   *
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  629   * If the current sequenc=
e is the same as xc_push_seq we need to do a flush. If
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  630   * xc_push_seq is less th=
an the current sequence, then it has already been
a44f13edf0ebb4 Dave Chinner      2010-08-24  631   * flushed and we don't n=
eed to do anything - the caller will wait for it to
a44f13edf0ebb4 Dave Chinner      2010-08-24  632   * complete if necessary.
a44f13edf0ebb4 Dave Chinner      2010-08-24  633   *
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  634   * xc_push_seq is checked=
 unlocked against the sequence number for a match.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  635   * Hence we can allow log=
 forces to run racily and not issue pushes for the
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  636   * same sequence twice.  =
If we get a race between multiple pushes for the same
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  637   * sequence they will blo=
ck on the first one and then abort, hence avoiding
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  638   * needless pushes.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  639   */
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  640  static void
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  641  xlog_cil_push_work(
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  642  	struct work_struct	*work)
71e330b593905e Dave Chinner      2010-05-21  643  {
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  644  	struct xfs_cil		*cil =3D
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  645  		container_of(work, stru=
ct xfs_cil, xc_push_work);
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  646  	struct xlog		*log =3D ci=
l->xc_log;
71e330b593905e Dave Chinner      2010-05-21  647  	struct xfs_log_vec	*lv;
71e330b593905e Dave Chinner      2010-05-21  648  	struct xfs_cil_ctx	*ctx;
71e330b593905e Dave Chinner      2010-05-21  649  	struct xfs_cil_ctx	*new_=
ctx;
71e330b593905e Dave Chinner      2010-05-21  650  	struct xlog_in_core	*com=
mit_iclog;
71e330b593905e Dave Chinner      2010-05-21  651  	struct xlog_ticket	*tic;
71e330b593905e Dave Chinner      2010-05-21  652  	int			num_iovecs;
71e330b593905e Dave Chinner      2010-05-21  653  	int			error =3D 0;
71e330b593905e Dave Chinner      2010-05-21  654  	struct xfs_trans_header =
thdr;
71e330b593905e Dave Chinner      2010-05-21  655  	struct xfs_log_iovec	lhd=
r;
71e330b593905e Dave Chinner      2010-05-21  656  	struct xfs_log_vec	lvhdr=
 =3D { NULL };
71e330b593905e Dave Chinner      2010-05-21  657  	xfs_lsn_t		commit_lsn;
4c2d542f2e7865 Dave Chinner      2012-04-23  658  	xfs_lsn_t		push_seq;
0279bbbbc03f2c Dave Chinner      2021-06-03  659  	struct bio		bio;
0279bbbbc03f2c Dave Chinner      2021-06-03  660  	DECLARE_COMPLETION_ONSTA=
CK(bdev_flush);
71e330b593905e Dave Chinner      2010-05-21  661  =

707e0ddaf67e89 Tetsuo Handa      2019-08-26  662  	new_ctx =3D kmem_zalloc(=
sizeof(*new_ctx), KM_NOFS);
71e330b593905e Dave Chinner      2010-05-21  663  	new_ctx->ticket =3D xlog=
_cil_ticket_alloc(log);
71e330b593905e Dave Chinner      2010-05-21  664  =

71e330b593905e Dave Chinner      2010-05-21  665  	down_write(&cil->xc_ctx_=
lock);
71e330b593905e Dave Chinner      2010-05-21  666  	ctx =3D cil->xc_ctx;
71e330b593905e Dave Chinner      2010-05-21  667  =

4bb928cdb900d0 Dave Chinner      2013-08-12  668  	spin_lock(&cil->xc_push_=
lock);
4c2d542f2e7865 Dave Chinner      2012-04-23  669  	push_seq =3D cil->xc_pus=
h_seq;
4c2d542f2e7865 Dave Chinner      2012-04-23  670  	ASSERT(push_seq <=3D ctx=
->sequence);
71e330b593905e Dave Chinner      2010-05-21  671  =

0e7ab7efe77451 Dave Chinner      2020-03-24  672  	/*
0e7ab7efe77451 Dave Chinner      2020-03-24  673  	 * Wake up any backgroun=
d push waiters now this context is being pushed.
0e7ab7efe77451 Dave Chinner      2020-03-24  674  	 */
c7f87f3984cfa1 Dave Chinner      2020-06-16  675  	if (ctx->space_used >=3D=
 XLOG_CIL_BLOCKING_SPACE_LIMIT(log))
c7f87f3984cfa1 Dave Chinner      2020-06-16  676  		wake_up_all(&cil->xc_pu=
sh_wait);
0e7ab7efe77451 Dave Chinner      2020-03-24  677  =

4c2d542f2e7865 Dave Chinner      2012-04-23  678  	/*
4c2d542f2e7865 Dave Chinner      2012-04-23  679  	 * Check if we've anythi=
ng to push. If there is nothing, then we don't
4c2d542f2e7865 Dave Chinner      2012-04-23  680  	 * move on to a new sequ=
ence number and so we have to be able to push
4c2d542f2e7865 Dave Chinner      2012-04-23  681  	 * this sequence again l=
ater.
4c2d542f2e7865 Dave Chinner      2012-04-23  682  	 */
4c2d542f2e7865 Dave Chinner      2012-04-23  683  	if (list_empty(&cil->xc_=
cil)) {
4c2d542f2e7865 Dave Chinner      2012-04-23  684  		cil->xc_push_seq =3D 0;
4bb928cdb900d0 Dave Chinner      2013-08-12  685  		spin_unlock(&cil->xc_pu=
sh_lock);
a44f13edf0ebb4 Dave Chinner      2010-08-24  686  		goto out_skip;
4c2d542f2e7865 Dave Chinner      2012-04-23  687  	}
4c2d542f2e7865 Dave Chinner      2012-04-23  688  =

a44f13edf0ebb4 Dave Chinner      2010-08-24  689  =

cf085a1b5d2214 Joe Perches       2019-11-07  690  	/* check for a previousl=
y pushed sequence */
8af3dcd3c89aef Dave Chinner      2014-09-23  691  	if (push_seq < cil->xc_c=
tx->sequence) {
8af3dcd3c89aef Dave Chinner      2014-09-23  692  		spin_unlock(&cil->xc_pu=
sh_lock);
df806158b0f6eb Dave Chinner      2010-05-17  693  		goto out_skip;
8af3dcd3c89aef Dave Chinner      2014-09-23  694  	}
8af3dcd3c89aef Dave Chinner      2014-09-23  695  =

8af3dcd3c89aef Dave Chinner      2014-09-23  696  	/*
8af3dcd3c89aef Dave Chinner      2014-09-23  697  	 * We are now going to p=
ush this context, so add it to the committing
8af3dcd3c89aef Dave Chinner      2014-09-23  698  	 * list before we do any=
thing else. This ensures that anyone waiting on
8af3dcd3c89aef Dave Chinner      2014-09-23  699  	 * this push can easily =
detect the difference between a "push in
8af3dcd3c89aef Dave Chinner      2014-09-23  700  	 * progress" and "CIL is=
 empty, nothing to do".
8af3dcd3c89aef Dave Chinner      2014-09-23  701  	 *
8af3dcd3c89aef Dave Chinner      2014-09-23  702  	 * IOWs, a wait loop can=
 now check for:
8af3dcd3c89aef Dave Chinner      2014-09-23  703  	 *	the current sequence =
not being found on the committing list;
8af3dcd3c89aef Dave Chinner      2014-09-23  704  	 *	an empty CIL; and
8af3dcd3c89aef Dave Chinner      2014-09-23  705  	 *	an unchanged sequence=
 number
8af3dcd3c89aef Dave Chinner      2014-09-23  706  	 * to detect a push that=
 had nothing to do and therefore does not need
8af3dcd3c89aef Dave Chinner      2014-09-23  707  	 * waiting on. If the CI=
L is not empty, we get put on the committing
8af3dcd3c89aef Dave Chinner      2014-09-23  708  	 * list before emptying =
the CIL and bumping the sequence number. Hence
8af3dcd3c89aef Dave Chinner      2014-09-23  709  	 * an empty CIL and an u=
nchanged sequence number means we jumped out
8af3dcd3c89aef Dave Chinner      2014-09-23  710  	 * above after doing not=
hing.
8af3dcd3c89aef Dave Chinner      2014-09-23  711  	 *
8af3dcd3c89aef Dave Chinner      2014-09-23  712  	 * Hence the waiter will=
 either find the commit sequence on the
8af3dcd3c89aef Dave Chinner      2014-09-23  713  	 * committing list or th=
e sequence number will be unchanged and the CIL
8af3dcd3c89aef Dave Chinner      2014-09-23  714  	 * still dirty. In that =
latter case, the push has not yet started, and
8af3dcd3c89aef Dave Chinner      2014-09-23  715  	 * so the waiter will ha=
ve to continue trying to check the CIL
8af3dcd3c89aef Dave Chinner      2014-09-23  716  	 * committing list until=
 it is found. In extreme cases of delay, the
8af3dcd3c89aef Dave Chinner      2014-09-23  717  	 * sequence may fully co=
mmit between the attempts the wait makes to wait
8af3dcd3c89aef Dave Chinner      2014-09-23  718  	 * on the commit sequenc=
e.
8af3dcd3c89aef Dave Chinner      2014-09-23  719  	 */
8af3dcd3c89aef Dave Chinner      2014-09-23  720  	list_add(&ctx->committin=
g, &cil->xc_committing);
8af3dcd3c89aef Dave Chinner      2014-09-23  721  	spin_unlock(&cil->xc_pus=
h_lock);
df806158b0f6eb Dave Chinner      2010-05-17  722  =

71e330b593905e Dave Chinner      2010-05-21  723  	/*
0279bbbbc03f2c Dave Chinner      2021-06-03  724  	 * The CIL is stable at =
this point - nothing new will be added to it
0279bbbbc03f2c Dave Chinner      2021-06-03  725  	 * because we hold the f=
lush lock exclusively. Hence we can now issue
0279bbbbc03f2c Dave Chinner      2021-06-03  726  	 * a cache flush to ensu=
re all the completed metadata in the journal we
0279bbbbc03f2c Dave Chinner      2021-06-03  727  	 * are about to overwrit=
e is on stable storage.
0279bbbbc03f2c Dave Chinner      2021-06-03  728  	 */
0279bbbbc03f2c Dave Chinner      2021-06-03  729  	xfs_flush_bdev_async(&bi=
o, log->l_mp->m_ddev_targp->bt_bdev,
0279bbbbc03f2c Dave Chinner      2021-06-03  730  				&bdev_flush);
0279bbbbc03f2c Dave Chinner      2021-06-03  731  =

0279bbbbc03f2c Dave Chinner      2021-06-03  732  	/*
0279bbbbc03f2c Dave Chinner      2021-06-03  733  	 * Pull all the log vect=
ors off the items in the CIL, and remove the
0279bbbbc03f2c Dave Chinner      2021-06-03  734  	 * items from the CIL. W=
e don't need the CIL lock here because it's only
0279bbbbc03f2c Dave Chinner      2021-06-03  735  	 * needed on the transac=
tion commit side which is currently locked out
0279bbbbc03f2c Dave Chinner      2021-06-03  736  	 * by the flush lock.
71e330b593905e Dave Chinner      2010-05-21  737  	 */
71e330b593905e Dave Chinner      2010-05-21  738  	lv =3D NULL;
71e330b593905e Dave Chinner      2010-05-21  739  	num_iovecs =3D 0;
71e330b593905e Dave Chinner      2010-05-21  740  	while (!list_empty(&cil-=
>xc_cil)) {
71e330b593905e Dave Chinner      2010-05-21  741  		struct xfs_log_item	*it=
em;
71e330b593905e Dave Chinner      2010-05-21  742  =

71e330b593905e Dave Chinner      2010-05-21  743  		item =3D list_first_ent=
ry(&cil->xc_cil,
71e330b593905e Dave Chinner      2010-05-21  744  					struct xfs_log_item,=
 li_cil);
71e330b593905e Dave Chinner      2010-05-21  745  		list_del_init(&item->li=
_cil);
71e330b593905e Dave Chinner      2010-05-21  746  		if (!ctx->lv_chain)
71e330b593905e Dave Chinner      2010-05-21  747  			ctx->lv_chain =3D item=
->li_lv;
71e330b593905e Dave Chinner      2010-05-21  748  		else
71e330b593905e Dave Chinner      2010-05-21  749  			lv->lv_next =3D item->=
li_lv;
71e330b593905e Dave Chinner      2010-05-21  750  		lv =3D item->li_lv;
71e330b593905e Dave Chinner      2010-05-21  751  		item->li_lv =3D NULL;
71e330b593905e Dave Chinner      2010-05-21  752  		num_iovecs +=3D lv->lv_=
niovecs;
71e330b593905e Dave Chinner      2010-05-21  753  	}
71e330b593905e Dave Chinner      2010-05-21  754  =

71e330b593905e Dave Chinner      2010-05-21  755  	/*
71e330b593905e Dave Chinner      2010-05-21  756  	 * initialise the new co=
ntext and attach it to the CIL. Then attach
c7f87f3984cfa1 Dave Chinner      2020-06-16  757  	 * the current context t=
o the CIL committing list so it can be found
71e330b593905e Dave Chinner      2010-05-21  758  	 * during log forces to =
extract the commit lsn of the sequence that
71e330b593905e Dave Chinner      2010-05-21  759  	 * needs to be forced.
71e330b593905e Dave Chinner      2010-05-21  760  	 */
71e330b593905e Dave Chinner      2010-05-21  761  	INIT_LIST_HEAD(&new_ctx-=
>committing);
71e330b593905e Dave Chinner      2010-05-21  762  	INIT_LIST_HEAD(&new_ctx-=
>busy_extents);
71e330b593905e Dave Chinner      2010-05-21  763  	new_ctx->sequence =3D ct=
x->sequence + 1;
71e330b593905e Dave Chinner      2010-05-21  764  	new_ctx->cil =3D cil;
71e330b593905e Dave Chinner      2010-05-21  765  	cil->xc_ctx =3D new_ctx;
71e330b593905e Dave Chinner      2010-05-21  766  =

71e330b593905e Dave Chinner      2010-05-21  767  	/*
71e330b593905e Dave Chinner      2010-05-21  768  	 * The switch is now don=
e, so we can drop the context lock and move out
71e330b593905e Dave Chinner      2010-05-21  769  	 * of a shared context. =
We can't just go straight to the commit record,
71e330b593905e Dave Chinner      2010-05-21  770  	 * though - we need to s=
ynchronise with previous and future commits so
71e330b593905e Dave Chinner      2010-05-21  771  	 * that the commit recor=
ds are correctly ordered in the log to ensure
71e330b593905e Dave Chinner      2010-05-21  772  	 * that we process items=
 during log IO completion in the correct order.
71e330b593905e Dave Chinner      2010-05-21  773  	 *
71e330b593905e Dave Chinner      2010-05-21  774  	 * For example, if we ge=
t an EFI in one checkpoint and the EFD in the
71e330b593905e Dave Chinner      2010-05-21  775  	 * next (e.g. due to log=
 forces), we do not want the checkpoint with
71e330b593905e Dave Chinner      2010-05-21  776  	 * the EFD to be committ=
ed before the checkpoint with the EFI.  Hence
71e330b593905e Dave Chinner      2010-05-21  777  	 * we must strictly orde=
r the commit records of the checkpoints so
71e330b593905e Dave Chinner      2010-05-21  778  	 * that: a) the checkpoi=
nt callbacks are attached to the iclogs in the
71e330b593905e Dave Chinner      2010-05-21  779  	 * correct order; and b)=
 the checkpoints are replayed in correct order
71e330b593905e Dave Chinner      2010-05-21  780  	 * in log recovery.
71e330b593905e Dave Chinner      2010-05-21  781  	 *
71e330b593905e Dave Chinner      2010-05-21  782  	 * Hence we need to add =
this context to the committing context list so
71e330b593905e Dave Chinner      2010-05-21  783  	 * that higher sequences=
 will wait for us to write out a commit record
71e330b593905e Dave Chinner      2010-05-21  784  	 * before they do.
f876e44603ad09 Dave Chinner      2014-02-27  785  	 *
f876e44603ad09 Dave Chinner      2014-02-27  786  	 * xfs_log_force_lsn req=
uires us to mirror the new sequence into the cil
f876e44603ad09 Dave Chinner      2014-02-27  787  	 * structure atomically =
with the addition of this sequence to the
f876e44603ad09 Dave Chinner      2014-02-27  788  	 * committing list. This=
 also ensures that we can do unlocked checks
f876e44603ad09 Dave Chinner      2014-02-27  789  	 * against the current s=
equence in log forces without risking
f876e44603ad09 Dave Chinner      2014-02-27  790  	 * deferencing a freed c=
ontext pointer.
71e330b593905e Dave Chinner      2010-05-21  791  	 */
4bb928cdb900d0 Dave Chinner      2013-08-12  792  	spin_lock(&cil->xc_push_=
lock);
f876e44603ad09 Dave Chinner      2014-02-27  793  	cil->xc_current_sequence=
 =3D new_ctx->sequence;
4bb928cdb900d0 Dave Chinner      2013-08-12  794  	spin_unlock(&cil->xc_pus=
h_lock);
71e330b593905e Dave Chinner      2010-05-21  795  	up_write(&cil->xc_ctx_lo=
ck);
71e330b593905e Dave Chinner      2010-05-21  796  =

71e330b593905e Dave Chinner      2010-05-21  797  	/*
71e330b593905e Dave Chinner      2010-05-21  798  	 * Build a checkpoint tr=
ansaction header and write it to the log to
71e330b593905e Dave Chinner      2010-05-21  799  	 * begin the transaction=
. We need to account for the space used by the
71e330b593905e Dave Chinner      2010-05-21  800  	 * transaction header he=
re as it is not accounted for in xlog_write().
71e330b593905e Dave Chinner      2010-05-21  801  	 *
71e330b593905e Dave Chinner      2010-05-21  802  	 * The LSN we need to pa=
ss to the log items on transaction commit is
71e330b593905e Dave Chinner      2010-05-21  803  	 * the LSN reported by t=
he first log vector write. If we use the commit
71e330b593905e Dave Chinner      2010-05-21  804  	 * record lsn then we ca=
n move the tail beyond the grant write head.
71e330b593905e Dave Chinner      2010-05-21  805  	 */
71e330b593905e Dave Chinner      2010-05-21  806  	tic =3D ctx->ticket;
71e330b593905e Dave Chinner      2010-05-21  807  	thdr.th_magic =3D XFS_TR=
ANS_HEADER_MAGIC;
71e330b593905e Dave Chinner      2010-05-21  808  	thdr.th_type =3D XFS_TRA=
NS_CHECKPOINT;
71e330b593905e Dave Chinner      2010-05-21  809  	thdr.th_tid =3D tic->t_t=
id;
71e330b593905e Dave Chinner      2010-05-21  810  	thdr.th_num_items =3D nu=
m_iovecs;
4e0d5f926b80b0 Christoph Hellwig 2010-06-23  811  	lhdr.i_addr =3D &thdr;
71e330b593905e Dave Chinner      2010-05-21  812  	lhdr.i_len =3D sizeof(xf=
s_trans_header_t);
71e330b593905e Dave Chinner      2010-05-21  813  	lhdr.i_type =3D XLOG_REG=
_TYPE_TRANSHDR;
71e330b593905e Dave Chinner      2010-05-21  814  	tic->t_curr_res -=3D lhd=
r.i_len + sizeof(xlog_op_header_t);
71e330b593905e Dave Chinner      2010-05-21  815  =

71e330b593905e Dave Chinner      2010-05-21  816  	lvhdr.lv_niovecs =3D 1;
71e330b593905e Dave Chinner      2010-05-21  817  	lvhdr.lv_iovecp =3D &lhd=
r;
71e330b593905e Dave Chinner      2010-05-21  818  	lvhdr.lv_next =3D ctx->l=
v_chain;
71e330b593905e Dave Chinner      2010-05-21  819  =

0279bbbbc03f2c Dave Chinner      2021-06-03  820  	/*
0279bbbbc03f2c Dave Chinner      2021-06-03  821  	 * Before we format and =
submit the first iclog, we have to ensure that
0279bbbbc03f2c Dave Chinner      2021-06-03  822  	 * the metadata writebac=
k ordering cache flush is complete.
0279bbbbc03f2c Dave Chinner      2021-06-03  823  	 */
0279bbbbc03f2c Dave Chinner      2021-06-03  824  	wait_for_completion(&bde=
v_flush);
0279bbbbc03f2c Dave Chinner      2021-06-03  825  =

69d51e0e16864f Dave Chinner      2021-06-04  826  	error =3D xlog_write(log=
, &lvhdr, tic, &ctx->start_lsn, NULL,
69d51e0e16864f Dave Chinner      2021-06-04  827  				XLOG_START_TRANS);
71e330b593905e Dave Chinner      2010-05-21  828  	if (error)
7db37c5e6575b2 Dave Chinner      2011-01-27  829  		goto out_abort_free_tic=
ket;
71e330b593905e Dave Chinner      2010-05-21  830  =

71e330b593905e Dave Chinner      2010-05-21  831  	/*
71e330b593905e Dave Chinner      2010-05-21  832  	 * now that we've writte=
n the checkpoint into the log, strictly
71e330b593905e Dave Chinner      2010-05-21  833  	 * order the commit reco=
rds so replay will get them in the right order.
71e330b593905e Dave Chinner      2010-05-21  834  	 */
71e330b593905e Dave Chinner      2010-05-21  835  restart:
4bb928cdb900d0 Dave Chinner      2013-08-12  836  	spin_lock(&cil->xc_push_=
lock);
71e330b593905e Dave Chinner      2010-05-21  837  	list_for_each_entry(new_=
ctx, &cil->xc_committing, committing) {
ac983517ec5941 Dave Chinner      2014-05-07  838  		/*
ac983517ec5941 Dave Chinner      2014-05-07  839  		 * Avoid getting stuck =
in this loop because we were woken by the
ac983517ec5941 Dave Chinner      2014-05-07  840  		 * shutdown, but then w=
ent back to sleep once already in the
ac983517ec5941 Dave Chinner      2014-05-07  841  		 * shutdown state.
ac983517ec5941 Dave Chinner      2014-05-07  842  		 */
ac983517ec5941 Dave Chinner      2014-05-07  843  		if (XLOG_FORCED_SHUTDOW=
N(log)) {
ac983517ec5941 Dave Chinner      2014-05-07  844  			spin_unlock(&cil->xc_p=
ush_lock);
ac983517ec5941 Dave Chinner      2014-05-07  845  			goto out_abort_free_ti=
cket;
ac983517ec5941 Dave Chinner      2014-05-07  846  		}
ac983517ec5941 Dave Chinner      2014-05-07  847  =

71e330b593905e Dave Chinner      2010-05-21  848  		/*
71e330b593905e Dave Chinner      2010-05-21  849  		 * Higher sequences wil=
l wait for this one so skip them.
ac983517ec5941 Dave Chinner      2014-05-07  850  		 * Don't wait for our o=
wn sequence, either.
71e330b593905e Dave Chinner      2010-05-21  851  		 */
71e330b593905e Dave Chinner      2010-05-21  852  		if (new_ctx->sequence >=
=3D ctx->sequence)
71e330b593905e Dave Chinner      2010-05-21  853  			continue;
71e330b593905e Dave Chinner      2010-05-21  854  		if (!new_ctx->commit_ls=
n) {
71e330b593905e Dave Chinner      2010-05-21  855  			/*
71e330b593905e Dave Chinner      2010-05-21  856  			 * It is still being p=
ushed! Wait for the push to
71e330b593905e Dave Chinner      2010-05-21  857  			 * complete, then star=
t again from the beginning.
71e330b593905e Dave Chinner      2010-05-21  858  			 */
4bb928cdb900d0 Dave Chinner      2013-08-12  859  			xlog_wait(&cil->xc_com=
mit_wait, &cil->xc_push_lock);
71e330b593905e Dave Chinner      2010-05-21  860  			goto restart;
71e330b593905e Dave Chinner      2010-05-21  861  		}
71e330b593905e Dave Chinner      2010-05-21  862  	}
4bb928cdb900d0 Dave Chinner      2013-08-12  863  	spin_unlock(&cil->xc_pus=
h_lock);
71e330b593905e Dave Chinner      2010-05-21  864  =

f10e925def9a6d Dave Chinner      2020-03-25  865  	error =3D xlog_commit_re=
cord(log, tic, &commit_iclog, &commit_lsn);
dd401770b0ff68 Dave Chinner      2020-03-25  866  	if (error)
dd401770b0ff68 Dave Chinner      2020-03-25  867  		goto out_abort_free_tic=
ket;
dd401770b0ff68 Dave Chinner      2020-03-25  868  =

8b41e3f98e6ca1 Christoph Hellwig 2020-03-25  869  	xfs_log_ticket_ungrant(l=
og, tic);
71e330b593905e Dave Chinner      2010-05-21  870  =

89ae379d564c5d Christoph Hellwig 2019-06-28  871  	spin_lock(&commit_iclog-=
>ic_callback_lock);
1858bb0bec612d Christoph Hellwig 2019-10-14  872  	if (commit_iclog->ic_sta=
te =3D=3D XLOG_STATE_IOERROR) {
89ae379d564c5d Christoph Hellwig 2019-06-28  873  		spin_unlock(&commit_icl=
og->ic_callback_lock);
71e330b593905e Dave Chinner      2010-05-21  874  		goto out_abort;
89ae379d564c5d Christoph Hellwig 2019-06-28  875  	}
89ae379d564c5d Christoph Hellwig 2019-06-28  876  	ASSERT_ALWAYS(commit_icl=
og->ic_state =3D=3D XLOG_STATE_ACTIVE ||
89ae379d564c5d Christoph Hellwig 2019-06-28  877  		      commit_iclog->ic_=
state =3D=3D XLOG_STATE_WANT_SYNC);
89ae379d564c5d Christoph Hellwig 2019-06-28  878  	list_add_tail(&ctx->iclo=
g_entry, &commit_iclog->ic_callbacks);
89ae379d564c5d Christoph Hellwig 2019-06-28  879  	spin_unlock(&commit_iclo=
g->ic_callback_lock);
71e330b593905e Dave Chinner      2010-05-21  880  =

71e330b593905e Dave Chinner      2010-05-21  881  	/*
71e330b593905e Dave Chinner      2010-05-21  882  	 * now the checkpoint co=
mmit is complete and we've attached the
71e330b593905e Dave Chinner      2010-05-21  883  	 * callbacks to the iclo=
g we can assign the commit LSN to the context
71e330b593905e Dave Chinner      2010-05-21  884  	 * and wake up anyone wh=
o is waiting for the commit to complete.
71e330b593905e Dave Chinner      2010-05-21  885  	 */
4bb928cdb900d0 Dave Chinner      2013-08-12  886  	spin_lock(&cil->xc_push_=
lock);
71e330b593905e Dave Chinner      2010-05-21  887  	ctx->commit_lsn =3D comm=
it_lsn;
eb40a87500ac2f Dave Chinner      2010-12-21  888  	wake_up_all(&cil->xc_com=
mit_wait);
4bb928cdb900d0 Dave Chinner      2013-08-12  889  	spin_unlock(&cil->xc_pus=
h_lock);
71e330b593905e Dave Chinner      2010-05-21  890  =

5fd9256ce156ef Dave Chinner      2021-06-03  891  	/*
5fd9256ce156ef Dave Chinner      2021-06-03  892  	 * If the checkpoint spa=
ns multiple iclogs, wait for all previous
cb1acb3f324636 Dave Chinner      2021-06-04  893  	 * iclogs to complete be=
fore we submit the commit_iclog. In this case,
cb1acb3f324636 Dave Chinner      2021-06-04  894  	 * the commit_iclog writ=
e needs to issue a pre-flush so that the
cb1acb3f324636 Dave Chinner      2021-06-04  895  	 * ordering is correctly=
 preserved down to stable storage.
5fd9256ce156ef Dave Chinner      2021-06-03  896  	 */
5fd9256ce156ef Dave Chinner      2021-06-03 @897  	spin_lock(&log->l_iclogl=
ock);
cb1acb3f324636 Dave Chinner      2021-06-04  898  	if (ctx->start_lsn !=3D =
commit_lsn) {
5fd9256ce156ef Dave Chinner      2021-06-03  899  		xlog_wait_on_iclog(comm=
it_iclog->ic_prev);
cb1acb3f324636 Dave Chinner      2021-06-04 @900  		spin_lock(&log->l_iclog=
lock);
cb1acb3f324636 Dave Chinner      2021-06-04  901  		commit_iclog->ic_flags =
|=3D XLOG_ICL_NEED_FLUSH;
5fd9256ce156ef Dave Chinner      2021-06-03  902  	}
5fd9256ce156ef Dave Chinner      2021-06-03  903  =

cb1acb3f324636 Dave Chinner      2021-06-04  904  	/*
cb1acb3f324636 Dave Chinner      2021-06-04  905  	 * The commit iclog must=
 be written to stable storage to guarantee
cb1acb3f324636 Dave Chinner      2021-06-04  906  	 * journal IO vs metadat=
a writeback IO is correctly ordered on stable
cb1acb3f324636 Dave Chinner      2021-06-04  907  	 * storage.
cb1acb3f324636 Dave Chinner      2021-06-04  908  	 */
cb1acb3f324636 Dave Chinner      2021-06-04  909  	commit_iclog->ic_flags |=
=3D XLOG_ICL_NEED_FUA;
cb1acb3f324636 Dave Chinner      2021-06-04  910  	xlog_state_release_iclog=
(log, commit_iclog);
cb1acb3f324636 Dave Chinner      2021-06-04  911  	spin_unlock(&log->l_iclo=
glock);
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  912  	return;
71e330b593905e Dave Chinner      2010-05-21  913  =

71e330b593905e Dave Chinner      2010-05-21  914  out_skip:
71e330b593905e Dave Chinner      2010-05-21  915  	up_write(&cil->xc_ctx_lo=
ck);
71e330b593905e Dave Chinner      2010-05-21  916  	xfs_log_ticket_put(new_c=
tx->ticket);
71e330b593905e Dave Chinner      2010-05-21  917  	kmem_free(new_ctx);
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  918  	return;
71e330b593905e Dave Chinner      2010-05-21  919  =

7db37c5e6575b2 Dave Chinner      2011-01-27  920  out_abort_free_ticket:
8b41e3f98e6ca1 Christoph Hellwig 2020-03-25  921  	xfs_log_ticket_ungrant(l=
og, tic);
71e330b593905e Dave Chinner      2010-05-21  922  out_abort:
12e6a0f449d585 Christoph Hellwig 2020-03-20  923  	ASSERT(XLOG_FORCED_SHUTD=
OWN(log));
12e6a0f449d585 Christoph Hellwig 2020-03-20  924  	xlog_cil_committed(ctx);
4c2d542f2e7865 Dave Chinner      2012-04-23  925  }
4c2d542f2e7865 Dave Chinner      2012-04-23  926  =


:::::: The code at line 897 was first introduced by commit
:::::: 5fd9256ce156ef7780f05c9ff0a5b9e2ed9f6679 xfs: separate CIL commit re=
cord IO

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Dave Chinner <david@fromorbit.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3602479564759843263==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
BcrMedyxIwEA
--===============3602479564759843263==--

