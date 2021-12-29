Content-Type: multipart/mixed; boundary="===============2691836174339600980=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/qla2xxx/qla_target.c:3322 qlt_xmit_response() warn: missing error code 'res'
Date: Thu, 30 Dec 2021 06:04:42 +0800
Message-ID: <202112300639.tCwNwSVl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2691836174339600980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Bogdanov <d.bogdanov@yadro.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eec4df26e24e978e49ccf9bcf49ca0f2ccdaeffe
commit: 4a8f71014b4d56c4fb287607e844c0a9f68f46d9 scsi: qla2xxx: Fix unmap o=
f already freed sgl
date:   2 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 2 months ago
config: i386-randconfig-m021-20211229 (https://download.01.org/0day-ci/arch=
ive/20211230/202112300639.tCwNwSVl-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/scsi/qla2xxx/qla_target.c:3322 qlt_xmit_response() warn: missing er=
ror code 'res'

vim +/res +3322 drivers/scsi/qla2xxx/qla_target.c

f83adb617f55be Quinn Tran             2014-04-11  3271  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3272  /*
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3273   * Callback to setu=
p response of xmit_type of QLA_TGT_XMIT_DATA and *
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3274   * QLA_TGT_XMIT_STA=
TUS for >=3D 24xx silicon
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3275   */
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3276  int qlt_xmit_respon=
se(struct qla_tgt_cmd *cmd, int xmit_type,
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3277  	uint8_t scsi_statu=
s)
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3278  {
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3279  	struct scsi_qla_ho=
st *vha =3D cmd->vha;
82de802ad46e23 Quinn Tran             2017-06-13  3280  	struct qla_qpair *=
qpair =3D cmd->qpair;
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3281  	struct ctio7_to_24=
xx *pkt;
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3282  	struct qla_tgt_prm=
 prm;
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3283  	uint32_t full_req_=
cnt =3D 0;
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3284  	unsigned long flag=
s =3D 0;
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3285  	int res;
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3286  =

51fd6e6351a62d Quinn Tran             2019-01-24  3287  	if (!qpair->fw_sta=
rted || (cmd->reset_count !=3D qpair->chip_reset) ||
51fd6e6351a62d Quinn Tran             2019-01-24  3288  	    (cmd->sess && =
cmd->sess->deleted)) {
a6ca88780dd66b Alexei Potashnik       2015-07-14  3289  		cmd->state =3D QL=
A_TGT_STATE_PROCESSED;
39c0c8553bfb5a Bart Van Assche        2021-03-20  3290  		return 0;
a6ca88780dd66b Alexei Potashnik       2015-07-14  3291  	}
a6ca88780dd66b Alexei Potashnik       2015-07-14  3292  =

22d84726e3b824 Quinn Tran             2017-06-13  3293  	ql_dbg_qp(ql_dbg_t=
gt, qpair, 0xe018,
82de802ad46e23 Quinn Tran             2017-06-13  3294  	    "is_send_statu=
s=3D%d, cmd->bufflen=3D%d, cmd->sg_cnt=3D%d, cmd->dma_data_direction=3D%d s=
e_cmd[%p] qp %d\n",
f83adb617f55be Quinn Tran             2014-04-11  3295  	    (xmit_type & Q=
LA_TGT_XMIT_STATUS) ?
f83adb617f55be Quinn Tran             2014-04-11  3296  	    1 : 0, cmd->bu=
fflen, cmd->sg_cnt, cmd->dma_data_direction,
82de802ad46e23 Quinn Tran             2017-06-13  3297  	    &cmd->se_cmd, =
qpair->id);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3298  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3299  	res =3D qlt_pre_xm=
it_response(cmd, &prm, xmit_type, scsi_status,
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3300  	    &full_req_cnt);
39c0c8553bfb5a Bart Van Assche        2021-03-20  3301  	if (unlikely(res !=
=3D 0)) {
39c0c8553bfb5a Bart Van Assche        2021-03-20  3302  		return res;
39c0c8553bfb5a Bart Van Assche        2021-03-20  3303  	}
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3304  =

82de802ad46e23 Quinn Tran             2017-06-13  3305  	spin_lock_irqsave(=
qpair->qp_lock_ptr, flags);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3306  =

ce1025cd4b8eb7 Himanshu Madhani       2015-12-17  3307  	if (xmit_type =3D=
=3D QLA_TGT_XMIT_STATUS)
60a9eadb19f33a Quinn Tran             2017-06-13  3308  		qpair->tgt_counte=
rs.core_qla_snd_status++;
ce1025cd4b8eb7 Himanshu Madhani       2015-12-17  3309  	else
60a9eadb19f33a Quinn Tran             2017-06-13  3310  		qpair->tgt_counte=
rs.core_qla_que_buf++;
ce1025cd4b8eb7 Himanshu Madhani       2015-12-17  3311  =

7c3f8fd10bab0b Quinn Tran             2017-06-13  3312  	if (!qpair->fw_sta=
rted || cmd->reset_count !=3D qpair->chip_reset) {
b6a029e1b0aba3 Arun Easi              2014-09-25  3313  		/*
3bb67df5b5f880 Dilip Kumar Uppugandla 2015-12-17  3314  		 * Either the por=
t is not online or this request was from
b6a029e1b0aba3 Arun Easi              2014-09-25  3315  		 * previous life,=
 just abort the processing.
b6a029e1b0aba3 Arun Easi              2014-09-25  3316  		 */
b6a029e1b0aba3 Arun Easi              2014-09-25  3317  		cmd->state =3D QL=
A_TGT_STATE_PROCESSED;
22d84726e3b824 Quinn Tran             2017-06-13  3318  		ql_dbg_qp(ql_dbg_=
async, qpair, 0xe101,
3bb67df5b5f880 Dilip Kumar Uppugandla 2015-12-17  3319  			"RESET-RSP onlin=
e/active/old-count/new-count =3D %d/%d/%d/%d.\n",
3bb67df5b5f880 Dilip Kumar Uppugandla 2015-12-17  3320  			vha->flags.onlin=
e, qla2x00_reset_active(vha),
7c3f8fd10bab0b Quinn Tran             2017-06-13  3321  			cmd->reset_count=
, qpair->chip_reset);
4a8f71014b4d56 Dmitry Bogdanov        2021-10-18 @3322  		goto out_unmap_un=
lock;
b6a029e1b0aba3 Arun Easi              2014-09-25  3323  	}
b6a029e1b0aba3 Arun Easi              2014-09-25  3324  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3325  	/* Does F/W have a=
n IOCBs for this request */
82de802ad46e23 Quinn Tran             2017-06-13  3326  	res =3D qlt_check_=
reserve_free_req(qpair, full_req_cnt);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3327  	if (unlikely(res))
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3328  		goto out_unmap_un=
lock;
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3329  =

f83adb617f55be Quinn Tran             2014-04-11  3330  	if (cmd->se_cmd.pr=
ot_op && (xmit_type & QLA_TGT_XMIT_DATA))
82de802ad46e23 Quinn Tran             2017-06-13  3331  		res =3D qlt_build=
_ctio_crc2_pkt(qpair, &prm);
f83adb617f55be Quinn Tran             2014-04-11  3332  	else
82de802ad46e23 Quinn Tran             2017-06-13  3333  		res =3D qlt_24xx_=
build_ctio_pkt(qpair, &prm);
810e30bc4658e9 Quinn Tran             2015-06-10  3334  	if (unlikely(res !=
=3D 0)) {
82de802ad46e23 Quinn Tran             2017-06-13  3335  		qpair->req->cnt +=
=3D full_req_cnt;
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3336  		goto out_unmap_un=
lock;
810e30bc4658e9 Quinn Tran             2015-06-10  3337  	}
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3338  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3339  	pkt =3D (struct ct=
io7_to_24xx *)prm.pkt;
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3340  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3341  	if (qlt_has_data(c=
md) && (xmit_type & QLA_TGT_XMIT_DATA)) {
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3342  		pkt->u.status0.fl=
ags |=3D
ad950360eebb5f Bart Van Assche        2015-07-09  3343  		    cpu_to_le16(C=
TIO7_FLAGS_DATA_IN |
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3344  			CTIO7_FLAGS_STAT=
US_MODE_0);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3345  =

f83adb617f55be Quinn Tran             2014-04-11  3346  		if (cmd->se_cmd.p=
rot_op =3D=3D TARGET_PROT_NORMAL)
32d29b4ce82785 Quinn Tran             2017-06-13  3347  			qlt_load_data_se=
gments(&prm);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3348  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3349  		if (prm.add_statu=
s_pkt =3D=3D 0) {
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3350  			if (xmit_type & =
QLA_TGT_XMIT_STATUS) {
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3351  				pkt->u.status0.=
scsi_status =3D
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3352  				    cpu_to_le16=
(prm.rq_result);
44d018577f1793 Quinn Tran             2021-06-23  3353  				if (!cmd->edif)
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3354  					pkt->u.status0=
.residual =3D
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3355  						cpu_to_le32(p=
rm.residual);
44d018577f1793 Quinn Tran             2021-06-23  3356  =

ad950360eebb5f Bart Van Assche        2015-07-09  3357  				pkt->u.status0.=
flags |=3D cpu_to_le16(
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3358  				    CTIO7_FLAGS=
_SEND_STATUS);
7c3f8fd10bab0b Quinn Tran             2017-06-13  3359  				if (qlt_need_ex=
plicit_conf(cmd, 0)) {
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3360  					pkt->u.status0=
.flags |=3D
ad950360eebb5f Bart Van Assche        2015-07-09  3361  					    cpu_to_le1=
6(
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3362  						CTIO7_FLAGS_E=
XPLICIT_CONFORM |
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3363  						CTIO7_FLAGS_C=
ONFORM_REQ);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3364  				}
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3365  			}
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3366  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3367  		} else {
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3368  			/*
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3369  			 * We have alrea=
dy made sure that there is sufficient
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3370  			 * amount of req=
uest entries to not drop HW lock in
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3371  			 * req_pkt().
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3372  			 */
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3373  			struct ctio7_to_=
24xx *ctio =3D
82de802ad46e23 Quinn Tran             2017-06-13  3374  				(struct ctio7_t=
o_24xx *)qlt_get_req_pkt(
82de802ad46e23 Quinn Tran             2017-06-13  3375  				    qpair->req);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3376  =

22d84726e3b824 Quinn Tran             2017-06-13  3377  			ql_dbg_qp(ql_dbg=
_tgt, qpair, 0x305e,
667024a3654918 Arun Easi              2014-09-25  3378  			    "Building ad=
ditional status packet 0x%p.\n",
667024a3654918 Arun Easi              2014-09-25  3379  			    ctio);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3380  =

f83adb617f55be Quinn Tran             2014-04-11  3381  			/*
f83adb617f55be Quinn Tran             2014-04-11  3382  			 * T10Dif: ctio_=
crc2_to_fw overlay ontop of
f83adb617f55be Quinn Tran             2014-04-11  3383  			 * ctio7_to_24xx
f83adb617f55be Quinn Tran             2014-04-11  3384  			 */
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3385  			memcpy(ctio, pkt=
, sizeof(*ctio));
f83adb617f55be Quinn Tran             2014-04-11  3386  			/* reset back to=
 CTIO7 */
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3387  			ctio->entry_coun=
t =3D 1;
f83adb617f55be Quinn Tran             2014-04-11  3388  			ctio->entry_type=
 =3D CTIO_TYPE7;
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3389  			ctio->dseg_count=
 =3D 0;
ad950360eebb5f Bart Van Assche        2015-07-09  3390  			ctio->u.status1.=
flags &=3D ~cpu_to_le16(
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3391  			    CTIO7_FLAGS_=
DATA_IN);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3392  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3393  			/* Real finish i=
s ctio_m1's finish */
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3394  			pkt->handle |=3D=
 CTIO_INTERMEDIATE_HANDLE_MARK;
ad950360eebb5f Bart Van Assche        2015-07-09  3395  			pkt->u.status0.f=
lags |=3D cpu_to_le16(
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3396  			    CTIO7_FLAGS_=
DONT_RET_CTIO);
f83adb617f55be Quinn Tran             2014-04-11  3397  =

f83adb617f55be Quinn Tran             2014-04-11  3398  			/* qlt_24xx_init=
_ctio_to_isp will correct
f83adb617f55be Quinn Tran             2014-04-11  3399  			 * all neccessar=
y fields that's part of CTIO7.
f83adb617f55be Quinn Tran             2014-04-11  3400  			 * There should =
be no residual of CTIO-CRC2 data.
f83adb617f55be Quinn Tran             2014-04-11  3401  			 */
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3402  			qlt_24xx_init_ct=
io_to_isp((struct ctio7_to_24xx *)ctio,
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3403  			    &prm);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3404  		}
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3405  	} else
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3406  		qlt_24xx_init_cti=
o_to_isp(pkt, &prm);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3407  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3408  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3409  	cmd->state =3D QLA=
_TGT_STATE_PROCESSED; /* Mid-level is done processing */
d564a372b0047d Quinn Tran             2014-09-25  3410  	cmd->cmd_sent_to_f=
w =3D 1;
079a3a3b9dff1c Quinn Tran             2018-09-04  3411  	cmd->ctio_flags =
=3D le16_to_cpu(pkt->u.status0.flags);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3412  =

63163e06012787 Himanshu Madhani       2014-09-25  3413  	/* Memory Barrier =
*/
63163e06012787 Himanshu Madhani       2014-09-25  3414  	wmb();
8abfa9e2268337 Quinn Tran             2017-06-13  3415  	if (qpair->reqq_st=
art_iocbs)
8abfa9e2268337 Quinn Tran             2017-06-13  3416  		qpair->reqq_start=
_iocbs(qpair);
8abfa9e2268337 Quinn Tran             2017-06-13  3417  	else
82de802ad46e23 Quinn Tran             2017-06-13  3418  		qla2x00_start_ioc=
bs(vha, qpair->req);
82de802ad46e23 Quinn Tran             2017-06-13  3419  	spin_unlock_irqres=
tore(qpair->qp_lock_ptr, flags);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3420  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3421  	return 0;
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3422  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3423  out_unmap_unlock:
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3424  	qlt_unmap_sg(vha, =
cmd);
82de802ad46e23 Quinn Tran             2017-06-13  3425  	spin_unlock_irqres=
tore(qpair->qp_lock_ptr, flags);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3426  =

2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3427  	return res;
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3428  }
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3429  EXPORT_SYMBOL(qlt_x=
mit_response);
2d70c103fd2a06 Nicholas Bellinger     2012-05-15  3430  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2691836174339600980==--

