Content-Type: multipart/mixed; boundary="===============7798766507397394230=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 13298/13468] drivers/scsi/libiscsi_tcp.c:563:2-8: preceding lock on line 542
Date: Sun, 22 May 2022 12:42:24 +0800
Message-ID: <202205221208.kAbInIPD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7798766507397394230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mike Christie <michael.christie@oracle.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Lee Duncan <lduncan@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: a01ff1e161ea32d438d94032dd93cf2e4d9caac3 [13298/13468] scsi: iscsi:=
 Remove iscsi_get_task back_lock requirement
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
522/202205221208.kAbInIPD-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/libiscsi_tcp.c:563:2-8: preceding lock on line 542

vim +563 drivers/scsi/libiscsi_tcp.c

a081c13e39b5c1 Mike Christie     2008-12-02  523  =

a081c13e39b5c1 Mike Christie     2008-12-02  524  /**
a081c13e39b5c1 Mike Christie     2008-12-02  525   * iscsi_tcp_r2t_rsp - iS=
CSI R2T Response processing
a081c13e39b5c1 Mike Christie     2008-12-02  526   * @conn: iscsi connection
5923d64b7ab63d Mike Christie     2021-02-06  527   * @hdr: PDU header
a081c13e39b5c1 Mike Christie     2008-12-02  528   */
5923d64b7ab63d Mike Christie     2021-02-06  529  static int iscsi_tcp_r2t_=
rsp(struct iscsi_conn *conn, struct iscsi_hdr *hdr)
a081c13e39b5c1 Mike Christie     2008-12-02  530  {
a081c13e39b5c1 Mike Christie     2008-12-02  531  	struct iscsi_session *se=
ssion =3D conn->session;
5923d64b7ab63d Mike Christie     2021-02-06  532  	struct iscsi_tcp_task *t=
cp_task;
5923d64b7ab63d Mike Christie     2021-02-06  533  	struct iscsi_tcp_conn *t=
cp_conn;
5923d64b7ab63d Mike Christie     2021-02-06  534  	struct iscsi_r2t_rsp *rh=
dr;
a081c13e39b5c1 Mike Christie     2008-12-02  535  	struct iscsi_r2t_info *r=
2t;
5923d64b7ab63d Mike Christie     2021-02-06  536  	struct iscsi_task *task;
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  537  	u32 data_length;
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  538  	u32 data_offset;
5923d64b7ab63d Mike Christie     2021-02-06  539  	int r2tsn;
a081c13e39b5c1 Mike Christie     2008-12-02  540  	int rc;
a081c13e39b5c1 Mike Christie     2008-12-02  541  =

5923d64b7ab63d Mike Christie     2021-02-06 @542  	spin_lock(&session->back=
_lock);
5923d64b7ab63d Mike Christie     2021-02-06  543  	task =3D iscsi_itt_to_ct=
ask(conn, hdr->itt);
5923d64b7ab63d Mike Christie     2021-02-06  544  	if (!task) {
5923d64b7ab63d Mike Christie     2021-02-06  545  		spin_unlock(&session->b=
ack_lock);
5923d64b7ab63d Mike Christie     2021-02-06  546  		return ISCSI_ERR_BAD_IT=
T;
5923d64b7ab63d Mike Christie     2021-02-06  547  	} else if (task->sc->sc_=
data_direction !=3D DMA_TO_DEVICE) {
5923d64b7ab63d Mike Christie     2021-02-06  548  		spin_unlock(&session->b=
ack_lock);
5923d64b7ab63d Mike Christie     2021-02-06  549  		return ISCSI_ERR_PROTO;
5923d64b7ab63d Mike Christie     2021-02-06  550  	}
5923d64b7ab63d Mike Christie     2021-02-06  551  	/*
5923d64b7ab63d Mike Christie     2021-02-06  552  	 * A bad target might co=
mplete the cmd before we have handled R2Ts
5923d64b7ab63d Mike Christie     2021-02-06  553  	 * so get a ref to the t=
ask that will be dropped in the xmit path.
5923d64b7ab63d Mike Christie     2021-02-06  554  	 */
5923d64b7ab63d Mike Christie     2021-02-06  555  	if (task->state !=3D ISC=
SI_TASK_RUNNING) {
5923d64b7ab63d Mike Christie     2021-02-06  556  		spin_unlock(&session->b=
ack_lock);
5923d64b7ab63d Mike Christie     2021-02-06  557  		/* Let the path that go=
t the early rsp complete it */
5923d64b7ab63d Mike Christie     2021-02-06  558  		return 0;
5923d64b7ab63d Mike Christie     2021-02-06  559  	}
5923d64b7ab63d Mike Christie     2021-02-06  560  	task->last_xfer =3D jiff=
ies;
a01ff1e161ea32 Mike Christie     2022-05-18  561  	if (!iscsi_get_task(task=
)) {
a01ff1e161ea32 Mike Christie     2022-05-18  562  		/* Let the path that go=
t the early rsp complete it */
a01ff1e161ea32 Mike Christie     2022-05-18 @563  		return 0;
a01ff1e161ea32 Mike Christie     2022-05-18  564  	}
5923d64b7ab63d Mike Christie     2021-02-06  565  =

5923d64b7ab63d Mike Christie     2021-02-06  566  	tcp_conn =3D conn->dd_da=
ta;
5923d64b7ab63d Mike Christie     2021-02-06  567  	rhdr =3D (struct iscsi_r=
2t_rsp *)tcp_conn->in.hdr;
5923d64b7ab63d Mike Christie     2021-02-06  568  	/* fill-in new R2T assoc=
iated with the task */
5923d64b7ab63d Mike Christie     2021-02-06  569  	iscsi_update_cmdsn(sessi=
on, (struct iscsi_nopin *)rhdr);
5923d64b7ab63d Mike Christie     2021-02-06  570  	spin_unlock(&session->ba=
ck_lock);
5923d64b7ab63d Mike Christie     2021-02-06  571  =

a081c13e39b5c1 Mike Christie     2008-12-02  572  	if (tcp_conn->in.datalen=
) {
a081c13e39b5c1 Mike Christie     2008-12-02  573  		iscsi_conn_printk(KERN_=
ERR, conn,
a081c13e39b5c1 Mike Christie     2008-12-02  574  				  "invalid R2t with d=
atalen %d\n",
a081c13e39b5c1 Mike Christie     2008-12-02  575  				  tcp_conn->in.datale=
n);
5923d64b7ab63d Mike Christie     2021-02-06  576  		rc =3D ISCSI_ERR_DATALE=
N;
5923d64b7ab63d Mike Christie     2021-02-06  577  		goto put_task;
a081c13e39b5c1 Mike Christie     2008-12-02  578  	}
a081c13e39b5c1 Mike Christie     2008-12-02  579  =

5923d64b7ab63d Mike Christie     2021-02-06  580  	tcp_task =3D task->dd_da=
ta;
5923d64b7ab63d Mike Christie     2021-02-06  581  	r2tsn =3D be32_to_cpu(rh=
dr->r2tsn);
a081c13e39b5c1 Mike Christie     2008-12-02  582  	if (tcp_task->exp_datasn=
 !=3D r2tsn){
0ab1c2529e6a70 Mike Christie     2009-03-05  583  		ISCSI_DBG_TCP(conn, "ta=
sk->exp_datasn(%d) !=3D rhdr->r2tsn(%d)\n",
0ab1c2529e6a70 Mike Christie     2009-03-05  584  			      tcp_task->exp_da=
tasn, r2tsn);
5923d64b7ab63d Mike Christie     2021-02-06  585  		rc =3D ISCSI_ERR_R2TSN;
5923d64b7ab63d Mike Christie     2021-02-06  586  		goto put_task;
a081c13e39b5c1 Mike Christie     2008-12-02  587  	}
a081c13e39b5c1 Mike Christie     2008-12-02  588  =

5923d64b7ab63d Mike Christie     2021-02-06  589  	if (session->state !=3D =
ISCSI_STATE_LOGGED_IN) {
a081c13e39b5c1 Mike Christie     2008-12-02  590  		iscsi_conn_printk(KERN_=
INFO, conn,
a081c13e39b5c1 Mike Christie     2008-12-02  591  				  "dropping R2T itt %=
d in recovery.\n",
a081c13e39b5c1 Mike Christie     2008-12-02  592  				  task->itt);
5923d64b7ab63d Mike Christie     2021-02-06  593  		rc =3D 0;
5923d64b7ab63d Mike Christie     2021-02-06  594  		goto put_task;
a081c13e39b5c1 Mike Christie     2008-12-02  595  	}
a081c13e39b5c1 Mike Christie     2008-12-02  596  =

5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  597  	data_length =3D be32_to_=
cpu(rhdr->data_length);
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  598  	if (data_length =3D=3D 0=
) {
a081c13e39b5c1 Mike Christie     2008-12-02  599  		iscsi_conn_printk(KERN_=
ERR, conn,
a081c13e39b5c1 Mike Christie     2008-12-02  600  				  "invalid R2T with z=
ero data len\n");
5923d64b7ab63d Mike Christie     2021-02-06  601  		rc =3D ISCSI_ERR_DATALE=
N;
5923d64b7ab63d Mike Christie     2021-02-06  602  		goto put_task;
a081c13e39b5c1 Mike Christie     2008-12-02  603  	}
a081c13e39b5c1 Mike Christie     2008-12-02  604  =

5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  605  	if (data_length > sessio=
n->max_burst)
0ab1c2529e6a70 Mike Christie     2009-03-05  606  		ISCSI_DBG_TCP(conn, "in=
valid R2T with data len %u and max "
0ab1c2529e6a70 Mike Christie     2009-03-05  607  			      "burst %u. Attem=
pting to execute request.\n",
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  608  			      data_length, ses=
sion->max_burst);
a081c13e39b5c1 Mike Christie     2008-12-02  609  =

5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  610  	data_offset =3D be32_to_=
cpu(rhdr->data_offset);
ae3d56d81507c3 Christoph Hellwig 2019-01-29  611  	if (data_offset + data_l=
ength > task->sc->sdb.length) {
a081c13e39b5c1 Mike Christie     2008-12-02  612  		iscsi_conn_printk(KERN_=
ERR, conn,
a081c13e39b5c1 Mike Christie     2008-12-02  613  				  "invalid R2T with d=
ata len %u at offset %u "
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  614  				  "and total length %=
d\n", data_length,
ae3d56d81507c3 Christoph Hellwig 2019-01-29  615  				  data_offset, task->=
sc->sdb.length);
5923d64b7ab63d Mike Christie     2021-02-06  616  		rc =3D ISCSI_ERR_DATALE=
N;
5923d64b7ab63d Mike Christie     2021-02-06  617  		goto put_task;
a081c13e39b5c1 Mike Christie     2008-12-02  618  	}
a081c13e39b5c1 Mike Christie     2008-12-02  619  =

659743b02c4110 Shlomo Pongratz   2014-02-07  620  	spin_lock(&tcp_task->poo=
l2queue);
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  621  	rc =3D kfifo_out(&tcp_ta=
sk->r2tpool.queue, (void *)&r2t, sizeof(void *));
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  622  	if (!rc) {
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  623  		iscsi_conn_printk(KERN_=
ERR, conn, "Could not allocate R2T. "
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  624  				  "Target has sent mo=
re R2Ts than it "
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  625  				  "negotiated for or =
driver has leaked.\n");
659743b02c4110 Shlomo Pongratz   2014-02-07  626  		spin_unlock(&tcp_task->=
pool2queue);
5923d64b7ab63d Mike Christie     2021-02-06  627  		rc =3D ISCSI_ERR_PROTO;
5923d64b7ab63d Mike Christie     2021-02-06  628  		goto put_task;
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  629  	}
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  630  =

5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  631  	r2t->exp_statsn =3D rhdr=
->statsn;
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  632  	r2t->data_length =3D dat=
a_length;
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  633  	r2t->data_offset =3D dat=
a_offset;
5d0fddd0a72d30 Shlomo Pongratz   2014-02-07  634  =

a081c13e39b5c1 Mike Christie     2008-12-02  635  	r2t->ttt =3D rhdr->ttt; =
/* no flip */
a081c13e39b5c1 Mike Christie     2008-12-02  636  	r2t->datasn =3D 0;
a081c13e39b5c1 Mike Christie     2008-12-02  637  	r2t->sent =3D 0;
a081c13e39b5c1 Mike Christie     2008-12-02  638  =

a081c13e39b5c1 Mike Christie     2008-12-02  639  	tcp_task->exp_datasn =3D=
 r2tsn + 1;
7acd72eb85f1c7 Stefani Seibold   2009-12-21  640  	kfifo_in(&tcp_task->r2tq=
ueue, (void*)&r2t, sizeof(void*));
a081c13e39b5c1 Mike Christie     2008-12-02  641  	conn->r2t_pdus_cnt++;
659743b02c4110 Shlomo Pongratz   2014-02-07  642  	spin_unlock(&tcp_task->p=
ool2queue);
a081c13e39b5c1 Mike Christie     2008-12-02  643  =

a081c13e39b5c1 Mike Christie     2008-12-02  644  	iscsi_requeue_task(task);
a081c13e39b5c1 Mike Christie     2008-12-02  645  	return 0;
5923d64b7ab63d Mike Christie     2021-02-06  646  =

5923d64b7ab63d Mike Christie     2021-02-06  647  put_task:
5923d64b7ab63d Mike Christie     2021-02-06  648  	iscsi_put_task(task);
5923d64b7ab63d Mike Christie     2021-02-06  649  	return rc;
a081c13e39b5c1 Mike Christie     2008-12-02  650  }
a081c13e39b5c1 Mike Christie     2008-12-02  651  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7798766507397394230==--

