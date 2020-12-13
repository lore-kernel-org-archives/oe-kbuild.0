Content-Type: multipart/mixed; boundary="===============6972534329954373586=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1069:6: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Sun, 13 Dec 2020 14:46:15 +0800
Message-ID: <202012131411.dkYlTyM8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6972534329954373586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Likun Gao <Likun.Gao@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6bff9bb8a292668e7da3e740394b061e5201f683
commit: 157e72e831cb8f323108b5df6d0b148aef9507fb drm/amdgpu: add sdma ip bl=
ock for sienna_cichlid (v5)
date:   6 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 months ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:1069:6: warning: Shifting signed =
32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
        SDMA_PKT_POLL_REGMEM_HEADER_MEM_POLL(1));
        ^

vim +1069 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c

157e72e831cb8f3 Likun Gao 2019-06-17  1051  =

157e72e831cb8f3 Likun Gao 2019-06-17  1052  =

157e72e831cb8f3 Likun Gao 2019-06-17  1053  /**
157e72e831cb8f3 Likun Gao 2019-06-17  1054   * sdma_v5_2_ring_emit_pipeline=
_sync - sync the pipeline
157e72e831cb8f3 Likun Gao 2019-06-17  1055   *
157e72e831cb8f3 Likun Gao 2019-06-17  1056   * @ring: amdgpu_ring pointer
157e72e831cb8f3 Likun Gao 2019-06-17  1057   *
157e72e831cb8f3 Likun Gao 2019-06-17  1058   * Make sure all previous opera=
tions are completed (CIK).
157e72e831cb8f3 Likun Gao 2019-06-17  1059   */
157e72e831cb8f3 Likun Gao 2019-06-17  1060  static void sdma_v5_2_ring_emit=
_pipeline_sync(struct amdgpu_ring *ring)
157e72e831cb8f3 Likun Gao 2019-06-17  1061  {
157e72e831cb8f3 Likun Gao 2019-06-17  1062  	uint32_t seq =3D ring->fence_d=
rv.sync_seq;
157e72e831cb8f3 Likun Gao 2019-06-17  1063  	uint64_t addr =3D ring->fence_=
drv.gpu_addr;
157e72e831cb8f3 Likun Gao 2019-06-17  1064  =

157e72e831cb8f3 Likun Gao 2019-06-17  1065  	/* wait for idle */
157e72e831cb8f3 Likun Gao 2019-06-17  1066  	amdgpu_ring_write(ring, SDMA_P=
KT_HEADER_OP(SDMA_OP_POLL_REGMEM) |
157e72e831cb8f3 Likun Gao 2019-06-17  1067  			  SDMA_PKT_POLL_REGMEM_HEADE=
R_HDP_FLUSH(0) |
157e72e831cb8f3 Likun Gao 2019-06-17  1068  			  SDMA_PKT_POLL_REGMEM_HEADE=
R_FUNC(3) | /* equal */
157e72e831cb8f3 Likun Gao 2019-06-17 @1069  			  SDMA_PKT_POLL_REGMEM_HEADE=
R_MEM_POLL(1));
157e72e831cb8f3 Likun Gao 2019-06-17  1070  	amdgpu_ring_write(ring, addr &=
 0xfffffffc);
157e72e831cb8f3 Likun Gao 2019-06-17  1071  	amdgpu_ring_write(ring, upper_=
32_bits(addr) & 0xffffffff);
157e72e831cb8f3 Likun Gao 2019-06-17  1072  	amdgpu_ring_write(ring, seq); =
/* reference */
157e72e831cb8f3 Likun Gao 2019-06-17  1073  	amdgpu_ring_write(ring, 0xffff=
ffff); /* mask */
157e72e831cb8f3 Likun Gao 2019-06-17  1074  	amdgpu_ring_write(ring, SDMA_P=
KT_POLL_REGMEM_DW5_RETRY_COUNT(0xfff) |
157e72e831cb8f3 Likun Gao 2019-06-17  1075  			  SDMA_PKT_POLL_REGMEM_DW5_I=
NTERVAL(4)); /* retry count, poll interval */
157e72e831cb8f3 Likun Gao 2019-06-17  1076  }
157e72e831cb8f3 Likun Gao 2019-06-17  1077  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6972534329954373586==--

