Content-Type: multipart/mixed; boundary="===============8564140622313242199=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/ufs/ufshpb.c:54:17: warning: Access to field 'is_last' results in a dereference of an undefined pointer value (loaded from variable 'srgn') [clang-analyzer-core.NullDereference]
Date: Sun, 23 Jan 2022 06:33:35 +0800
Message-ID: <202201230608.GaekbR7k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8564140622313242199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
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
head:   1c52283265a462a100ae63ddf58b4e5884acde86
commit: f02bc9754a6887bf5e286889265d24ce5e3b1952 scsi: ufs: ufshpb: Introdu=
ce Host Performance Buffer feature
date:   6 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20220122 (https://download.01.org/0day-ci/arc=
hive/20220123/202201230608.GaekbR7k-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df02bc9754a6887bf5e286889265d24ce5e3b1952
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f02bc9754a6887bf5e286889265d24ce5e3b1952
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/scsi/scsi_debug.c:4969:2: note: Loop condition is false. Executi=
on continues on line 4979
           list_for_each_entry(devip, &sdbg_host->dev_info_list, dev_list) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/scsi/scsi_debug.c:4979:7: note: 'open_devip' is null
           if (!open_devip) { /* try and make a new one */
                ^~~~~~~~~~
   drivers/scsi/scsi_debug.c:4979:2: note: Taking true branch
           if (!open_devip) { /* try and make a new one */
           ^
   drivers/scsi/scsi_debug.c:4980:16: note: Calling 'sdebug_device_create'
                   open_devip =3D sdebug_device_create(sdbg_host, GFP_ATOMI=
C);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_debug.c:4927:6: note: Assuming 'devip' is non-null
           if (devip) {
               ^~~~~
   drivers/scsi/scsi_debug.c:4927:2: note: Taking true branch
           if (devip) {
           ^
   drivers/scsi/scsi_debug.c:4928:7: note: Assuming 'sdebug_uuid_ctl' is no=
t equal to 1
                   if (sdebug_uuid_ctl =3D=3D 1)
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_debug.c:4928:3: note: Taking false branch
                   if (sdebug_uuid_ctl =3D=3D 1)
                   ^
   drivers/scsi/scsi_debug.c:4930:12: note: Assuming 'sdebug_uuid_ctl' is n=
ot equal to 2
                   else if (sdebug_uuid_ctl =3D=3D 2) {
                            ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_debug.c:4930:8: note: Taking false branch
                   else if (sdebug_uuid_ctl =3D=3D 2) {
                        ^
   drivers/scsi/scsi_debug.c:4940:7: note: Assuming 'sdeb_zbc_in_use' is tr=
ue
                   if (sdeb_zbc_in_use) {
                       ^~~~~~~~~~~~~~~
   drivers/scsi/scsi_debug.c:4940:3: note: Taking true branch
                   if (sdeb_zbc_in_use) {
                   ^
   drivers/scsi/scsi_debug.c:4942:8: note: Calling 'sdebug_device_create_zo=
nes'
                           if (sdebug_device_create_zones(devip)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_debug.c:4848:6: note: Assuming 'sdeb_zbc_zone_size_mb'=
 is 0
           if (!sdeb_zbc_zone_size_mb) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_debug.c:4848:2: note: Taking true branch
           if (!sdeb_zbc_zone_size_mb) {
           ^
   drivers/scsi/scsi_debug.c:4850:7: note: '?' condition is false
                           >> ilog2(sdebug_sector_size);
                              ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/scsi/scsi_debug.c:4850:7: note: '?' condition is true
                           >> ilog2(sdebug_sector_size);
                              ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/scsi/scsi_debug.c:4850:7: note: Calling '__ilog2_u32'
                           >> ilog2(sdebug_sector_size);
                              ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_debug.c:4850:7: note: Returning from '__ilog2_u32'
                           >> ilog2(sdebug_sector_size);
                              ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   drivers/scsi/scsi_debug.c:4850:4: note: The result of the right shift is=
 undefined because the right operand is negative
                           >> ilog2(sdebug_sector_size);
                           ^
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/scsi/ufs/ufshpb.c:54:17: warning: Access to field 'is_last' resu=
lts in a dereference of an undefined pointer value (loaded from variable 's=
rgn') [clang-analyzer-core.NullDereference]
                   srgn->is_last =3D true;
                                 ^
   drivers/scsi/ufs/ufshpb.c:475:6: note: Assuming 'lun' is < field 'max_lu=
_supported'
           if (lun >=3D hba->dev_info.max_lu_supported)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:475:2: note: Taking false branch
           if (lun >=3D hba->dev_info.max_lu_supported)
           ^
   drivers/scsi/ufs/ufshpb.c:479:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/scsi/ufs/ufshpb.c:479:2: note: Taking false branch
           if (ret)
           ^
   drivers/scsi/ufs/ufshpb.c:482:8: note: Calling 'ufshpb_alloc_hpb_lu'
           hpb =3D ufshpb_alloc_hpb_lu(hba, lun, &hba->ufshpb_dev,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:257:6: note: Assuming 'hpb' is non-null
           if (!hpb)
               ^~~~
   drivers/scsi/ufs/ufshpb.c:257:2: note: Taking false branch
           if (!hpb)
           ^
   drivers/scsi/ufs/ufshpb.c:264:8: note: Calling 'ufshpb_lu_hpb_init'
           ret =3D ufshpb_lu_hpb_init(hba, hpb);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:241:8: note: Calling 'ufshpb_alloc_region_tbl'
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
>> drivers/scsi/ufs/ufshpb.c:104:22: warning: Division by zero [clang-analy=
zer-core.DivideZero]
           hpb->srgns_per_lu =3D DIV_ROUND_UP(hpb_lu_info->num_blocks,
                               ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                        ^
   drivers/scsi/ufs/ufshpb.c:475:6: note: Assuming 'lun' is < field 'max_lu=
_supported'
           if (lun >=3D hba->dev_info.max_lu_supported)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:475:2: note: Taking false branch
           if (lun >=3D hba->dev_info.max_lu_supported)
           ^
   drivers/scsi/ufs/ufshpb.c:479:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/scsi/ufs/ufshpb.c:479:2: note: Taking false branch
           if (ret)
           ^
   drivers/scsi/ufs/ufshpb.c:482:8: note: Calling 'ufshpb_alloc_hpb_lu'
           hpb =3D ufshpb_alloc_hpb_lu(hba, lun, &hba->ufshpb_dev,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:257:6: note: Assuming 'hpb' is non-null
           if (!hpb)
               ^~~~
   drivers/scsi/ufs/ufshpb.c:257:2: note: Taking false branch
           if (!hpb)
           ^
   drivers/scsi/ufs/ufshpb.c:262:2: note: Calling 'ufshpb_lu_parameter_init'
           ufshpb_lu_parameter_init(hba, hpb, hpb_dev_info, hpb_lu_info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:78:23: note: Assuming field 'num_pinned' is 0
           hpb->lu_pinned_end =3D hpb_lu_info->num_pinned ?
                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:78:23: note: '?' condition is false
   drivers/scsi/ufs/ufshpb.c:91:31: note: '?' condition is false
           hpb->entries_per_rgn_shift =3D ilog2(entries_per_rgn);
                                        ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/scsi/ufs/ufshpb.c:91:31: note: '?' condition is true
           hpb->entries_per_rgn_shift =3D ilog2(entries_per_rgn);
                                        ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/scsi/ufs/ufshpb.c:95:32: note: '?' condition is false
           hpb->entries_per_srgn_shift =3D ilog2(hpb->entries_per_srgn);
                                         ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/scsi/ufs/ufshpb.c:95:32: note: '?' condition is true
           hpb->entries_per_srgn_shift =3D ilog2(hpb->entries_per_srgn);
                                         ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/scsi/ufs/ufshpb.c:104:22: note: Division by zero
           hpb->srgns_per_lu =3D DIV_ROUND_UP(hpb_lu_info->num_blocks,
                               ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/scsi/ufs/ufshpb.c:241:2: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
           ret =3D ufshpb_alloc_region_tbl(hba, hpb);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:241:2: note: Value stored to 'ret' is never re=
ad
           ret =3D ufshpb_alloc_region_tbl(hba, hpb);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (3 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/md/dm-cache-metadata.c:341:3: warning: Value stored to 'bdev_siz=
e' is never read [clang-analyzer-deadcode.DeadStores]
                   bdev_size =3D DM_CACHE_METADATA_MAX_SECTORS;
                   ^
   drivers/md/dm-cache-metadata.c:341:3: note: Value stored to 'bdev_size' =
is never read
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.

vim +54 drivers/scsi/ufs/ufshpb.c

f02bc9754a6887 Daejun Park 2021-07-12   38  =

f02bc9754a6887 Daejun Park 2021-07-12   39  static void ufshpb_init_subregi=
on_tbl(struct ufshpb_lu *hpb,
f02bc9754a6887 Daejun Park 2021-07-12   40  				      struct ufshpb_region =
*rgn, bool last)
f02bc9754a6887 Daejun Park 2021-07-12   41  {
f02bc9754a6887 Daejun Park 2021-07-12   42  	int srgn_idx;
f02bc9754a6887 Daejun Park 2021-07-12   43  	struct ufshpb_subregion *srgn;
f02bc9754a6887 Daejun Park 2021-07-12   44  =

f02bc9754a6887 Daejun Park 2021-07-12   45  	for (srgn_idx =3D 0; srgn_idx =
< rgn->srgn_cnt; srgn_idx++) {
f02bc9754a6887 Daejun Park 2021-07-12   46  		srgn =3D rgn->srgn_tbl + srgn=
_idx;
f02bc9754a6887 Daejun Park 2021-07-12   47  =

f02bc9754a6887 Daejun Park 2021-07-12   48  		srgn->rgn_idx =3D rgn->rgn_id=
x;
f02bc9754a6887 Daejun Park 2021-07-12   49  		srgn->srgn_idx =3D srgn_idx;
f02bc9754a6887 Daejun Park 2021-07-12   50  		srgn->srgn_state =3D HPB_SRGN=
_UNUSED;
f02bc9754a6887 Daejun Park 2021-07-12   51  	}
f02bc9754a6887 Daejun Park 2021-07-12   52  =

f02bc9754a6887 Daejun Park 2021-07-12   53  	if (unlikely(last && hpb->last=
_srgn_entries))
f02bc9754a6887 Daejun Park 2021-07-12  @54  		srgn->is_last =3D true;
f02bc9754a6887 Daejun Park 2021-07-12   55  }
f02bc9754a6887 Daejun Park 2021-07-12   56  =

f02bc9754a6887 Daejun Park 2021-07-12   57  static int ufshpb_alloc_subregi=
on_tbl(struct ufshpb_lu *hpb,
f02bc9754a6887 Daejun Park 2021-07-12   58  				      struct ufshpb_region =
*rgn, int srgn_cnt)
f02bc9754a6887 Daejun Park 2021-07-12   59  {
f02bc9754a6887 Daejun Park 2021-07-12   60  	rgn->srgn_tbl =3D kvcalloc(srg=
n_cnt, sizeof(struct ufshpb_subregion),
f02bc9754a6887 Daejun Park 2021-07-12   61  				 GFP_KERNEL);
f02bc9754a6887 Daejun Park 2021-07-12   62  	if (!rgn->srgn_tbl)
f02bc9754a6887 Daejun Park 2021-07-12   63  		return -ENOMEM;
f02bc9754a6887 Daejun Park 2021-07-12   64  =

f02bc9754a6887 Daejun Park 2021-07-12   65  	rgn->srgn_cnt =3D srgn_cnt;
f02bc9754a6887 Daejun Park 2021-07-12   66  	return 0;
f02bc9754a6887 Daejun Park 2021-07-12   67  }
f02bc9754a6887 Daejun Park 2021-07-12   68  =

f02bc9754a6887 Daejun Park 2021-07-12   69  static void ufshpb_lu_parameter=
_init(struct ufs_hba *hba,
f02bc9754a6887 Daejun Park 2021-07-12   70  				     struct ufshpb_lu *hpb,
f02bc9754a6887 Daejun Park 2021-07-12   71  				     struct ufshpb_dev_info=
 *hpb_dev_info,
f02bc9754a6887 Daejun Park 2021-07-12   72  				     struct ufshpb_lu_info =
*hpb_lu_info)
f02bc9754a6887 Daejun Park 2021-07-12   73  {
f02bc9754a6887 Daejun Park 2021-07-12   74  	u32 entries_per_rgn;
f02bc9754a6887 Daejun Park 2021-07-12   75  	u64 rgn_mem_size, tmp;
f02bc9754a6887 Daejun Park 2021-07-12   76  =

f02bc9754a6887 Daejun Park 2021-07-12   77  	hpb->lu_pinned_start =3D hpb_l=
u_info->pinned_start;
f02bc9754a6887 Daejun Park 2021-07-12   78  	hpb->lu_pinned_end =3D hpb_lu_=
info->num_pinned ?
f02bc9754a6887 Daejun Park 2021-07-12   79  		(hpb_lu_info->pinned_start + =
hpb_lu_info->num_pinned - 1)
f02bc9754a6887 Daejun Park 2021-07-12   80  		: PINNED_NOT_SET;
f02bc9754a6887 Daejun Park 2021-07-12   81  =

f02bc9754a6887 Daejun Park 2021-07-12   82  	rgn_mem_size =3D (1ULL << hpb_=
dev_info->rgn_size) * HPB_RGN_SIZE_UNIT
f02bc9754a6887 Daejun Park 2021-07-12   83  			* HPB_ENTRY_SIZE;
f02bc9754a6887 Daejun Park 2021-07-12   84  	do_div(rgn_mem_size, HPB_ENTRY=
_BLOCK_SIZE);
f02bc9754a6887 Daejun Park 2021-07-12   85  	hpb->srgn_mem_size =3D (1ULL <=
< hpb_dev_info->srgn_size)
f02bc9754a6887 Daejun Park 2021-07-12   86  		* HPB_RGN_SIZE_UNIT / HPB_ENT=
RY_BLOCK_SIZE * HPB_ENTRY_SIZE;
f02bc9754a6887 Daejun Park 2021-07-12   87  =

f02bc9754a6887 Daejun Park 2021-07-12   88  	tmp =3D rgn_mem_size;
f02bc9754a6887 Daejun Park 2021-07-12   89  	do_div(tmp, HPB_ENTRY_SIZE);
f02bc9754a6887 Daejun Park 2021-07-12   90  	entries_per_rgn =3D (u32)tmp;
f02bc9754a6887 Daejun Park 2021-07-12   91  	hpb->entries_per_rgn_shift =3D=
 ilog2(entries_per_rgn);
f02bc9754a6887 Daejun Park 2021-07-12   92  	hpb->entries_per_rgn_mask =3D =
entries_per_rgn - 1;
f02bc9754a6887 Daejun Park 2021-07-12   93  =

f02bc9754a6887 Daejun Park 2021-07-12   94  	hpb->entries_per_srgn =3D hpb-=
>srgn_mem_size / HPB_ENTRY_SIZE;
f02bc9754a6887 Daejun Park 2021-07-12   95  	hpb->entries_per_srgn_shift =
=3D ilog2(hpb->entries_per_srgn);
f02bc9754a6887 Daejun Park 2021-07-12   96  	hpb->entries_per_srgn_mask =3D=
 hpb->entries_per_srgn - 1;
f02bc9754a6887 Daejun Park 2021-07-12   97  =

f02bc9754a6887 Daejun Park 2021-07-12   98  	tmp =3D rgn_mem_size;
f02bc9754a6887 Daejun Park 2021-07-12   99  	do_div(tmp, hpb->srgn_mem_size=
);
f02bc9754a6887 Daejun Park 2021-07-12  100  	hpb->srgns_per_rgn =3D (int)tm=
p;
f02bc9754a6887 Daejun Park 2021-07-12  101  =

f02bc9754a6887 Daejun Park 2021-07-12  102  	hpb->rgns_per_lu =3D DIV_ROUND=
_UP(hpb_lu_info->num_blocks,
f02bc9754a6887 Daejun Park 2021-07-12  103  				entries_per_rgn);
f02bc9754a6887 Daejun Park 2021-07-12 @104  	hpb->srgns_per_lu =3D DIV_ROUN=
D_UP(hpb_lu_info->num_blocks,
f02bc9754a6887 Daejun Park 2021-07-12  105  				(hpb->srgn_mem_size / HPB_E=
NTRY_SIZE));
f02bc9754a6887 Daejun Park 2021-07-12  106  	hpb->last_srgn_entries =3D hpb=
_lu_info->num_blocks
f02bc9754a6887 Daejun Park 2021-07-12  107  				 % (hpb->srgn_mem_size / HP=
B_ENTRY_SIZE);
f02bc9754a6887 Daejun Park 2021-07-12  108  =

f02bc9754a6887 Daejun Park 2021-07-12  109  	hpb->pages_per_srgn =3D DIV_RO=
UND_UP(hpb->srgn_mem_size, PAGE_SIZE);
f02bc9754a6887 Daejun Park 2021-07-12  110  }
f02bc9754a6887 Daejun Park 2021-07-12  111  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8564140622313242199==--

