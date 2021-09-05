Content-Type: multipart/mixed; boundary="===============1549542759517373624=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/ufs/ufshpb.c:54:17: warning: Access to field 'is_last' results in a dereference of an undefined pointer value (loaded from variable 'srgn') [clang-analyzer-core.NullDereference]
Date: Sun, 05 Sep 2021 17:20:37 +0800
Message-ID: <202109051730.kjVU19WT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1549542759517373624==
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
head:   49624efa65ac9889f4e7c7b2452b2e6ce42ba37d
commit: f02bc9754a6887bf5e286889265d24ce5e3b1952 scsi: ufs: ufshpb: Introdu=
ce Host Performance Buffer feature
date:   5 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20210904 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 1104e3=
258b5064e7110cc297e2cec60ac9acfc0a)
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
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mtd/chips/cfi_cmdset_0001.c:1741:2: note: Loop condition is fals=
e.  Exiting loop
           ENABLE_VPP(map);
           ^
   include/linux/mtd/map.h:253:25: note: expanded from macro 'ENABLE_VPP'
   #define ENABLE_VPP(map) do { if (map->set_vpp) map->set_vpp(map, 1); } w=
hile (0)
                           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1748:6: note: Assuming field 'state'=
 is equal to FL_STATUS
           if (chip->state !=3D FL_STATUS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1748:2: note: Taking false branch
           if (chip->state !=3D FL_STATUS) {
           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1753:6: note: Loop condition is true=
.  Entering loop body
           if (map_word_bitsset(map, status, CMD(0x30))) {
               ^
   include/linux/mtd/map.h:312:2: note: expanded from macro 'map_word_bitss=
et'
           for (i =3D 0; i < map_words(map); i++) {                        =
  \
           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1753:6: note: Assuming the condition=
 is false
           if (map_word_bitsset(map, status, CMD(0x30))) {
               ^
   include/linux/mtd/map.h:313:7: note: expanded from macro 'map_word_bitss=
et'
                   if ((val1).x[i] & (val2).x[i]) {                        \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1753:6: note: Taking false branch
           if (map_word_bitsset(map, status, CMD(0x30))) {
               ^
   include/linux/mtd/map.h:313:3: note: expanded from macro 'map_word_bitss=
et'
                   if ((val1).x[i] & (val2).x[i]) {                        \
                   ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1753:6: note: Loop condition is fals=
e. Execution continues on line 1753
           if (map_word_bitsset(map, status, CMD(0x30))) {
               ^
   include/linux/mtd/map.h:312:2: note: expanded from macro 'map_word_bitss=
et'
           for (i =3D 0; i < map_words(map); i++) {                        =
  \
           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1753:2: note: Taking false branch
           if (map_word_bitsset(map, status, CMD(0x30))) {
           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1764:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1764:2: note: Taking false branch
           if (ret) {
           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1781:6: note: Assuming 'word_gap' is=
 not equal to 0
           if (!word_gap) {
               ^~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1781:2: note: Taking false branch
           if (!word_gap) {
           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1797:7: note: Assuming the condition=
 is false
                   if (n > vec->iov_len - vec_seek)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1797:3: note: Taking false branch
                   if (n > vec->iov_len - vec_seek)
                   ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1799:7: note: Assuming 'n' is <=3D '=
len'
                   if (n > len)
                       ^~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1799:3: note: Taking false branch
                   if (n > len)
                   ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1802:7: note: Assuming 'word_gap' is=
 not equal to 0
                   if (!word_gap && len < map_bankwidth(map))
                       ^~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1802:17: note: Left side of '&&' is =
false
                   if (!word_gap && len < map_bankwidth(map))
                                 ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1811:7: note: Assuming 'len' is not =
equal to 0
                   if (!len || word_gap =3D=3D map_bankwidth(map)) {
                       ^~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1811:7: note: Left side of '||' is f=
alse
   drivers/mtd/chips/cfi_cmdset_0001.c:1811:15: note: Assuming 'word_gap' i=
s not equal to field 'bankwidth'
                   if (!len || word_gap =3D=3D map_bankwidth(map)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1811:3: note: Taking false branch
                   if (!len || word_gap =3D=3D map_bankwidth(map)) {
                   ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1818:7: note: Assuming 'vec_seek' is=
 equal to field 'iov_len'
                   if (vec_seek =3D=3D vec->iov_len) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1818:3: note: Taking true branch
                   if (vec_seek =3D=3D vec->iov_len) {
                   ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1795:2: note: Loop condition is true=
. Execution continues on line 1796
           do {
           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1797:24: note: The left operand of '=
-' is a garbage value
                   if (n > vec->iov_len - vec_seek)
                           ~~~~~~~~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
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
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/scsi/ufs/ufshpb.c:78:23: note: Assuming field 'num_pinned' is 0
           hpb->lu_pinned_end =3D hpb_lu_info->num_pinned ?
                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/ufs/ufshpb.c:78:23: note: '?' condition is false
   drivers/scsi/ufs/ufshpb.c:84:2: note: Left side of '&&' is false
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:229:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/scsi/ufs/ufshpb.c:84:2: note: 4 is >=3D 4
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:68:32: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                  ^~~~~~~~
   note: expanded from here
   drivers/scsi/ufs/ufshpb.c:84:2: note: Left side of '&&' is true
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^
   include/asm-generic/div64.h:68:31: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                 ^
   drivers/scsi/ufs/ufshpb.c:84:2: note: Left side of '&&' is false
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:234:35: note: expanded from macro 'do_div'
                      __builtin_constant_p(__base) &&      \
                                                   ^
   drivers/scsi/ufs/ufshpb.c:84:2: note: Assuming the condition is false
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:241:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/scsi/ufs/ufshpb.c:84:2: note: Taking false branch
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:241:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/scsi/ufs/ufshpb.c:89:2: note: Left side of '&&' is false
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:229:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/scsi/ufs/ufshpb.c:89:2: note: 4 is >=3D 4
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:68:32: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                  ^~~~~~~~
   note: expanded from here
   drivers/scsi/ufs/ufshpb.c:89:2: note: Left side of '&&' is true
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^
   include/asm-generic/div64.h:68:31: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                 ^
   drivers/scsi/ufs/ufshpb.c:89:2: note: Left side of '&&' is false
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:234:35: note: expanded from macro 'do_div'
                      __builtin_constant_p(__base) &&      \
                                                   ^
   drivers/scsi/ufs/ufshpb.c:89:2: note: Assuming the condition is false
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:241:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/scsi/ufs/ufshpb.c:89:2: note: Taking false branch
           do_div(tmp, HPB_ENTRY_SIZE);

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

f02bc9754a6887 Daejun Park 2021-07-12  @53  	if (unlikely(last && hpb->last=
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

--===============1549542759517373624==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1549542759517373624==--

