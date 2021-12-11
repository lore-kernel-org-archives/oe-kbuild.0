Content-Type: multipart/mixed; boundary="===============2296909812581691569=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:1405:2: warning: Value stored to 'bo_size' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 12 Dec 2021 04:11:29 +0800
Message-ID: <202112120420.eGUdurzf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2296909812581691569==
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
head:   eccea80be2576dee642bc6cab20f1a242d58a08c
commit: c780b2eedbd0ddc9f594379fd39281100693fd3d drm/amdgpu: Rename kfd_bo_=
va_list to kfd_mem_attachment
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c007-20211208 (https://download.01.org/0day-ci/ar=
chive/20211212/202112120420.eGUdurzf-lkp(a)intel.com/config)
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
           ^
   drivers/i3c/master/svc-i3c-master.c:260:7: note: Assuming the condition =
is true
                   if (master->addrs[i] =3D=3D ibiaddr)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:260:3: note: Taking true branch
                   if (master->addrs[i] =3D=3D ibiaddr)
                   ^
   drivers/i3c/master/svc-i3c-master.c:261:4: note:  Execution continues on=
 line 263
                           break;
                           ^
   drivers/i3c/master/svc-i3c-master.c:263:6: note: 'i' is not equal to SVC=
_I3C_MAX_DEVS
           if (i =3D=3D SVC_I3C_MAX_DEVS)
               ^
   drivers/i3c/master/svc-i3c-master.c:263:2: note: Taking false branch
           if (i =3D=3D SVC_I3C_MAX_DEVS)
           ^
   drivers/i3c/master/svc-i3c-master.c:266:2: note: Returning without writi=
ng to 'master->ibi.tbq_slot', which participates in a condition later
           return master->descs[i];
           ^
   drivers/i3c/master/svc-i3c-master.c:266:2: note: Returning pointer
           return master->descs[i];
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:371:9: note: Returning from 'svc_i3c=
_master_dev_from_addr'
                   dev =3D svc_i3c_master_dev_from_addr(master, ibiaddr);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:371:3: note: Value assigned to 'dev'
                   dev =3D svc_i3c_master_dev_from_addr(master, ibiaddr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:372:7: note: Assuming 'dev' is null
                   if (!dev)
                       ^~~~
   drivers/i3c/master/svc-i3c-master.c:372:3: note: Taking true branch
                   if (!dev)
                   ^
   drivers/i3c/master/svc-i3c-master.c:373:4: note: Calling 'svc_i3c_master=
_nack_ibi'
                           svc_i3c_master_nack_ibi(master);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:337:1: note: Returning without writi=
ng to 'master->ibi.tbq_slot', which participates in a condition later
   }
   ^
   drivers/i3c/master/svc-i3c-master.c:373:4: note: Returning from 'svc_i3c=
_master_nack_ibi'
                           svc_i3c_master_nack_ibi(master);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:376:3: note:  Execution continues on=
 line 392
                   break;
                   ^
   drivers/i3c/master/svc-i3c-master.c:392:6: note: Assuming the condition =
is true
           if (svc_i3c_master_error(master)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:392:2: note: Taking true branch
           if (svc_i3c_master_error(master)) {
           ^
   drivers/i3c/master/svc-i3c-master.c:393:7: note: Assuming field 'tbq_slo=
t' is non-null
                   if (master->ibi.tbq_slot) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/svc-i3c-master.c:393:3: note: Taking true branch
                   if (master->ibi.tbq_slot) {
                   ^
   drivers/i3c/master/svc-i3c-master.c:394:35: note: Passing null pointer v=
alue via 1st parameter 'dev'
                           data =3D i3c_dev_get_master_data(dev);
                                                          ^~~
   drivers/i3c/master/svc-i3c-master.c:394:11: note: Calling 'i3c_dev_get_m=
aster_data'
                           data =3D i3c_dev_get_master_data(dev);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i3c/master.h:557:9: note: Dereference of null pointer
           return dev->common.master_priv;
                  ^~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_dbgdev.c:773:2: warning: Value =
stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D 0;
           ^        ~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_dbgdev.c:773:2: note: Value sto=
red to 'status' is never read
           status =3D 0;
           ^        ~
   Suppressed 10 warnings (10 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mfd/max8997-irq.c:248:3: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   ret =3D max8997_read_reg(max8997->i2c, MAX8997_REG_FLASH=
STATUS,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/mfd/max8997-irq.c:248:3: note: Value stored to 'ret' is never re=
ad
                   ret =3D max8997_read_reg(max8997->i2c, MAX8997_REG_FLASH=
STATUS,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   5 warnings generated.
   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c:74:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c:74:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/bo_size +1405 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c

a46a2cd103a863 Felix Kuehling    2018-02-06  1364  =

a46a2cd103a863 Felix Kuehling    2018-02-06  1365  int amdgpu_amdkfd_gpuvm_=
map_memory_to_gpu(
b40a6ab2cf9213 Felix Kuehling    2021-04-07  1366  		struct kgd_dev *kgd, s=
truct kgd_mem *mem, void *drm_priv)
a46a2cd103a863 Felix Kuehling    2018-02-06  1367  {
a46a2cd103a863 Felix Kuehling    2018-02-06  1368  	struct amdgpu_device *a=
dev =3D get_amdgpu_device(kgd);
b40a6ab2cf9213 Felix Kuehling    2021-04-07  1369  	struct amdgpu_vm *avm =
=3D drm_priv_to_vm(drm_priv);
a46a2cd103a863 Felix Kuehling    2018-02-06  1370  	int ret;
a46a2cd103a863 Felix Kuehling    2018-02-06  1371  	struct amdgpu_bo *bo;
a46a2cd103a863 Felix Kuehling    2018-02-06  1372  	uint32_t domain;
c780b2eedbd0dd Felix Kuehling    2021-04-08  1373  	struct kfd_mem_attachme=
nt *entry;
a46a2cd103a863 Felix Kuehling    2018-02-06  1374  	struct bo_vm_reservatio=
n_context ctx;
c780b2eedbd0dd Felix Kuehling    2021-04-08  1375  	struct kfd_mem_attachme=
nt *attachment =3D NULL;
c780b2eedbd0dd Felix Kuehling    2021-04-08  1376  	struct kfd_mem_attachme=
nt *attachment_aql =3D NULL;
a46a2cd103a863 Felix Kuehling    2018-02-06  1377  	unsigned long bo_size;
5ae0283e831a94 Felix Kuehling    2018-03-23  1378  	bool is_invalid_userptr=
 =3D false;
a46a2cd103a863 Felix Kuehling    2018-02-06  1379  =

a46a2cd103a863 Felix Kuehling    2018-02-06  1380  	bo =3D mem->bo;
a46a2cd103a863 Felix Kuehling    2018-02-06  1381  	if (!bo) {
a46a2cd103a863 Felix Kuehling    2018-02-06  1382  		pr_err("Invalid BO whe=
n mapping memory to GPU\n");
5ae0283e831a94 Felix Kuehling    2018-03-23  1383  		return -EINVAL;
5ae0283e831a94 Felix Kuehling    2018-03-23  1384  	}
5ae0283e831a94 Felix Kuehling    2018-03-23  1385  =

5ae0283e831a94 Felix Kuehling    2018-03-23  1386  	/* Make sure restore is=
 not running concurrently. Since we
5ae0283e831a94 Felix Kuehling    2018-03-23  1387  	 * don't map invalid us=
erptr BOs, we rely on the next restore
5ae0283e831a94 Felix Kuehling    2018-03-23  1388  	 * worker to do the map=
ping
5ae0283e831a94 Felix Kuehling    2018-03-23  1389  	 */
5ae0283e831a94 Felix Kuehling    2018-03-23  1390  	mutex_lock(&mem->proces=
s_info->lock);
5ae0283e831a94 Felix Kuehling    2018-03-23  1391  =

5ae0283e831a94 Felix Kuehling    2018-03-23  1392  	/* Lock mmap-sem. If we=
 find an invalid userptr BO, we can be
5ae0283e831a94 Felix Kuehling    2018-03-23  1393  	 * sure that the MMU no=
tifier is no longer running
5ae0283e831a94 Felix Kuehling    2018-03-23  1394  	 * concurrently and the=
 queues are actually stopped
5ae0283e831a94 Felix Kuehling    2018-03-23  1395  	 */
5ae0283e831a94 Felix Kuehling    2018-03-23  1396  	if (amdgpu_ttm_tt_get_u=
sermm(bo->tbo.ttm)) {
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  1397  		mmap_write_lock(curren=
t->mm);
5ae0283e831a94 Felix Kuehling    2018-03-23  1398  		is_invalid_userptr =3D=
 atomic_read(&mem->invalid);
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  1399  		mmap_write_unlock(curr=
ent->mm);
a46a2cd103a863 Felix Kuehling    2018-02-06  1400  	}
a46a2cd103a863 Felix Kuehling    2018-02-06  1401  =

5ae0283e831a94 Felix Kuehling    2018-03-23  1402  	mutex_lock(&mem->lock);
5ae0283e831a94 Felix Kuehling    2018-03-23  1403  =

a46a2cd103a863 Felix Kuehling    2018-02-06  1404  	domain =3D mem->domain;
8c392cd5f1c638 Daniel Vetter     2020-12-14 @1405  	bo_size =3D bo->tbo.bas=
e.size;
a46a2cd103a863 Felix Kuehling    2018-02-06  1406  =

a46a2cd103a863 Felix Kuehling    2018-02-06  1407  	pr_debug("Map VA 0x%llx=
 - 0x%llx to vm %p domain %s\n",
a46a2cd103a863 Felix Kuehling    2018-02-06  1408  			mem->va,
a46a2cd103a863 Felix Kuehling    2018-02-06  1409  			mem->va + bo_size * (=
1 + mem->aql_queue),
b40a6ab2cf9213 Felix Kuehling    2021-04-07  1410  			avm, domain_string(do=
main));
a46a2cd103a863 Felix Kuehling    2018-02-06  1411  =

b40a6ab2cf9213 Felix Kuehling    2021-04-07  1412  	ret =3D reserve_bo_and_=
vm(mem, avm, &ctx);
a46a2cd103a863 Felix Kuehling    2018-02-06  1413  	if (unlikely(ret))
a46a2cd103a863 Felix Kuehling    2018-02-06  1414  		goto out;
a46a2cd103a863 Felix Kuehling    2018-02-06  1415  =

5ae0283e831a94 Felix Kuehling    2018-03-23  1416  	/* Userptr can be marke=
d as "not invalid", but not actually be
5ae0283e831a94 Felix Kuehling    2018-03-23  1417  	 * validated yet (still=
 in the system domain). In that case
5ae0283e831a94 Felix Kuehling    2018-03-23  1418  	 * the queues are still=
 stopped and we can leave mapping for
5ae0283e831a94 Felix Kuehling    2018-03-23  1419  	 * the next restore wor=
ker
5ae0283e831a94 Felix Kuehling    2018-03-23  1420  	 */
0f04e538580c08 Felix Kuehling    2018-05-03  1421  	if (amdgpu_ttm_tt_get_u=
sermm(bo->tbo.ttm) &&
0f04e538580c08 Felix Kuehling    2018-05-03  1422  	    bo->tbo.mem.mem_typ=
e =3D=3D TTM_PL_SYSTEM)
5ae0283e831a94 Felix Kuehling    2018-03-23  1423  		is_invalid_userptr =3D=
 true;
5ae0283e831a94 Felix Kuehling    2018-03-23  1424  =

c780b2eedbd0dd Felix Kuehling    2021-04-08  1425  	if (!kfd_mem_is_attache=
d(avm, mem)) {
c780b2eedbd0dd Felix Kuehling    2021-04-08  1426  		ret =3D kfd_mem_attach=
(adev, mem, avm, false, &attachment);
a46a2cd103a863 Felix Kuehling    2018-02-06  1427  		if (ret)
c780b2eedbd0dd Felix Kuehling    2021-04-08  1428  			goto attach_failed;
a46a2cd103a863 Felix Kuehling    2018-02-06  1429  		if (mem->aql_queue) {
c780b2eedbd0dd Felix Kuehling    2021-04-08  1430  			ret =3D kfd_mem_attac=
h(adev, mem, avm, true,
c780b2eedbd0dd Felix Kuehling    2021-04-08  1431  					     &attachment_aq=
l);
a46a2cd103a863 Felix Kuehling    2018-02-06  1432  			if (ret)
c780b2eedbd0dd Felix Kuehling    2021-04-08  1433  				goto attach_failed_a=
ql;
a46a2cd103a863 Felix Kuehling    2018-02-06  1434  		}
a46a2cd103a863 Felix Kuehling    2018-02-06  1435  	} else {
5b21d3e5fd2110 Felix Kuehling    2018-03-15  1436  		ret =3D vm_validate_pt=
_pd_bos(avm);
a46a2cd103a863 Felix Kuehling    2018-02-06  1437  		if (unlikely(ret))
c780b2eedbd0dd Felix Kuehling    2021-04-08  1438  			goto attach_failed;
a46a2cd103a863 Felix Kuehling    2018-02-06  1439  	}
a46a2cd103a863 Felix Kuehling    2018-02-06  1440  =

5ae0283e831a94 Felix Kuehling    2018-03-23  1441  	if (mem->mapped_to_gpu_=
memory =3D=3D 0 &&
5ae0283e831a94 Felix Kuehling    2018-03-23  1442  	    !amdgpu_ttm_tt_get_=
usermm(bo->tbo.ttm)) {
a46a2cd103a863 Felix Kuehling    2018-02-06  1443  		/* Validate BO only on=
ce. The eviction fence gets added to BO
a46a2cd103a863 Felix Kuehling    2018-02-06  1444  		 * the first time it i=
s mapped. Validate will wait for all
a46a2cd103a863 Felix Kuehling    2018-02-06  1445  		 * background eviction=
s to complete.
a46a2cd103a863 Felix Kuehling    2018-02-06  1446  		 */
a46a2cd103a863 Felix Kuehling    2018-02-06  1447  		ret =3D amdgpu_amdkfd_=
bo_validate(bo, domain, true);
a46a2cd103a863 Felix Kuehling    2018-02-06  1448  		if (ret) {
a46a2cd103a863 Felix Kuehling    2018-02-06  1449  			pr_debug("Validate fa=
iled\n");
a46a2cd103a863 Felix Kuehling    2018-02-06  1450  			goto map_bo_to_gpuvm_=
failed;
a46a2cd103a863 Felix Kuehling    2018-02-06  1451  		}
a46a2cd103a863 Felix Kuehling    2018-02-06  1452  	}
a46a2cd103a863 Felix Kuehling    2018-02-06  1453  =

c780b2eedbd0dd Felix Kuehling    2021-04-08  1454  	list_for_each_entry(ent=
ry, &mem->attachments, list) {
c780b2eedbd0dd Felix Kuehling    2021-04-08  1455  		if (entry->bo_va->base=
.vm !=3D avm || entry->is_mapped)
c780b2eedbd0dd Felix Kuehling    2021-04-08  1456  			continue;
c780b2eedbd0dd Felix Kuehling    2021-04-08  1457  =

a46a2cd103a863 Felix Kuehling    2018-02-06  1458  		pr_debug("\t map VA 0x=
%llx - 0x%llx in entry %p\n",
c780b2eedbd0dd Felix Kuehling    2021-04-08  1459  			 entry->va, entry->va=
 + bo_size, entry);
a46a2cd103a863 Felix Kuehling    2018-02-06  1460  =

5ae0283e831a94 Felix Kuehling    2018-03-23  1461  		ret =3D map_bo_to_gpuv=
m(adev, entry, ctx.sync,
5ae0283e831a94 Felix Kuehling    2018-03-23  1462  				      is_invalid_use=
rptr);
a46a2cd103a863 Felix Kuehling    2018-02-06  1463  		if (ret) {
0d87c9cfc08e15 Kent Russell      2019-05-01  1464  			pr_err("Failed to map=
 bo to gpuvm\n");
a46a2cd103a863 Felix Kuehling    2018-02-06  1465  			goto map_bo_to_gpuvm_=
failed;
a46a2cd103a863 Felix Kuehling    2018-02-06  1466  		}
a46a2cd103a863 Felix Kuehling    2018-02-06  1467  =

b40a6ab2cf9213 Felix Kuehling    2021-04-07  1468  		ret =3D vm_update_pds(=
avm, ctx.sync);
a46a2cd103a863 Felix Kuehling    2018-02-06  1469  		if (ret) {
a46a2cd103a863 Felix Kuehling    2018-02-06  1470  			pr_err("Failed to upd=
ate page directories\n");
a46a2cd103a863 Felix Kuehling    2018-02-06  1471  			goto map_bo_to_gpuvm_=
failed;
a46a2cd103a863 Felix Kuehling    2018-02-06  1472  		}
a46a2cd103a863 Felix Kuehling    2018-02-06  1473  =

a46a2cd103a863 Felix Kuehling    2018-02-06  1474  		entry->is_mapped =3D t=
rue;
a46a2cd103a863 Felix Kuehling    2018-02-06  1475  		mem->mapped_to_gpu_mem=
ory++;
a46a2cd103a863 Felix Kuehling    2018-02-06  1476  		pr_debug("\t INC mappi=
ng count %d\n",
a46a2cd103a863 Felix Kuehling    2018-02-06  1477  			 mem->mapped_to_gpu_m=
emory);
a46a2cd103a863 Felix Kuehling    2018-02-06  1478  	}
a46a2cd103a863 Felix Kuehling    2018-02-06  1479  =

4671078eb8e390 Christian K=C3=B6nig   2020-09-21  1480  	if (!amdgpu_ttm_tt=
_get_usermm(bo->tbo.ttm) && !bo->tbo.pin_count)
a46a2cd103a863 Felix Kuehling    2018-02-06  1481  		amdgpu_bo_fence(bo,
5b21d3e5fd2110 Felix Kuehling    2018-03-15  1482  				&avm->process_info->=
eviction_fence->base,
a46a2cd103a863 Felix Kuehling    2018-02-06  1483  				true);
a46a2cd103a863 Felix Kuehling    2018-02-06  1484  	ret =3D unreserve_bo_an=
d_vms(&ctx, false, false);
a46a2cd103a863 Felix Kuehling    2018-02-06  1485  =

a46a2cd103a863 Felix Kuehling    2018-02-06  1486  	goto out;
a46a2cd103a863 Felix Kuehling    2018-02-06  1487  =

a46a2cd103a863 Felix Kuehling    2018-02-06  1488  map_bo_to_gpuvm_failed:
c780b2eedbd0dd Felix Kuehling    2021-04-08  1489  	if (attachment_aql)
c780b2eedbd0dd Felix Kuehling    2021-04-08  1490  		kfd_mem_detach(attachm=
ent_aql);
c780b2eedbd0dd Felix Kuehling    2021-04-08  1491  attach_failed_aql:
c780b2eedbd0dd Felix Kuehling    2021-04-08  1492  	if (attachment)
c780b2eedbd0dd Felix Kuehling    2021-04-08  1493  		kfd_mem_detach(attachm=
ent);
c780b2eedbd0dd Felix Kuehling    2021-04-08  1494  attach_failed:
a46a2cd103a863 Felix Kuehling    2018-02-06  1495  	unreserve_bo_and_vms(&c=
tx, false, false);
a46a2cd103a863 Felix Kuehling    2018-02-06  1496  out:
a46a2cd103a863 Felix Kuehling    2018-02-06  1497  	mutex_unlock(&mem->proc=
ess_info->lock);
a46a2cd103a863 Felix Kuehling    2018-02-06  1498  	mutex_unlock(&mem->lock=
);
a46a2cd103a863 Felix Kuehling    2018-02-06  1499  	return ret;
a46a2cd103a863 Felix Kuehling    2018-02-06  1500  }
a46a2cd103a863 Felix Kuehling    2018-02-06  1501  =


:::::: The code at line 1405 was first introduced by commit
:::::: 8c392cd5f1c638f953ebf2c6f4baca9df9e699f4 drm/amdkfd: fix ttm size re=
factor fallout

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2296909812581691569==--

