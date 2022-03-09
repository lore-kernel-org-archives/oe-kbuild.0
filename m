Content-Type: multipart/mixed; boundary="===============6356276904870833594=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10 2248/9999] drivers/scsi/ufs/ufshpb.c:54:17: warning: Access to field 'is_last' results in a dereference of an undefined pointer value (loaded from variable 'srgn') [clang-analyzer-core.NullDereference]
Date: Wed, 09 Mar 2022 19:46:01 +0800
Message-ID: <202203091914.qg1ZyehS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6356276904870833594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Daejun Park <daejun7.park@samsung.com>
CC: Todd Kjos <tkjos@google.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Bart Van Assche <bvanassche@acm.org>
CC: Can Guo <cang@codeaurora.org>
CC: Bean Huo <beanhuo@micron.com>
CC: Stanley Chu <stanley.chu@mediatek.com>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android13-5.10
head:   5da5b1871950c71755fa5a0b88c78e2f2623da24
commit: 791e1c6968f60f8d46d63279dc7c285de47fe44c [2248/9999] FROMLIST: scsi=
: ufs: Introduce HPB feature
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-c007-20220307 (https://download.01.org/0day-ci/ar=
chive/20220309/202203091914.qg1ZyehS-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/791e1c6968f60f8=
d46d63279dc7c285de47fe44c
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android13-5.10
        git checkout 791e1c6968f60f8d46d63279dc7c285de47fe44c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/video/fbdev/matrox/g450_pll.c:363:10: warning: Value stored to '=
tmp' is never read [clang-analyzer-deadcode.DeadStores]
                                   else tmp =3D
                                        ^
   drivers/video/fbdev/matrox/g450_pll.c:363:10: note: Value stored to 'tmp=
' is never read
   drivers/video/fbdev/matrox/g450_pll.c:420:5: warning: Value stored to 'm=
np' is never read [clang-analyzer-deadcode.DeadStores]
                                   mnp |=3D matroxfb_DAC_in(minfo, M1064_XP=
IXPLLCN) << 8;
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/video/fbdev/matrox/g450_pll.c:420:5: note: Value stored to 'mnp'=
 is never read
                                   mnp |=3D matroxfb_DAC_in(minfo, M1064_XP=
IXPLLCN) << 8;
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/scsi/snic/vnic_dev.c:151:4: warning: Value stored to 'len' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           len =3D count;
                           ^     ~~~~~
   drivers/scsi/snic/vnic_dev.c:151:4: note: Value stored to 'len' is never=
 read
                           len =3D count;
                           ^     ~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/scsi/ufs/ufshpb.c:54:17: warning: Access to field 'is_last' resu=
lts in a dereference of an undefined pointer value (loaded from variable 's=
rgn') [clang-analyzer-core.NullDereference]
                   srgn->is_last =3D true;
                                 ^
   drivers/scsi/ufs/ufshpb.c:476:6: note: Assuming 'lun' is < field 'max_lu=
_supported'
           if (lun >=3D hba->dev_info.max_lu_supported)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:476:2: note: Taking false branch
           if (lun >=3D hba->dev_info.max_lu_supported)
           ^
   drivers/scsi/ufs/ufshpb.c:480:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/scsi/ufs/ufshpb.c:480:2: note: Taking false branch
           if (ret)
           ^
   drivers/scsi/ufs/ufshpb.c:483:8: note: Calling 'ufshpb_alloc_hpb_lu'
           hpb =3D ufshpb_alloc_hpb_lu(hba, lun, &hba->ufshpb_dev,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:258:6: note: Assuming 'hpb' is non-null
           if (!hpb)
               ^~~~
   drivers/scsi/ufs/ufshpb.c:258:2: note: Taking false branch
           if (!hpb)
           ^
   drivers/scsi/ufs/ufshpb.c:265:8: note: Calling 'ufshpb_lu_hpb_init'
           ret =3D ufshpb_lu_hpb_init(hba, hpb);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:242:8: note: Calling 'ufshpb_alloc_region_tbl'
           ret =3D ufshpb_alloc_region_tbl(hba, hpb);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:120:6: note: Assuming 'rgn_table' is non-null
           if (!rgn_table)
               ^~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:120:2: note: Taking false branch
           if (!rgn_table)
           ^
   drivers/scsi/ufs/ufshpb.c:125:20: note: Assuming 'rgn_idx' is < field 'r=
gns_per_lu'
           for (rgn_idx =3D 0; rgn_idx < hpb->rgns_per_lu; rgn_idx++) {
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:125:2: note: Loop condition is true.  Entering=
 loop body
           for (rgn_idx =3D 0; rgn_idx < hpb->rgns_per_lu; rgn_idx++) {
           ^
   drivers/scsi/ufs/ufshpb.c:132:7: note: Assuming the condition is true
                   if (rgn_idx =3D=3D hpb->rgns_per_lu - 1) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:132:3: note: Taking true branch
                   if (rgn_idx =3D=3D hpb->rgns_per_lu - 1) {
                   ^
   drivers/scsi/ufs/ufshpb.c:139:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/scsi/ufs/ufshpb.c:139:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/scsi/ufs/ufshpb.c:141:3: note: Calling 'ufshpb_init_subregion_tb=
l'
                   ufshpb_init_subregion_tbl(hpb, rgn, last_srgn);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:43:2: note: 'srgn' declared without an initial=
 value
           struct ufshpb_subregion *srgn;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:45:21: note: Assuming 'srgn_idx' is >=3D field=
 'srgn_cnt'
           for (srgn_idx =3D 0; srgn_idx < rgn->srgn_cnt; srgn_idx++) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:45:2: note: Loop condition is false. Execution=
 continues on line 53
           for (srgn_idx =3D 0; srgn_idx < rgn->srgn_cnt; srgn_idx++) {
           ^
   drivers/scsi/ufs/ufshpb.c:53:15: note: 'last' is true
           if (unlikely(last && hpb->last_srgn_entries))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/scsi/ufs/ufshpb.c:53:15: note: Left side of '&&' is true
           if (unlikely(last && hpb->last_srgn_entries))
                        ^
   drivers/scsi/ufs/ufshpb.c:53:6: note: Assuming the condition is false
           if (unlikely(last && hpb->last_srgn_entries))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/scsi/ufs/ufshpb.c:53:2: note: Taking true branch
           if (unlikely(last && hpb->last_srgn_entries))
           ^
   drivers/scsi/ufs/ufshpb.c:54:17: note: Access to field 'is_last' results=
 in a dereference of an undefined pointer value (loaded from variable 'srgn=
')
                   srgn->is_last =3D true;
                   ~~~~          ^
   drivers/scsi/ufs/ufshpb.c:242:2: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
           ret =3D ufshpb_alloc_region_tbl(hba, hpb);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:242:2: note: Value stored to 'ret' is never re=
ad
           ret =3D ufshpb_alloc_region_tbl(hba, hpb);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +54 drivers/scsi/ufs/ufshpb.c

791e1c6968f60f Daejun Park 2021-06-16  38  =

791e1c6968f60f Daejun Park 2021-06-16  39  static void ufshpb_init_subregio=
n_tbl(struct ufshpb_lu *hpb,
791e1c6968f60f Daejun Park 2021-06-16  40  				      struct ufshpb_region *=
rgn, bool last)
791e1c6968f60f Daejun Park 2021-06-16  41  {
791e1c6968f60f Daejun Park 2021-06-16  42  	int srgn_idx;
791e1c6968f60f Daejun Park 2021-06-16  43  	struct ufshpb_subregion *srgn;
791e1c6968f60f Daejun Park 2021-06-16  44  =

791e1c6968f60f Daejun Park 2021-06-16  45  	for (srgn_idx =3D 0; srgn_idx <=
 rgn->srgn_cnt; srgn_idx++) {
791e1c6968f60f Daejun Park 2021-06-16  46  		srgn =3D rgn->srgn_tbl + srgn_=
idx;
791e1c6968f60f Daejun Park 2021-06-16  47  =

791e1c6968f60f Daejun Park 2021-06-16  48  		srgn->rgn_idx =3D rgn->rgn_idx;
791e1c6968f60f Daejun Park 2021-06-16  49  		srgn->srgn_idx =3D srgn_idx;
791e1c6968f60f Daejun Park 2021-06-16  50  		srgn->srgn_state =3D HPB_SRGN_=
UNUSED;
791e1c6968f60f Daejun Park 2021-06-16  51  	}
791e1c6968f60f Daejun Park 2021-06-16  52  =

791e1c6968f60f Daejun Park 2021-06-16  53  	if (unlikely(last && hpb->last_=
srgn_entries))
791e1c6968f60f Daejun Park 2021-06-16 @54  		srgn->is_last =3D true;
791e1c6968f60f Daejun Park 2021-06-16  55  }
791e1c6968f60f Daejun Park 2021-06-16  56  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6356276904870833594==--

