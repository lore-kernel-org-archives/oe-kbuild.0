Content-Type: multipart/mixed; boundary="===============3259521103313436369=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2970/11953] drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2109:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Tue, 15 Mar 2022 13:31:34 +0800
Message-ID: <202203151308.VuOwt66a-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3259521103313436369==
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
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: 22f7cc7524081bb2bfb2720e43ab9889e2ed5b00 [2970/11953] drm/amdgpu: r=
estructure amdgpu_fill_buffer v2
:::::: branch date: 5 days ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-c006-20220310 (https://download.01.org/0day-ci/arc=
hive/20220315/202203151308.VuOwt66a-lkp(a)intel.com/config)
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
                                        ^  ~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:973:2: note: 'session_idx' initi=
alized to -1
           int session_idx =3D -1;
           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:980:9: note: Assuming 'idx' is <=
 field 'length_dw'
           while (idx < ib->length_dw) {
                  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:980:2: note: Loop condition is t=
rue.  Entering loop body
           while (idx < ib->length_dw) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:984:8: note: Assuming 'len' is >=
=3D 8
                   if ((len < 8) || (len & 3)) {
                        ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:984:7: note: Left side of '||' i=
s false
                   if ((len < 8) || (len & 3)) {
                       ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:984:21: note: Assuming the condi=
tion is false
                   if ((len < 8) || (len & 3)) {
                                     ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:984:3: note: Taking false branch
                   if ((len < 8) || (len & 3)) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:990:3: note: Control jumps to 'c=
ase 16777217:' @line 1001
                   switch (cmd) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1002:17: note: The result of the=
 left shift is undefined because the right operand is negative
                           created |=3D 1 << session_idx;
                                        ^  ~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1016:19: warning: The result of =
the left shift is undefined because the right operand is negative [clang-an=
alyzer-core.UndefinedBinaryOperatorResult]
                           destroyed |=3D 1 << session_idx;
                                          ^  ~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:973:2: note: 'session_idx' initi=
alized to -1
           int session_idx =3D -1;
           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:980:9: note: Assuming 'idx' is <=
 field 'length_dw'
           while (idx < ib->length_dw) {
                  ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:980:2: note: Loop condition is t=
rue.  Entering loop body
           while (idx < ib->length_dw) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:984:8: note: Assuming 'len' is >=
=3D 8
                   if ((len < 8) || (len & 3)) {
                        ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:984:7: note: Left side of '||' i=
s false
                   if ((len < 8) || (len & 3)) {
                       ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:984:21: note: Assuming the condi=
tion is false
                   if ((len < 8) || (len & 3)) {
                                     ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:984:3: note: Taking false branch
                   if ((len < 8) || (len & 3)) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:990:3: note: Control jumps to 'c=
ase 33554433:' @line 1015
                   switch (cmd) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:1016:19: note: The result of the=
 left shift is undefined because the right operand is negative
                           destroyed |=3D 1 << session_idx;
                                          ^  ~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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

22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2062  =

22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2063  int amdgpu_fill_buff=
er(struct amdgpu_bo *bo,
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2064  			uint32_t src_data,
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2065  			struct dma_resv *=
resv,
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2066  			struct dma_fence =
**f)
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2067  {
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2068  	struct amdgpu_devic=
e *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2069  	struct amdgpu_ring =
*ring =3D adev->mman.buffer_funcs_ring;
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2070  	struct dma_fence *f=
ence =3D NULL;
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2071  	struct amdgpu_res_c=
ursor dst;
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2072  	int r;
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2073  =

22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2074  	if (!adev->mman.buf=
fer_funcs_enabled) {
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2075  		DRM_ERROR("Trying =
to clear memory with ring turned off.\n");
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2076  		return -EINVAL;
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2077  	}
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2078  =

22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2079  	amdgpu_res_first(bo=
->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2080  =

22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2081  	mutex_lock(&adev->m=
man.gtt_window_lock);
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2082  	while (dst.remainin=
g) {
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2083  		struct dma_fence *=
next;
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2084  		uint64_t cur_size,=
 to;
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2085  =

22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2086  		/* Never fill more=
 than 256MiB at once to avoid timeouts */
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2087  		cur_size =3D min(d=
st.size, 256ULL << 20);
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2088  =

22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2089  		r =3D amdgpu_ttm_m=
ap_buffer(&bo->tbo, bo->tbo.resource, &dst,
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2090  					  1, ring, fals=
e, &cur_size, &to);
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2091  		if (r)
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2092  			goto error;
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2093  =

22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2094  		r =3D amdgpu_ttm_f=
ill_mem(ring, src_data, to, cur_size, resv,
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2095  					&next, true);
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2096  		if (r)
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2097  			goto error;
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2098  =

22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2099  		dma_fence_put(fenc=
e);
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2100  		fence =3D next;
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2101  =

22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2102  		amdgpu_res_next(&d=
st, cur_size);
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2103  	}
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2104  error:
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2105  	mutex_unlock(&adev-=
>mman.gtt_window_lock);
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2106  	if (f)
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2107  		*f =3D dma_fence_g=
et(fence);
22f7cc7524081bb Christian K=C3=B6nig 2022-01-28  2108  	dma_fence_put(fence=
);
59b4a97742888d9 Flora Cui       2016-07-19 @2109  	return r;
59b4a97742888d9 Flora Cui       2016-07-19  2110  }
59b4a97742888d9 Flora Cui       2016-07-19  2111  =


:::::: The code at line 2109 was first introduced by commit
:::::: 59b4a97742888d9d3c4daa96bd15157ebd496f81 drm/amdgpu: implement amdgp=
u_fill_buffer()

:::::: TO: Flora Cui <Flora.Cui@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3259521103313436369==--

