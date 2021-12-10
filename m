Content-Type: multipart/mixed; boundary="===============7545437346421755084=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:1405:2: warning: Value stored to 'bo_size' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 10 Dec 2021 10:53:24 +0800
Message-ID: <202112101052.xYHuOcIv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7545437346421755084==
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
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c007-20211208 (https://download.01.org/0day-ci/ar=
chive/20211210/202112101052.xYHuOcIv-lkp(a)intel.com/config)
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
   drivers/base/core.c:2561:17: note: Passing null pointer value via 1st pa=
rameter 'list'
           list_move_tail(&deva->kobj.entry, &devb->kobj.entry);
                          ^~~~~~~~~~~~~~~~~
   drivers/base/core.c:2561:2: note: Calling 'list_move_tail'
           list_move_tail(&deva->kobj.entry, &devb->kobj.entry);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:227:19: note: Passing null pointer value via 1st pa=
rameter 'entry'
           __list_del_entry(list);
                            ^~~~
   include/linux/list.h:227:2: note: Calling '__list_del_entry'
           __list_del_entry(list);
           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:135:13: note: Access to field 'prev' results in a d=
ereference of a null pointer (loaded from variable 'entry')
           __list_del(entry->prev, entry->next);
                      ^~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/usb/gadget/udc/udc-xilinx.c:632:3: warning: Value stored to 'buf=
ferspace' is never read [clang-analyzer-deadcode.DeadStores]
                   bufferspace -=3D count;
                   ^              ~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:632:3: note: Value stored to 'buffer=
space' is never read
                   bufferspace -=3D count;
                   ^              ~~~~~
   drivers/usb/gadget/udc/udc-xilinx.c:1136:19: warning: Value stored to 'r=
eq' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xusb_req *req    =3D to_xusb_req(_req);
                            ^~~
   drivers/usb/gadget/udc/udc-xilinx.c:1136:19: note: Value stored to 'req'=
 during its initialization is never read
           struct xusb_req *req    =3D to_xusb_req(_req);
                            ^~~
   Suppressed 2 warnings (2 in non-user code).
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
   10 warnings generated.
   drivers/usb/gadget/udc/bdc/bdc_ep.c:224:17: warning: Although the value =
stored to 'dma_last_bd' is used in the enclosing expression, the value is n=
ever actually read from 'dma_last_bd' [clang-analyzer-deadcode.DeadStores]
           dma_first_bd =3D dma_last_bd =3D 0;
                          ^             ~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:224:17: note: Although the value sto=
red to 'dma_last_bd' is used in the enclosing expression, the value is neve=
r actually read from 'dma_last_bd'
           dma_first_bd =3D dma_last_bd =3D 0;
                          ^             ~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:296:2: warning: Value stored to 'ava=
ilable1' is never read [clang-analyzer-deadcode.DeadStores]
           available1 =3D available2 =3D chain_bd1 =3D chain_bd2 =3D 0;
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:296:2: note: Value stored to 'availa=
ble1' is never read
           available1 =3D available2 =3D chain_bd1 =3D chain_bd2 =3D 0;
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:296:15: warning: Although the value =
stored to 'available2' is used in the enclosing expression, the value is ne=
ver actually read from 'available2' [clang-analyzer-deadcode.DeadStores]
           available1 =3D available2 =3D chain_bd1 =3D chain_bd2 =3D 0;
                        ^            ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:296:15: note: Although the value sto=
red to 'available2' is used in the enclosing expression, the value is never=
 actually read from 'available2'
           available1 =3D available2 =3D chain_bd1 =3D chain_bd2 =3D 0;
                        ^            ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:296:28: warning: Although the value =
stored to 'chain_bd1' is used in the enclosing expression, the value is nev=
er actually read from 'chain_bd1' [clang-analyzer-deadcode.DeadStores]
           available1 =3D available2 =3D chain_bd1 =3D chain_bd2 =3D 0;
                                     ^           ~~~~~~~~~~~~~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:296:28: note: Although the value sto=
red to 'chain_bd1' is used in the enclosing expression, the value is never =
actually read from 'chain_bd1'
           available1 =3D available2 =3D chain_bd1 =3D chain_bd2 =3D 0;
                                     ^           ~~~~~~~~~~~~~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:296:40: warning: Although the value =
stored to 'chain_bd2' is used in the enclosing expression, the value is nev=
er actually read from 'chain_bd2' [clang-analyzer-deadcode.DeadStores]
           available1 =3D available2 =3D chain_bd1 =3D chain_bd2 =3D 0;
                                                 ^           ~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:296:40: note: Although the value sto=
red to 'chain_bd2' is used in the enclosing expression, the value is never =
actually read from 'chain_bd2'
           available1 =3D available2 =3D chain_bd1 =3D chain_bd2 =3D 0;
                                                 ^           ~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:564:2: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:564:2: note: Value stored to 'ret' i=
s never read
           ret =3D 0;
           ^     ~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:568:2: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D bdc_stop_ep(bdc, ep->ep_num);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/bdc/bdc_ep.c:568:2: note: Value stored to 'ret' i=
s never read
           ret =3D bdc_stop_ep(bdc, ep->ep_num);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
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
   lib/rhashtable.c:792:21: warning: Value stored to 'p' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           struct rhash_head *p =3D iter->p;
                              ^   ~~~~~~~
   lib/rhashtable.c:792:21: note: Value stored to 'p' during its initializa=
tion is never read
           struct rhash_head *p =3D iter->p;
                              ^   ~~~~~~~
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
   10 warnings generated.
   drivers/regulator/core.c:3693:3: warning: Value stored to 'possible_uV' =
is never read [clang-analyzer-deadcode.DeadStores]
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   drivers/regulator/core.c:3693:3: note: Value stored to 'possible_uV' is =
never read
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
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
--===============7545437346421755084==--

