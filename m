Content-Type: multipart/mixed; boundary="===============6308074399276290648=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V2 09/12] scsi: iscsi: Remove iscsi_get_task back_lock requirement
Date: Sun, 20 Mar 2022 11:51:15 +0800
Message-ID: <202203201128.bN7SCVD0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6308074399276290648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220320004402.6707-10-michael.christie@oracle.com>
References: <20220320004402.6707-10-michael.christie@oracle.com>
TO: Mike Christie <michael.christie@oracle.com>
TO: lduncan(a)suse.com
TO: martin.petersen(a)oracle.com
TO: linux-scsi(a)vger.kernel.org
TO: jejb(a)linux.ibm.com
CC: Mike Christie <michael.christie@oracle.com>

Hi Mike,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next next-20220318]
[cannot apply to v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mike-Christie/misc-iscsi-p=
atches/20220320-084535
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-ne=
xt
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: powerpc-randconfig-c024-20220320 (https://download.01.org/0day-ci/a=
rchive/20220320/202203201128.bN7SCVD0-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/libiscsi_tcp.c:563:2-8: preceding lock on line 542

vim +563 drivers/scsi/libiscsi_tcp.c

a081c13e39b5c17 Mike Christie     2008-12-02  523  =

a081c13e39b5c17 Mike Christie     2008-12-02  524  /**
a081c13e39b5c17 Mike Christie     2008-12-02  525   * iscsi_tcp_r2t_rsp - i=
SCSI R2T Response processing
a081c13e39b5c17 Mike Christie     2008-12-02  526   * @conn: iscsi connecti=
on
5923d64b7ab63dc Mike Christie     2021-02-06  527   * @hdr: PDU header
a081c13e39b5c17 Mike Christie     2008-12-02  528   */
5923d64b7ab63dc Mike Christie     2021-02-06  529  static int iscsi_tcp_r2t=
_rsp(struct iscsi_conn *conn, struct iscsi_hdr *hdr)
a081c13e39b5c17 Mike Christie     2008-12-02  530  {
a081c13e39b5c17 Mike Christie     2008-12-02  531  	struct iscsi_session *s=
ession =3D conn->session;
5923d64b7ab63dc Mike Christie     2021-02-06  532  	struct iscsi_tcp_task *=
tcp_task;
5923d64b7ab63dc Mike Christie     2021-02-06  533  	struct iscsi_tcp_conn *=
tcp_conn;
5923d64b7ab63dc Mike Christie     2021-02-06  534  	struct iscsi_r2t_rsp *r=
hdr;
a081c13e39b5c17 Mike Christie     2008-12-02  535  	struct iscsi_r2t_info *=
r2t;
5923d64b7ab63dc Mike Christie     2021-02-06  536  	struct iscsi_task *task;
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  537  	u32 data_length;
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  538  	u32 data_offset;
5923d64b7ab63dc Mike Christie     2021-02-06  539  	int r2tsn;
a081c13e39b5c17 Mike Christie     2008-12-02  540  	int rc;
a081c13e39b5c17 Mike Christie     2008-12-02  541  =

5923d64b7ab63dc Mike Christie     2021-02-06 @542  	spin_lock(&session->bac=
k_lock);
5923d64b7ab63dc Mike Christie     2021-02-06  543  	task =3D iscsi_itt_to_c=
task(conn, hdr->itt);
5923d64b7ab63dc Mike Christie     2021-02-06  544  	if (!task) {
5923d64b7ab63dc Mike Christie     2021-02-06  545  		spin_unlock(&session->=
back_lock);
5923d64b7ab63dc Mike Christie     2021-02-06  546  		return ISCSI_ERR_BAD_I=
TT;
5923d64b7ab63dc Mike Christie     2021-02-06  547  	} else if (task->sc->sc=
_data_direction !=3D DMA_TO_DEVICE) {
5923d64b7ab63dc Mike Christie     2021-02-06  548  		spin_unlock(&session->=
back_lock);
5923d64b7ab63dc Mike Christie     2021-02-06  549  		return ISCSI_ERR_PROTO;
5923d64b7ab63dc Mike Christie     2021-02-06  550  	}
5923d64b7ab63dc Mike Christie     2021-02-06  551  	/*
5923d64b7ab63dc Mike Christie     2021-02-06  552  	 * A bad target might c=
omplete the cmd before we have handled R2Ts
5923d64b7ab63dc Mike Christie     2021-02-06  553  	 * so get a ref to the =
task that will be dropped in the xmit path.
5923d64b7ab63dc Mike Christie     2021-02-06  554  	 */
5923d64b7ab63dc Mike Christie     2021-02-06  555  	if (task->state !=3D IS=
CSI_TASK_RUNNING) {
5923d64b7ab63dc Mike Christie     2021-02-06  556  		spin_unlock(&session->=
back_lock);
5923d64b7ab63dc Mike Christie     2021-02-06  557  		/* Let the path that g=
ot the early rsp complete it */
5923d64b7ab63dc Mike Christie     2021-02-06  558  		return 0;
5923d64b7ab63dc Mike Christie     2021-02-06  559  	}
5923d64b7ab63dc Mike Christie     2021-02-06  560  	task->last_xfer =3D jif=
fies;
231349c81d2fff8 Mike Christie     2022-03-19  561  	if (!iscsi_get_task(tas=
k)) {
231349c81d2fff8 Mike Christie     2022-03-19  562  		/* Let the path that g=
ot the early rsp complete it */
231349c81d2fff8 Mike Christie     2022-03-19 @563  		return 0;
231349c81d2fff8 Mike Christie     2022-03-19  564  	}
5923d64b7ab63dc Mike Christie     2021-02-06  565  =

5923d64b7ab63dc Mike Christie     2021-02-06  566  	tcp_conn =3D conn->dd_d=
ata;
5923d64b7ab63dc Mike Christie     2021-02-06  567  	rhdr =3D (struct iscsi_=
r2t_rsp *)tcp_conn->in.hdr;
5923d64b7ab63dc Mike Christie     2021-02-06  568  	/* fill-in new R2T asso=
ciated with the task */
5923d64b7ab63dc Mike Christie     2021-02-06  569  	iscsi_update_cmdsn(sess=
ion, (struct iscsi_nopin *)rhdr);
5923d64b7ab63dc Mike Christie     2021-02-06  570  	spin_unlock(&session->b=
ack_lock);
5923d64b7ab63dc Mike Christie     2021-02-06  571  =

a081c13e39b5c17 Mike Christie     2008-12-02  572  	if (tcp_conn->in.datale=
n) {
a081c13e39b5c17 Mike Christie     2008-12-02  573  		iscsi_conn_printk(KERN=
_ERR, conn,
a081c13e39b5c17 Mike Christie     2008-12-02  574  				  "invalid R2t with =
datalen %d\n",
a081c13e39b5c17 Mike Christie     2008-12-02  575  				  tcp_conn->in.datal=
en);
5923d64b7ab63dc Mike Christie     2021-02-06  576  		rc =3D ISCSI_ERR_DATAL=
EN;
5923d64b7ab63dc Mike Christie     2021-02-06  577  		goto put_task;
a081c13e39b5c17 Mike Christie     2008-12-02  578  	}
a081c13e39b5c17 Mike Christie     2008-12-02  579  =

5923d64b7ab63dc Mike Christie     2021-02-06  580  	tcp_task =3D task->dd_d=
ata;
5923d64b7ab63dc Mike Christie     2021-02-06  581  	r2tsn =3D be32_to_cpu(r=
hdr->r2tsn);
a081c13e39b5c17 Mike Christie     2008-12-02  582  	if (tcp_task->exp_datas=
n !=3D r2tsn){
0ab1c2529e6a70e Mike Christie     2009-03-05  583  		ISCSI_DBG_TCP(conn, "t=
ask->exp_datasn(%d) !=3D rhdr->r2tsn(%d)\n",
0ab1c2529e6a70e Mike Christie     2009-03-05  584  			      tcp_task->exp_d=
atasn, r2tsn);
5923d64b7ab63dc Mike Christie     2021-02-06  585  		rc =3D ISCSI_ERR_R2TSN;
5923d64b7ab63dc Mike Christie     2021-02-06  586  		goto put_task;
a081c13e39b5c17 Mike Christie     2008-12-02  587  	}
a081c13e39b5c17 Mike Christie     2008-12-02  588  =

5923d64b7ab63dc Mike Christie     2021-02-06  589  	if (session->state !=3D=
 ISCSI_STATE_LOGGED_IN) {
a081c13e39b5c17 Mike Christie     2008-12-02  590  		iscsi_conn_printk(KERN=
_INFO, conn,
a081c13e39b5c17 Mike Christie     2008-12-02  591  				  "dropping R2T itt =
%d in recovery.\n",
a081c13e39b5c17 Mike Christie     2008-12-02  592  				  task->itt);
5923d64b7ab63dc Mike Christie     2021-02-06  593  		rc =3D 0;
5923d64b7ab63dc Mike Christie     2021-02-06  594  		goto put_task;
a081c13e39b5c17 Mike Christie     2008-12-02  595  	}
a081c13e39b5c17 Mike Christie     2008-12-02  596  =

5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  597  	data_length =3D be32_to=
_cpu(rhdr->data_length);
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  598  	if (data_length =3D=3D =
0) {
a081c13e39b5c17 Mike Christie     2008-12-02  599  		iscsi_conn_printk(KERN=
_ERR, conn,
a081c13e39b5c17 Mike Christie     2008-12-02  600  				  "invalid R2T with =
zero data len\n");
5923d64b7ab63dc Mike Christie     2021-02-06  601  		rc =3D ISCSI_ERR_DATAL=
EN;
5923d64b7ab63dc Mike Christie     2021-02-06  602  		goto put_task;
a081c13e39b5c17 Mike Christie     2008-12-02  603  	}
a081c13e39b5c17 Mike Christie     2008-12-02  604  =

5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  605  	if (data_length > sessi=
on->max_burst)
0ab1c2529e6a70e Mike Christie     2009-03-05  606  		ISCSI_DBG_TCP(conn, "i=
nvalid R2T with data len %u and max "
0ab1c2529e6a70e Mike Christie     2009-03-05  607  			      "burst %u. Atte=
mpting to execute request.\n",
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  608  			      data_length, se=
ssion->max_burst);
a081c13e39b5c17 Mike Christie     2008-12-02  609  =

5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  610  	data_offset =3D be32_to=
_cpu(rhdr->data_offset);
ae3d56d81507c33 Christoph Hellwig 2019-01-29  611  	if (data_offset + data_=
length > task->sc->sdb.length) {
a081c13e39b5c17 Mike Christie     2008-12-02  612  		iscsi_conn_printk(KERN=
_ERR, conn,
a081c13e39b5c17 Mike Christie     2008-12-02  613  				  "invalid R2T with =
data len %u at offset %u "
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  614  				  "and total length =
%d\n", data_length,
ae3d56d81507c33 Christoph Hellwig 2019-01-29  615  				  data_offset, task-=
>sc->sdb.length);
5923d64b7ab63dc Mike Christie     2021-02-06  616  		rc =3D ISCSI_ERR_DATAL=
EN;
5923d64b7ab63dc Mike Christie     2021-02-06  617  		goto put_task;
a081c13e39b5c17 Mike Christie     2008-12-02  618  	}
a081c13e39b5c17 Mike Christie     2008-12-02  619  =

659743b02c41107 Shlomo Pongratz   2014-02-07  620  	spin_lock(&tcp_task->po=
ol2queue);
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  621  	rc =3D kfifo_out(&tcp_t=
ask->r2tpool.queue, (void *)&r2t, sizeof(void *));
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  622  	if (!rc) {
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  623  		iscsi_conn_printk(KERN=
_ERR, conn, "Could not allocate R2T. "
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  624  				  "Target has sent m=
ore R2Ts than it "
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  625  				  "negotiated for or=
 driver has leaked.\n");
659743b02c41107 Shlomo Pongratz   2014-02-07  626  		spin_unlock(&tcp_task-=
>pool2queue);
5923d64b7ab63dc Mike Christie     2021-02-06  627  		rc =3D ISCSI_ERR_PROTO;
5923d64b7ab63dc Mike Christie     2021-02-06  628  		goto put_task;
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  629  	}
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  630  =

5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  631  	r2t->exp_statsn =3D rhd=
r->statsn;
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  632  	r2t->data_length =3D da=
ta_length;
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  633  	r2t->data_offset =3D da=
ta_offset;
5d0fddd0a72d302 Shlomo Pongratz   2014-02-07  634  =

a081c13e39b5c17 Mike Christie     2008-12-02  635  	r2t->ttt =3D rhdr->ttt;=
 /* no flip */
a081c13e39b5c17 Mike Christie     2008-12-02  636  	r2t->datasn =3D 0;
a081c13e39b5c17 Mike Christie     2008-12-02  637  	r2t->sent =3D 0;
a081c13e39b5c17 Mike Christie     2008-12-02  638  =

a081c13e39b5c17 Mike Christie     2008-12-02  639  	tcp_task->exp_datasn =
=3D r2tsn + 1;
7acd72eb85f1c7a Stefani Seibold   2009-12-21  640  	kfifo_in(&tcp_task->r2t=
queue, (void*)&r2t, sizeof(void*));
a081c13e39b5c17 Mike Christie     2008-12-02  641  	conn->r2t_pdus_cnt++;
659743b02c41107 Shlomo Pongratz   2014-02-07  642  	spin_unlock(&tcp_task->=
pool2queue);
a081c13e39b5c17 Mike Christie     2008-12-02  643  =

a081c13e39b5c17 Mike Christie     2008-12-02  644  	iscsi_requeue_task(task=
);
a081c13e39b5c17 Mike Christie     2008-12-02  645  	return 0;
5923d64b7ab63dc Mike Christie     2021-02-06  646  =

5923d64b7ab63dc Mike Christie     2021-02-06  647  put_task:
5923d64b7ab63dc Mike Christie     2021-02-06  648  	iscsi_put_task(task);
5923d64b7ab63dc Mike Christie     2021-02-06  649  	return rc;
a081c13e39b5c17 Mike Christie     2008-12-02  650  }
a081c13e39b5c17 Mike Christie     2008-12-02  651  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6308074399276290648==--

