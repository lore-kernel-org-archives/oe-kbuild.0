Content-Type: multipart/mixed; boundary="===============4103577309130669039=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3104/4901] drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2109:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Thu, 10 Feb 2022 18:02:18 +0800
Message-ID: <202202101827.kNms5A9c-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4103577309130669039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Felix Kuehling <Felix.Kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   395a61741f7ea29e1f4a0d6e160197fe8e377572
commit: 22f7cc7524081bb2bfb2720e43ab9889e2ed5b00 [3104/4901] drm/amdgpu: re=
structure amdgpu_fill_buffer v2
:::::: branch date: 2 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20220210 (https://download.01.org/0day-ci/arc=
hive/20220210/202202101827.kNms5A9c-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa845d=
7a245d85c441d0bd44fc7b6c3be8f3de8d)
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
           if (CONFIG_NOUVEAU_DEBUG >=3D (l) && _subdev->debug >=3D (l))   =
           \
                                              ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:151:2: note: Taking false =
branch
           OUTP_TRACE(&dp->outp, "training pattern %d", pattern);
           ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h:55:30: note: expanded fr=
om macro 'OUTP_TRACE'
   #define OUTP_TRACE(o,f,a...) OUTP_MSG((o), trace, f, ##a)
                                ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h:50:2: note: expanded fro=
m macro 'OUTP_MSG'
           nvkm_##l(&_outp->disp->engine.subdev, "outp %02x:%04x:%04x: "f"\=
n",    \
           ^
   note: expanded from here
   drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:63:30: note: expanded=
 from macro 'nvkm_trace'
   #define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,   info, f, ##a)
                                ^
   drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:57:35: note: expanded=
 from macro 'nvkm_printk'
   #define nvkm_printk(s,l,p,f,a...) nvkm_printk_((s), NV_DBG_##l, p, f, ##=
a)
                                     ^
   drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:54:2: note: expanded =
from macro 'nvkm_printk_'
           if (CONFIG_NOUVEAU_DEBUG >=3D (l) && _subdev->debug >=3D (l))   =
           \
           ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:151:2: note: Loop conditio=
n is false.  Exiting loop
           OUTP_TRACE(&dp->outp, "training pattern %d", pattern);
           ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h:55:30: note: expanded fr=
om macro 'OUTP_TRACE'
   #define OUTP_TRACE(o,f,a...) OUTP_MSG((o), trace, f, ##a)
                                ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h:50:2: note: expanded fro=
m macro 'OUTP_MSG'
           nvkm_##l(&_outp->disp->engine.subdev, "outp %02x:%04x:%04x: "f"\=
n",    \
           ^
   note: expanded from here
   drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:63:30: note: expanded=
 from macro 'nvkm_trace'
   #define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,   info, f, ##a)
                                ^
   drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:57:35: note: expanded=
 from macro 'nvkm_printk'
   #define nvkm_printk(s,l,p,f,a...) nvkm_printk_((s), NV_DBG_##l, p, f, ##=
a)
                                     ^
   drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:52:36: note: expanded=
 from macro 'nvkm_printk_'
   #define nvkm_printk_(s,l,p,f,a...) do {                                 =
       \
                                      ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:151:2: note: Loop conditio=
n is false.  Exiting loop
           OUTP_TRACE(&dp->outp, "training pattern %d", pattern);
           ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h:55:30: note: expanded fr=
om macro 'OUTP_TRACE'
   #define OUTP_TRACE(o,f,a...) OUTP_MSG((o), trace, f, ##a)
                                ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h:48:30: note: expanded fr=
om macro 'OUTP_MSG'
   #define OUTP_MSG(o,l,f,a...) do {                                       =
       \
                                ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:154:2: note: Calling 'nvkm=
_rdaux'
           nvkm_rdaux(dp->aux, DPCD_LC02, &sink_tp, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h:171:6: note: Assuming =
'ret' is not equal to 0
           if (ret =3D=3D 0) {
               ^~~~~~~~
   drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h:171:2: note: Taking fa=
lse branch
           if (ret =3D=3D 0) {
           ^
   drivers/gpu/drm/nouveau/include/nvkm/subdev/i2c.h:176:2: note: Returning=
 without writing to '*data'
           return ret;
           ^
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:154:2: note: Returning fro=
m 'nvkm_rdaux'
           nvkm_rdaux(dp->aux, DPCD_LC02, &sink_tp, 1);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:155:10: note: The left exp=
ression of the compound assignment is an uninitialized value. The computed =
value will also be garbage
           sink_tp &=3D ~DPCD_LC02_TRAINING_PATTERN_SET;
           ~~~~~~~ ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
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
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4103577309130669039==--

