Content-Type: multipart/mixed; boundary="===============6808708178309253983=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-linux-intel-lts:5.10/yocto 2361/2740] drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2311:2: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Mon, 23 Aug 2021 08:12:31 +0800
Message-ID: <202108230825.bhGokdxW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6808708178309253983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Junxiao Chang <junxiao.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   d75bc4fd519e80cd379997651b77218cb949ecf7
commit: 6bf890b1629e2a0821448f2c94b20438a1703c3a [2361/2740] drm/amdgpu: Us=
e delayed work to collect RAS error counters
:::::: branch date: 6 weeks ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20210822 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a83d99=
c55ebb14532c414066a5aa3bdb65389965)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel/linux-intel-lts/commit/6bf890b1629e2a082=
1448f2c94b20438a1703c3a
        git remote add intel-linux-intel-lts https://github.com/intel/linux=
-intel-lts.git
        git fetch --no-tags intel-linux-intel-lts 5.10/yocto
        git checkout 6bf890b1629e2a0821448f2c94b20438a1703c3a
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   crypto/drbg.c:244:17: warning: Value stored to 'entropylen' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned short entropylen =3D drbg_sec_strength(drbg->core->flag=
s);
                          ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/drbg.c:244:17: note: Value stored to 'entropylen' during its init=
ialization is never read
           unsigned short entropylen =3D drbg_sec_strength(drbg->core->flag=
s);
                          ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:842:3: warning: Value stored to '=
tmp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:842:3: note: Value stored to 'tmp=
' is never read
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
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
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   11 warnings generated.
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:397:7: warning: Value stored to=
 'is_hi_req' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           bool is_hi_req =3D pstate =3D=3D AMDGPU_XGMI_PSTATE_MAX_VEGA20;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:397:7: note: Value stored to 'i=
s_hi_req' during its initialization is never read
           bool is_hi_req =3D pstate =3D=3D AMDGPU_XGMI_PSTATE_MAX_VEGA20;
                ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:404:2: warning: Value stored to=
 'request_adev' is never read [clang-analyzer-deadcode.DeadStores]
           request_adev =3D hive->hi_req_gpu ? hive->hi_req_gpu : adev;
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:404:2: note: Value stored to 'r=
equest_adev' is never read
           request_adev =3D hive->hi_req_gpu ? hive->hi_req_gpu : adev;
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:405:2: warning: Value stored to=
 'init_low' is never read [clang-analyzer-deadcode.DeadStores]
           init_low =3D hive->pstate =3D=3D AMDGPU_XGMI_PSTATE_UNKNOWN;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:405:2: note: Value stored to 'i=
nit_low' is never read
           init_low =3D hive->pstate =3D=3D AMDGPU_XGMI_PSTATE_UNKNOWN;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:792:3: warning: Call to function=
 'strcpy' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureA=
PI.strcpy]
                   strcpy(head.name, ras_block_str(i));
                   ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:792:3: note: Call to function 's=
trcpy' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcpy'. CWE-119
                   strcpy(head.name, ras_block_str(i));
                   ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1957:3: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1957:3: note: Value stored to 'r=
et' is never read
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2311:2: warning: Assigned value =
is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           atomic_set(&con->ras_ce_count, ce_count);
           ^
   arch/arm/include/asm/atomic.h:26:25: note: expanded from macro 'atomic_s=
et'
   #define atomic_set(v,i) WRITE_ONCE(((v)->counter), (i))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                       ^ ~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2267:26: note: 'ce_count' declar=
ed without an initial value
           unsigned long ue_count, ce_count;
                                   ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2271:7: note: Calling 'amdgpu_ra=
s_is_supported'
           if (!amdgpu_ras_is_supported(adev, ras_block->block)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ras.h:481:6: note: Assuming =
'block' is < AMDGPU_RAS_BLOCK__LAST
           if (block >=3D AMDGPU_RAS_BLOCK_COUNT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ras.h:481:2: note: Taking fa=
lse branch
           if (block >=3D AMDGPU_RAS_BLOCK_COUNT)
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ras.h:483:9: note: Assuming =
'ras' is non-null, which participates in a condition later
           return ras && (adev->ras_enabled & (1 << block));
                  ^~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ras.h:483:9: note: Left side=
 of '&&' is true
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ras.h:483:2: note: Returning=
 without writing to 'adev->psp.ras.ras', which participates in a condition =
later
           return ras && (adev->ras_enabled & (1 << block));
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ras.h:483:2: note: Returning=
 without writing to 'adev->in_suspend', which participates in a condition l=
ater
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_ras.h:483:2: note: Returning=
 value, which participates in a condition later
           return ras && (adev->ras_enabled & (1 << block));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2271:7: note: Returning from 'am=
dgpu_ras_is_supported'
           if (!amdgpu_ras_is_supported(adev, ras_block->block)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2271:6: note: Assuming the condi=
tion is false
           if (!amdgpu_ras_is_supported(adev, ras_block->block)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2271:2: note: Taking false branch
           if (!amdgpu_ras_is_supported(adev, ras_block->block)) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2276:6: note: Calling 'amdgpu_ra=
s_feature_enable_on_boot'
           r =3D amdgpu_ras_feature_enable_on_boot(adev, ras_block, 1);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:710:7: note: 'con' is non-null, =
which participates in a condition later
           if (!con)
                ^~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:710:2: note: Taking false branch
           if (!con)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:713:6: note: Assuming the condit=
ion is true
           if (con->flags & AMDGPU_RAS_FLAG_INIT_BY_VBIOS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:713:2: note: Taking true branch
           if (con->flags & AMDGPU_RAS_FLAG_INIT_BY_VBIOS) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:714:7: note: 'enable' is true
                   if (enable) {
                       ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:714:3: note: Taking true branch
                   if (enable) {
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:726:8: note: Assuming the condit=
ion is false
                           if (ret =3D=3D -EINVAL) {
                               ^~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:726:4: note: Taking false branch
                           if (ret =3D=3D -EINVAL) {
                           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:752:2: note: Returning value (lo=
aded from 'ret'), which participates in a condition later
           return ret;
           ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2276:6: note: Returning from 'am=
dgpu_ras_feature_enable_on_boot'
           r =3D amdgpu_ras_feature_enable_on_boot(adev, ras_block, 1);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2277:6: note: Assuming 'r' is 0
           if (r) {
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2277:2: note: Taking false branch
           if (r) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2292:2: note: Calling 'amdgpu_pe=
rsistent_edc_harvesting'
           amdgpu_persistent_edc_harvesting(adev, ras_block);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2248:2: note: Taking false branch
           if (!amdgpu_persistent_edc_harvesting_supported(adev))
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2251:6: note: Value assigned to =
field 'in_suspend', which participates in a condition later
           if (amdgpu_ras_query_error_status(adev, &info) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2251:6: note: Assuming the condi=
tion is false
           if (amdgpu_ras_query_error_status(adev, &info) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2251:2: note: Taking false branch
           if (amdgpu_ras_query_error_status(adev, &info) !=3D 0)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2254:6: note: Calling 'amdgpu_ra=
s_reset_error_status'
           if (amdgpu_ras_reset_error_status(adev, ras_block->block) !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +2311 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c

56d08d57eea886 John Clements 2021-03-25  2259  =

b293e891b05701 Hawking Zhang 2019-08-30  2260  /* helper function to handle=
 common stuff in ip late init phase */
b293e891b05701 Hawking Zhang 2019-08-30  2261  int amdgpu_ras_late_init(str=
uct amdgpu_device *adev,
b293e891b05701 Hawking Zhang 2019-08-30  2262  			 struct ras_common_if *ra=
s_block,
b293e891b05701 Hawking Zhang 2019-08-30  2263  			 struct ras_fs_if *fs_inf=
o,
b293e891b05701 Hawking Zhang 2019-08-30  2264  			 struct ras_ih_if *ih_inf=
o)
b293e891b05701 Hawking Zhang 2019-08-30  2265  {
6bf890b1629e2a Luben Tuikov  2021-05-21  2266  	struct amdgpu_ras *con =3D =
amdgpu_ras_get_context(adev);
6bf890b1629e2a Luben Tuikov  2021-05-21  2267  	unsigned long ue_count, ce_=
count;
b293e891b05701 Hawking Zhang 2019-08-30  2268  	int r;
b293e891b05701 Hawking Zhang 2019-08-30  2269  =

b293e891b05701 Hawking Zhang 2019-08-30  2270  	/* disable RAS feature per =
IP block if it is not supported */
b293e891b05701 Hawking Zhang 2019-08-30  2271  	if (!amdgpu_ras_is_supporte=
d(adev, ras_block->block)) {
b293e891b05701 Hawking Zhang 2019-08-30  2272  		amdgpu_ras_feature_enable_=
on_boot(adev, ras_block, 0);
b293e891b05701 Hawking Zhang 2019-08-30  2273  		return 0;
b293e891b05701 Hawking Zhang 2019-08-30  2274  	}
b293e891b05701 Hawking Zhang 2019-08-30  2275  =

b293e891b05701 Hawking Zhang 2019-08-30  2276  	r =3D amdgpu_ras_feature_en=
able_on_boot(adev, ras_block, 1);
b293e891b05701 Hawking Zhang 2019-08-30  2277  	if (r) {
b293e891b05701 Hawking Zhang 2019-08-30  2278  		if (r =3D=3D -EAGAIN) {
b293e891b05701 Hawking Zhang 2019-08-30  2279  			/* request gpu reset. wil=
l run again */
b293e891b05701 Hawking Zhang 2019-08-30  2280  			amdgpu_ras_request_reset_=
on_boot(adev,
b293e891b05701 Hawking Zhang 2019-08-30  2281  					ras_block->block);
b293e891b05701 Hawking Zhang 2019-08-30  2282  			return 0;
53b3f8f40e6cff Dennis Li     2020-08-19  2283  		} else if (adev->in_suspen=
d || amdgpu_in_reset(adev)) {
b293e891b05701 Hawking Zhang 2019-08-30  2284  			/* in resume phase, if fa=
il to enable ras,
b293e891b05701 Hawking Zhang 2019-08-30  2285  			 * clean up all ras fs no=
des, and disable ras */
b293e891b05701 Hawking Zhang 2019-08-30  2286  			goto cleanup;
b293e891b05701 Hawking Zhang 2019-08-30  2287  		} else
b293e891b05701 Hawking Zhang 2019-08-30  2288  			return r;
b293e891b05701 Hawking Zhang 2019-08-30  2289  	}
b293e891b05701 Hawking Zhang 2019-08-30  2290  =

56d08d57eea886 John Clements 2021-03-25  2291  	/* check for errors on warm=
 reset edc persisant supported ASIC */
56d08d57eea886 John Clements 2021-03-25  2292  	amdgpu_persistent_edc_harve=
sting(adev, ras_block);
56d08d57eea886 John Clements 2021-03-25  2293  =

b293e891b05701 Hawking Zhang 2019-08-30  2294  	/* in resume phase, no need=
 to create ras fs node */
53b3f8f40e6cff Dennis Li     2020-08-19  2295  	if (adev->in_suspend || amd=
gpu_in_reset(adev))
b293e891b05701 Hawking Zhang 2019-08-30  2296  		return 0;
b293e891b05701 Hawking Zhang 2019-08-30  2297  =

b293e891b05701 Hawking Zhang 2019-08-30  2298  	if (ih_info->cb) {
b293e891b05701 Hawking Zhang 2019-08-30  2299  		r =3D amdgpu_ras_interrupt=
_add_handler(adev, ih_info);
b293e891b05701 Hawking Zhang 2019-08-30  2300  		if (r)
b293e891b05701 Hawking Zhang 2019-08-30  2301  			goto interrupt;
b293e891b05701 Hawking Zhang 2019-08-30  2302  	}
b293e891b05701 Hawking Zhang 2019-08-30  2303  =

b293e891b05701 Hawking Zhang 2019-08-30  2304  	r =3D amdgpu_ras_sysfs_crea=
te(adev, fs_info);
b293e891b05701 Hawking Zhang 2019-08-30  2305  	if (r)
b293e891b05701 Hawking Zhang 2019-08-30  2306  		goto sysfs;
b293e891b05701 Hawking Zhang 2019-08-30  2307  =

6bf890b1629e2a Luben Tuikov  2021-05-21  2308  	/* Those are the cached val=
ues at init.
6bf890b1629e2a Luben Tuikov  2021-05-21  2309  	 */
6bf890b1629e2a Luben Tuikov  2021-05-21  2310  	amdgpu_ras_query_error_coun=
t(adev, &ce_count, &ue_count);
6bf890b1629e2a Luben Tuikov  2021-05-21 @2311  	atomic_set(&con->ras_ce_cou=
nt, ce_count);
6bf890b1629e2a Luben Tuikov  2021-05-21  2312  	atomic_set(&con->ras_ue_cou=
nt, ue_count);
6bf890b1629e2a Luben Tuikov  2021-05-21  2313  =

b293e891b05701 Hawking Zhang 2019-08-30  2314  	return 0;
b293e891b05701 Hawking Zhang 2019-08-30  2315  cleanup:
b293e891b05701 Hawking Zhang 2019-08-30  2316  	amdgpu_ras_sysfs_remove(ade=
v, ras_block);
b293e891b05701 Hawking Zhang 2019-08-30  2317  sysfs:
b293e891b05701 Hawking Zhang 2019-08-30  2318  	if (ih_info->cb)
b293e891b05701 Hawking Zhang 2019-08-30  2319  		amdgpu_ras_interrupt_remov=
e_handler(adev, ih_info);
b293e891b05701 Hawking Zhang 2019-08-30  2320  interrupt:
b293e891b05701 Hawking Zhang 2019-08-30  2321  	amdgpu_ras_feature_enable(a=
dev, ras_block, 0);
b293e891b05701 Hawking Zhang 2019-08-30  2322  	return r;
b293e891b05701 Hawking Zhang 2019-08-30  2323  }
b293e891b05701 Hawking Zhang 2019-08-30  2324  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6808708178309253983==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
J2E5KwIA
--===============6808708178309253983==--

