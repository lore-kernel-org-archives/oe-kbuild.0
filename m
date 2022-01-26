Content-Type: multipart/mixed; boundary="===============4119780940636259977=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [agd5f:drm-next 124/190] drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:877:51: warning: Uninitialized variable: reg_access_ctrl [uninitvar]
Date: Wed, 26 Jan 2022 19:54:36 +0800
Message-ID: <202201261900.ZLv3AEFH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4119780940636259977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hawking Zhang <Hawking.Zhang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Zhou, Peng Ju" <PengJu.Zhou@amd.com>
CC: Lijo Lazar <lijo.lazar@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   63e583c8843f305a3e334a96d5de00435f4d38a2
commit: 5d447e296701484f3df5b31a7a078cbf1e3a9cc9 [124/190] drm/amdgpu: add =
helper for rlcg indirect reg access
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper=
.c:
>> drivers/gpu/drm/amd/display/dc/dc_helper.c:450:48: warning: Function 'ge=
neric_reg_wait' argument order different: declaration 'ctx, addr, mask, shi=
ft, condition_value, delay_between_poll_us, time_out_num_tries, func_name, =
line' definition 'ctx, addr, shift, mask, condition_value, delay_between_po=
ll_us, time_out_num_tries, func_name, line' [funcArgOrderDifferent]
   void generic_reg_wait(const struct dc_context *ctx,
                                                  ^
   drivers/gpu/drm/amd/display/dc/dm_services.h:140:48: note: Function 'gen=
eric_reg_wait' argument order different: declaration 'ctx, addr, mask, shif=
t, condition_value, delay_between_poll_us, time_out_num_tries, func_name, l=
ine' definition 'ctx, addr, shift, mask, condition_value, delay_between_pol=
l_us, time_out_num_tries, func_name, line'
   void generic_reg_wait(const struct dc_context *ctx,
                                                  ^
   drivers/gpu/drm/amd/display/dc/dc_helper.c:450:48: note: Function 'gener=
ic_reg_wait' argument order different: declaration 'ctx, addr, mask, shift,=
 condition_value, delay_between_poll_us, time_out_num_tries, func_name, lin=
e' definition 'ctx, addr, shift, mask, condition_value, delay_between_poll_=
us, time_out_num_tries, func_name, line'
   void generic_reg_wait(const struct dc_context *ctx,
                                                  ^
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:877:51: warning: Uninitialized =
variable: reg_access_ctrl [uninitvar]
    scratch_reg0 =3D (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scr=
atch_reg0;
                                                     ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:878:51: warning: Uninitialized =
variable: reg_access_ctrl [uninitvar]
    scratch_reg1 =3D (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scr=
atch_reg1;
                                                     ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:879:51: warning: Uninitialized =
variable: reg_access_ctrl [uninitvar]
    scratch_reg2 =3D (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scr=
atch_reg2;
                                                     ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:880:51: warning: Uninitialized =
variable: reg_access_ctrl [uninitvar]
    scratch_reg3 =3D (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scr=
atch_reg3;
                                                     ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:877:51: warning: Uninitialized =
struct member: reg_access_ctrl.scratch_reg0 [uninitStructMember]
    scratch_reg0 =3D (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scr=
atch_reg0;
                                                     ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:878:51: warning: Uninitialized =
struct member: reg_access_ctrl.scratch_reg1 [uninitStructMember]
    scratch_reg1 =3D (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scr=
atch_reg1;
                                                     ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:879:51: warning: Uninitialized =
struct member: reg_access_ctrl.scratch_reg2 [uninitStructMember]
    scratch_reg2 =3D (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scr=
atch_reg2;
                                                     ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:880:51: warning: Uninitialized =
struct member: reg_access_ctrl.scratch_reg3 [uninitStructMember]
    scratch_reg3 =3D (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->scr=
atch_reg3;
                                                     ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:884:16: warning: Uninitialized =
struct member: reg_access_ctrl.grbm_cntl [uninitStructMember]
    if (offset =3D=3D reg_access_ctrl->grbm_cntl) {
                  ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:888:23: warning: Uninitialized =
struct member: reg_access_ctrl.grbm_idx [uninitStructMember]
    } else if (offset =3D=3D reg_access_ctrl->grbm_idx) {
                         ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:881:6: warning: Uninitialized s=
truct member: reg_access_ctrl.spare_int [uninitStructMember]
    if (reg_access_ctrl->spare_int)
        ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:882:49: warning: Uninitialized =
struct member: reg_access_ctrl.spare_int [uninitStructMember]
     spare_int =3D (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->spare=
_int;
                                                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:901:7: warning: Uninitialized s=
truct member: reg_access_ctrl.spare_int [uninitStructMember]
     if (reg_access_ctrl->spare_int)
         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:881:6: warning: Uninitialized v=
ariable: reg_access_ctrl [uninitvar]
    if (reg_access_ctrl->spare_int)
        ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:882:49: warning: Uninitialized =
variable: reg_access_ctrl [uninitvar]
     spare_int =3D (void __iomem *)adev->rmmio + 4 * reg_access_ctrl->spare=
_int;
                                                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:884:16: warning: Uninitialized =
variable: reg_access_ctrl [uninitvar]
    if (offset =3D=3D reg_access_ctrl->grbm_cntl) {
                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:888:23: warning: Uninitialized =
variable: reg_access_ctrl [uninitvar]
    } else if (offset =3D=3D reg_access_ctrl->grbm_idx) {
                         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:901:7: warning: Uninitialized v=
ariable: reg_access_ctrl [uninitvar]
     if (reg_access_ctrl->spare_int)
         ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7676:7: warning: Identical inner =
'if' condition is always true. [identicalInnerCondition]
     if (grbm_soft_reset) {
         ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7666:6: note: outer condition: gr=
bm_soft_reset
    if (grbm_soft_reset) {
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7676:7: note: identical inner con=
dition: grbm_soft_reset
     if (grbm_soft_reset) {
         ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7537:6: warning: Unused variable:=
 r [unusedVariable]
    int r;
        ^

vim +877 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c

5d447e29670148 Hawking Zhang 2022-01-18  858  =

5d447e29670148 Hawking Zhang 2022-01-18  859  static u32 amdgpu_virt_rlcg_r=
eg_rw(struct amdgpu_device *adev, u32 offset, u32 v, u32 flag)
5d447e29670148 Hawking Zhang 2022-01-18  860  {
5d447e29670148 Hawking Zhang 2022-01-18  861  	struct amdgpu_rlcg_reg_acces=
s_ctrl *reg_access_ctrl;
5d447e29670148 Hawking Zhang 2022-01-18  862  	uint32_t timeout =3D 50000;
5d447e29670148 Hawking Zhang 2022-01-18  863  	uint32_t i, tmp;
5d447e29670148 Hawking Zhang 2022-01-18  864  	uint32_t ret =3D 0;
5d447e29670148 Hawking Zhang 2022-01-18  865  	static void *scratch_reg0;
5d447e29670148 Hawking Zhang 2022-01-18  866  	static void *scratch_reg1;
5d447e29670148 Hawking Zhang 2022-01-18  867  	static void *scratch_reg2;
5d447e29670148 Hawking Zhang 2022-01-18  868  	static void *scratch_reg3;
5d447e29670148 Hawking Zhang 2022-01-18  869  	static void *spare_int;
5d447e29670148 Hawking Zhang 2022-01-18  870  =

5d447e29670148 Hawking Zhang 2022-01-18  871  	if (!adev->gfx.rlc.rlcg_reg_=
access_supported) {
5d447e29670148 Hawking Zhang 2022-01-18  872  		dev_err(adev->dev,
5d447e29670148 Hawking Zhang 2022-01-18  873  			"indirect registers access=
 through rlcg is not available\n");
5d447e29670148 Hawking Zhang 2022-01-18  874  		return 0;
5d447e29670148 Hawking Zhang 2022-01-18  875  	}
5d447e29670148 Hawking Zhang 2022-01-18  876  =

5d447e29670148 Hawking Zhang 2022-01-18 @877  	scratch_reg0 =3D (void __iom=
em *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg0;
5d447e29670148 Hawking Zhang 2022-01-18 @878  	scratch_reg1 =3D (void __iom=
em *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg1;
5d447e29670148 Hawking Zhang 2022-01-18 @879  	scratch_reg2 =3D (void __iom=
em *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg2;
5d447e29670148 Hawking Zhang 2022-01-18 @880  	scratch_reg3 =3D (void __iom=
em *)adev->rmmio + 4 * reg_access_ctrl->scratch_reg3;
5d447e29670148 Hawking Zhang 2022-01-18 @881  	if (reg_access_ctrl->spare_i=
nt)
5d447e29670148 Hawking Zhang 2022-01-18  882  		spare_int =3D (void __iomem=
 *)adev->rmmio + 4 * reg_access_ctrl->spare_int;
5d447e29670148 Hawking Zhang 2022-01-18  883  =

5d447e29670148 Hawking Zhang 2022-01-18 @884  	if (offset =3D=3D reg_access=
_ctrl->grbm_cntl) {
5d447e29670148 Hawking Zhang 2022-01-18  885  		/* if the target reg offset=
 is grbm_cntl, write to scratch_reg2 */
5d447e29670148 Hawking Zhang 2022-01-18  886  		writel(v, scratch_reg2);
5d447e29670148 Hawking Zhang 2022-01-18  887  		writel(v, ((void __iomem *)=
adev->rmmio) + (offset * 4));
5d447e29670148 Hawking Zhang 2022-01-18 @888  	} else if (offset =3D=3D reg=
_access_ctrl->grbm_idx) {
5d447e29670148 Hawking Zhang 2022-01-18  889  		/* if the target reg offset=
 is grbm_idx, write to scratch_reg3 */
5d447e29670148 Hawking Zhang 2022-01-18  890  		writel(v, scratch_reg3);
5d447e29670148 Hawking Zhang 2022-01-18  891  		writel(v, ((void __iomem *)=
adev->rmmio) + (offset * 4));
5d447e29670148 Hawking Zhang 2022-01-18  892  	} else {
5d447e29670148 Hawking Zhang 2022-01-18  893  		/*
5d447e29670148 Hawking Zhang 2022-01-18  894  		 * SCRATCH_REG0 	=3D read/w=
rite value
5d447e29670148 Hawking Zhang 2022-01-18  895  		 * SCRATCH_REG1[30:28]	=3D =
command
5d447e29670148 Hawking Zhang 2022-01-18  896  		 * SCRATCH_REG1[19:0]	=3D a=
ddress in dword
5d447e29670148 Hawking Zhang 2022-01-18  897  		 * SCRATCH_REG1[26:24]	=3D =
Error reporting
5d447e29670148 Hawking Zhang 2022-01-18  898  		 */
5d447e29670148 Hawking Zhang 2022-01-18  899  		writel(v, scratch_reg0);
5d447e29670148 Hawking Zhang 2022-01-18  900  		writel((offset | flag), scr=
atch_reg1);
5d447e29670148 Hawking Zhang 2022-01-18  901  		if (reg_access_ctrl->spare_=
int)
5d447e29670148 Hawking Zhang 2022-01-18  902  			writel(1, spare_int);
5d447e29670148 Hawking Zhang 2022-01-18  903  =

5d447e29670148 Hawking Zhang 2022-01-18  904  		for (i =3D 0; i < timeout; =
i++) {
5d447e29670148 Hawking Zhang 2022-01-18  905  			tmp =3D readl(scratch_reg1=
);
5d447e29670148 Hawking Zhang 2022-01-18  906  			if (!(tmp & flag))
5d447e29670148 Hawking Zhang 2022-01-18  907  				break;
5d447e29670148 Hawking Zhang 2022-01-18  908  			udelay(10);
5d447e29670148 Hawking Zhang 2022-01-18  909  		}
5d447e29670148 Hawking Zhang 2022-01-18  910  =

5d447e29670148 Hawking Zhang 2022-01-18  911  		if (i >=3D timeout) {
5d447e29670148 Hawking Zhang 2022-01-18  912  			if (amdgpu_sriov_rlcg_erro=
r_report_enabled(adev)) {
5d447e29670148 Hawking Zhang 2022-01-18  913  				if (tmp & AMDGPU_RLCG_VFG=
ATE_DISABLED) {
5d447e29670148 Hawking Zhang 2022-01-18  914  					dev_err(adev->dev,
5d447e29670148 Hawking Zhang 2022-01-18  915  						"vfgate is disabled, rl=
cg failed to program reg: 0x%05x\n", offset);
5d447e29670148 Hawking Zhang 2022-01-18  916  				} else if (tmp & AMDGPU_R=
LCG_WRONG_OPERATION_TYPE) {
5d447e29670148 Hawking Zhang 2022-01-18  917  					dev_err(adev->dev,
5d447e29670148 Hawking Zhang 2022-01-18  918  						"wrong operation type, =
rlcg failed to program reg: 0x%05x\n", offset);
5d447e29670148 Hawking Zhang 2022-01-18  919  				} else if (tmp & AMDGPU_R=
LCG_REG_NOT_IN_RANGE) {
5d447e29670148 Hawking Zhang 2022-01-18  920  					dev_err(adev->dev,
5d447e29670148 Hawking Zhang 2022-01-18  921  						"regiser is not in rang=
e, rlcg failed to program reg: 0x%05x\n", offset);
5d447e29670148 Hawking Zhang 2022-01-18  922  				} else {
5d447e29670148 Hawking Zhang 2022-01-18  923  					dev_err(adev->dev,
5d447e29670148 Hawking Zhang 2022-01-18  924  						"unknown error type, rl=
cg failed to program reg: 0x%05x\n", offset);
5d447e29670148 Hawking Zhang 2022-01-18  925  				}
5d447e29670148 Hawking Zhang 2022-01-18  926  			} else {
5d447e29670148 Hawking Zhang 2022-01-18  927  				dev_err(adev->dev,
5d447e29670148 Hawking Zhang 2022-01-18  928  					"timeout: rlcg faled to =
program reg: 0x%05x\n", offset);
5d447e29670148 Hawking Zhang 2022-01-18  929  			}
5d447e29670148 Hawking Zhang 2022-01-18  930  		}
5d447e29670148 Hawking Zhang 2022-01-18  931  	}
5d447e29670148 Hawking Zhang 2022-01-18  932  =

5d447e29670148 Hawking Zhang 2022-01-18  933  	ret =3D readl(scratch_reg0);
5d447e29670148 Hawking Zhang 2022-01-18  934  	return ret;
5d447e29670148 Hawking Zhang 2022-01-18  935  }
5d447e29670148 Hawking Zhang 2022-01-18  936  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4119780940636259977==--

