Content-Type: multipart/mixed; boundary="===============7046693028890197714=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:1405:2: warning: Value stored to 'bo_size' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 10 Dec 2021 11:34:47 +0800
Message-ID: <202112101102.rECaVARg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7046693028890197714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Felix Kuehling <Felix.Kuehling@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c741e49150dbb0c0aebe234389f4aa8b47958fa8
commit: c780b2eedbd0ddc9f594379fd39281100693fd3d drm/amdgpu: Rename kfd_bo_=
va_list to kfd_mem_attachment
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c007-20211208 (https://download.01.org/0day-ci/ar=
chive/20211210/202112101102.rECaVARg-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc780b2eedbd0ddc9f594379fd39281100693fd3d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c780b2eedbd0ddc9f594379fd39281100693fd3d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_iext_tree.c:521:18: note: Left side of '&&' is false
           if (node !=3D new && pos =3D=3D 0 && nr_entries > 0)
                           ^
   fs/xfs/libxfs/xfs_iext_tree.c:524:23: note: 'i' is <=3D 'pos'
           for (i =3D nr_entries; i > pos; i--) {
                                ^
   fs/xfs/libxfs/xfs_iext_tree.c:524:2: note: Loop condition is false. Exec=
ution continues on line 528
           for (i =3D nr_entries; i > pos; i--) {
           ^
   fs/xfs/libxfs/xfs_iext_tree.c:528:18: note: Array access (via field 'key=
s') results in a null pointer dereference
           node->keys[pos] =3D offset;
                 ~~~~      ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (8 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2867:6: wa=
rning: Access to field 'disable_edc_leakage_controller' results in a derefe=
rence of a null pointer (loaded from variable 'data') [clang-analyzer-core.=
NullDereference]
           if (data->disable_edc_leakage_controller)
               ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2899:6: no=
te: Assuming 'data' is not equal to NULL
           if (data =3D=3D NULL)
               ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2899:2: no=
te: Taking false branch
           if (data =3D=3D NULL)
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2903:2: no=
te: Calling 'smu7_patch_voltage_workaround'
           smu7_patch_voltage_workaround(hwmgr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2436:6: no=
te: Assuming 'table_info' is equal to NULL
           if (table_info !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2436:2: no=
te: Taking false branch
           if (table_info !=3D NULL) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2440:3: no=
te: Returning without writing to 'hwmgr->backend'
                   return 0;
                   ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2903:2: no=
te: Returning from 'smu7_patch_voltage_workaround'
           smu7_patch_voltage_workaround(hwmgr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2907:2: no=
te: Taking false branch
           if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps,
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2918:6: no=
te: Assuming field 'pp_table_version' is not equal to PP_TABLE_V1
           if (hwmgr->pp_table_version =3D=3D PP_TABLE_V1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2918:2: no=
te: Taking false branch
           if (hwmgr->pp_table_version =3D=3D PP_TABLE_V1) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2921:13: n=
ote: Assuming field 'pp_table_version' is not equal to PP_TABLE_V0
           } else if (hwmgr->pp_table_version =3D=3D PP_TABLE_V0) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2921:9: no=
te: Taking false branch
           } else if (hwmgr->pp_table_version =3D=3D PP_TABLE_V0) {
                  ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2929:6: no=
te: Assuming 'result' is not equal to 0
           if (0 =3D=3D result) {
               ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2929:2: no=
te: Taking false branch
           if (0 =3D=3D result) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2953:3: no=
te: Calling 'smu7_hwmgr_backend_fini'
                   smu7_hwmgr_backend_fini(hwmgr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2824:2: no=
te: Null pointer value stored to field 'backend'
           hwmgr->backend =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2953:3: no=
te: Returning from 'smu7_hwmgr_backend_fini'
                   smu7_hwmgr_backend_fini(hwmgr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2956:11: n=
ote: Calling 'smu7_update_edc_leakage_table'
           result =3D smu7_update_edc_leakage_table(hwmgr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2862:2: no=
te: 'data' initialized to a null pointer value
           struct smu7_hwmgr *data =3D (struct smu7_hwmgr *)(hwmgr->backend=
);
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:2867:6: no=
te: Access to field 'disable_edc_leakage_controller' results in a dereferen=
ce of a null pointer (loaded from variable 'data')
           if (data->disable_edc_leakage_controller)
               ^~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:281:14: warning: Althou=
gh the value stored to 'k' is used in the enclosing expression, the value i=
s never actually read from 'k' [clang-analyzer-deadcode.DeadStores]
           for (i =3D j, k =3D 0; i < old->shared_count; ++i) {
                       ^   ~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:281:14: note: Although =
the value stored to 'k' is used in the enclosing expression, the value is n=
ever actually read from 'k'
           for (i =3D j, k =3D 0; i < old->shared_count; ++i) {
                       ^   ~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:1405:2: warning: Value =
stored to 'bo_size' is never read [clang-analyzer-deadcode.DeadStores]
           bo_size =3D bo->tbo.base.size;
           ^         ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:1405:2: note: Value sto=
red to 'bo_size' is never read
           bo_size =3D bo->tbo.base.size;
           ^         ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:1508:16: warning: Value=
 stored to 'bo_size' during its initialization is never read [clang-analyze=
r-deadcode.DeadStores]
           unsigned long bo_size =3D mem->bo->tbo.base.size;
                         ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:1508:16: note: Value st=
ored to 'bo_size' during its initialization is never read
           unsigned long bo_size =3D mem->bo->tbo.base.size;
                         ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/i915/display/icl_dsi.c:141:11: warning: Dereference of n=
ull pointer [clang-analyzer-core.NullDereference]
                           tmp |=3D *data++ << 8 * j;
                                  ^
   drivers/gpu/drm/i915/display/icl_dsi.c:1746:6: note: Assuming 'ret' is >=
=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/gpu/drm/i915/display/icl_dsi.c:1746:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/gpu/drm/i915/display/icl_dsi.c:1749:6: note: Assuming the condit=
ion is false
           if (msg->flags & MIPI_DSI_MSG_USE_LPM)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/icl_dsi.c:1749:2: note: Taking false branch
           if (msg->flags & MIPI_DSI_MSG_USE_LPM)
           ^
   drivers/gpu/drm/i915/display/icl_dsi.c:1754:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/gpu/drm/i915/display/icl_dsi.c:1754:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/gpu/drm/i915/display/icl_dsi.c:1758:6: note: Assuming the condit=
ion is true
           if (mipi_dsi_packet_format_is_long(msg->type)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/icl_dsi.c:1758:2: note: Taking true branch
           if (mipi_dsi_packet_format_is_long(msg->type)) {
           ^
   drivers/gpu/drm/i915/display/icl_dsi.c:1759:9: note: Calling 'dsi_send_p=
kt_payld'
                   ret =3D dsi_send_pkt_payld(intel_dsi_host, dsi_pkt);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/icl_dsi.c:195:6: note: Assuming the conditi=
on is false
           if (pkt.payload_length > MAX_PLOAD_CREDIT * 4) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/icl_dsi.c:195:2: note: Taking false branch
           if (pkt.payload_length > MAX_PLOAD_CREDIT * 4) {
           ^
   drivers/gpu/drm/i915/display/icl_dsi.c:201:7: note: Calling 'add_payld_t=
o_queue'
           if (!add_payld_to_queue(host, pkt.payload,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/icl_dsi.c:130:14: note: Assuming 'i' is < '=
len'
           for (i =3D 0; i < len; i +=3D 4) {
                       ^~~~~~~
   drivers/gpu/drm/i915/display/icl_dsi.c:130:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < len; i +=3D 4) {
           ^
   drivers/gpu/drm/i915/display/icl_dsi.c:134:7: note: Assuming 'free_credi=
ts' is >=3D 1
                   if (free_credits < 1) {
                       ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/icl_dsi.c:134:3: note: Taking false branch
                   if (free_credits < 1) {
                   ^
   drivers/gpu/drm/i915/display/icl_dsi.c:140:19: note: Assuming '__UNIQUE_=
ID___x587' is >=3D '__UNIQUE_ID___y588'
                   for (j =3D 0; j < min_t(u32, len - i, 4); j++)
                                   ^
   include/linux/minmax.h:110:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)

vim +/bo_size +1405 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c

a46a2cd103a8637 Felix Kuehling    2018-02-06  1364  =

a46a2cd103a8637 Felix Kuehling    2018-02-06  1365  int amdgpu_amdkfd_gpuvm=
_map_memory_to_gpu(
b40a6ab2cf92139 Felix Kuehling    2021-04-07  1366  		struct kgd_dev *kgd, =
struct kgd_mem *mem, void *drm_priv)
a46a2cd103a8637 Felix Kuehling    2018-02-06  1367  {
a46a2cd103a8637 Felix Kuehling    2018-02-06  1368  	struct amdgpu_device *=
adev =3D get_amdgpu_device(kgd);
b40a6ab2cf92139 Felix Kuehling    2021-04-07  1369  	struct amdgpu_vm *avm =
=3D drm_priv_to_vm(drm_priv);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1370  	int ret;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1371  	struct amdgpu_bo *bo;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1372  	uint32_t domain;
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1373  	struct kfd_mem_attachm=
ent *entry;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1374  	struct bo_vm_reservati=
on_context ctx;
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1375  	struct kfd_mem_attachm=
ent *attachment =3D NULL;
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1376  	struct kfd_mem_attachm=
ent *attachment_aql =3D NULL;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1377  	unsigned long bo_size;
5ae0283e831a94c Felix Kuehling    2018-03-23  1378  	bool is_invalid_userpt=
r =3D false;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1379  =

a46a2cd103a8637 Felix Kuehling    2018-02-06  1380  	bo =3D mem->bo;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1381  	if (!bo) {
a46a2cd103a8637 Felix Kuehling    2018-02-06  1382  		pr_err("Invalid BO wh=
en mapping memory to GPU\n");
5ae0283e831a94c Felix Kuehling    2018-03-23  1383  		return -EINVAL;
5ae0283e831a94c Felix Kuehling    2018-03-23  1384  	}
5ae0283e831a94c Felix Kuehling    2018-03-23  1385  =

5ae0283e831a94c Felix Kuehling    2018-03-23  1386  	/* Make sure restore i=
s not running concurrently. Since we
5ae0283e831a94c Felix Kuehling    2018-03-23  1387  	 * don't map invalid u=
serptr BOs, we rely on the next restore
5ae0283e831a94c Felix Kuehling    2018-03-23  1388  	 * worker to do the ma=
pping
5ae0283e831a94c Felix Kuehling    2018-03-23  1389  	 */
5ae0283e831a94c Felix Kuehling    2018-03-23  1390  	mutex_lock(&mem->proce=
ss_info->lock);
5ae0283e831a94c Felix Kuehling    2018-03-23  1391  =

5ae0283e831a94c Felix Kuehling    2018-03-23  1392  	/* Lock mmap-sem. If w=
e find an invalid userptr BO, we can be
5ae0283e831a94c Felix Kuehling    2018-03-23  1393  	 * sure that the MMU n=
otifier is no longer running
5ae0283e831a94c Felix Kuehling    2018-03-23  1394  	 * concurrently and th=
e queues are actually stopped
5ae0283e831a94c Felix Kuehling    2018-03-23  1395  	 */
5ae0283e831a94c Felix Kuehling    2018-03-23  1396  	if (amdgpu_ttm_tt_get_=
usermm(bo->tbo.ttm)) {
d8ed45c5dcd455f Michel Lespinasse 2020-06-08  1397  		mmap_write_lock(curre=
nt->mm);
5ae0283e831a94c Felix Kuehling    2018-03-23  1398  		is_invalid_userptr =
=3D atomic_read(&mem->invalid);
d8ed45c5dcd455f Michel Lespinasse 2020-06-08  1399  		mmap_write_unlock(cur=
rent->mm);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1400  	}
a46a2cd103a8637 Felix Kuehling    2018-02-06  1401  =

5ae0283e831a94c Felix Kuehling    2018-03-23  1402  	mutex_lock(&mem->lock);
5ae0283e831a94c Felix Kuehling    2018-03-23  1403  =

a46a2cd103a8637 Felix Kuehling    2018-02-06  1404  	domain =3D mem->domain;
8c392cd5f1c638f Daniel Vetter     2020-12-14 @1405  	bo_size =3D bo->tbo.ba=
se.size;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1406  =

a46a2cd103a8637 Felix Kuehling    2018-02-06  1407  	pr_debug("Map VA 0x%ll=
x - 0x%llx to vm %p domain %s\n",
a46a2cd103a8637 Felix Kuehling    2018-02-06  1408  			mem->va,
a46a2cd103a8637 Felix Kuehling    2018-02-06  1409  			mem->va + bo_size * =
(1 + mem->aql_queue),
b40a6ab2cf92139 Felix Kuehling    2021-04-07  1410  			avm, domain_string(d=
omain));
a46a2cd103a8637 Felix Kuehling    2018-02-06  1411  =

b40a6ab2cf92139 Felix Kuehling    2021-04-07  1412  	ret =3D reserve_bo_and=
_vm(mem, avm, &ctx);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1413  	if (unlikely(ret))
a46a2cd103a8637 Felix Kuehling    2018-02-06  1414  		goto out;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1415  =

5ae0283e831a94c Felix Kuehling    2018-03-23  1416  	/* Userptr can be mark=
ed as "not invalid", but not actually be
5ae0283e831a94c Felix Kuehling    2018-03-23  1417  	 * validated yet (stil=
l in the system domain). In that case
5ae0283e831a94c Felix Kuehling    2018-03-23  1418  	 * the queues are stil=
l stopped and we can leave mapping for
5ae0283e831a94c Felix Kuehling    2018-03-23  1419  	 * the next restore wo=
rker
5ae0283e831a94c Felix Kuehling    2018-03-23  1420  	 */
0f04e538580c086 Felix Kuehling    2018-05-03  1421  	if (amdgpu_ttm_tt_get_=
usermm(bo->tbo.ttm) &&
0f04e538580c086 Felix Kuehling    2018-05-03  1422  	    bo->tbo.mem.mem_ty=
pe =3D=3D TTM_PL_SYSTEM)
5ae0283e831a94c Felix Kuehling    2018-03-23  1423  		is_invalid_userptr =
=3D true;
5ae0283e831a94c Felix Kuehling    2018-03-23  1424  =

c780b2eedbd0ddc Felix Kuehling    2021-04-08  1425  	if (!kfd_mem_is_attach=
ed(avm, mem)) {
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1426  		ret =3D kfd_mem_attac=
h(adev, mem, avm, false, &attachment);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1427  		if (ret)
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1428  			goto attach_failed;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1429  		if (mem->aql_queue) {
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1430  			ret =3D kfd_mem_atta=
ch(adev, mem, avm, true,
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1431  					     &attachment_a=
ql);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1432  			if (ret)
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1433  				goto attach_failed_=
aql;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1434  		}
a46a2cd103a8637 Felix Kuehling    2018-02-06  1435  	} else {
5b21d3e5fd2110d Felix Kuehling    2018-03-15  1436  		ret =3D vm_validate_p=
t_pd_bos(avm);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1437  		if (unlikely(ret))
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1438  			goto attach_failed;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1439  	}
a46a2cd103a8637 Felix Kuehling    2018-02-06  1440  =

5ae0283e831a94c Felix Kuehling    2018-03-23  1441  	if (mem->mapped_to_gpu=
_memory =3D=3D 0 &&
5ae0283e831a94c Felix Kuehling    2018-03-23  1442  	    !amdgpu_ttm_tt_get=
_usermm(bo->tbo.ttm)) {
a46a2cd103a8637 Felix Kuehling    2018-02-06  1443  		/* Validate BO only o=
nce. The eviction fence gets added to BO
a46a2cd103a8637 Felix Kuehling    2018-02-06  1444  		 * the first time it =
is mapped. Validate will wait for all
a46a2cd103a8637 Felix Kuehling    2018-02-06  1445  		 * background evictio=
ns to complete.
a46a2cd103a8637 Felix Kuehling    2018-02-06  1446  		 */
a46a2cd103a8637 Felix Kuehling    2018-02-06  1447  		ret =3D amdgpu_amdkfd=
_bo_validate(bo, domain, true);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1448  		if (ret) {
a46a2cd103a8637 Felix Kuehling    2018-02-06  1449  			pr_debug("Validate f=
ailed\n");
a46a2cd103a8637 Felix Kuehling    2018-02-06  1450  			goto map_bo_to_gpuvm=
_failed;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1451  		}
a46a2cd103a8637 Felix Kuehling    2018-02-06  1452  	}
a46a2cd103a8637 Felix Kuehling    2018-02-06  1453  =

c780b2eedbd0ddc Felix Kuehling    2021-04-08  1454  	list_for_each_entry(en=
try, &mem->attachments, list) {
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1455  		if (entry->bo_va->bas=
e.vm !=3D avm || entry->is_mapped)
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1456  			continue;
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1457  =

a46a2cd103a8637 Felix Kuehling    2018-02-06  1458  		pr_debug("\t map VA 0=
x%llx - 0x%llx in entry %p\n",
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1459  			 entry->va, entry->v=
a + bo_size, entry);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1460  =

5ae0283e831a94c Felix Kuehling    2018-03-23  1461  		ret =3D map_bo_to_gpu=
vm(adev, entry, ctx.sync,
5ae0283e831a94c Felix Kuehling    2018-03-23  1462  				      is_invalid_us=
erptr);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1463  		if (ret) {
0d87c9cfc08e150 Kent Russell      2019-05-01  1464  			pr_err("Failed to ma=
p bo to gpuvm\n");
a46a2cd103a8637 Felix Kuehling    2018-02-06  1465  			goto map_bo_to_gpuvm=
_failed;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1466  		}
a46a2cd103a8637 Felix Kuehling    2018-02-06  1467  =

b40a6ab2cf92139 Felix Kuehling    2021-04-07  1468  		ret =3D vm_update_pds=
(avm, ctx.sync);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1469  		if (ret) {
a46a2cd103a8637 Felix Kuehling    2018-02-06  1470  			pr_err("Failed to up=
date page directories\n");
a46a2cd103a8637 Felix Kuehling    2018-02-06  1471  			goto map_bo_to_gpuvm=
_failed;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1472  		}
a46a2cd103a8637 Felix Kuehling    2018-02-06  1473  =

a46a2cd103a8637 Felix Kuehling    2018-02-06  1474  		entry->is_mapped =3D =
true;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1475  		mem->mapped_to_gpu_me=
mory++;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1476  		pr_debug("\t INC mapp=
ing count %d\n",
a46a2cd103a8637 Felix Kuehling    2018-02-06  1477  			 mem->mapped_to_gpu_=
memory);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1478  	}
a46a2cd103a8637 Felix Kuehling    2018-02-06  1479  =

4671078eb8e390b Christian K=C3=B6nig   2020-09-21  1480  	if (!amdgpu_ttm_t=
t_get_usermm(bo->tbo.ttm) && !bo->tbo.pin_count)
a46a2cd103a8637 Felix Kuehling    2018-02-06  1481  		amdgpu_bo_fence(bo,
5b21d3e5fd2110d Felix Kuehling    2018-03-15  1482  				&avm->process_info-=
>eviction_fence->base,
a46a2cd103a8637 Felix Kuehling    2018-02-06  1483  				true);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1484  	ret =3D unreserve_bo_a=
nd_vms(&ctx, false, false);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1485  =

a46a2cd103a8637 Felix Kuehling    2018-02-06  1486  	goto out;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1487  =

a46a2cd103a8637 Felix Kuehling    2018-02-06  1488  map_bo_to_gpuvm_failed:
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1489  	if (attachment_aql)
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1490  		kfd_mem_detach(attach=
ment_aql);
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1491  attach_failed_aql:
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1492  	if (attachment)
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1493  		kfd_mem_detach(attach=
ment);
c780b2eedbd0ddc Felix Kuehling    2021-04-08  1494  attach_failed:
a46a2cd103a8637 Felix Kuehling    2018-02-06  1495  	unreserve_bo_and_vms(&=
ctx, false, false);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1496  out:
a46a2cd103a8637 Felix Kuehling    2018-02-06  1497  	mutex_unlock(&mem->pro=
cess_info->lock);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1498  	mutex_unlock(&mem->loc=
k);
a46a2cd103a8637 Felix Kuehling    2018-02-06  1499  	return ret;
a46a2cd103a8637 Felix Kuehling    2018-02-06  1500  }
a46a2cd103a8637 Felix Kuehling    2018-02-06  1501  =


:::::: The code at line 1405 was first introduced by commit
:::::: 8c392cd5f1c638f953ebf2c6f4baca9df9e699f4 drm/amdkfd: fix ttm size re=
factor fallout

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7046693028890197714==--

