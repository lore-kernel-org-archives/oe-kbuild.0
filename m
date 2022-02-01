Content-Type: multipart/mixed; boundary="===============3292304462108156497=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1549/3223] drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c:56 gfxhub_v1_1_get_xgmi_info() warn: should '(((((((adev->virt.caps & (1 << 2)) && adev->gfx.rlc.funcs && adev->gfx.rlc.rlcg_reg_access_supported)) ?amdgpu_sriov_rreg(adev, adev->reg_offset[1][0][0] + 2425, 0, 1):a...
Date: Wed, 02 Feb 2022 00:19:28 +0800
Message-ID: <202202020005.PBLkR4xr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3292304462108156497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Hawking Zhang <Hawking.Zhang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Zhou, Peng Ju" <PengJu.Zhou@amd.com>
CC: Lijo Lazar <lijo.lazar@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   711428e8f370eff043ae549572b8141987861583
commit: 1b2dc99e2dc6f35f55f0487e12fc9166fbd023ed [1549/3223] drm/amdgpu: sw=
itch to amdgpu_sriov_rreg/wreg
:::::: branch date: 12 hours ago
:::::: commit date: 7 days ago
config: i386-randconfig-m021-20220131 (https://download.01.org/0day-ci/arch=
ive/20220202/202202020005.PBLkR4xr-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c:56 gfxhub_v1_1_get_xgmi_info() war=
n: should '(((((((adev->virt.caps & (1 << 2)) && adev->gfx.rlc.funcs && ade=
v->gfx.rlc.rlcg_reg_access_supported)) ?amdgpu_sriov_rreg(adev, adev->reg_o=
ffset[1][0][0] + 2425, 0, 1):amdgpu_device_rreg(adev, (adev->reg_offset[1][=
0][0] + 2425), 0))) & 65535) >> 0) << 24' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c:530 gfxhub_v2_1_get_xgmi_info() wa=
rn: should '(((((((adev->virt.caps & (1 << 2)) && adev->gfx.rlc.funcs && ad=
ev->gfx.rlc.rlcg_reg_access_supported)) ?amdgpu_sriov_rreg(adev, adev->reg_=
offset[1][0][0] + 5880, 0, 1):amdgpu_device_rreg(adev, (adev->reg_offset[1]=
[0][0] + 5880), 0))) & 131071) >> 0) << 24' be a 64 bit type?

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c:63 gfxhub_v1_1_get_xgmi_info() war=
n: should '(((((((adev->virt.caps & (1 << 2)) && adev->gfx.rlc.funcs && ade=
v->gfx.rlc.rlcg_reg_access_supported)) ?amdgpu_sriov_rreg(adev, adev->reg_o=
ffset[1][0][0] + 2424, 0, 1):amdgpu_device_rreg(adev, (adev->reg_offset[1][=
0][0] + 2424), 0))) & 65535) >> 0) << 24' be a 64 bit type?

vim +56 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c

3cbb3a9749a31a Rajneesh Bhardwaj 2020-04-30  43  =

21470d97c9f8bb Kevin Wang        2020-10-14  44  int gfxhub_v1_1_get_xgmi_i=
nfo(struct amdgpu_device *adev)
bf0a60b78b61a7 Alex Deucher      2018-06-19  45  {
3cbb3a9749a31a Rajneesh Bhardwaj 2020-04-30  46  	u32 max_num_physical_node=
s;
3cbb3a9749a31a Rajneesh Bhardwaj 2020-04-30  47  	u32 max_physical_node_id;
3cbb3a9749a31a Rajneesh Bhardwaj 2020-04-30  48  	u32 xgmi_lfb_cntl;
3cbb3a9749a31a Rajneesh Bhardwaj 2020-04-30  49  	u32 max_region;
3cbb3a9749a31a Rajneesh Bhardwaj 2020-04-30  50  	u64 seg_size;
3cbb3a9749a31a Rajneesh Bhardwaj 2020-04-30  51  =

3cbb3a9749a31a Rajneesh Bhardwaj 2020-04-30  52  	if (adev->asic_type =3D=
=3D CHIP_ALDEBARAN) {
3cbb3a9749a31a Rajneesh Bhardwaj 2020-04-30  53  		xgmi_lfb_cntl =3D RREG32=
_SOC15(GC, 0, mmMC_VM_XGMI_LFB_CNTL_ALDE);
3cbb3a9749a31a Rajneesh Bhardwaj 2020-04-30  54  		seg_size =3D REG_GET_FIE=
LD(
3cbb3a9749a31a Rajneesh Bhardwaj 2020-04-30  55  			RREG32_SOC15(GC, 0, mmM=
C_VM_XGMI_LFB_SIZE_ALDE),
3cbb3a9749a31a Rajneesh Bhardwaj 2020-04-30 @56  			MC_VM_XGMI_LFB_SIZE, PF=
_LFB_SIZE) << 24;

:::::: The code@line 56 was first introduced by commit
:::::: 3cbb3a9749a31a6e8549650df3d16a050acab3ca drm/amdgpu: support get xgm=
i information for Aldebaran

:::::: TO: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3292304462108156497==--

