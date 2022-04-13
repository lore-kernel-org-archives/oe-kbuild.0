Content-Type: multipart/mixed; boundary="===============5829108583991705632=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bvanassche:ufs-for-next 29/29] drivers/ufs/core/ufshpb.c:1544:17: warning: Access to field 'is_last' results in a dereference of an undefined pointer value (loaded from variable 'srgn') [clang-analyzer-core.NullDereference]
Date: Wed, 13 Apr 2022 08:59:41 +0800
Message-ID: <202204130800.NZRwIfhc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5829108583991705632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux ufs-for-next
head:   e1c32435245394413b0308d1329938ce4db52877
commit: e1c32435245394413b0308d1329938ce4db52877 [29/29] scsi: ufs: Split t=
he drivers/scsi/ufs directory
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm-randconfig-c002-20220411 (https://download.01.org/0day-ci/archi=
ve/20220413/202204130800.NZRwIfhc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478=
d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/bvanassche/linux/commit/e1c32435245394413b0308=
d1329938ce4db52877
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche ufs-for-next
        git checkout e1c32435245394413b0308d1329938ce4db52877
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_btree_staging.c:224:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(nops, cur->bc_ops, sizeof(struct xfs_btree_ops));
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
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
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
   arch/arm/include/asm/page.h:139:26: note: expanded from macro 'clear_pag=
e'
   #define clear_page(page)        memset((void *)(page), 0, PAGE_SIZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   arch/arm/include/asm/page.h:139:26: note: expanded from macro 'clear_pag=
e'
   #define clear_page(page)        memset((void *)(page), 0, PAGE_SIZE)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/ufs/core/ufshpb.c:1544:17: warning: Access to field 'is_last' re=
sults in a dereference of an undefined pointer value (loaded from variable =
'srgn') [clang-analyzer-core.NullDereference]
                   srgn->is_last =3D true;
                                 ^
   drivers/ufs/core/ufshpb.c:2478:6: note: Assuming 'lun' is < field 'max_l=
u_supported'
           if (lun >=3D hba->dev_info.max_lu_supported)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:2478:2: note: Taking false branch
           if (lun >=3D hba->dev_info.max_lu_supported)
           ^
   drivers/ufs/core/ufshpb.c:2482:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/ufs/core/ufshpb.c:2482:2: note: Taking false branch
           if (ret)
           ^
   drivers/ufs/core/ufshpb.c:2485:8: note: Calling 'ufshpb_alloc_hpb_lu'
           hpb =3D ufshpb_alloc_hpb_lu(hba, sdev, &hba->ufshpb_dev,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:2191:6: note: Assuming 'hpb' is non-null
           if (!hpb)
               ^~~~
   drivers/ufs/core/ufshpb.c:2191:2: note: Taking false branch
           if (!hpb)
           ^
   drivers/ufs/core/ufshpb.c:2199:8: note: Calling 'ufshpb_lu_hpb_init'
           ret =3D ufshpb_lu_hpb_init(hba, hpb);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:2114:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_init(&hpb->rgn_state_lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/ufs/core/ufshpb.c:2115:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_init(&hpb->rsp_list_lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/ufs/core/ufshpb.c:2116:2: note: Loop condition is false.  Exitin=
g loop
           spin_lock_init(&hpb->param_lock);
           ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/ufs/core/ufshpb.c:2123:2: note: Loop condition is false.  Exitin=
g loop
           INIT_WORK(&hpb->map_work, ufshpb_map_work_handler);
           ^
   include/linux/workqueue.h:245:2: note: expanded from macro 'INIT_WORK'
           __INIT_WORK((_work), (_func), 0)
           ^
   include/linux/workqueue.h:225:2: note: expanded from macro '__INIT_WORK'
           do {                                                            \
           ^
   drivers/ufs/core/ufshpb.c:2124:6: note: Assuming field 'is_hcm' is false
           if (hpb->is_hcm) {
               ^~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:2124:2: note: Taking false branch
           if (hpb->is_hcm) {
           ^
   drivers/ufs/core/ufshpb.c:2133:6: note: Assuming field 'map_req_cache' i=
s non-null
           if (!hpb->map_req_cache) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:2133:2: note: Taking false branch
           if (!hpb->map_req_cache) {
           ^
   drivers/ufs/core/ufshpb.c:2142:6: note: Assuming field 'm_page_cache' is=
 non-null
           if (!hpb->m_page_cache) {
               ^~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:2142:2: note: Taking false branch
           if (!hpb->m_page_cache) {
           ^
   drivers/ufs/core/ufshpb.c:2150:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/ufs/core/ufshpb.c:2150:2: note: Taking false branch
           if (ret) {
           ^
   drivers/ufs/core/ufshpb.c:2156:8: note: Calling 'ufshpb_alloc_region_tbl'
           ret =3D ufshpb_alloc_region_tbl(hba, hpb);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1620:6: note: Assuming 'rgn_table' is non-null
           if (!rgn_table)
               ^~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1620:2: note: Taking false branch
           if (!rgn_table)
           ^
   drivers/ufs/core/ufshpb.c:1623:20: note: Assuming 'rgn_idx' is < field '=
rgns_per_lu'
           for (rgn_idx =3D 0; rgn_idx < hpb->rgns_per_lu; rgn_idx++) {
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1623:2: note: Loop condition is true.  Enterin=
g loop body
           for (rgn_idx =3D 0; rgn_idx < hpb->rgns_per_lu; rgn_idx++) {
           ^
   drivers/ufs/core/ufshpb.c:1630:3: note: Loop condition is false.  Exitin=
g loop
                   spin_lock_init(&rgn->rgn_lock);
                   ^
   include/linux/spinlock.h:329:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/ufs/core/ufshpb.c:1636:7: note: Assuming the condition is true
                   if (rgn_idx =3D=3D hpb->rgns_per_lu - 1) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1636:3: note: Taking true branch
                   if (rgn_idx =3D=3D hpb->rgns_per_lu - 1) {
                   ^
   drivers/ufs/core/ufshpb.c:1643:7: note: 'ret' is 0
                   if (ret)
                       ^~~
   drivers/ufs/core/ufshpb.c:1643:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/ufs/core/ufshpb.c:1645:3: note: Calling 'ufshpb_init_subregion_t=
bl'
                   ufshpb_init_subregion_tbl(hpb, rgn, last_srgn);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1533:2: note: 'srgn' declared without an initi=
al value
           struct ufshpb_subregion *srgn;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1535:2: note: Assuming 'srgn_idx' is >=3D fiel=
d 'srgn_cnt'
           for_each_sub_region(rgn, srgn_idx, srgn) {
           ^
   drivers/ufs/core/ufshpb.h:143:8: note: expanded from macro 'for_each_sub=
_region'
                ((i) < (rgn)->srgn_cnt) && ((srgn) =3D &(rgn)->srgn_tbl[i])=
; \
                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1535:2: note: Left side of '&&' is false
           for_each_sub_region(rgn, srgn_idx, srgn) {
           ^
   drivers/ufs/core/ufshpb.h:143:31: note: expanded from macro 'for_each_su=
b_region'
                ((i) < (rgn)->srgn_cnt) && ((srgn) =3D &(rgn)->srgn_tbl[i])=
; \
                                        ^
   drivers/ufs/core/ufshpb.c:1543:15: note: 'last' is true
           if (unlikely(last && hpb->last_srgn_entries))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/ufs/core/ufshpb.c:1543:15: note: Left side of '&&' is true
           if (unlikely(last && hpb->last_srgn_entries))
                        ^
   drivers/ufs/core/ufshpb.c:1543:6: note: Assuming the condition is false
           if (unlikely(last && hpb->last_srgn_entries))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/ufs/core/ufshpb.c:1543:2: note: Taking true branch
           if (unlikely(last && hpb->last_srgn_entries))
           ^
   drivers/ufs/core/ufshpb.c:1544:17: note: Access to field 'is_last' resul=
ts in a dereference of an undefined pointer value (loaded from variable 'sr=
gn')
                   srgn->is_last =3D true;
                   ~~~~          ^
>> drivers/ufs/core/ufshpb.c:1601:22: warning: Division by zero [clang-anal=
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
   drivers/ufs/core/ufshpb.c:1567:6: note: Assuming the condition is false
           if (ufshpb_is_legacy(hba))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1567:2: note: Taking false branch
           if (ufshpb_is_legacy(hba))
           ^
   drivers/ufs/core/ufshpb.c:1573:23: note: Assuming field 'num_pinned' is 0
           hpb->lu_pinned_end =3D hpb_lu_info->num_pinned ?
                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ufs/core/ufshpb.c:1573:23: note: '?' condition is false
   drivers/ufs/core/ufshpb.c:1581:2: note: Left side of '&&' is false
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/ufs/core/ufshpb.c:1581:2: note: Left side of '&&' is false
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:227:42: note: expanded from macro 'do_div'
           } else if (__builtin_constant_p(__base) &&      \
                                                   ^
   drivers/ufs/core/ufshpb.c:1581:2: note: Assuming the condition is false
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:234:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/ufs/core/ufshpb.c:1581:2: note: Taking false branch
           do_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
           ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/ufs/core/ufshpb.c:1586:2: note: Left side of '&&' is false
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   drivers/ufs/core/ufshpb.c:1586:2: note: Left side of '&&' is false
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:227:42: note: expanded from macro 'do_div'
           } else if (__builtin_constant_p(__base) &&      \
                                                   ^
   drivers/ufs/core/ufshpb.c:1586:2: note: Assuming the condition is false
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:234:20: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                      ~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/ufs/core/ufshpb.c:1586:2: note: Taking false branch
           do_div(tmp, HPB_ENTRY_SIZE);
           ^
   include/asm-generic/div64.h:234:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   drivers/ufs/core/ufshpb.c:1588:31: note: '?' condition is false
           hpb->entries_per_rgn_shift =3D ilog2(entries_per_rgn);
                                        ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/ufs/core/ufshpb.c:1588:31: note: '?' condition is true
           hpb->entries_per_rgn_shift =3D ilog2(entries_per_rgn);
                                        ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/ufs/core/ufshpb.c:1592:32: note: '?' condition is false
           hpb->entries_per_srgn_shift =3D ilog2(hpb->entries_per_srgn);
                                         ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/ufs/core/ufshpb.c:1592:32: note: '?' condition is true
           hpb->entries_per_srgn_shift =3D ilog2(hpb->entries_per_srgn);
                                         ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/ufs/core/ufshpb.c:1596:2: note: Left side of '&&' is false
           do_div(tmp, hpb->srgn_mem_size);
           ^
   include/asm-generic/div64.h:223:35: note: expanded from macro 'do_div'

vim +1544 drivers/ufs/core/ufshpb.c

4b5f49079c52a7e drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1528  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1529  sta=
tic void ufshpb_init_subregion_tbl(struct ufshpb_lu *hpb,
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1530  			=
	      struct ufshpb_region *rgn, bool last)
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1531  {
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1532  	in=
t srgn_idx;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1533  	st=
ruct ufshpb_subregion *srgn;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1534  =

4b5f49079c52a7e drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1535  	fo=
r_each_sub_region(rgn, srgn_idx, srgn) {
4b5f49079c52a7e drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1536  		I=
NIT_LIST_HEAD(&srgn->list_act_srgn);
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1537  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1538  		s=
rgn->rgn_idx =3D rgn->rgn_idx;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1539  		s=
rgn->srgn_idx =3D srgn_idx;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1540  		s=
rgn->srgn_state =3D HPB_SRGN_UNUSED;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1541  	}
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1542  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1543  	if=
 (unlikely(last && hpb->last_srgn_entries))
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12 @1544  		s=
rgn->is_last =3D true;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1545  }
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1546  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1547  sta=
tic int ufshpb_alloc_subregion_tbl(struct ufshpb_lu *hpb,
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1548  			=
	      struct ufshpb_region *rgn, int srgn_cnt)
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1549  {
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1550  	rg=
n->srgn_tbl =3D kvcalloc(srgn_cnt, sizeof(struct ufshpb_subregion),
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1551  			=
	 GFP_KERNEL);
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1552  	if=
 (!rgn->srgn_tbl)
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1553  		r=
eturn -ENOMEM;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1554  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1555  	rg=
n->srgn_cnt =3D srgn_cnt;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1556  	re=
turn 0;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1557  }
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1558  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1559  sta=
tic void ufshpb_lu_parameter_init(struct ufs_hba *hba,
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1560  			=
	     struct ufshpb_lu *hpb,
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1561  			=
	     struct ufshpb_dev_info *hpb_dev_info,
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1562  			=
	     struct ufshpb_lu_info *hpb_lu_info)
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1563  {
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1564  	u3=
2 entries_per_rgn;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1565  	u6=
4 rgn_mem_size, tmp;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1566  =

41d8a9333cc96f5 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1567  	if=
 (ufshpb_is_legacy(hba))
41d8a9333cc96f5 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1568  		h=
pb->pre_req_max_tr_len =3D HPB_LEGACY_CHUNK_HIGH;
41d8a9333cc96f5 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1569  	el=
se
9ec5128a8b5631d drivers/scsi/ufs/ufshpb.c Avri Altman 2021-10-31  1570  		h=
pb->pre_req_max_tr_len =3D hpb_dev_info->max_hpb_single_cmd;
41d8a9333cc96f5 drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1571  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1572  	hp=
b->lu_pinned_start =3D hpb_lu_info->pinned_start;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1573  	hp=
b->lu_pinned_end =3D hpb_lu_info->num_pinned ?
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1574  		(=
hpb_lu_info->pinned_start + hpb_lu_info->num_pinned - 1)
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1575  		:=
 PINNED_NOT_SET;
4b5f49079c52a7e drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1576  	hp=
b->lru_info.max_lru_active_cnt =3D
4b5f49079c52a7e drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1577  		h=
pb_lu_info->max_active_rgns - hpb_lu_info->num_pinned;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1578  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1579  	rg=
n_mem_size =3D (1ULL << hpb_dev_info->rgn_size) * HPB_RGN_SIZE_UNIT
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1580  			=
* HPB_ENTRY_SIZE;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1581  	do=
_div(rgn_mem_size, HPB_ENTRY_BLOCK_SIZE);
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1582  	hp=
b->srgn_mem_size =3D (1ULL << hpb_dev_info->srgn_size)
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1583  		*=
 HPB_RGN_SIZE_UNIT / HPB_ENTRY_BLOCK_SIZE * HPB_ENTRY_SIZE;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1584  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1585  	tm=
p =3D rgn_mem_size;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1586  	do=
_div(tmp, HPB_ENTRY_SIZE);
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1587  	en=
tries_per_rgn =3D (u32)tmp;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1588  	hp=
b->entries_per_rgn_shift =3D ilog2(entries_per_rgn);
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1589  	hp=
b->entries_per_rgn_mask =3D entries_per_rgn - 1;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1590  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1591  	hp=
b->entries_per_srgn =3D hpb->srgn_mem_size / HPB_ENTRY_SIZE;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1592  	hp=
b->entries_per_srgn_shift =3D ilog2(hpb->entries_per_srgn);
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1593  	hp=
b->entries_per_srgn_mask =3D hpb->entries_per_srgn - 1;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1594  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1595  	tm=
p =3D rgn_mem_size;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1596  	do=
_div(tmp, hpb->srgn_mem_size);
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1597  	hp=
b->srgns_per_rgn =3D (int)tmp;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1598  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1599  	hp=
b->rgns_per_lu =3D DIV_ROUND_UP(hpb_lu_info->num_blocks,
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1600  			=
	entries_per_rgn);
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12 @1601  	hp=
b->srgns_per_lu =3D DIV_ROUND_UP(hpb_lu_info->num_blocks,
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1602  			=
	(hpb->srgn_mem_size / HPB_ENTRY_SIZE));
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1603  	hp=
b->last_srgn_entries =3D hpb_lu_info->num_blocks
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1604  			=
	 % (hpb->srgn_mem_size / HPB_ENTRY_SIZE);
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1605  =

f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1606  	hp=
b->pages_per_srgn =3D DIV_ROUND_UP(hpb->srgn_mem_size, PAGE_SIZE);
119ee38c10fa34f drivers/scsi/ufs/ufshpb.c Avri Altman 2021-07-12  1607  =

119ee38c10fa34f drivers/scsi/ufs/ufshpb.c Avri Altman 2021-07-12  1608  	if=
 (hpb_dev_info->control_mode =3D=3D HPB_HOST_CONTROL)
119ee38c10fa34f drivers/scsi/ufs/ufshpb.c Avri Altman 2021-07-12  1609  		h=
pb->is_hcm =3D true;
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1610  }
f02bc9754a6887b drivers/scsi/ufs/ufshpb.c Daejun Park 2021-07-12  1611  =


:::::: The code at line 1544 was first introduced by commit
:::::: f02bc9754a6887bf5e286889265d24ce5e3b1952 scsi: ufs: ufshpb: Introduc=
e Host Performance Buffer feature

:::::: TO: Daejun Park <daejun7.park@samsung.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5829108583991705632==--

