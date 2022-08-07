Content-Type: multipart/mixed; boundary="===============1255331880595600682=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:934:17: warning: use of uninitialized value 'index' [CWE-457]
Date: Sun, 07 Aug 2022 10:18:22 +0800
Message-ID: <202208071014.27NFI2aj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1255331880595600682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/amd/amdgpu/sdma_v6_0.c:934:17: warning: use of uninitialized value '=
index' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Stanley Yang <Stanley.Yang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Likun Gao <Likun.Gao@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: 61a039d1757b148717b9e10ea0cd30e5da6cf919 drm/amdgpu: add initial su=
pport for sdma v6.0
date:   3 months ago
:::::: branch date: 83 minutes ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220805 (https://download.01.org/0day-ci/archi=
ve/20220807/202208071014.27NFI2aj-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D61a039d1757b148717b9e10ea0cd30e5da6cf919
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 61a039d1757b148717b9e10ea0cd30e5da6cf919
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c: In function 'sdma_v6_0_ring_test=
_ring':
   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:919:26: warning: dereference of N=
ULL '0' [CWE-476] [-Wanalyzer-null-dereference]
     919 |                 *cpu_ptr =3D tmp;
         |                 ~~~~~~~~~^~~~~
     'sdma_v6_0_ring_test_ring': events 1-2
       |
       |  913 |         if (ring->is_mes_queue) {
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |  914 |                 uint32_t offset =3D 0;
       |  915 |                 offset =3D amdgpu_mes_ctx_get_offs(ring,
       |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (2) ...to here
       |  916 |                                          AMDGPU_MES_CTX_PAD=
DING_OFFS);
       |      |                                          ~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
       |
     'sdma_v6_0_ring_test_ring': event 3
       |
       |drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h:384:71:
       |  383 |         (ring->is_mes_queue && ring->mes_ctx ?             =
             \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |  384 |          (void *)((uint8_t *)(ring->mes_ctx->meta_data_ptr)=
 + offset) : \
       |      |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~^~~
       |      |                                                            =
           |
       |      |                                                            =
           (3) following 'false' branch...
       |  385 |          NULL)
       |      |          ~~~~~                                             =
            =

   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:918:27: note: in expansion of mac=
ro 'amdgpu_mes_ctx_get_offs_cpu_addr'
       |  918 |                 cpu_ptr =3D amdgpu_mes_ctx_get_offs_cpu_add=
r(ring, offset);
       |      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'sdma_v6_0_ring_test_ring': events 4-5
       |
       |  919 |                 *cpu_ptr =3D tmp;
       |      |                 ~~~~~~~~~^~~~~
       |      |                          |
       |      |                          (4) ...to here
       |      |                          (5) dereference of NULL '<unknown>'
       |
>> drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:934:17: warning: use of uninitial=
ized value 'index' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     934 |                 amdgpu_device_wb_free(adev, index);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'sdma_v6_0_ring_test_ring': events 1-4
       |
       |  905 |         unsigned index;
       |      |                  ^~~~~
       |      |                  |
       |      |                  (1) region created on stack here
       |......
       |  913 |         if (ring->is_mes_queue) {
       |      |            ~      =

       |      |            |
       |      |            (2) following 'true' branch...
       |  914 |                 uint32_t offset =3D 0;
       |  915 |                 offset =3D amdgpu_mes_ctx_get_offs(ring,
       |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (3) ...to here
       |  916 |                                          AMDGPU_MES_CTX_PAD=
DING_OFFS);
       |      |                                          ~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
       |......
       |  932 |         if (r) {
       |      |            ~      =

       |      |            |
       |      |            (4) following 'true' branch (when 'r !=3D 0')...
       |
     'sdma_v6_0_ring_test_ring': event 5
       |
       |include/drm/drm_print.h:518:9:
       |  518 |         __drm_err(fmt, ##__VA_ARGS__)
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (5) ...to here
   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:933:17: note: in expansion of mac=
ro 'DRM_ERROR'
       |  933 |                 DRM_ERROR("amdgpu: dma failed to lock ring =
%d (%d).\n", ring->idx, r);
       |      |                 ^~~~~~~~~
       |
     'sdma_v6_0_ring_test_ring': event 6
       |
       |  934 |                 amdgpu_device_wb_free(adev, index);
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (6) use of uninitialized value 'index' here
       |
   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c: In function 'sdma_v6_0_ring_test=
_ib':
   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:1000:26: warning: dereference of =
NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
    1000 |                 *cpu_ptr =3D tmp;
         |                 ~~~~~~~~~^~~~~
     'sdma_v6_0_ring_test_ib': events 1-2
       |
       |  990 |         if (ring->is_mes_queue) {
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |  991 |                 uint32_t offset =3D 0;
       |  992 |                 offset =3D amdgpu_mes_ctx_get_offs(ring, AM=
DGPU_MES_CTX_IB_OFFS);
       |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (2) ...to here
       |
     'sdma_v6_0_ring_test_ib': event 3
       |
       |drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h:384:71:
       |  383 |         (ring->is_mes_queue && ring->mes_ctx ?             =
             \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |  384 |          (void *)((uint8_t *)(ring->mes_ctx->meta_data_ptr)=
 + offset) : \
       |      |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~^~~
       |      |                                                            =
           |
       |      |                                                            =
           (3) following 'false' branch...
       |  385 |          NULL)
       |      |          ~~~~~                                             =
            =

   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:999:27: note: in expansion of mac=
ro 'amdgpu_mes_ctx_get_offs_cpu_addr'
       |  999 |                 cpu_ptr =3D amdgpu_mes_ctx_get_offs_cpu_add=
r(ring, offset);
       |      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'sdma_v6_0_ring_test_ib': events 4-5
       |
       | 1000 |                 *cpu_ptr =3D tmp;
       |      |                 ~~~~~~~~~^~~~~
       |      |                          |
       |      |                          (4) ...to here
       |      |                          (5) dereference of NULL '<unknown>'
       |
   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c:1044:21: warning: dereference of =
NULL 'cpu_ptr' [CWE-476] [-Wanalyzer-null-dereference]
    1044 |                 tmp =3D le32_to_cpu(*cpu_ptr);
     'sdma_v6_0_ring_test_ib': events 1-13
       |
       |  990 |         if (ring->is_mes_queue) {
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |......
       | 1002 |                 r =3D amdgpu_device_wb_get(adev, &index);
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (2) ...to here
       | 1003 |                 if (r) {
       |      |                    ~
       |      |                    |
       |      |                    (3) following 'false' branch (when 'r =
=3D=3D 0')...

vim +/index +934 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c

61a039d1757b14 Stanley Yang 2022-04-13  891  =

61a039d1757b14 Stanley Yang 2022-04-13  892  /**
61a039d1757b14 Stanley Yang 2022-04-13  893   * sdma_v6_0_ring_test_ring - =
simple async dma engine test
61a039d1757b14 Stanley Yang 2022-04-13  894   *
61a039d1757b14 Stanley Yang 2022-04-13  895   * @ring: amdgpu_ring structur=
e holding ring information
61a039d1757b14 Stanley Yang 2022-04-13  896   *
61a039d1757b14 Stanley Yang 2022-04-13  897   * Test the DMA engine by writ=
ing using it to write an
61a039d1757b14 Stanley Yang 2022-04-13  898   * value to memory.
61a039d1757b14 Stanley Yang 2022-04-13  899   * Returns 0 for success, erro=
r for failure.
61a039d1757b14 Stanley Yang 2022-04-13  900   */
61a039d1757b14 Stanley Yang 2022-04-13  901  static int sdma_v6_0_ring_test=
_ring(struct amdgpu_ring *ring)
61a039d1757b14 Stanley Yang 2022-04-13  902  {
61a039d1757b14 Stanley Yang 2022-04-13  903  	struct amdgpu_device *adev =
=3D ring->adev;
61a039d1757b14 Stanley Yang 2022-04-13  904  	unsigned i;
61a039d1757b14 Stanley Yang 2022-04-13  905  	unsigned index;
61a039d1757b14 Stanley Yang 2022-04-13  906  	int r;
61a039d1757b14 Stanley Yang 2022-04-13  907  	u32 tmp;
61a039d1757b14 Stanley Yang 2022-04-13  908  	u64 gpu_addr;
61a039d1757b14 Stanley Yang 2022-04-13  909  	volatile uint32_t *cpu_ptr =
=3D NULL;
61a039d1757b14 Stanley Yang 2022-04-13  910  =

61a039d1757b14 Stanley Yang 2022-04-13  911  	tmp =3D 0xCAFEDEAD;
61a039d1757b14 Stanley Yang 2022-04-13  912  =

61a039d1757b14 Stanley Yang 2022-04-13  913  	if (ring->is_mes_queue) {
61a039d1757b14 Stanley Yang 2022-04-13  914  		uint32_t offset =3D 0;
61a039d1757b14 Stanley Yang 2022-04-13  915  		offset =3D amdgpu_mes_ctx_ge=
t_offs(ring,
61a039d1757b14 Stanley Yang 2022-04-13  916  					 AMDGPU_MES_CTX_PADDING_O=
FFS);
61a039d1757b14 Stanley Yang 2022-04-13  917  		gpu_addr =3D amdgpu_mes_ctx_=
get_offs_gpu_addr(ring, offset);
61a039d1757b14 Stanley Yang 2022-04-13  918  		cpu_ptr =3D amdgpu_mes_ctx_g=
et_offs_cpu_addr(ring, offset);
61a039d1757b14 Stanley Yang 2022-04-13  919  		*cpu_ptr =3D tmp;
61a039d1757b14 Stanley Yang 2022-04-13  920  	} else {
61a039d1757b14 Stanley Yang 2022-04-13  921  		r =3D amdgpu_device_wb_get(a=
dev, &index);
61a039d1757b14 Stanley Yang 2022-04-13  922  		if (r) {
61a039d1757b14 Stanley Yang 2022-04-13  923  			dev_err(adev->dev, "(%d) fa=
iled to allocate wb slot\n", r);
61a039d1757b14 Stanley Yang 2022-04-13  924  			return r;
61a039d1757b14 Stanley Yang 2022-04-13  925  		}
61a039d1757b14 Stanley Yang 2022-04-13  926  =

61a039d1757b14 Stanley Yang 2022-04-13  927  		gpu_addr =3D adev->wb.gpu_ad=
dr + (index * 4);
61a039d1757b14 Stanley Yang 2022-04-13  928  		adev->wb.wb[index] =3D cpu_t=
o_le32(tmp);
61a039d1757b14 Stanley Yang 2022-04-13  929  	}
61a039d1757b14 Stanley Yang 2022-04-13  930  =

61a039d1757b14 Stanley Yang 2022-04-13  931  	r =3D amdgpu_ring_alloc(ring,=
 5);
61a039d1757b14 Stanley Yang 2022-04-13  932  	if (r) {
61a039d1757b14 Stanley Yang 2022-04-13  933  		DRM_ERROR("amdgpu: dma faile=
d to lock ring %d (%d).\n", ring->idx, r);
61a039d1757b14 Stanley Yang 2022-04-13 @934  		amdgpu_device_wb_free(adev, =
index);
61a039d1757b14 Stanley Yang 2022-04-13  935  		return r;
61a039d1757b14 Stanley Yang 2022-04-13  936  	}
61a039d1757b14 Stanley Yang 2022-04-13  937  =

61a039d1757b14 Stanley Yang 2022-04-13  938  	amdgpu_ring_write(ring, SDMA_=
PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_WRITE) |
61a039d1757b14 Stanley Yang 2022-04-13  939  			  SDMA_PKT_COPY_LINEAR_HEAD=
ER_SUB_OP(SDMA_SUBOP_WRITE_LINEAR));
61a039d1757b14 Stanley Yang 2022-04-13  940  	amdgpu_ring_write(ring, lower=
_32_bits(gpu_addr));
61a039d1757b14 Stanley Yang 2022-04-13  941  	amdgpu_ring_write(ring, upper=
_32_bits(gpu_addr));
61a039d1757b14 Stanley Yang 2022-04-13  942  	amdgpu_ring_write(ring, SDMA_=
PKT_WRITE_UNTILED_DW_3_COUNT(0));
61a039d1757b14 Stanley Yang 2022-04-13  943  	amdgpu_ring_write(ring, 0xDEA=
DBEEF);
61a039d1757b14 Stanley Yang 2022-04-13  944  	amdgpu_ring_commit(ring);
61a039d1757b14 Stanley Yang 2022-04-13  945  =

61a039d1757b14 Stanley Yang 2022-04-13  946  	for (i =3D 0; i < adev->usec_=
timeout; i++) {
61a039d1757b14 Stanley Yang 2022-04-13  947  		if (ring->is_mes_queue)
61a039d1757b14 Stanley Yang 2022-04-13  948  			tmp =3D le32_to_cpu(*cpu_pt=
r);
61a039d1757b14 Stanley Yang 2022-04-13  949  		else
61a039d1757b14 Stanley Yang 2022-04-13  950  			tmp =3D le32_to_cpu(adev->w=
b.wb[index]);
61a039d1757b14 Stanley Yang 2022-04-13  951  		if (tmp =3D=3D 0xDEADBEEF)
61a039d1757b14 Stanley Yang 2022-04-13  952  			break;
61a039d1757b14 Stanley Yang 2022-04-13  953  		if (amdgpu_emu_mode =3D=3D 1)
61a039d1757b14 Stanley Yang 2022-04-13  954  			msleep(1);
61a039d1757b14 Stanley Yang 2022-04-13  955  		else
61a039d1757b14 Stanley Yang 2022-04-13  956  			udelay(1);
61a039d1757b14 Stanley Yang 2022-04-13  957  	}
61a039d1757b14 Stanley Yang 2022-04-13  958  =

61a039d1757b14 Stanley Yang 2022-04-13  959  	if (i >=3D adev->usec_timeout)
61a039d1757b14 Stanley Yang 2022-04-13  960  		r =3D -ETIMEDOUT;
61a039d1757b14 Stanley Yang 2022-04-13  961  =

61a039d1757b14 Stanley Yang 2022-04-13  962  	if (!ring->is_mes_queue)
61a039d1757b14 Stanley Yang 2022-04-13  963  		amdgpu_device_wb_free(adev, =
index);
61a039d1757b14 Stanley Yang 2022-04-13  964  =

61a039d1757b14 Stanley Yang 2022-04-13  965  	return r;
61a039d1757b14 Stanley Yang 2022-04-13  966  }
61a039d1757b14 Stanley Yang 2022-04-13  967  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1255331880595600682==--

