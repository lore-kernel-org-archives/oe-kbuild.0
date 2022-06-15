Content-Type: multipart/mixed; boundary="===============6970980761127271703=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ufs/core/ufshpb.c:1583:17: warning: Access to field 'is_last' results in a dereference of an undefined pointer value (loaded from variable 'srgn') [clang-analyzer-core.NullDereference]
Date: Wed, 15 Jun 2022 09:14:35 +0800
Message-ID: <202206150914.wHwkCAx4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6970980761127271703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/u=
fs/core/ufshpb.c:1583:17: warning: Access to field 'is_last' results in a d=
ereference of an undefined pointer value (loaded from variable 'srgn') [cla=
ng-analyzer-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Bean Huo <beanhuo@micron.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   018ab4fabddd94f1c96f3b59e180691b9e88d5d8
commit: dd11376b9f1b73aca3f8c6eb541486bbb6996f05 scsi: ufs: Split the drive=
rs/scsi/ufs directory
date:   4 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220613 (https://download.01.org/0day-ci/archi=
ve/20220615/202206150914.wHwkCAx4-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d37826=
8ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddd11376b9f1b73aca3f8c6eb541486bbb6996f05
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dd11376b9f1b73aca3f8c6eb541486bbb6996f05
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/of.h:265:2: note: expanded from macro 'for_each_of_allnode=
s_from'
           for (dn =3D __of_find_all_nodes(from); dn; dn =3D __of_find_all_=
nodes(dn))
           ^
   drivers/of/unittest.c:3131:6: note: 'of_symbols' is non-null
           if (of_symbols) {
               ^~~~~~~~~~
   drivers/of/unittest.c:3131:2: note: Taking true branch
           if (of_symbols) {
           ^
   drivers/of/unittest.c:3133:29: note: Access to field 'properties' result=
s in a dereference of an undefined pointer value (loaded from variable 'ove=
rlay_base_symbols')
                   for_each_property_of_node(overlay_base_symbols, prop) {
                                             ^
   include/linux/of.h:359:12: note: expanded from macro 'for_each_property_=
of_node'
           for (pp =3D dn->properties; pp !=3D NULL; pp =3D pp->next)
                     ^~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/ufs/core/ufshpb.c:306:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ppn_buf, page_address(page) + (offset * HPB_ENTRY_SIZE),
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:306:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(ppn_buf, page_address(page) + (offset * HPB_ENTRY_SIZE),
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:336:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cdb[6], &ppn_tmp, sizeof(__be64));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:336:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(&cdb[6], &ppn_tmp, sizeof(__be64));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:754:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   clear_page(page_address(mctx->m_page[i]));
                   ^
   arch/arm/include/asm/page-nommu.h:11:26: note: expanded from macro 'clea=
r_page'
   #define clear_page(page)        memset((page), 0, PAGE_SIZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:754:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   clear_page(page_address(mctx->m_page[i]));
                   ^
   arch/arm/include/asm/page-nommu.h:11:26: note: expanded from macro 'clea=
r_page'
   #define clear_page(page)        memset((page), 0, PAGE_SIZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> drivers/ufs/core/ufshpb.c:1583:17: warning: Access to field 'is_last' re=
sults in a dereference of an undefined pointer value (loaded from variable =
'srgn') [clang-analyzer-core.NullDereference]
                   srgn->is_last =3D true;
                                 ^
   drivers/ufs/core/ufshpb.c:2498:6: note: Assuming 'lun' is < field 'max_l=
u_supported'
           if (lun >=3D hba->dev_info.max_lu_supported)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:2498:2: note: Taking false branch
           if (lun >=3D hba->dev_info.max_lu_supported)
           ^
   drivers/ufs/core/ufshpb.c:2502:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/ufs/core/ufshpb.c:2502:2: note: Taking false branch
           if (ret)
           ^
   drivers/ufs/core/ufshpb.c:2505:8: note: Calling 'ufshpb_alloc_hpb_lu'
           hpb =3D ufshpb_alloc_hpb_lu(hba, sdev, &hba->ufshpb_dev,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:2230:6: note: Assuming 'hpb' is non-null
           if (!hpb)
               ^~~~
   drivers/ufs/core/ufshpb.c:2230:2: note: Taking false branch
           if (!hpb)
           ^
   drivers/ufs/core/ufshpb.c:2238:8: note: Calling 'ufshpb_lu_hpb_init'
           ret =3D ufshpb_lu_hpb_init(hba, hpb);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:2153:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_init(&hpb->rgn_state_lock);
           ^
   include/linux/spinlock.h:339:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/ufs/core/ufshpb.c:2154:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_init(&hpb->rsp_list_lock);
           ^
   include/linux/spinlock.h:339:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/ufs/core/ufshpb.c:2155:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_init(&hpb->param_lock);
           ^
   include/linux/spinlock.h:339:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/ufs/core/ufshpb.c:2162:2: note: Loop condition is false.  Exitin=
g loop
           INIT_WORK(&hpb->map_work, ufshpb_map_work_handler);
           ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:236:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/ufs/core/ufshpb.c:2163:6: note: Assuming field 'is_hcm' is false
           if (hpb->is_hcm) {
               ^~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:2163:2: note: Taking false branch
           if (hpb->is_hcm) {
           ^
   drivers/ufs/core/ufshpb.c:2172:6: note: Assuming field 'map_req_cache' i=
s non-null
           if (!hpb->map_req_cache) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:2172:2: note: Taking false branch
           if (!hpb->map_req_cache) {
           ^
   drivers/ufs/core/ufshpb.c:2181:6: note: Assuming field 'm_page_cache' is=
 non-null
           if (!hpb->m_page_cache) {
               ^~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:2181:2: note: Taking false branch
           if (!hpb->m_page_cache) {
           ^
   drivers/ufs/core/ufshpb.c:2189:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/ufs/core/ufshpb.c:2189:2: note: Taking false branch
           if (ret) {
           ^
   drivers/ufs/core/ufshpb.c:2195:8: note: Calling 'ufshpb_alloc_region_tbl'
           ret =3D ufshpb_alloc_region_tbl(hba, hpb);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1659:6: note: Assuming 'rgn_table' is non-null
           if (!rgn_table)
               ^~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1659:2: note: Taking false branch
           if (!rgn_table)
           ^
   drivers/ufs/core/ufshpb.c:1662:20: note: Assuming 'rgn_idx' is < field '=
rgns_per_lu'
           for (rgn_idx =3D 0; rgn_idx < hpb->rgns_per_lu; rgn_idx++) {
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1662:2: note: Loop condition is true.  Enterin=
g loop body
           for (rgn_idx =3D 0; rgn_idx < hpb->rgns_per_lu; rgn_idx++) {
           ^
   drivers/ufs/core/ufshpb.c:1669:3: note: Loop condition is false.  Exitin=
g loop
                   spin_lock_init(&rgn->rgn_lock);
                   ^
   include/linux/spinlock.h:339:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/ufs/core/ufshpb.c:1675:7: note: Assuming the condition is true
                   if (rgn_idx =3D=3D hpb->rgns_per_lu - 1) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1675:3: note: Taking true branch
                   if (rgn_idx =3D=3D hpb->rgns_per_lu - 1) {
                   ^
   drivers/ufs/core/ufshpb.c:1682:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/ufs/core/ufshpb.c:1682:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/ufs/core/ufshpb.c:1684:3: note: Calling 'ufshpb_init_subregion_t=
bl'
                   ufshpb_init_subregion_tbl(hpb, rgn, last_srgn);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1572:2: note: 'srgn' declared without an initi=
al value
           struct ufshpb_subregion *srgn;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1574:2: note: Assuming 'srgn_idx' is >=3D fiel=
d 'srgn_cnt'
           for_each_sub_region(rgn, srgn_idx, srgn) {
           ^
   drivers/ufs/core/ufshpb.h:143:8: note: expanded from macro 'for_each_sub=
_region'
                ((i) < (rgn)->srgn_cnt) && ((srgn) =3D &(rgn)->srgn_tbl[i])=
; \
                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1574:2: note: Left side of '&&' is false
           for_each_sub_region(rgn, srgn_idx, srgn) {
           ^
   drivers/ufs/core/ufshpb.h:143:31: note: expanded from macro 'for_each_su=
b_region'
                ((i) < (rgn)->srgn_cnt) && ((srgn) =3D &(rgn)->srgn_tbl[i])=
; \
                                        ^
   drivers/ufs/core/ufshpb.c:1582:15: note: 'last' is true
           if (unlikely(last && hpb->last_srgn_entries))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/ufs/core/ufshpb.c:1582:15: note: Left side of '&&' is true
           if (unlikely(last && hpb->last_srgn_entries))
                        ^
   drivers/ufs/core/ufshpb.c:1582:6: note: Assuming the condition is false
           if (unlikely(last && hpb->last_srgn_entries))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/ufs/core/ufshpb.c:1582:2: note: Taking true branch
           if (unlikely(last && hpb->last_srgn_entries))
           ^
   drivers/ufs/core/ufshpb.c:1583:17: note: Access to field 'is_last' resul=
ts in a dereference of an undefined pointer value (loaded from variable 'sr=
gn')
                   srgn->is_last =3D true;
                   ~~~~          ^
>> drivers/ufs/core/ufshpb.c:1640:22: warning: Division by zero [clang-anal=
yzer-core.DivideZero]
           hpb->srgns_per_lu =3D DIV_ROUND_UP(hpb_lu_info->num_blocks,
                               ^
   include/linux/math.h:37:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/ufs/core/ufshpb.c:1606:6: note: Assuming the condition is true
           if (ufshpb_is_legacy(hba))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1606:2: note: Taking true branch
           if (ufshpb_is_legacy(hba))
           ^
   drivers/ufs/core/ufshpb.c:1612:23: note: Assuming field 'num_pinned' is 0
           hpb->lu_pinned_end =3D hpb_lu_info->num_pinned ?
                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1612:23: note: '?' condition is false
   drivers/ufs/core/ufshpb.c:1620:2: note: Left side of '&&' is false
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/ufs/core/ufshpb.c:1620:2: note: Left side of '&&' is false
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:227:42: note: expanded from macro 'do_div'
           } else if (__builtin_constant_p(__base) &&      \
                                                   ^
   drivers/ufs/core/ufshpb.c:1620:2: note: Assuming the condition is true
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:234:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/ufs/core/ufshpb.c:1620:2: note: Taking true branch
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/ufs/core/ufshpb.c:1625:2: note: Left side of '&&' is false
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/ufs/core/ufshpb.c:1625:2: note: Left side of '&&' is false
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:227:42: note: expanded from macro 'do_div'
           } else if (__builtin_constant_p(__base) &&      \
                                                   ^
   drivers/ufs/core/ufshpb.c:1625:2: note: Assuming the condition is true
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:234:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/ufs/core/ufshpb.c:1625:2: note: Taking true branch
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/ufs/core/ufshpb.c:1627:31: note: '?' condition is false
           hpb->entries_per_rgn_shift =3D ilog2(entries_per_rgn);
                                        ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/ufs/core/ufshpb.c:1627:31: note: '?' condition is true
           hpb->entries_per_rgn_shift =3D ilog2(entries_per_rgn);
                                        ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/ufs/core/ufshpb.c:1631:32: note: '?' condition is false
           hpb->entries_per_srgn_shift =3D ilog2(hpb->entries_per_srgn);
                                         ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/ufs/core/ufshpb.c:1631:32: note: '?' condition is true
           hpb->entries_per_srgn_shift =3D ilog2(hpb->entries_per_srgn);
                                         ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/ufs/core/ufshpb.c:1635:2: note: Left side of '&&' is false
           do_div(tmp, hpb->srgn_mem_size);
           ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'

vim +1583 drivers/ufs/core/ufshpb.c

4b5f49079c52a7 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1567  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1568  stat=
ic void ufshpb_init_subregion_tbl(struct ufshpb_lu *hpb,
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1569  				=
      struct ufshpb_region *rgn, bool last)
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1570  {
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1571  	int=
 srgn_idx;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1572  	str=
uct ufshpb_subregion *srgn;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1573  =

4b5f49079c52a7 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1574  	for=
_each_sub_region(rgn, srgn_idx, srgn) {
4b5f49079c52a7 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1575  		IN=
IT_LIST_HEAD(&srgn->list_act_srgn);
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1576  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1577  		sr=
gn->rgn_idx =3D rgn->rgn_idx;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1578  		sr=
gn->srgn_idx =3D srgn_idx;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1579  		sr=
gn->srgn_state =3D HPB_SRGN_UNUSED;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1580  	}
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1581  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12 @1582  	if =
(unlikely(last && hpb->last_srgn_entries))
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12 @1583  		sr=
gn->is_last =3D true;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1584  }
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1585  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1586  stat=
ic int ufshpb_alloc_subregion_tbl(struct ufshpb_lu *hpb,
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1587  				=
      struct ufshpb_region *rgn, int srgn_cnt)
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1588  {
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1589  	rgn=
->srgn_tbl =3D kvcalloc(srgn_cnt, sizeof(struct ufshpb_subregion),
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1590  				=
 GFP_KERNEL);
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1591  	if =
(!rgn->srgn_tbl)
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1592  		re=
turn -ENOMEM;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1593  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1594  	rgn=
->srgn_cnt =3D srgn_cnt;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1595  	ret=
urn 0;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1596  }
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1597  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1598  stat=
ic void ufshpb_lu_parameter_init(struct ufs_hba *hba,
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1599  				=
     struct ufshpb_lu *hpb,
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1600  				=
     struct ufshpb_dev_info *hpb_dev_info,
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1601  				=
     struct ufshpb_lu_info *hpb_lu_info)
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1602  {
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1603  	u32=
 entries_per_rgn;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1604  	u64=
 rgn_mem_size, tmp;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1605  =

41d8a9333cc96f drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1606  	if =
(ufshpb_is_legacy(hba))
41d8a9333cc96f drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1607  		hp=
b->pre_req_max_tr_len =3D HPB_LEGACY_CHUNK_HIGH;
41d8a9333cc96f drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1608  	else
9ec5128a8b5631 drivers/scsi/ufs/ufshpb.c Avri Altman 2021-10-31  1609  		hp=
b->pre_req_max_tr_len =3D hpb_dev_info->max_hpb_single_cmd;
41d8a9333cc96f drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1610  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1611  	hpb=
->lu_pinned_start =3D hpb_lu_info->pinned_start;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1612  	hpb=
->lu_pinned_end =3D hpb_lu_info->num_pinned ?
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1613  		(h=
pb_lu_info->pinned_start + hpb_lu_info->num_pinned - 1)
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1614  		: =
PINNED_NOT_SET;
4b5f49079c52a7 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1615  	hpb=
->lru_info.max_lru_active_cnt =3D
4b5f49079c52a7 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1616  		hp=
b_lu_info->max_active_rgns - hpb_lu_info->num_pinned;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1617  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1618  	rgn=
_mem_size =3D (1ULL << hpb_dev_info->rgn_size) * HPB_RGN_SIZE_UNIT
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1619  			*=
 HPB_ENTRY_SIZE;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1620  	do_=
div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1621  	hpb=
->srgn_mem_size =3D (1ULL << hpb_dev_info->srgn_size)
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1622  		* =
HPB_RGN_SIZE_UNIT / HPB_ENTRY_BLOCK_SIZE * HPB_ENTRY_SIZE;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1623  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1624  	tmp=
 =3D rgn_mem_size;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1625  	do_=
div(tmp, HPB_ENTRY_SIZE);
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1626  	ent=
ries_per_rgn =3D (u32)tmp;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1627  	hpb=
->entries_per_rgn_shift =3D ilog2(entries_per_rgn);
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1628  	hpb=
->entries_per_rgn_mask =3D entries_per_rgn - 1;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1629  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1630  	hpb=
->entries_per_srgn =3D hpb->srgn_mem_size / HPB_ENTRY_SIZE;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1631  	hpb=
->entries_per_srgn_shift =3D ilog2(hpb->entries_per_srgn);
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1632  	hpb=
->entries_per_srgn_mask =3D hpb->entries_per_srgn - 1;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1633  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1634  	tmp=
 =3D rgn_mem_size;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1635  	do_=
div(tmp, hpb->srgn_mem_size);
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1636  	hpb=
->srgns_per_rgn =3D (int)tmp;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1637  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1638  	hpb=
->rgns_per_lu =3D DIV_ROUND_UP(hpb_lu_info->num_blocks,
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1639  				=
entries_per_rgn);
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12 @1640  	hpb=
->srgns_per_lu =3D DIV_ROUND_UP(hpb_lu_info->num_blocks,
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1641  				=
(hpb->srgn_mem_size / HPB_ENTRY_SIZE));
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1642  	hpb=
->last_srgn_entries =3D hpb_lu_info->num_blocks
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1643  				=
 % (hpb->srgn_mem_size / HPB_ENTRY_SIZE);
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1644  =

f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1645  	hpb=
->pages_per_srgn =3D DIV_ROUND_UP(hpb->srgn_mem_size, PAGE_SIZE);
119ee38c10fa34 drivers/scsi/ufs/ufshpb.c Avri Altman 2021-07-12  1646  =

119ee38c10fa34 drivers/scsi/ufs/ufshpb.c Avri Altman 2021-07-12  1647  	if =
(hpb_dev_info->control_mode =3D=3D HPB_HOST_CONTROL)
119ee38c10fa34 drivers/scsi/ufs/ufshpb.c Avri Altman 2021-07-12  1648  		hp=
b->is_hcm =3D true;
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1649  }
f02bc9754a6887 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1650  =


:::::: The code at line 1583 was first introduced by commit
:::::: f02bc9754a6887bf5e286889265d24ce5e3b1952 scsi: ufs: ufshpb: Introduc=
e Host Performance Buffer feature

:::::: TO: Daejun Park <daejun7.park@samsung.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6970980761127271703==--

