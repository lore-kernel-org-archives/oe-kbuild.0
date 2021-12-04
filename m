Content-Type: multipart/mixed; boundary="===============7584658522798853236=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/ufs/ufshpb.c:54 ufshpb_init_subregion_tbl() error: potentially dereferencing uninitialized 'srgn'.
Date: Sun, 05 Dec 2021 07:28:54 +0800
Message-ID: <202112050712.4Q6KkUEZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7584658522798853236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Daejun Park <daejun7.park@samsung.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Bart Van Assche <bvanassche@acm.org>
CC: Can Guo <cang@codeaurora.org>
CC: Bean Huo <beanhuo@micron.com>
CC: Stanley Chu <stanley.chu@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23b55d673d7527b093cd97b7c217c82e70cd1af0
commit: f02bc9754a6887bf5e286889265d24ce5e3b1952 scsi: ufs: ufshpb: Introdu=
ce Host Performance Buffer feature
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: nios2-randconfig-m031-20211202 (https://download.01.org/0day-ci/arc=
hive/20211205/202112050712.4Q6KkUEZ-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/scsi/ufs/ufshpb.c:54 ufshpb_init_subregion_tbl() error: potentially=
 dereferencing uninitialized 'srgn'.

vim +/srgn +54 drivers/scsi/ufs/ufshpb.c

f02bc9754a6887 Daejun Park 2021-07-12  38  =

f02bc9754a6887 Daejun Park 2021-07-12  39  static void ufshpb_init_subregio=
n_tbl(struct ufshpb_lu *hpb,
f02bc9754a6887 Daejun Park 2021-07-12  40  				      struct ufshpb_region *=
rgn, bool last)
f02bc9754a6887 Daejun Park 2021-07-12  41  {
f02bc9754a6887 Daejun Park 2021-07-12  42  	int srgn_idx;
f02bc9754a6887 Daejun Park 2021-07-12  43  	struct ufshpb_subregion *srgn;
f02bc9754a6887 Daejun Park 2021-07-12  44  =

f02bc9754a6887 Daejun Park 2021-07-12  45  	for (srgn_idx =3D 0; srgn_idx <=
 rgn->srgn_cnt; srgn_idx++) {
f02bc9754a6887 Daejun Park 2021-07-12  46  		srgn =3D rgn->srgn_tbl + srgn_=
idx;
f02bc9754a6887 Daejun Park 2021-07-12  47  =

f02bc9754a6887 Daejun Park 2021-07-12  48  		srgn->rgn_idx =3D rgn->rgn_idx;
f02bc9754a6887 Daejun Park 2021-07-12  49  		srgn->srgn_idx =3D srgn_idx;
f02bc9754a6887 Daejun Park 2021-07-12  50  		srgn->srgn_state =3D HPB_SRGN_=
UNUSED;
f02bc9754a6887 Daejun Park 2021-07-12  51  	}
f02bc9754a6887 Daejun Park 2021-07-12  52  =

f02bc9754a6887 Daejun Park 2021-07-12  53  	if (unlikely(last && hpb->last_=
srgn_entries))
f02bc9754a6887 Daejun Park 2021-07-12 @54  		srgn->is_last =3D true;
f02bc9754a6887 Daejun Park 2021-07-12  55  }
f02bc9754a6887 Daejun Park 2021-07-12  56  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7584658522798853236==--

