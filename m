Content-Type: multipart/mixed; boundary="===============0243039122489310271=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/qedi/qedi_fw.c:932:40: sparse: sparse: incorrect type in assignment (different base types)
Date: Thu, 01 Sep 2022 21:37:16 +0800
Message-ID: <202209012156.arbZD4MI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0243039122489310271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Shai Malin <smalin@marvell.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Manish Rangankar <mrangankar@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5e4d5e99162ba8025d58a3af7ad103f155d2df7
commit: 9757f8af04423f60b6ecbd6802ff4e3f618fbb44 scsi: qedi: Add support fo=
r fastpath doorbell recovery
date:   1 year, 1 month ago
:::::: branch date: 20 hours ago
:::::: commit date: 1 year, 1 month ago
config: powerpc-randconfig-s043-20220901 (https://download.01.org/0day-ci/a=
rchive/20220901/202209012156.arbZD4MI-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9757f8af04423f60b6ecbd6802ff4e3f618fbb44
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9757f8af04423f60b6ecbd6802ff4e3f618fbb44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash drivers/scsi/qedi/

If you fix the issue, kindly add following tag where applicable
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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0243039122489310271==--

