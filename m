Content-Type: multipart/mixed; boundary="===============2602880020196053295=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/qedi/qedi_fw.c:1460:31: sparse: sparse: incorrect type in assignment (different base types)
Date: Sat, 20 Aug 2022 06:51:13 +0800
Message-ID: <202208200608.rjiNMGXA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2602880020196053295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Justin Stitt <jstitt007@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Nathan Chancellor <nathan@kernel.org>

include/uapi/linux/swab.h
tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50cd95ac46548429e5bba7ca75cc97d11a697947
commit: d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7 include/uapi/linux/swab.h:=
 move explicit cast outside ternary
date:   9 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 weeks ago
config: ia64-randconfig-s053-20220820 (https://download.01.org/0day-ci/arch=
ive/20220820/202208200608.rjiNMGXA-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Di=
a64 SHELL=3D/bin/bash drivers/scsi/qedi/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/qedi/qedi_fw.c:1459:30: sparse: sparse: cast to restricted =
itt_t
   drivers/scsi/qedi/qedi_fw.c:1459:28: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [usertype] itt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1459:28: sparse:     expected restricted __l=
e32 [addressable] [usertype] itt
   drivers/scsi/qedi/qedi_fw.c:1459:28: sparse:     got unsigned int [usert=
ype]
>> drivers/scsi/qedi/qedi_fw.c:1460:31: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [usertype] cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1460:31: sparse:     expected restricted __l=
e32 [addressable] [usertype] cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1460:31: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1463:33: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/qedi/qedi_fw.c:1463:33: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/qedi/qedi_fw.c:1463:33: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/qedi/qedi_fw.c:1463:33: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/qedi/qedi_fw.c:1463:33: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/qedi/qedi_fw.c:1463:33: sparse: sparse: cast to restricted =
__be32
>> drivers/scsi/qedi/qedi_fw.c:1463:31: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1463:31: sparse:     expected restricted __l=
e32 [addressable] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1463:31: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1464:33: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/qedi/qedi_fw.c:1464:33: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/qedi/qedi_fw.c:1464:33: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/qedi/qedi_fw.c:1464:33: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/qedi/qedi_fw.c:1464:33: sparse: sparse: cast to restricted =
__be32
   drivers/scsi/qedi/qedi_fw.c:1464:33: sparse: sparse: cast to restricted =
__be32
>> drivers/scsi/qedi/qedi_fw.c:1464:31: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1464:31: sparse:     expected restricted __l=
e32 [addressable] [usertype] hi
   drivers/scsi/qedi/qedi_fw.c:1464:31: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1469:36: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [usertype] rtt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1469:36: sparse:     expected restricted __l=
e32 [addressable] [usertype] rtt
   drivers/scsi/qedi/qedi_fw.c:1469:36: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:1473:36: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [usertype] rtt @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:1473:36: sparse:     expected restricted __l=
e32 [addressable] [usertype] rtt
   drivers/scsi/qedi/qedi_fw.c:1473:36: sparse:     got unsigned int
   drivers/scsi/qedi/qedi_fw.c:1478:41: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] hdr_second_dword @@     got int @@
   drivers/scsi/qedi/qedi_fw.c:1478:41: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] hdr_second_dword
   drivers/scsi/qedi/qedi_fw.c:1478:41: sparse:     got int
>> drivers/scsi/qedi/qedi_fw.c:1479:35: sparse: sparse: incorrect type in a=
ssignment (different base types) @@     expected restricted __le32 [address=
able] [assigned] [usertype] ref_cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1479:35: sparse:     expected restricted __l=
e32 [addressable] [assigned] [usertype] ref_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1479:35: sparse:     got unsigned int [usert=
ype]
   drivers/scsi/qedi/qedi_fw.c:50:25: sparse: sparse: restricted __le16 deg=
rades to integer
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned int [usertype] val =
@@     got restricted __le32 [usertype] stat_sn @@
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse:     expected unsigned int [us=
ertype] val
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse:     got restricted __le32 [us=
ertype] stat_sn
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned int [usertype] val =
@@     got restricted __le32 [usertype] exp_cmd_sn @@
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse:     expected unsigned int [us=
ertype] val
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse:     got restricted __le32 [us=
ertype] exp_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned int [usertype] val =
@@     got restricted __le32 [usertype] max_cmd_sn @@
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse:     expected unsigned int [us=
ertype] val
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse:     got restricted __le32 [us=
ertype] max_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: cast from restricted =
__le32
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned int [usertype] val =
@@     got restricted __le16 [usertype] time_2_wait @@
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse:     expected unsigned int [us=
ertype] val
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse:     got restricted __le16 [us=
ertype] time_2_wait
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: cast from restricted =
__le16
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: cast from restricted =
__le16
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: cast from restricted =
__le16
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: cast from restricted =
__le16
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __be16 [usertype]=
 t2wait @@     got restricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse:     expected restricted __be1=
6 [usertype] t2wait
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse:     got restricted __be32 [us=
ertype]
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse: sparse: incorrect type in arg=
ument 1 (different base types) @@     expected unsigned int [usertype] val =
@@     got restricted __le16 [usertype] time_2_retain @@
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse:     expected unsigned int [us=
ertype] val
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse:     got restricted __le16 [us=
ertype] time_2_retain
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse: sparse: cast from restricted =
__le16
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse: sparse: cast from restricted =
__le16
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse: sparse: cast from restricted =
__le16
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
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned int [usertype] val=
 @@     got restricted __le32 [usertype] stat_sn @@
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse:     expected unsigned int [u=
sertype] val
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse:     got restricted __le32 [u=
sertype] stat_sn
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned int [usertype] val=
 @@     got restricted __le32 [usertype] exp_cmd_sn @@
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse:     expected unsigned int [u=
sertype] val
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse:     got restricted __le32 [u=
sertype] exp_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned int [usertype] val=
 @@     got restricted __le32 [usertype] max_cmd_sn @@
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse:     expected unsigned int [u=
sertype] val
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse:     got restricted __le32 [u=
sertype] max_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: cast from restricted=
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
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned int [usertype] val=
 @@     got restricted __le32 [usertype] stat_sn @@
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse:     expected unsigned int [u=
sertype] val
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse:     got restricted __le32 [u=
sertype] stat_sn
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned int [usertype] val=
 @@     got restricted __le32 [usertype] exp_cmd_sn @@
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse:     expected unsigned int [u=
sertype] val
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse:     got restricted __le32 [u=
sertype] exp_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned int [usertype] val=
 @@     got restricted __le32 [usertype] max_cmd_sn @@
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse:     expected unsigned int [u=
sertype] val
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse:     got restricted __le32 [u=
sertype] max_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse: sparse: cast from restricted=
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
>> drivers/scsi/qedi/qedi_fw.c:287:28: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __be16 [usertype=
] tsih @@     got restricted __le16 [usertype] tsih @@
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse:     expected restricted __be=
16 [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse:     got restricted __le16 [u=
sertype] tsih
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: incorrect type in ar=
gument 1 (different base types) @@     expected unsigned int [usertype] val=
 @@     got restricted __le32 [usertype] stat_sn @@
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse:     expected unsigned int [u=
sertype] val
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse:     got restricted __le32 [u=
sertype] stat_sn
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: cast from restricted=
 __le32
   drivers/scsi/qedi/qedi_fw.c:289:35: sparse: sparse: too many warnings

vim +1460 drivers/scsi/qedi/qedi_fw.c

ace7f46ba5fde7 Manish Rangankar            2016-12-01  1421  =

60a0d379f11bc7 Mike Christie               2021-05-25  1422  static int sen=
d_iscsi_tmf(struct qedi_conn *qedi_conn, struct iscsi_task *mtask,
60a0d379f11bc7 Mike Christie               2021-05-25  1423  			  struct is=
csi_task *ctask)
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1424  {
be086e7c53f1fa Mintz, Yuval                2017-03-11  1425  	struct iscsi_=
tmf_request_hdr tmf_pdu_header;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1426  	struct iscsi_=
task_params task_params;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1427  	struct qedi_c=
tx *qedi =3D qedi_conn->qedi;
fb09a1ed5c6e50 Shai Malin                  2021-10-04  1428  	struct iscsi_=
task_context *fw_task_ctx;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1429  	struct iscsi_=
tm *tmf_hdr;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1430  	struct qedi_c=
md *qedi_cmd;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1431  	struct qedi_c=
md *cmd;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1432  	struct qedi_e=
ndpoint *ep;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1433  	u32 scsi_lun[=
2];
be086e7c53f1fa Mintz, Yuval                2017-03-11  1434  	s16 tid =3D 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1435  	u16 sq_idx =
=3D 0;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1436  =

ace7f46ba5fde7 Manish Rangankar            2016-12-01  1437  	tmf_hdr =3D (=
struct iscsi_tm *)mtask->hdr;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1438  	qedi_cmd =3D =
(struct qedi_cmd *)mtask->dd_data;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1439  	ep =3D qedi_c=
onn->ep;
b19775e4785996 manish.rangankar(a)cavium.com 2017-05-19  1440  	if (!ep)
b19775e4785996 manish.rangankar(a)cavium.com 2017-05-19  1441  		return -EN=
ODEV;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1442  =

be086e7c53f1fa Mintz, Yuval                2017-03-11  1443  	tid =3D qedi_=
get_task_idx(qedi);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1444  	if (tid =3D=
=3D -1)
be086e7c53f1fa Mintz, Yuval                2017-03-11  1445  		return -ENOM=
EM;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1446  =

be086e7c53f1fa Mintz, Yuval                2017-03-11  1447  	fw_task_ctx =
=3D
fb09a1ed5c6e50 Shai Malin                  2021-10-04  1448  	     (struct =
iscsi_task_context *)qedi_get_task_mem(&qedi->tasks,
21dd79e82f00b2 Tomer Tayar                 2017-12-27  1449  							       =
tid);
fb09a1ed5c6e50 Shai Malin                  2021-10-04  1450  	memset(fw_tas=
k_ctx, 0, sizeof(struct iscsi_task_context));
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1451  =

be086e7c53f1fa Mintz, Yuval                2017-03-11  1452  	qedi_cmd->tas=
k_id =3D tid;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1453  =

be086e7c53f1fa Mintz, Yuval                2017-03-11  1454  	memset(&task_=
params, 0, sizeof(task_params));
be086e7c53f1fa Mintz, Yuval                2017-03-11  1455  	memset(&tmf_p=
du_header, 0, sizeof(tmf_pdu_header));
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1456  =

be086e7c53f1fa Mintz, Yuval                2017-03-11  1457  	/* Update hea=
der info */
be086e7c53f1fa Mintz, Yuval                2017-03-11  1458  	qedi_update_i=
tt_map(qedi, tid, mtask->itt, qedi_cmd);
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1459  	tmf_pdu_heade=
r.itt =3D qedi_set_itt(tid, get_itt(mtask->itt));
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1460  	tmf_pdu_heade=
r.cmd_sn =3D be32_to_cpu(tmf_hdr->cmdsn);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1461  =

be086e7c53f1fa Mintz, Yuval                2017-03-11  1462  	memcpy(scsi_l=
un, &tmf_hdr->lun, sizeof(struct scsi_lun));
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1463  	tmf_pdu_heade=
r.lun.lo =3D be32_to_cpu(scsi_lun[0]);
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1464  	tmf_pdu_heade=
r.lun.hi =3D be32_to_cpu(scsi_lun[1]);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1465  =

ace7f46ba5fde7 Manish Rangankar            2016-12-01  1466  	if ((tmf_hdr-=
>flags & ISCSI_FLAG_TM_FUNC_MASK) =3D=3D
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1467  	     ISCSI_TM=
_FUNC_ABORT_TASK) {
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1468  		cmd =3D (str=
uct qedi_cmd *)ctask->dd_data;
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1469  		tmf_pdu_head=
er.rtt =3D
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1470  				qedi_set_i=
tt(cmd->task_id,
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1471  					     get_=
itt(tmf_hdr->rtt));
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1472  	} else {
be086e7c53f1fa Mintz, Yuval                2017-03-11  1473  		tmf_pdu_head=
er.rtt =3D ISCSI_RESERVED_TAG;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1474  	}
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1475  =

be086e7c53f1fa Mintz, Yuval                2017-03-11  1476  	tmf_pdu_heade=
r.opcode =3D tmf_hdr->opcode;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1477  	tmf_pdu_heade=
r.function =3D tmf_hdr->flags;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1478  	tmf_pdu_heade=
r.hdr_second_dword =3D ntoh24(tmf_hdr->dlength);
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1479  	tmf_pdu_heade=
r.ref_cmd_sn =3D be32_to_cpu(tmf_hdr->refcmdsn);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1480  =

be086e7c53f1fa Mintz, Yuval                2017-03-11  1481  	/* Fill fw in=
put params */
be086e7c53f1fa Mintz, Yuval                2017-03-11  1482  	task_params.c=
ontext =3D fw_task_ctx;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1483  	task_params.c=
onn_icid =3D (u16)qedi_conn->iscsi_conn_id;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1484  	task_params.i=
tid =3D tid;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1485  	task_params.c=
q_rss_number =3D 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1486  	task_params.t=
x_io_size =3D 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1487  	task_params.r=
x_io_size =3D 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1488  =

be086e7c53f1fa Mintz, Yuval                2017-03-11  1489  	sq_idx =3D qe=
di_get_wqe_idx(qedi_conn);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1490  	task_params.s=
qe =3D &ep->sq[sq_idx];
be086e7c53f1fa Mintz, Yuval                2017-03-11  1491  =

be086e7c53f1fa Mintz, Yuval                2017-03-11  1492  	memset(task_p=
arams.sqe, 0, sizeof(struct iscsi_wqe));
f7eea75262fc8e Mike Christie               2021-05-25  1493  	init_initiato=
r_tmf_request_task(&task_params, &tmf_pdu_header);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1494  =

ace7f46ba5fde7 Manish Rangankar            2016-12-01  1495  	spin_lock(&qe=
di_conn->list_lock);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1496  	list_add_tail=
(&qedi_cmd->io_cmd, &qedi_conn->active_cmd_list);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1497  	qedi_cmd->io_=
cmd_in_list =3D true;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1498  	qedi_conn->ac=
tive_cmd_count++;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1499  	spin_unlock(&=
qedi_conn->list_lock);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1500  =

ace7f46ba5fde7 Manish Rangankar            2016-12-01  1501  	qedi_ring_doo=
rbell(qedi_conn);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1502  	return 0;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1503  }
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1504  =


:::::: The code at line 1460 was first introduced by commit
:::::: be086e7c53f1fac51eed14523b28f2214b548dd2 qed*: Utilize Firmware 8.15=
.3.0

:::::: TO: Mintz, Yuval <Yuval.Mintz@cavium.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2602880020196053295==--

