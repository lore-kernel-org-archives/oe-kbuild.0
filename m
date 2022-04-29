Content-Type: multipart/mixed; boundary="===============2244413585267984604=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bvanassche:ufs-for-next 5/6] drivers/ufs/core/ufshpb.c:1538 ufshpb_init_subregion_tbl() error: potentially dereferencing uninitialized 'srgn'.
Date: Fri, 29 Apr 2022 19:04:26 +0800
Message-ID: <202204291937.TmnRM37F-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2244413585267984604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>

Hi Bart,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/bvanassche/linux ufs-for-next
head:   d34bcd2acd8e932a32bf1aac6296ee8ea8d230d3
commit: c7ae521dbba0e69015cf50f474d58778326931d3 [5/6] scsi: ufs: Split the=
 drivers/scsi/ufs directory
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: nios2-randconfig-m031-20220428 (https://download.01.org/0day-ci/arc=
hive/20220429/202204291937.TmnRM37F-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/ufs/core/ufshpb.c:1538 ufshpb_init_subregion_tbl() error: potential=
ly dereferencing uninitialized 'srgn'.

vim +/srgn +1538 drivers/ufs/core/ufshpb.c

4b5f49079c52a7e drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1522  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1523  sta=
tic void ufshpb_init_subregion_tbl(struct ufshpb_lu *hpb,
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1524  			=
	      struct ufshpb_region *rgn, bool last)
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1525  {
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1526  	in=
t srgn_idx;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1527  	st=
ruct ufshpb_subregion *srgn;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1528  =

4b5f49079c52a7e drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1529  	fo=
r_each_sub_region(rgn, srgn_idx, srgn) {
4b5f49079c52a7e drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1530  		I=
NIT_LIST_HEAD(&srgn->list_act_srgn);
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1531  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1532  		s=
rgn->rgn_idx =3D rgn->rgn_idx;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1533  		s=
rgn->srgn_idx =3D srgn_idx;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1534  		s=
rgn->srgn_state =3D HPB_SRGN_UNUSED;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1535  	}
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1536  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1537  	if=
 (unlikely(last && hpb->last_srgn_entries))
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12 @1538  		s=
rgn->is_last =3D true;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1539  }
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1540  =


:::::: The code at line 1538 was first introduced by commit
:::::: f02bc9754a6887bf5e286889265d24ce5e3b1952 scsi: ufs: ufshpb: Introduc=
e Host Performance Buffer feature

:::::: TO: Daejun Park <daejun7.park@samsung.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2244413585267984604==--

