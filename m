Content-Type: multipart/mixed; boundary="===============7051988241637755500=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/qedi/qedi_fw.c:932:40: sparse: sparse: incorrect type in assignment (different base types)
Date: Sun, 27 Feb 2022 20:13:27 +0800
Message-ID: <202202272027.ZlOkOKoF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7051988241637755500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Shai Malin <smalin@marvell.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Manish Rangankar <mrangankar@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2293be58d6a18cab800e25e42081bacb75c05752
commit: 9757f8af04423f60b6ecbd6802ff4e3f618fbb44 scsi: qedi: Add support fo=
r fastpath doorbell recovery
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220227=
/202202272027.ZlOkOKoF-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9757f8af04423f60b6ecbd6802ff4e3f618fbb44
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9757f8af04423f60b6ecbd6802ff4e3f618fbb44
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/net/wireless/mediatek/mt76/=
mt7915/ drivers/scsi/qedi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: cast from restricted =
__le16
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __be16 [usertype]=
 t2wait @@     got restricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse:     expected restricted __be1=
6 [usertype] t2wait
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse:     got restricted __be32 [us=
ertype]
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse: sparse: cast from restricted =
__le16
   drivers/scsi/qedi/qedi_fw.c:56:28: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __be16 [usertype]=
 t2retain @@     got restricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:56:28: sparse:     expected restricted __be1=
6 [usertype] t2retain
   drivers/scsi/qedi/qedi_fw.c:56:28: sparse:     got restricted __be32 [us=
ertype]
   drivers/scsi/qedi/qedi_fw.c:105:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:105:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:105:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:109:29: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:111:27: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __be32 [usertype=
] ttt @@     got restricted __le32 [usertype] ttt @@
   drivers/scsi/qedi/qedi_fw.c:111:27: sparse:     expected restricted __be=
32 [usertype] ttt
   drivers/scsi/qedi/qedi_fw.c:111:27: sparse:     got restricted __le32 [u=
sertype] ttt
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:116:36: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:211:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:211:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:211:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:214:29: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 deg=
rades to integer
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
   drivers/scsi/qedi/qedi_fw.c:623:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:624:26: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:625:20: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:629:31: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:632:38: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:734:28: sparse: sparse: incorrect type in in=
itializer (different base types) @@     expected unsigned int [usertype] pr=
oto_itt @@     got restricted __le16 [usertype] itid @@
   drivers/scsi/qedi/qedi_fw.c:734:28: sparse:     expected unsigned int [u=
sertype] proto_itt
   drivers/scsi/qedi/qedi_fw.c:734:28: sparse:     got restricted __le16 [u=
sertype] itid
   drivers/scsi/qedi/qedi_fw.c:744:19: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int [usertype] isc=
si_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:744:19: sparse:     expected unsigned int [u=
sertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:744:19: sparse:     got restricted __le16 [u=
sertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:795:9: sparse: sparse: cast to restricted it=
t_t
   drivers/scsi/qedi/qedi_fw.c:857:20: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int [usertype] isc=
si_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:857:20: sparse:     expected unsigned int [u=
sertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:857:20: sparse:     got restricted __le16 [u=
sertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:888:50: sparse: sparse: cast from restricted=
 itt_t
   drivers/scsi/qedi/qedi_fw.c:888:40: sparse: sparse: restricted __le16 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:893:48: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/scsi/qedi/qedi_fw.c:892:49: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le16 [usertype=
] itid @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:892:49: sparse:     expected restricted __le=
16 [usertype] itid
   drivers/scsi/qedi/qedi_fw.c:892:49: sparse:     got unsigned int
>> drivers/scsi/qedi/qedi_fw.c:932:40: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le16 [usertype=
] sq_prod @@     got unsigned short [usertype] fw_sq_prod_idx @@
   drivers/scsi/qedi/qedi_fw.c:932:40: sparse:     expected restricted __le=
16 [usertype] sq_prod
   drivers/scsi/qedi/qedi_fw.c:932:40: sparse:     got unsigned short [user=
type] fw_sq_prod_idx
   drivers/scsi/qedi/qedi_fw.c:1008:40: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] isid_tabc @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:1008:40: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] isid_tabc
   drivers/scsi/qedi/qedi_fw.c:1008:40: sparse:     got unsigned int
   drivers/scsi/qedi/qedi_fw.c:1009:37: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le16 [address=
able] [assigned] [usertype] isid_d @@     got unsigned short @@
   drivers/scsi/qedi/qedi_fw.c:1009:37: sparse:     expected restricted __l=
e16 [addressable] [assigned] [usertype] isid_d
   drivers/scsi/qedi/qedi_fw.c:1009:37: sparse:     got unsigned short
   drivers/scsi/qedi/qedi_fw.c:1011:35: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le16 [address=
able] [assigned] [usertype] tsih @@     got restricted __be16 [usertype] ts=
ih @@
   drivers/scsi/qedi/qedi_fw.c:1011:35: sparse:     expected restricted __l=
e16 [addressable] [assigned] [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:1011:35: sparse:     got restricted __be16 [=
usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:1012:47: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] hdr_second_dword @@     got int @@
   drivers/scsi/qedi/qedi_fw.c:1012:47: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] hdr_second_dword
   drivers/scsi/qedi/qedi_fw.c:1012:47: sparse:     got int
   drivers/scsi/qedi/qedi_fw.c:1015:36: sparse: sparse: cast to restricted =
itt_t
   drivers/scsi/qedi/qedi_fw.c:1015:34: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] itt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1015:34: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] itt
   drivers/scsi/qedi/qedi_fw.c:1015:34: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1016:34: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le16 [address=
able] [assigned] [usertype] cid @@     got unsigned int [usertype] iscsi_co=
nn_id @@
   drivers/scsi/qedi/qedi_fw.c:1016:34: sparse:     expected restricted __l=
e16 [addressable] [assigned] [usertype] cid
   drivers/scsi/qedi/qedi_fw.c:1016:34: sparse:     got unsigned int [usert=
ype] iscsi_conn_id
   drivers/scsi/qedi/qedi_fw.c:1017:37: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1017:37: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1017:37: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1018:42: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] exp_stat_sn @@     got unsigned int [usertype] =
@@
   drivers/scsi/qedi/qedi_fw.c:1018:42: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] exp_stat_sn
   drivers/scsi/qedi/qedi_fw.c:1018:42: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1024:45: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1024:45: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1024:45: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1026:45: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1026:45: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] hi
   drivers/scsi/qedi/qedi_fw.c:1026:45: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1033:45: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1033:45: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1033:45: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1035:45: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1035:45: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] hi
   drivers/scsi/qedi/qedi_fw.c:1035:45: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1037:46: sparse: sparse: too many warnings

vim +932 drivers/scsi/qedi/qedi_fw.c

ace7f46ba5fde7 Manish Rangankar 2016-12-01  827  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  828  void qedi_fp_process_cqes(=
struct qedi_work *work)
ace7f46ba5fde7 Manish Rangankar 2016-12-01  829  {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  830  	struct qedi_ctx *qedi =3D=
 work->qedi;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  831  	union iscsi_cqe *cqe =3D =
&work->cqe;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  832  	struct iscsi_task *task =
=3D NULL;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  833  	struct iscsi_nopout *nopo=
ut_hdr;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  834  	struct qedi_conn *q_conn;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  835  	struct iscsi_conn *conn;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  836  	struct qedi_cmd *qedi_cmd;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  837  	u32 comp_type;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  838  	u32 iscsi_cid;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  839  	u32 hdr_opcode;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  840  	u16 que_idx =3D work->que=
_idx;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  841  	u8 cqe_err_bits =3D 0;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  842  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  843  	comp_type =3D cqe->cqe_co=
mmon.cqe_type;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  844  	hdr_opcode =3D cqe->cqe_c=
ommon.iscsi_hdr.common.hdr_first_byte;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  845  	cqe_err_bits =3D
ace7f46ba5fde7 Manish Rangankar 2016-12-01  846  		cqe->cqe_common.error_bi=
tmap.error_bits.cqe_error_status_bits;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  847  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  848  	QEDI_INFO(&qedi->dbg_ctx,=
 QEDI_LOG_CONN,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  849  		  "fw_cid=3D0x%x, cqe ty=
pe=3D0x%x, opcode=3D0x%x\n",
ace7f46ba5fde7 Manish Rangankar 2016-12-01  850  		  cqe->cqe_common.conn_i=
d, comp_type, hdr_opcode);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  851  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  852  	if (comp_type >=3D MAX_IS=
CSI_CQES_TYPE) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  853  		QEDI_WARN(&qedi->dbg_ctx=
, "Invalid CqE type\n");
ace7f46ba5fde7 Manish Rangankar 2016-12-01  854  		return;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  855  	}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  856  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01 @857  	iscsi_cid  =3D cqe->cqe_c=
ommon.conn_id;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  858  	q_conn =3D qedi->cid_que.=
conn_cid_tbl[iscsi_cid];
ace7f46ba5fde7 Manish Rangankar 2016-12-01  859  	if (!q_conn) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  860  		QEDI_WARN(&qedi->dbg_ctx,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  861  			  "Session no longer ex=
ists for cid=3D0x%x!!\n",
ace7f46ba5fde7 Manish Rangankar 2016-12-01  862  			  iscsi_cid);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  863  		return;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  864  	}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  865  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  866  	conn =3D q_conn->cls_conn=
->dd_data;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  867  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  868  	if (unlikely(cqe_err_bits=
 &&
ace7f46ba5fde7 Manish Rangankar 2016-12-01  869  		     GET_FIELD(cqe_err_b=
its,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  870  			       CQE_ERROR_BITMAP=
_DATA_DIGEST_ERR))) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  871  		iscsi_conn_failure(conn,=
 ISCSI_ERR_DATA_DGST);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  872  		return;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  873  	}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  874  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  875  	switch (comp_type) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  876  	case ISCSI_CQE_TYPE_SOLIC=
ITED:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  877  	case ISCSI_CQE_TYPE_SOLIC=
ITED_WITH_SENSE:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  878  		qedi_cmd =3D container_o=
f(work, struct qedi_cmd, cqe_work);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  879  		task =3D qedi_cmd->task;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  880  		if (!task) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  881  			QEDI_WARN(&qedi->dbg_ct=
x, "task is NULL\n");
ace7f46ba5fde7 Manish Rangankar 2016-12-01  882  			return;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  883  		}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  884  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  885  		/* Process NOPIN local c=
ompletion */
ace7f46ba5fde7 Manish Rangankar 2016-12-01  886  		nopout_hdr =3D (struct i=
scsi_nopout *)task->hdr;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  887  		if ((nopout_hdr->itt =3D=
=3D RESERVED_ITT) &&
ace7f46ba5fde7 Manish Rangankar 2016-12-01  888  		    (cqe->cqe_solicited.=
itid !=3D (u16)RESERVED_ITT)) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  889  			qedi_process_nopin_loca=
l_cmpl(qedi, &cqe->cqe_solicited,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  890  						      task, q_conn);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  891  		} else {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  892  			cqe->cqe_solicited.itid=
 =3D
ace7f46ba5fde7 Manish Rangankar 2016-12-01  893  					       qedi_get_itt(c=
qe->cqe_solicited);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  894  			/* Process other solici=
ted responses */
ace7f46ba5fde7 Manish Rangankar 2016-12-01  895  			qedi_mtask_completion(q=
edi, cqe, task, q_conn, que_idx);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  896  		}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  897  		break;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  898  	case ISCSI_CQE_TYPE_UNSOL=
ICITED:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  899  		switch (hdr_opcode) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  900  		case ISCSI_OPCODE_NOP_IN:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  901  			qedi_process_nopin_mesg=
(qedi, cqe, task, q_conn,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  902  						que_idx);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  903  			break;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  904  		case ISCSI_OPCODE_ASYNC_=
MSG:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  905  			qedi_process_async_mesg=
(qedi, cqe, task, q_conn,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  906  						que_idx);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  907  			break;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  908  		case ISCSI_OPCODE_REJECT:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  909  			qedi_process_reject_mes=
g(qedi, cqe, task, q_conn,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  910  						 que_idx);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  911  			break;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  912  		}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  913  		goto exit_fp_process;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  914  	case ISCSI_CQE_TYPE_DUMMY:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  915  		QEDI_INFO(&qedi->dbg_ctx=
, QEDI_LOG_SCSI_TM, "Dummy CqE\n");
ace7f46ba5fde7 Manish Rangankar 2016-12-01  916  		goto exit_fp_process;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  917  	case ISCSI_CQE_TYPE_TASK_=
CLEANUP:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  918  		QEDI_INFO(&qedi->dbg_ctx=
, QEDI_LOG_SCSI_TM, "CleanUp CqE\n");
5b04d050cde44c Mike Christie    2021-05-25  919  		qedi_process_cmd_cleanup=
_resp(qedi, &cqe->cqe_solicited, conn);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  920  		goto exit_fp_process;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  921  	default:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  922  		QEDI_ERR(&qedi->dbg_ctx,=
 "Error cqe.\n");
ace7f46ba5fde7 Manish Rangankar 2016-12-01  923  		break;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  924  	}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  925  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  926  exit_fp_process:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  927  	return;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  928  }
ace7f46ba5fde7 Manish Rangankar 2016-12-01  929  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  930  static void qedi_ring_door=
bell(struct qedi_conn *qedi_conn)
ace7f46ba5fde7 Manish Rangankar 2016-12-01  931  {
9757f8af04423f Shai Malin       2021-08-05 @932  	qedi_conn->ep->db_data.sq=
_prod =3D qedi_conn->ep->fw_sq_prod_idx;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  933  =

9757f8af04423f Shai Malin       2021-08-05  934  	/* wmb - Make sure fw idx=
 is coherent */
9757f8af04423f Shai Malin       2021-08-05  935  	wmb();
9757f8af04423f Shai Malin       2021-08-05  936  	writel(*(u32 *)&qedi_conn=
->ep->db_data, qedi_conn->ep->p_doorbell);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  937  =

ace7f46ba5fde7 Manish Rangankar 2016-12-01  938  	/* Make sure fw write idx=
 is coherent, and include both memory barriers
ace7f46ba5fde7 Manish Rangankar 2016-12-01  939  	 * as a failsafe as for s=
ome architectures the call is the same but on
ace7f46ba5fde7 Manish Rangankar 2016-12-01  940  	 * others they are two di=
fferent assembly operations.
ace7f46ba5fde7 Manish Rangankar 2016-12-01  941  	 */
ace7f46ba5fde7 Manish Rangankar 2016-12-01  942  	wmb();
ace7f46ba5fde7 Manish Rangankar 2016-12-01  943  	QEDI_INFO(&qedi_conn->qed=
i->dbg_ctx, QEDI_LOG_MP_REQ,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  944  		  "prod_idx=3D0x%x, fw_p=
rod_idx=3D0x%x, cid=3D0x%x\n",
ace7f46ba5fde7 Manish Rangankar 2016-12-01  945  		  qedi_conn->ep->sq_prod=
_idx, qedi_conn->ep->fw_sq_prod_idx,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  946  		  qedi_conn->iscsi_conn_=
id);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  947  }
ace7f46ba5fde7 Manish Rangankar 2016-12-01  948  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7051988241637755500==--

