Content-Type: multipart/mixed; boundary="===============0623681431201515143=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/qedi/qedi_fw.c:1039:45: sparse: sparse: incorrect type in assignment (different base types)
Date: Thu, 07 Jul 2022 18:09:25 +0800
Message-ID: <202207071843.bRWZg0ph-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0623681431201515143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mike Christie <michael.christie@oracle.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Manish Rangankar <mrangankar@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9f09069cde34dcd86f5ecf3a3139fd752020812f
commit: ed1b86ba0fba3d586cd53057551a95197b0a37ad scsi: qedi: Wake up if cmd=
_cleanup_req is set
date:   1 year, 1 month ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 1 month ago
config: m68k-randconfig-s032-20220707 (https://download.01.org/0day-ci/arch=
ive/20220707/202207071843.bRWZg0ph-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ded1b86ba0fba3d586cd53057551a95197b0a37ad
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ed1b86ba0fba3d586cd53057551a95197b0a37ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
68k SHELL=3D/bin/bash drivers/scsi/qedi/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/scsi/qedi/qedi_fw.c:285:29: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __be16 [usertype=
] tsih @@     got restricted __le16 [usertype] tsih @@
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse:     expected restricted __be=
16 [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse:     got restricted __le16 [u=
sertype] tsih
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:289:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:290:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:293:37: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:331:13: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned short [usertype] i=
dx @@     got restricted __le16 [usertype] rqe_opaque @@
   drivers/scsi/qedi/qedi_fw.c:331:13: sparse:     expected unsigned short =
[usertype] idx
   drivers/scsi/qedi/qedi_fw.c:331:13: sparse:     got restricted __le16 [u=
sertype] rqe_opaque
   drivers/scsi/qedi/qedi_fw.c:366:13: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned short [usertype] i=
dx @@     got restricted __le16 [usertype] rqe_opaque @@
   drivers/scsi/qedi/qedi_fw.c:366:13: sparse:     expected unsigned short =
[usertype] idx
   drivers/scsi/qedi/qedi_fw.c:366:13: sparse:     got restricted __le16 [u=
sertype] rqe_opaque
   drivers/scsi/qedi/qedi_fw.c:384:41: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le16 [usertype=
] opaque @@     got restricted __le32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:384:41: sparse:     expected restricted __le=
16 [usertype] opaque
   drivers/scsi/qedi/qedi_fw.c:384:41: sparse:     got restricted __le32 [u=
sertype]
   drivers/scsi/qedi/qedi_fw.c:427:29: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:434:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:435:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:436:23: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:437:20: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:453:28: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:497:32: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:513:18: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:513:16: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int @@     got res=
tricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:513:16: sparse:     expected unsigned int
   drivers/scsi/qedi/qedi_fw.c:513:16: sparse:     got restricted __be32 [u=
sertype]
   drivers/scsi/qedi/qedi_fw.c:514:18: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:514:16: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int @@     got res=
tricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:514:16: sparse:     expected unsigned int
   drivers/scsi/qedi/qedi_fw.c:514:16: sparse:     got restricted __be32 [u=
sertype]
   drivers/scsi/qedi/qedi_fw.c:516:31: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:517:31: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:518:28: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:523:28: sparse: sparse: cast from restricted=
 __le16
   drivers/scsi/qedi/qedi_fw.c:524:28: sparse: sparse: cast from restricted=
 __le16
   drivers/scsi/qedi/qedi_fw.c:525:28: sparse: sparse: cast from restricted=
 __le16
   drivers/scsi/qedi/qedi_fw.c:548:29: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:563:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:563:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:563:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:565:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:566:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:567:23: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:590:20: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int [usertype] isc=
si_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:590:20: sparse:     expected unsigned int [u=
sertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:590:20: sparse:     got restricted __le16 [u=
sertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:630:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:631:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:632:20: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:636:31: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:639:38: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:741:28: sparse: sparse: incorrect type in in=
itializer (different base types) @@     expected unsigned int [usertype] pr=
oto_itt @@     got restricted __le16 [usertype] itid @@
   drivers/scsi/qedi/qedi_fw.c:741:28: sparse:     expected unsigned int [u=
sertype] proto_itt
   drivers/scsi/qedi/qedi_fw.c:741:28: sparse:     got restricted __le16 [u=
sertype] itid
   drivers/scsi/qedi/qedi_fw.c:751:19: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int [usertype] isc=
si_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:751:19: sparse:     expected unsigned int [u=
sertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:751:19: sparse:     got restricted __le16 [u=
sertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:802:9: sparse: sparse: cast to restricted it=
t_t
   drivers/scsi/qedi/qedi_fw.c:864:20: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int [usertype] isc=
si_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:864:20: sparse:     expected unsigned int [u=
sertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:864:20: sparse:     got restricted __le16 [u=
sertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:895:50: sparse: sparse: cast from restricted=
 itt_t
   drivers/scsi/qedi/qedi_fw.c:895:40: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:900:48: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:899:49: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le16 [usertype=
] itid @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:899:49: sparse:     expected restricted __le=
16 [usertype] itid
   drivers/scsi/qedi/qedi_fw.c:899:49: sparse:     got unsigned int
   drivers/scsi/qedi/qedi_fw.c:948:23: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le16 [assigned=
] [usertype] sq_prod @@     got unsigned short [usertype] fw_sq_prod_idx @@
   drivers/scsi/qedi/qedi_fw.c:948:23: sparse:     expected restricted __le=
16 [assigned] [usertype] sq_prod
   drivers/scsi/qedi/qedi_fw.c:948:23: sparse:     got unsigned short [user=
type] fw_sq_prod_idx
   drivers/scsi/qedi/qedi_fw.c:1021:40: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] isid_tabc @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:1021:40: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] isid_tabc
   drivers/scsi/qedi/qedi_fw.c:1021:40: sparse:     got unsigned int
   drivers/scsi/qedi/qedi_fw.c:1022:37: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le16 [address=
able] [assigned] [usertype] isid_d @@     got unsigned short @@
   drivers/scsi/qedi/qedi_fw.c:1022:37: sparse:     expected restricted __l=
e16 [addressable] [assigned] [usertype] isid_d
   drivers/scsi/qedi/qedi_fw.c:1022:37: sparse:     got unsigned short
   drivers/scsi/qedi/qedi_fw.c:1024:35: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le16 [address=
able] [assigned] [usertype] tsih @@     got restricted __be16 [usertype] ts=
ih @@
   drivers/scsi/qedi/qedi_fw.c:1024:35: sparse:     expected restricted __l=
e16 [addressable] [assigned] [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:1024:35: sparse:     got restricted __be16 [=
usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:1025:47: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] hdr_second_dword @@     got int @@
   drivers/scsi/qedi/qedi_fw.c:1025:47: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] hdr_second_dword
   drivers/scsi/qedi/qedi_fw.c:1025:47: sparse:     got int
   drivers/scsi/qedi/qedi_fw.c:1028:36: sparse: sparse: cast to restricted =
itt_t
   drivers/scsi/qedi/qedi_fw.c:1028:34: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] itt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1028:34: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] itt
   drivers/scsi/qedi/qedi_fw.c:1028:34: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1029:34: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le16 [address=
able] [assigned] [usertype] cid @@     got unsigned int [usertype] iscsi_co=
nn_id @@
   drivers/scsi/qedi/qedi_fw.c:1029:34: sparse:     expected restricted __l=
e16 [addressable] [assigned] [usertype] cid
   drivers/scsi/qedi/qedi_fw.c:1029:34: sparse:     got unsigned int [usert=
ype] iscsi_conn_id
   drivers/scsi/qedi/qedi_fw.c:1030:37: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1030:37: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1030:37: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1031:42: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] exp_stat_sn @@     got unsigned int [usertype] =
@@
   drivers/scsi/qedi/qedi_fw.c:1031:42: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] exp_stat_sn
   drivers/scsi/qedi/qedi_fw.c:1031:42: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1037:45: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1037:45: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1037:45: sparse:     got unsigned int [usert=
ype]
>> drivers/scsi/qedi/qedi_fw.c:1039:45: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1039:45: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] hi
   drivers/scsi/qedi/qedi_fw.c:1039:45: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1046:45: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1046:45: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1046:45: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1048:45: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1048:45: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] hi
   drivers/scsi/qedi/qedi_fw.c:1048:45: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1050:46: sparse: sparse: too many warnings

vim +1039 drivers/scsi/qedi/qedi_fw.c

be086e7c53f1fa Mintz, Yuval     2017-03-11   978  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01   979  int qedi_send_iscsi_login=
(struct qedi_conn *qedi_conn,
ace7f46ba5fde7 Manish Rangankar 2016-12-01   980  			  struct iscsi_task *t=
ask)
ace7f46ba5fde7 Manish Rangankar 2016-12-01   981  {
be086e7c53f1fa Mintz, Yuval     2017-03-11   982  	struct iscsi_login_req_h=
dr login_req_pdu_header;
be086e7c53f1fa Mintz, Yuval     2017-03-11   983  	struct scsi_sgl_task_par=
ams tx_sgl_task_params;
be086e7c53f1fa Mintz, Yuval     2017-03-11   984  	struct scsi_sgl_task_par=
ams rx_sgl_task_params;
be086e7c53f1fa Mintz, Yuval     2017-03-11   985  	struct iscsi_task_params=
 task_params;
21dd79e82f00b2 Tomer Tayar      2017-12-27   986  	struct e4_iscsi_task_con=
text *fw_task_ctx;
be086e7c53f1fa Mintz, Yuval     2017-03-11   987  	struct qedi_ctx *qedi =
=3D qedi_conn->qedi;
ace7f46ba5fde7 Manish Rangankar 2016-12-01   988  	struct iscsi_login_req *=
login_hdr;
be086e7c53f1fa Mintz, Yuval     2017-03-11   989  	struct scsi_sge *resp_sg=
e =3D NULL;
ace7f46ba5fde7 Manish Rangankar 2016-12-01   990  	struct qedi_cmd *qedi_cm=
d;
be086e7c53f1fa Mintz, Yuval     2017-03-11   991  	struct qedi_endpoint *ep;
ace7f46ba5fde7 Manish Rangankar 2016-12-01   992  	s16 tid =3D 0;
be086e7c53f1fa Mintz, Yuval     2017-03-11   993  	u16 sq_idx =3D 0;
be086e7c53f1fa Mintz, Yuval     2017-03-11   994  	int rval =3D 0;
ace7f46ba5fde7 Manish Rangankar 2016-12-01   995  =

be086e7c53f1fa Mintz, Yuval     2017-03-11   996  	resp_sge =3D (struct scs=
i_sge *)qedi_conn->gen_pdu.resp_bd_tbl;
ace7f46ba5fde7 Manish Rangankar 2016-12-01   997  	qedi_cmd =3D (struct qed=
i_cmd *)task->dd_data;
be086e7c53f1fa Mintz, Yuval     2017-03-11   998  	ep =3D qedi_conn->ep;
ace7f46ba5fde7 Manish Rangankar 2016-12-01   999  	login_hdr =3D (struct is=
csi_login_req *)task->hdr;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1000  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  1001  	tid =3D qedi_get_task_id=
x(qedi);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1002  	if (tid =3D=3D -1)
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1003  		return -ENOMEM;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1004  =

be086e7c53f1fa Mintz, Yuval     2017-03-11  1005  	fw_task_ctx =3D
21dd79e82f00b2 Tomer Tayar      2017-12-27  1006  	     (struct e4_iscsi_ta=
sk_context *)qedi_get_task_mem(&qedi->tasks,
21dd79e82f00b2 Tomer Tayar      2017-12-27  1007  							       tid);
21dd79e82f00b2 Tomer Tayar      2017-12-27  1008  	memset(fw_task_ctx, 0, s=
izeof(struct e4_iscsi_task_context));
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1009  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  1010  	qedi_cmd->task_id =3D ti=
d;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1011  =

be086e7c53f1fa Mintz, Yuval     2017-03-11  1012  	memset(&task_params, 0, =
sizeof(task_params));
be086e7c53f1fa Mintz, Yuval     2017-03-11  1013  	memset(&login_req_pdu_he=
ader, 0, sizeof(login_req_pdu_header));
be086e7c53f1fa Mintz, Yuval     2017-03-11  1014  	memset(&tx_sgl_task_para=
ms, 0, sizeof(tx_sgl_task_params));
be086e7c53f1fa Mintz, Yuval     2017-03-11  1015  	memset(&rx_sgl_task_para=
ms, 0, sizeof(rx_sgl_task_params));
be086e7c53f1fa Mintz, Yuval     2017-03-11  1016  	/* Update header info */
be086e7c53f1fa Mintz, Yuval     2017-03-11  1017  	login_req_pdu_header.opc=
ode =3D login_hdr->opcode;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1018  	login_req_pdu_header.ver=
sion_min =3D login_hdr->min_version;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1019  	login_req_pdu_header.ver=
sion_max =3D login_hdr->max_version;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1020  	login_req_pdu_header.fla=
gs_attr =3D login_hdr->flags;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1021  	login_req_pdu_header.isi=
d_tabc =3D swab32p((u32 *)login_hdr->isid);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1022  	login_req_pdu_header.isi=
d_d =3D swab16p((u16 *)&login_hdr->isid[4]);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1023  =

be086e7c53f1fa Mintz, Yuval     2017-03-11  1024  	login_req_pdu_header.tsi=
h =3D login_hdr->tsih;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1025  	login_req_pdu_header.hdr=
_second_dword =3D ntoh24(login_hdr->dlength);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1026  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  1027  	qedi_update_itt_map(qedi=
, tid, task->itt, qedi_cmd);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1028  	login_req_pdu_header.itt=
 =3D qedi_set_itt(tid, get_itt(task->itt));
be086e7c53f1fa Mintz, Yuval     2017-03-11  1029  	login_req_pdu_header.cid=
 =3D qedi_conn->iscsi_conn_id;
be086e7c53f1fa Mintz, Yuval     2017-03-11 @1030  	login_req_pdu_header.cmd=
_sn =3D be32_to_cpu(login_hdr->cmdsn);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1031  	login_req_pdu_header.exp=
_stat_sn =3D be32_to_cpu(login_hdr->exp_statsn);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1032  	login_req_pdu_header.exp=
_stat_sn =3D 0;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1033  =

be086e7c53f1fa Mintz, Yuval     2017-03-11  1034  	/* Fill tx AHS and rx bu=
ffer */
be086e7c53f1fa Mintz, Yuval     2017-03-11  1035  	tx_sgl_task_params.sgl =
=3D
be086e7c53f1fa Mintz, Yuval     2017-03-11  1036  			       (struct scsi_sg=
e *)qedi_conn->gen_pdu.req_bd_tbl;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1037  	tx_sgl_task_params.sgl_p=
hys_addr.lo =3D
be086e7c53f1fa Mintz, Yuval     2017-03-11  1038  					 (u32)(qedi_conn->ge=
n_pdu.req_dma_addr);
be086e7c53f1fa Mintz, Yuval     2017-03-11 @1039  	tx_sgl_task_params.sgl_p=
hys_addr.hi =3D
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1040  			      (u32)((u64)qedi_=
conn->gen_pdu.req_dma_addr >> 32);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1041  	tx_sgl_task_params.total=
_buffer_size =3D ntoh24(login_hdr->dlength);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1042  	tx_sgl_task_params.num_s=
ges =3D 1;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1043  =

be086e7c53f1fa Mintz, Yuval     2017-03-11  1044  	rx_sgl_task_params.sgl =
=3D
be086e7c53f1fa Mintz, Yuval     2017-03-11  1045  			      (struct scsi_sge=
 *)qedi_conn->gen_pdu.resp_bd_tbl;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1046  	rx_sgl_task_params.sgl_p=
hys_addr.lo =3D
be086e7c53f1fa Mintz, Yuval     2017-03-11  1047  					(u32)(qedi_conn->gen=
_pdu.resp_dma_addr);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1048  	rx_sgl_task_params.sgl_p=
hys_addr.hi =3D
be086e7c53f1fa Mintz, Yuval     2017-03-11  1049  			     (u32)((u64)qedi_c=
onn->gen_pdu.resp_dma_addr >> 32);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1050  	rx_sgl_task_params.total=
_buffer_size =3D resp_sge->sge_len;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1051  	rx_sgl_task_params.num_s=
ges =3D 1;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1052  =

be086e7c53f1fa Mintz, Yuval     2017-03-11  1053  	/* Fill fw input params =
*/
be086e7c53f1fa Mintz, Yuval     2017-03-11  1054  	task_params.context =3D =
fw_task_ctx;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1055  	task_params.conn_icid =
=3D (u16)qedi_conn->iscsi_conn_id;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1056  	task_params.itid =3D tid;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1057  	task_params.cq_rss_numbe=
r =3D 0;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1058  	task_params.tx_io_size =
=3D ntoh24(login_hdr->dlength);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1059  	task_params.rx_io_size =
=3D resp_sge->sge_len;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1060  =

be086e7c53f1fa Mintz, Yuval     2017-03-11  1061  	sq_idx =3D qedi_get_wqe_=
idx(qedi_conn);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1062  	task_params.sqe =3D &ep-=
>sq[sq_idx];
be086e7c53f1fa Mintz, Yuval     2017-03-11  1063  =

be086e7c53f1fa Mintz, Yuval     2017-03-11  1064  	memset(task_params.sqe, =
0, sizeof(struct iscsi_wqe));
be086e7c53f1fa Mintz, Yuval     2017-03-11  1065  	rval =3D init_initiator_=
login_request_task(&task_params,
be086e7c53f1fa Mintz, Yuval     2017-03-11  1066  						 &login_req_pdu_hea=
der,
be086e7c53f1fa Mintz, Yuval     2017-03-11  1067  						 &tx_sgl_task_param=
s,
be086e7c53f1fa Mintz, Yuval     2017-03-11  1068  						 &rx_sgl_task_param=
s);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1069  	if (rval)
be086e7c53f1fa Mintz, Yuval     2017-03-11  1070  		return -1;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1071  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  1072  	spin_lock(&qedi_conn->li=
st_lock);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1073  	list_add_tail(&qedi_cmd-=
>io_cmd, &qedi_conn->active_cmd_list);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1074  	qedi_cmd->io_cmd_in_list=
 =3D true;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1075  	qedi_conn->active_cmd_co=
unt++;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1076  	spin_unlock(&qedi_conn->=
list_lock);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1077  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  1078  	qedi_ring_doorbell(qedi_=
conn);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1079  	return 0;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1080  }
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1081  =


:::::: The code at line 1039 was first introduced by commit
:::::: be086e7c53f1fac51eed14523b28f2214b548dd2 qed*: Utilize Firmware 8.15=
.3.0

:::::: TO: Mintz, Yuval <Yuval.Mintz@cavium.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0623681431201515143==--

