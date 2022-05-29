Content-Type: multipart/mixed; boundary="===============3890979917456073769=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c:56 gfxhub_v1_1_get_xgmi_info() warn: should '(((((((adev->virt.caps & (1 << 2)) && adev->gfx.rlc.funcs && adev->gfx.rlc.rlcg_reg_access_supported)) ?amdgpu_sriov_rreg(adev, adev->reg_offset[1][0][0] + 2425, 0, 1):a...
Date: Sun, 29 May 2022 19:00:53 +0800
Message-ID: <202205291815.MJ3JKjQk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3890979917456073769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hawking Zhang <Hawking.Zhang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Zhou, Peng Ju" <PengJu.Zhou@amd.com>
CC: Lijo Lazar <lijo.lazar@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   664a393a2663a0f62fc1b18157ccae33dcdbb8c8
commit: 1b2dc99e2dc6f35f55f0487e12fc9166fbd023ed drm/amdgpu: switch to amdg=
pu_sriov_rreg/wreg
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: arc-randconfig-m031-20220524 (https://download.01.org/0day-ci/archi=
ve/20220529/202205291815.MJ3JKjQk-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
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

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3890979917456073769==--

