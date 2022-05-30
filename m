Content-Type: multipart/mixed; boundary="===============3161968225042837722=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_fw.c:1077 mpi3mr_create_op_reply_q() error: we previously assumed 'op_reply_q->q_segments' could be null (see line 1048)
Date: Mon, 30 May 2022 10:46:21 +0800
Message-ID: <202205301009.QQK5A93y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3161968225042837722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kashyap Desai <kashyap.desai@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Tomas Henzl <thenzl@redhat.com>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b00ed48bb0a7c295facf9036135a573a5cdbe7de
commit: c9566231cfaf448dd281cd7c516012a7e1c7e448 scsi: mpi3mr: Create opera=
tional request and reply queue pair
date:   12 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 12 months ago
config: microblaze-randconfig-m031-20220529 (https://download.01.org/0day-c=
i/archive/20220530/202205301009.QQK5A93y-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_fw.c:1077 mpi3mr_create_op_reply_q() error: we p=
reviously assumed 'op_reply_q->q_segments' could be null (see line 1048)
drivers/scsi/mpi3mr/mpi3mr_fw.c:1184 mpi3mr_create_op_req_q() error: we pre=
viously assumed 'op_req_q->q_segments' could be null (see line 1157)

Old smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_fw.c:2380 mpi3mr_cleanup_ioc() warn: inconsisten=
t indenting

vim +1077 drivers/scsi/mpi3mr/mpi3mr_fw.c

c9566231cfaf44 Kashyap Desai 2021-05-20  1013  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1014  /**
c9566231cfaf44 Kashyap Desai 2021-05-20  1015   * mpi3mr_create_op_reply_q =
- create operational reply queue
c9566231cfaf44 Kashyap Desai 2021-05-20  1016   * @mrioc: Adapter instance =
reference
c9566231cfaf44 Kashyap Desai 2021-05-20  1017   * @qidx: operational reply =
queue index
c9566231cfaf44 Kashyap Desai 2021-05-20  1018   *
c9566231cfaf44 Kashyap Desai 2021-05-20  1019   * Create operatinal reply q=
ueue by issuing MPI request
c9566231cfaf44 Kashyap Desai 2021-05-20  1020   * through admin queue.
c9566231cfaf44 Kashyap Desai 2021-05-20  1021   *
c9566231cfaf44 Kashyap Desai 2021-05-20  1022   * Return:  0 on success, no=
n-zero on failure.
c9566231cfaf44 Kashyap Desai 2021-05-20  1023   */
c9566231cfaf44 Kashyap Desai 2021-05-20  1024  static int mpi3mr_create_op_=
reply_q(struct mpi3mr_ioc *mrioc, u16 qidx)
c9566231cfaf44 Kashyap Desai 2021-05-20  1025  {
c9566231cfaf44 Kashyap Desai 2021-05-20  1026  	struct mpi3_create_reply_qu=
eue_request create_req;
c9566231cfaf44 Kashyap Desai 2021-05-20  1027  	struct op_reply_qinfo *op_r=
eply_q =3D mrioc->op_reply_qinfo + qidx;
c9566231cfaf44 Kashyap Desai 2021-05-20  1028  	int retval =3D 0;
c9566231cfaf44 Kashyap Desai 2021-05-20  1029  	u16 reply_qid =3D 0, midx;
c9566231cfaf44 Kashyap Desai 2021-05-20  1030  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1031  	reply_qid =3D op_reply_q->q=
id;
c9566231cfaf44 Kashyap Desai 2021-05-20  1032  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1033  	midx =3D REPLY_QUEUE_IDX_TO=
_MSIX_IDX(qidx, mrioc->op_reply_q_offset);
c9566231cfaf44 Kashyap Desai 2021-05-20  1034  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1035  	if (reply_qid) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1036  		retval =3D -1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1037  		ioc_err(mrioc, "CreateRepQ=
: called for duplicate qid %d\n",
c9566231cfaf44 Kashyap Desai 2021-05-20  1038  		    reply_qid);
c9566231cfaf44 Kashyap Desai 2021-05-20  1039  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1040  		return retval;
c9566231cfaf44 Kashyap Desai 2021-05-20  1041  	}
c9566231cfaf44 Kashyap Desai 2021-05-20  1042  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1043  	reply_qid =3D qidx + 1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1044  	op_reply_q->num_replies =3D=
 MPI3MR_OP_REP_Q_QD;
c9566231cfaf44 Kashyap Desai 2021-05-20  1045  	op_reply_q->ci =3D 0;
c9566231cfaf44 Kashyap Desai 2021-05-20  1046  	op_reply_q->ephase =3D 1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1047  =

c9566231cfaf44 Kashyap Desai 2021-05-20 @1048  	if (!op_reply_q->q_segments=
) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1049  		retval =3D mpi3mr_alloc_op=
_reply_q_segments(mrioc, qidx);
c9566231cfaf44 Kashyap Desai 2021-05-20  1050  		if (retval) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1051  			mpi3mr_free_op_reply_q_se=
gments(mrioc, qidx);
c9566231cfaf44 Kashyap Desai 2021-05-20  1052  			goto out;
c9566231cfaf44 Kashyap Desai 2021-05-20  1053  		}
c9566231cfaf44 Kashyap Desai 2021-05-20  1054  	}
c9566231cfaf44 Kashyap Desai 2021-05-20  1055  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1056  	memset(&create_req, 0, size=
of(create_req));
c9566231cfaf44 Kashyap Desai 2021-05-20  1057  	mutex_lock(&mrioc->init_cmd=
s.mutex);
c9566231cfaf44 Kashyap Desai 2021-05-20  1058  	if (mrioc->init_cmds.state =
& MPI3MR_CMD_PENDING) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1059  		retval =3D -1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1060  		ioc_err(mrioc, "CreateRepQ=
: Init command is in use\n");
c9566231cfaf44 Kashyap Desai 2021-05-20  1061  		goto out;
c9566231cfaf44 Kashyap Desai 2021-05-20  1062  	}
c9566231cfaf44 Kashyap Desai 2021-05-20  1063  	mrioc->init_cmds.state =3D =
MPI3MR_CMD_PENDING;
c9566231cfaf44 Kashyap Desai 2021-05-20  1064  	mrioc->init_cmds.is_waiting=
 =3D 1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1065  	mrioc->init_cmds.callback =
=3D NULL;
c9566231cfaf44 Kashyap Desai 2021-05-20  1066  	create_req.host_tag =3D cpu=
_to_le16(MPI3MR_HOSTTAG_INITCMDS);
c9566231cfaf44 Kashyap Desai 2021-05-20  1067  	create_req.function =3D MPI=
3_FUNCTION_CREATE_REPLY_QUEUE;
c9566231cfaf44 Kashyap Desai 2021-05-20  1068  	create_req.queue_id =3D cpu=
_to_le16(reply_qid);
c9566231cfaf44 Kashyap Desai 2021-05-20  1069  	create_req.flags =3D MPI3_C=
REATE_REPLY_QUEUE_FLAGS_INT_ENABLE_ENABLE;
c9566231cfaf44 Kashyap Desai 2021-05-20  1070  	create_req.msix_index =3D c=
pu_to_le16(mrioc->intr_info[midx].msix_index);
c9566231cfaf44 Kashyap Desai 2021-05-20  1071  	if (mrioc->enable_segqueue)=
 {
c9566231cfaf44 Kashyap Desai 2021-05-20  1072  		create_req.flags |=3D
c9566231cfaf44 Kashyap Desai 2021-05-20  1073  		    MPI3_CREATE_REQUEST_QU=
EUE_FLAGS_SEGMENTED_SEGMENTED;
c9566231cfaf44 Kashyap Desai 2021-05-20  1074  		create_req.base_address =
=3D cpu_to_le64(
c9566231cfaf44 Kashyap Desai 2021-05-20  1075  		    op_reply_q->q_segment_=
list_dma);
c9566231cfaf44 Kashyap Desai 2021-05-20  1076  	} else
c9566231cfaf44 Kashyap Desai 2021-05-20 @1077  		create_req.base_address =
=3D cpu_to_le64(
c9566231cfaf44 Kashyap Desai 2021-05-20  1078  		    op_reply_q->q_segments=
[0].segment_dma);
c9566231cfaf44 Kashyap Desai 2021-05-20  1079  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1080  	create_req.size =3D cpu_to_=
le16(op_reply_q->num_replies);
c9566231cfaf44 Kashyap Desai 2021-05-20  1081  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1082  	init_completion(&mrioc->ini=
t_cmds.done);
c9566231cfaf44 Kashyap Desai 2021-05-20  1083  	retval =3D mpi3mr_admin_req=
uest_post(mrioc, &create_req,
c9566231cfaf44 Kashyap Desai 2021-05-20  1084  	    sizeof(create_req), 1);
c9566231cfaf44 Kashyap Desai 2021-05-20  1085  	if (retval) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1086  		ioc_err(mrioc, "CreateRepQ=
: Admin Post failed\n");
c9566231cfaf44 Kashyap Desai 2021-05-20  1087  		goto out_unlock;
c9566231cfaf44 Kashyap Desai 2021-05-20  1088  	}
c9566231cfaf44 Kashyap Desai 2021-05-20  1089  	wait_for_completion_timeout=
(&mrioc->init_cmds.done,
c9566231cfaf44 Kashyap Desai 2021-05-20  1090  	    (MPI3MR_INTADMCMD_TIMEO=
UT * HZ));
c9566231cfaf44 Kashyap Desai 2021-05-20  1091  	if (!(mrioc->init_cmds.stat=
e & MPI3MR_CMD_COMPLETE)) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1092  		ioc_err(mrioc, "CreateRepQ=
: command timed out\n");
c9566231cfaf44 Kashyap Desai 2021-05-20  1093  		mpi3mr_set_diagsave(mrioc);
c9566231cfaf44 Kashyap Desai 2021-05-20  1094  		mpi3mr_issue_reset(mrioc,
c9566231cfaf44 Kashyap Desai 2021-05-20  1095  		    MPI3_SYSIF_HOST_DIAG_R=
ESET_ACTION_DIAG_FAULT,
c9566231cfaf44 Kashyap Desai 2021-05-20  1096  		    MPI3MR_RESET_FROM_CREA=
TEREPQ_TIMEOUT);
c9566231cfaf44 Kashyap Desai 2021-05-20  1097  		mrioc->unrecoverable =3D 1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1098  		retval =3D -1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1099  		goto out_unlock;
c9566231cfaf44 Kashyap Desai 2021-05-20  1100  	}
c9566231cfaf44 Kashyap Desai 2021-05-20  1101  	if ((mrioc->init_cmds.ioc_s=
tatus & MPI3_IOCSTATUS_STATUS_MASK)
c9566231cfaf44 Kashyap Desai 2021-05-20  1102  	    !=3D MPI3_IOCSTATUS_SUC=
CESS) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1103  		ioc_err(mrioc,
c9566231cfaf44 Kashyap Desai 2021-05-20  1104  		    "CreateRepQ: Failed io=
c_status(0x%04x) Loginfo(0x%08x)\n",
c9566231cfaf44 Kashyap Desai 2021-05-20  1105  		    (mrioc->init_cmds.ioc_=
status & MPI3_IOCSTATUS_STATUS_MASK),
c9566231cfaf44 Kashyap Desai 2021-05-20  1106  		    mrioc->init_cmds.ioc_l=
oginfo);
c9566231cfaf44 Kashyap Desai 2021-05-20  1107  		retval =3D -1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1108  		goto out_unlock;
c9566231cfaf44 Kashyap Desai 2021-05-20  1109  	}
c9566231cfaf44 Kashyap Desai 2021-05-20  1110  	op_reply_q->qid =3D reply_q=
id;
c9566231cfaf44 Kashyap Desai 2021-05-20  1111  	mrioc->intr_info[midx].op_r=
eply_q =3D op_reply_q;
c9566231cfaf44 Kashyap Desai 2021-05-20  1112  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1113  out_unlock:
c9566231cfaf44 Kashyap Desai 2021-05-20  1114  	mrioc->init_cmds.state =3D =
MPI3MR_CMD_NOTUSED;
c9566231cfaf44 Kashyap Desai 2021-05-20  1115  	mutex_unlock(&mrioc->init_c=
mds.mutex);
c9566231cfaf44 Kashyap Desai 2021-05-20  1116  out:
c9566231cfaf44 Kashyap Desai 2021-05-20  1117  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1118  	return retval;
c9566231cfaf44 Kashyap Desai 2021-05-20  1119  }
c9566231cfaf44 Kashyap Desai 2021-05-20  1120  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1121  /**
c9566231cfaf44 Kashyap Desai 2021-05-20  1122   * mpi3mr_create_op_req_q - =
create operational request queue
c9566231cfaf44 Kashyap Desai 2021-05-20  1123   * @mrioc: Adapter instance =
reference
c9566231cfaf44 Kashyap Desai 2021-05-20  1124   * @idx: operational request=
 queue index
c9566231cfaf44 Kashyap Desai 2021-05-20  1125   * @reply_qid: Reply queue ID
c9566231cfaf44 Kashyap Desai 2021-05-20  1126   *
c9566231cfaf44 Kashyap Desai 2021-05-20  1127   * Create operatinal request=
 queue by issuing MPI request
c9566231cfaf44 Kashyap Desai 2021-05-20  1128   * through admin queue.
c9566231cfaf44 Kashyap Desai 2021-05-20  1129   *
c9566231cfaf44 Kashyap Desai 2021-05-20  1130   * Return:  0 on success, no=
n-zero on failure.
c9566231cfaf44 Kashyap Desai 2021-05-20  1131   */
c9566231cfaf44 Kashyap Desai 2021-05-20  1132  static int mpi3mr_create_op_=
req_q(struct mpi3mr_ioc *mrioc, u16 idx,
c9566231cfaf44 Kashyap Desai 2021-05-20  1133  	u16 reply_qid)
c9566231cfaf44 Kashyap Desai 2021-05-20  1134  {
c9566231cfaf44 Kashyap Desai 2021-05-20  1135  	struct mpi3_create_request_=
queue_request create_req;
c9566231cfaf44 Kashyap Desai 2021-05-20  1136  	struct op_req_qinfo *op_req=
_q =3D mrioc->req_qinfo + idx;
c9566231cfaf44 Kashyap Desai 2021-05-20  1137  	int retval =3D 0;
c9566231cfaf44 Kashyap Desai 2021-05-20  1138  	u16 req_qid =3D 0;
c9566231cfaf44 Kashyap Desai 2021-05-20  1139  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1140  	req_qid =3D op_req_q->qid;
c9566231cfaf44 Kashyap Desai 2021-05-20  1141  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1142  	if (req_qid) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1143  		retval =3D -1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1144  		ioc_err(mrioc, "CreateReqQ=
: called for duplicate qid %d\n",
c9566231cfaf44 Kashyap Desai 2021-05-20  1145  		    req_qid);
c9566231cfaf44 Kashyap Desai 2021-05-20  1146  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1147  		return retval;
c9566231cfaf44 Kashyap Desai 2021-05-20  1148  	}
c9566231cfaf44 Kashyap Desai 2021-05-20  1149  	req_qid =3D idx + 1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1150  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1151  	op_req_q->num_requests =3D =
MPI3MR_OP_REQ_Q_QD;
c9566231cfaf44 Kashyap Desai 2021-05-20  1152  	op_req_q->ci =3D 0;
c9566231cfaf44 Kashyap Desai 2021-05-20  1153  	op_req_q->pi =3D 0;
c9566231cfaf44 Kashyap Desai 2021-05-20  1154  	op_req_q->reply_qid =3D rep=
ly_qid;
c9566231cfaf44 Kashyap Desai 2021-05-20  1155  	spin_lock_init(&op_req_q->q=
_lock);
c9566231cfaf44 Kashyap Desai 2021-05-20  1156  =

c9566231cfaf44 Kashyap Desai 2021-05-20 @1157  	if (!op_req_q->q_segments) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1158  		retval =3D mpi3mr_alloc_op=
_req_q_segments(mrioc, idx);
c9566231cfaf44 Kashyap Desai 2021-05-20  1159  		if (retval) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1160  			mpi3mr_free_op_req_q_segm=
ents(mrioc, idx);
c9566231cfaf44 Kashyap Desai 2021-05-20  1161  			goto out;
c9566231cfaf44 Kashyap Desai 2021-05-20  1162  		}
c9566231cfaf44 Kashyap Desai 2021-05-20  1163  	}
c9566231cfaf44 Kashyap Desai 2021-05-20  1164  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1165  	memset(&create_req, 0, size=
of(create_req));
c9566231cfaf44 Kashyap Desai 2021-05-20  1166  	mutex_lock(&mrioc->init_cmd=
s.mutex);
c9566231cfaf44 Kashyap Desai 2021-05-20  1167  	if (mrioc->init_cmds.state =
& MPI3MR_CMD_PENDING) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1168  		retval =3D -1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1169  		ioc_err(mrioc, "CreateReqQ=
: Init command is in use\n");
c9566231cfaf44 Kashyap Desai 2021-05-20  1170  		goto out;
c9566231cfaf44 Kashyap Desai 2021-05-20  1171  	}
c9566231cfaf44 Kashyap Desai 2021-05-20  1172  	mrioc->init_cmds.state =3D =
MPI3MR_CMD_PENDING;
c9566231cfaf44 Kashyap Desai 2021-05-20  1173  	mrioc->init_cmds.is_waiting=
 =3D 1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1174  	mrioc->init_cmds.callback =
=3D NULL;
c9566231cfaf44 Kashyap Desai 2021-05-20  1175  	create_req.host_tag =3D cpu=
_to_le16(MPI3MR_HOSTTAG_INITCMDS);
c9566231cfaf44 Kashyap Desai 2021-05-20  1176  	create_req.function =3D MPI=
3_FUNCTION_CREATE_REQUEST_QUEUE;
c9566231cfaf44 Kashyap Desai 2021-05-20  1177  	create_req.queue_id =3D cpu=
_to_le16(req_qid);
c9566231cfaf44 Kashyap Desai 2021-05-20  1178  	if (mrioc->enable_segqueue)=
 {
c9566231cfaf44 Kashyap Desai 2021-05-20  1179  		create_req.flags =3D
c9566231cfaf44 Kashyap Desai 2021-05-20  1180  		    MPI3_CREATE_REQUEST_QU=
EUE_FLAGS_SEGMENTED_SEGMENTED;
c9566231cfaf44 Kashyap Desai 2021-05-20  1181  		create_req.base_address =
=3D cpu_to_le64(
c9566231cfaf44 Kashyap Desai 2021-05-20  1182  		    op_req_q->q_segment_li=
st_dma);
c9566231cfaf44 Kashyap Desai 2021-05-20  1183  	} else
c9566231cfaf44 Kashyap Desai 2021-05-20 @1184  		create_req.base_address =
=3D cpu_to_le64(
c9566231cfaf44 Kashyap Desai 2021-05-20  1185  		    op_req_q->q_segments[0=
].segment_dma);
c9566231cfaf44 Kashyap Desai 2021-05-20  1186  	create_req.reply_queue_id =
=3D cpu_to_le16(reply_qid);
c9566231cfaf44 Kashyap Desai 2021-05-20  1187  	create_req.size =3D cpu_to_=
le16(op_req_q->num_requests);
c9566231cfaf44 Kashyap Desai 2021-05-20  1188  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1189  	init_completion(&mrioc->ini=
t_cmds.done);
c9566231cfaf44 Kashyap Desai 2021-05-20  1190  	retval =3D mpi3mr_admin_req=
uest_post(mrioc, &create_req,
c9566231cfaf44 Kashyap Desai 2021-05-20  1191  	    sizeof(create_req), 1);
c9566231cfaf44 Kashyap Desai 2021-05-20  1192  	if (retval) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1193  		ioc_err(mrioc, "CreateReqQ=
: Admin Post failed\n");
c9566231cfaf44 Kashyap Desai 2021-05-20  1194  		goto out_unlock;
c9566231cfaf44 Kashyap Desai 2021-05-20  1195  	}
c9566231cfaf44 Kashyap Desai 2021-05-20  1196  	wait_for_completion_timeout=
(&mrioc->init_cmds.done,
c9566231cfaf44 Kashyap Desai 2021-05-20  1197  	    (MPI3MR_INTADMCMD_TIMEO=
UT * HZ));
c9566231cfaf44 Kashyap Desai 2021-05-20  1198  	if (!(mrioc->init_cmds.stat=
e & MPI3MR_CMD_COMPLETE)) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1199  		ioc_err(mrioc, "CreateReqQ=
: command timed out\n");
c9566231cfaf44 Kashyap Desai 2021-05-20  1200  		mpi3mr_set_diagsave(mrioc);
c9566231cfaf44 Kashyap Desai 2021-05-20  1201  		if (mpi3mr_issue_reset(mri=
oc,
c9566231cfaf44 Kashyap Desai 2021-05-20  1202  		    MPI3_SYSIF_HOST_DIAG_R=
ESET_ACTION_DIAG_FAULT,
c9566231cfaf44 Kashyap Desai 2021-05-20  1203  		    MPI3MR_RESET_FROM_CREA=
TEREQQ_TIMEOUT))
c9566231cfaf44 Kashyap Desai 2021-05-20  1204  			mrioc->unrecoverable =3D =
1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1205  		retval =3D -1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1206  		goto out_unlock;
c9566231cfaf44 Kashyap Desai 2021-05-20  1207  	}
c9566231cfaf44 Kashyap Desai 2021-05-20  1208  	if ((mrioc->init_cmds.ioc_s=
tatus & MPI3_IOCSTATUS_STATUS_MASK)
c9566231cfaf44 Kashyap Desai 2021-05-20  1209  	    !=3D MPI3_IOCSTATUS_SUC=
CESS) {
c9566231cfaf44 Kashyap Desai 2021-05-20  1210  		ioc_err(mrioc,
c9566231cfaf44 Kashyap Desai 2021-05-20  1211  		    "CreateReqQ: Failed io=
c_status(0x%04x) Loginfo(0x%08x)\n",
c9566231cfaf44 Kashyap Desai 2021-05-20  1212  		    (mrioc->init_cmds.ioc_=
status & MPI3_IOCSTATUS_STATUS_MASK),
c9566231cfaf44 Kashyap Desai 2021-05-20  1213  		    mrioc->init_cmds.ioc_l=
oginfo);
c9566231cfaf44 Kashyap Desai 2021-05-20  1214  		retval =3D -1;
c9566231cfaf44 Kashyap Desai 2021-05-20  1215  		goto out_unlock;
c9566231cfaf44 Kashyap Desai 2021-05-20  1216  	}
c9566231cfaf44 Kashyap Desai 2021-05-20  1217  	op_req_q->qid =3D req_qid;
c9566231cfaf44 Kashyap Desai 2021-05-20  1218  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1219  out_unlock:
c9566231cfaf44 Kashyap Desai 2021-05-20  1220  	mrioc->init_cmds.state =3D =
MPI3MR_CMD_NOTUSED;
c9566231cfaf44 Kashyap Desai 2021-05-20  1221  	mutex_unlock(&mrioc->init_c=
mds.mutex);
c9566231cfaf44 Kashyap Desai 2021-05-20  1222  out:
c9566231cfaf44 Kashyap Desai 2021-05-20  1223  =

c9566231cfaf44 Kashyap Desai 2021-05-20  1224  	return retval;
c9566231cfaf44 Kashyap Desai 2021-05-20  1225  }
c9566231cfaf44 Kashyap Desai 2021-05-20  1226  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3161968225042837722==--

