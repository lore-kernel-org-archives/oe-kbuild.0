Content-Type: multipart/mixed; boundary="===============8982062621191354244=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2939/13576] drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2109:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sun, 20 Mar 2022 22:51:27 +0800
Message-ID: <202203202242.yzVcezyu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8982062621191354244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Felix Kuehling <Felix.Kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6d72dda014a4753974eb08950089ddf71fec4f60
commit: 22f7cc7524081bb2bfb2720e43ab9889e2ed5b00 [2939/13576] drm/amdgpu: r=
estructure amdgpu_fill_buffer v2
:::::: branch date: 2 days ago
:::::: commit date: 7 weeks ago
config: riscv-randconfig-c006-20220310 (https://download.01.org/0day-ci/arc=
hive/20220320/202203202242.yzVcezyu-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D22f7cc7524081bb2bfb2720e43ab9889e2ed5b00
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 22f7cc7524081bb2bfb2720e43ab9889e2ed5b00
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/media/cec/core/cec-adap.c:921:2: note: Taking true branch
           if (!data->completed)
           ^
   drivers/media/cec/core/cec-adap.c:922:3: note: Calling 'cec_data_cancel'
                   cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:378:6: note: Assuming 'data' is equal =
to field 'transmitting'
           if (data->adap->transmitting =3D=3D data) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:378:2: note: Taking true branch
           if (data->adap->transmitting =3D=3D data) {
           ^
   drivers/media/cec/core/cec-adap.c:387:6: note: Assuming the condition is=
 true
           if (data->msg.tx_status & CEC_TX_STATUS_OK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:387:2: note: Taking true branch
           if (data->msg.tx_status & CEC_TX_STATUS_OK) {
           ^
   drivers/media/cec/core/cec-adap.c:401:2: note: Calling 'cec_data_complet=
ed'
           cec_data_completed(data);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:344:6: note: Assuming field 'fh' is nu=
ll
           if (data->fh)
               ^~~~~~~~
   drivers/media/cec/core/cec-adap.c:344:2: note: Taking false branch
           if (data->fh)
           ^
   drivers/media/cec/core/cec-adap.c:347:6: note: Assuming field 'blocking'=
 is false
           if (data->blocking) {
               ^~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:347:2: note: Taking false branch
           if (data->blocking) {
           ^
   drivers/media/cec/core/cec-adap.c:359:13: note: Field 'fh' is null
                   if (data->fh)
                             ^
   drivers/media/cec/core/cec-adap.c:359:3: note: Taking false branch
                   if (data->fh)
                   ^
   drivers/media/cec/core/cec-adap.c:361:3: note: Memory is released
                   kfree(data);
                   ^~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:401:2: note: Returning; memory was rel=
eased via 1st parameter
           cec_data_completed(data);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:922:3: note: Returning; memory was rel=
eased via 1st parameter
                   cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:925:9: note: Use of memory after it is=
 freed
           *msg =3D data->msg;
                  ^~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
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
   drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c:62:17: warning: Although the value=
 stored to 'hdp_clk_cntl1' is used in the enclosing expression, the value i=
s never actually read from 'hdp_clk_cntl1' [clang-analyzer-deadcode.DeadSto=
res]
           hdp_clk_cntl =3D hdp_clk_cntl1 =3D RREG32_SOC15(HDP, 0, mmHDP_CL=
K_CNTL);
                          ^
   drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c:62:17: note: Although the value st=
ored to 'hdp_clk_cntl1' is used in the enclosing expression, the value is n=
ever actually read from 'hdp_clk_cntl1'
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/gpu/drm/amd/amdgpu/atom.c:960:2: warning: Value stored to 'dst' =
is never read [clang-analyzer-deadcode.DeadStores]
           dst =3D atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:960:2: note: Value stored to 'dst' is =
never read
           dst =3D atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:979:2: warning: Value stored to 'dst' =
is never read [clang-analyzer-deadcode.DeadStores]
           dst =3D atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:979:2: note: Value stored to 'dst' is =
never read
           dst =3D atom_get_dst(ctx, arg, attr, ptr, &saved, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/atom.c:1386:2: warning: Value stored to 'str_=
off' is never read [clang-analyzer-deadcode.DeadStores]
           str_off =3D 0;
           ^         ~
   drivers/gpu/drm/amd/amdgpu/atom.c:1386:2: note: Value stored to 'str_off=
' is never read
           str_off =3D 0;
           ^         ~
   drivers/gpu/drm/amd/amdgpu/atom.c:1409:2: warning: Value stored to 'off_=
to_vbios_str' is never read [clang-analyzer-deadcode.DeadStores]
           off_to_vbios_str =3D 0;
           ^                  ~
   drivers/gpu/drm/amd/amdgpu/atom.c:1409:2: note: Value stored to 'off_to_=
vbios_str' is never read
           off_to_vbios_str =3D 0;
           ^                  ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2109:2: warning: Undefined or ga=
rbage value returned to caller [clang-analyzer-core.uninitialized.UndefRetu=
rn]
           return r;
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:460:6: note: Assuming field 'mem=
_type' is not equal to TTM_PL_TT
           if (new_mem->mem_type =3D=3D TTM_PL_TT ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:460:6: note: Left side of '||' i=
s false
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:461:6: note: Assuming the condit=
ion is false
               new_mem->mem_type =3D=3D AMDGPU_PL_PREEMPT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:460:2: note: Taking false branch
           if (new_mem->mem_type =3D=3D TTM_PL_TT ||
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:469:19: note: Assuming field 'pi=
n_count' is <=3D 0
           if (WARN_ON_ONCE(abo->tbo.pin_count > 0))
                            ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:469:2: note: Taking false branch
           if (WARN_ON_ONCE(abo->tbo.pin_count > 0))
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:474:6: note: Assuming field 'mem=
_type' is not equal to TTM_PL_SYSTEM
           if (old_mem->mem_type =3D=3D TTM_PL_SYSTEM && bo->ttm =3D=3D NUL=
L) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:474:41: note: Left side of '&&' =
is false
           if (old_mem->mem_type =3D=3D TTM_PL_SYSTEM && bo->ttm =3D=3D NUL=
L) {
                                                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:478:15: note: Field 'mem_type' i=
s not equal to TTM_PL_SYSTEM
           if (old_mem->mem_type =3D=3D TTM_PL_SYSTEM &&
                        ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:478:41: note: Left side of '&&' =
is false
           if (old_mem->mem_type =3D=3D TTM_PL_SYSTEM &&
                                                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:484:7: note: Assuming field 'mem=
_type' is not equal to TTM_PL_TT
           if ((old_mem->mem_type =3D=3D TTM_PL_TT ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:484:7: note: Left side of '||' i=
s false
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:485:7: note: Assuming the condit=
ion is false
                old_mem->mem_type =3D=3D AMDGPU_PL_PREEMPT) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:485:47: note: Left side of '&&' =
is false
                old_mem->mem_type =3D=3D AMDGPU_PL_PREEMPT) &&
                                                        ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:497:6: note: Assuming the condit=
ion is false
           if (old_mem->mem_type =3D=3D AMDGPU_PL_GDS ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:497:6: note: Left side of '||' i=
s false
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:498:6: note: Assuming the condit=
ion is false
               old_mem->mem_type =3D=3D AMDGPU_PL_GWS ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:497:6: note: Left side of '||' i=
s false
           if (old_mem->mem_type =3D=3D AMDGPU_PL_GDS ||
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:499:6: note: Assuming the condit=
ion is false
               old_mem->mem_type =3D=3D AMDGPU_PL_OA ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:497:6: note: Left side of '||' i=
s false
           if (old_mem->mem_type =3D=3D AMDGPU_PL_GDS ||
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:500:6: note: Assuming the condit=
ion is false
               new_mem->mem_type =3D=3D AMDGPU_PL_GDS ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:497:6: note: Left side of '||' i=
s false
           if (old_mem->mem_type =3D=3D AMDGPU_PL_GDS ||
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:501:6: note: Assuming the condit=
ion is false
               new_mem->mem_type =3D=3D AMDGPU_PL_GWS ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:497:6: note: Left side of '||' i=
s false
           if (old_mem->mem_type =3D=3D AMDGPU_PL_GDS ||
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:502:6: note: Assuming the condit=
ion is false
               new_mem->mem_type =3D=3D AMDGPU_PL_OA) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:497:2: note: Taking false branch
           if (old_mem->mem_type =3D=3D AMDGPU_PL_GDS ||
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:508:6: note: Assuming field 'typ=
e' is not equal to ttm_bo_type_device
           if (bo->type =3D=3D ttm_bo_type_device &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:508:37: note: Left side of '&&' =
is false
           if (bo->type =3D=3D ttm_bo_type_device &&
                                              ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:517:6: note: Assuming field 'buf=
fer_funcs_enabled' is true
           if (adev->mman.buffer_funcs_enabled) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:517:2: note: Taking true branch
           if (adev->mman.buffer_funcs_enabled) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:518:18: note: Field 'mem_type' i=
s not equal to TTM_PL_SYSTEM
                   if (((old_mem->mem_type =3D=3D TTM_PL_SYSTEM &&
                                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:518:44: note: Left side of '&&' =
is false
                   if (((old_mem->mem_type =3D=3D TTM_PL_SYSTEM &&
                                                            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:520:9: note: Assuming field 'mem=
_type' is not equal to TTM_PL_VRAM
                        (old_mem->mem_type =3D=3D TTM_PL_VRAM &&

vim +2109 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2062  =

22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2063  int amdgpu_fill_buffe=
r(struct amdgpu_bo *bo,
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2064  			uint32_t src_data,
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2065  			struct dma_resv *r=
esv,
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2066  			struct dma_fence *=
*f)
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2067  {
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2068  	struct amdgpu_device=
 *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2069  	struct amdgpu_ring *=
ring =3D adev->mman.buffer_funcs_ring;
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2070  	struct dma_fence *fe=
nce =3D NULL;
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2071  	struct amdgpu_res_cu=
rsor dst;
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2072  	int r;
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2073  =

22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2074  	if (!adev->mman.buff=
er_funcs_enabled) {
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2075  		DRM_ERROR("Trying t=
o clear memory with ring turned off.\n");
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2076  		return -EINVAL;
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2077  	}
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2078  =

22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2079  	amdgpu_res_first(bo-=
>tbo.resource, 0, amdgpu_bo_size(bo), &dst);
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2080  =

22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2081  	mutex_lock(&adev->mm=
an.gtt_window_lock);
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2082  	while (dst.remaining=
) {
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2083  		struct dma_fence *n=
ext;
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2084  		uint64_t cur_size, =
to;
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2085  =

22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2086  		/* Never fill more =
than 256MiB at once to avoid timeouts */
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2087  		cur_size =3D min(ds=
t.size, 256ULL << 20);
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2088  =

22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2089  		r =3D amdgpu_ttm_ma=
p_buffer(&bo->tbo, bo->tbo.resource, &dst,
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2090  					  1, ring, false=
, &cur_size, &to);
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2091  		if (r)
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2092  			goto error;
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2093  =

22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2094  		r =3D amdgpu_ttm_fi=
ll_mem(ring, src_data, to, cur_size, resv,
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2095  					&next, true);
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2096  		if (r)
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2097  			goto error;
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2098  =

22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2099  		dma_fence_put(fence=
);
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2100  		fence =3D next;
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2101  =

22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2102  		amdgpu_res_next(&ds=
t, cur_size);
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2103  	}
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2104  error:
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2105  	mutex_unlock(&adev->=
mman.gtt_window_lock);
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2106  	if (f)
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2107  		*f =3D dma_fence_ge=
t(fence);
22f7cc7524081b Christian K=C3=B6nig 2022-01-28  2108  	dma_fence_put(fence);
59b4a97742888d Flora Cui       2016-07-19 @2109  	return r;
59b4a97742888d Flora Cui       2016-07-19  2110  }
59b4a97742888d Flora Cui       2016-07-19  2111  =


:::::: The code at line 2109 was first introduced by commit
:::::: 59b4a97742888d9d3c4daa96bd15157ebd496f81 drm/amdgpu: implement amdgp=
u_fill_buffer()

:::::: TO: Flora Cui <Flora.Cui@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8982062621191354244==--

