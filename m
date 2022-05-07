Content-Type: multipart/mixed; boundary="===============1343715562016690601=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [agd5f:drm-next 454/599] drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:724:4-36: duplicated argument to & or |
Date: Sat, 07 May 2022 16:24:19 +0800
Message-ID: <202205071634.jnLchJM2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1343715562016690601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Leo Liu <leo.liu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: James Zhu <James.Zhu@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   3170f5f234272247989fafee4cba4cbbc822631c
commit: 8da1170a16e4d4b49fa07d1f75ad480847ff7eca [454/599] drm/amdgpu: add =
VCN4 ip block support
:::::: branch date: 11 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-c024-20220506 (https://download.01.org/0day-ci/arc=
hive/20220507/202205071634.jnLchJM2-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:724:4-36: duplicated argument to &=
 or |

vim +724 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c

8da1170a16e4d4 Leo Liu 2022-04-13  647  =

8da1170a16e4d4 Leo Liu 2022-04-13  648  /**
8da1170a16e4d4 Leo Liu 2022-04-13  649   * vcn_v4_0_disable_clock_gating - =
disable VCN clock gating
8da1170a16e4d4 Leo Liu 2022-04-13  650   *
8da1170a16e4d4 Leo Liu 2022-04-13  651   * @adev: amdgpu_device pointer
8da1170a16e4d4 Leo Liu 2022-04-13  652   * @inst: instance number
8da1170a16e4d4 Leo Liu 2022-04-13  653   *
8da1170a16e4d4 Leo Liu 2022-04-13  654   * Disable clock gating for VCN blo=
ck
8da1170a16e4d4 Leo Liu 2022-04-13  655   */
8da1170a16e4d4 Leo Liu 2022-04-13  656  static void vcn_v4_0_disable_clock_=
gating(struct amdgpu_device *adev, int inst)
8da1170a16e4d4 Leo Liu 2022-04-13  657  {
8da1170a16e4d4 Leo Liu 2022-04-13  658  	uint32_t data;
8da1170a16e4d4 Leo Liu 2022-04-13  659  =

8da1170a16e4d4 Leo Liu 2022-04-13  660  	if (adev->cg_flags & AMD_CG_SUPPOR=
T_VCN_MGCG)
8da1170a16e4d4 Leo Liu 2022-04-13  661  		return;
8da1170a16e4d4 Leo Liu 2022-04-13  662  =

8da1170a16e4d4 Leo Liu 2022-04-13  663  	/* VCN disable CGC */
8da1170a16e4d4 Leo Liu 2022-04-13  664  	data =3D RREG32_SOC15(VCN, inst, r=
egUVD_CGC_CTRL);
8da1170a16e4d4 Leo Liu 2022-04-13  665  	data &=3D ~UVD_CGC_CTRL__DYN_CLOCK=
_MODE_MASK;
8da1170a16e4d4 Leo Liu 2022-04-13  666  	data |=3D 1 << UVD_CGC_CTRL__CLK_G=
ATE_DLY_TIMER__SHIFT;
8da1170a16e4d4 Leo Liu 2022-04-13  667  	data |=3D 4 << UVD_CGC_CTRL__CLK_O=
FF_DELAY__SHIFT;
8da1170a16e4d4 Leo Liu 2022-04-13  668  	WREG32_SOC15(VCN, inst, regUVD_CGC=
_CTRL, data);
8da1170a16e4d4 Leo Liu 2022-04-13  669  =

8da1170a16e4d4 Leo Liu 2022-04-13  670  	data =3D RREG32_SOC15(VCN, inst, r=
egUVD_CGC_GATE);
8da1170a16e4d4 Leo Liu 2022-04-13  671  	data &=3D ~(UVD_CGC_GATE__SYS_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  672  		| UVD_CGC_GATE__UDEC_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  673  		| UVD_CGC_GATE__MPEG2_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  674  		| UVD_CGC_GATE__REGS_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  675  		| UVD_CGC_GATE__RBC_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  676  		| UVD_CGC_GATE__LMI_MC_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  677  		| UVD_CGC_GATE__LMI_UMC_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  678  		| UVD_CGC_GATE__IDCT_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  679  		| UVD_CGC_GATE__MPRD_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  680  		| UVD_CGC_GATE__MPC_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  681  		| UVD_CGC_GATE__LBSI_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  682  		| UVD_CGC_GATE__LRBBM_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  683  		| UVD_CGC_GATE__UDEC_RE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  684  		| UVD_CGC_GATE__UDEC_CM_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  685  		| UVD_CGC_GATE__UDEC_IT_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  686  		| UVD_CGC_GATE__UDEC_DB_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  687  		| UVD_CGC_GATE__UDEC_MP_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  688  		| UVD_CGC_GATE__WCB_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  689  		| UVD_CGC_GATE__VCPU_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  690  		| UVD_CGC_GATE__MMSCH_MASK);
8da1170a16e4d4 Leo Liu 2022-04-13  691  =

8da1170a16e4d4 Leo Liu 2022-04-13  692  	WREG32_SOC15(VCN, inst, regUVD_CGC=
_GATE, data);
8da1170a16e4d4 Leo Liu 2022-04-13  693  	SOC15_WAIT_ON_RREG(VCN, inst, regU=
VD_CGC_GATE, 0,  0xFFFFFFFF);
8da1170a16e4d4 Leo Liu 2022-04-13  694  =

8da1170a16e4d4 Leo Liu 2022-04-13  695  	data =3D RREG32_SOC15(VCN, inst, r=
egUVD_CGC_CTRL);
8da1170a16e4d4 Leo Liu 2022-04-13  696  	data &=3D ~(UVD_CGC_CTRL__UDEC_RE_=
MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  697  		| UVD_CGC_CTRL__UDEC_CM_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  698  		| UVD_CGC_CTRL__UDEC_IT_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  699  		| UVD_CGC_CTRL__UDEC_DB_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  700  		| UVD_CGC_CTRL__UDEC_MP_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  701  		| UVD_CGC_CTRL__SYS_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  702  		| UVD_CGC_CTRL__UDEC_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  703  		| UVD_CGC_CTRL__MPEG2_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  704  		| UVD_CGC_CTRL__REGS_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  705  		| UVD_CGC_CTRL__RBC_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  706  		| UVD_CGC_CTRL__LMI_MC_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  707  		| UVD_CGC_CTRL__LMI_UMC_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  708  		| UVD_CGC_CTRL__IDCT_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  709  		| UVD_CGC_CTRL__MPRD_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  710  		| UVD_CGC_CTRL__MPC_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  711  		| UVD_CGC_CTRL__LBSI_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  712  		| UVD_CGC_CTRL__LRBBM_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  713  		| UVD_CGC_CTRL__WCB_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  714  		| UVD_CGC_CTRL__VCPU_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  715  		| UVD_CGC_CTRL__MMSCH_MODE_MASK);
8da1170a16e4d4 Leo Liu 2022-04-13  716  	WREG32_SOC15(VCN, inst, regUVD_CGC=
_CTRL, data);
8da1170a16e4d4 Leo Liu 2022-04-13  717  =

8da1170a16e4d4 Leo Liu 2022-04-13  718  	data =3D RREG32_SOC15(VCN, inst, r=
egUVD_SUVD_CGC_GATE);
8da1170a16e4d4 Leo Liu 2022-04-13  719  	data |=3D (UVD_SUVD_CGC_GATE__SRE_=
MASK
8da1170a16e4d4 Leo Liu 2022-04-13  720  		| UVD_SUVD_CGC_GATE__SIT_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  721  		| UVD_SUVD_CGC_GATE__SMP_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  722  		| UVD_SUVD_CGC_GATE__SCM_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  723  		| UVD_SUVD_CGC_GATE__SDB_MASK
8da1170a16e4d4 Leo Liu 2022-04-13 @724  		| UVD_SUVD_CGC_GATE__SRE_H264_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  725  		| UVD_SUVD_CGC_GATE__SRE_H264_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  726  		| UVD_SUVD_CGC_GATE__SRE_HEVC_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  727  		| UVD_SUVD_CGC_GATE__SIT_H264_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  728  		| UVD_SUVD_CGC_GATE__SIT_HEVC_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  729  		| UVD_SUVD_CGC_GATE__SCM_H264_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  730  		| UVD_SUVD_CGC_GATE__SCM_HEVC_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  731  		| UVD_SUVD_CGC_GATE__SDB_H264_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  732  		| UVD_SUVD_CGC_GATE__SDB_HEVC_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  733  		| UVD_SUVD_CGC_GATE__SCLR_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  734  		| UVD_SUVD_CGC_GATE__UVD_SC_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  735  		| UVD_SUVD_CGC_GATE__ENT_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  736  		| UVD_SUVD_CGC_GATE__SIT_HEVC_DEC=
_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  737  		| UVD_SUVD_CGC_GATE__SIT_HEVC_ENC=
_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  738  		| UVD_SUVD_CGC_GATE__SITE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  739  		| UVD_SUVD_CGC_GATE__SRE_VP9_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  740  		| UVD_SUVD_CGC_GATE__SCM_VP9_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  741  		| UVD_SUVD_CGC_GATE__SIT_VP9_DEC_=
MASK
8da1170a16e4d4 Leo Liu 2022-04-13  742  		| UVD_SUVD_CGC_GATE__SDB_VP9_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  743  		| UVD_SUVD_CGC_GATE__IME_HEVC_MAS=
K);
8da1170a16e4d4 Leo Liu 2022-04-13  744  	WREG32_SOC15(VCN, inst, regUVD_SUV=
D_CGC_GATE, data);
8da1170a16e4d4 Leo Liu 2022-04-13  745  =

8da1170a16e4d4 Leo Liu 2022-04-13  746  	data =3D RREG32_SOC15(VCN, inst, r=
egUVD_SUVD_CGC_CTRL);
8da1170a16e4d4 Leo Liu 2022-04-13  747  	data &=3D ~(UVD_SUVD_CGC_CTRL__SRE=
_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  748  		| UVD_SUVD_CGC_CTRL__SIT_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  749  		| UVD_SUVD_CGC_CTRL__SMP_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  750  		| UVD_SUVD_CGC_CTRL__SCM_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  751  		| UVD_SUVD_CGC_CTRL__SDB_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  752  		| UVD_SUVD_CGC_CTRL__SCLR_MODE_MA=
SK
8da1170a16e4d4 Leo Liu 2022-04-13  753  		| UVD_SUVD_CGC_CTRL__UVD_SC_MODE_=
MASK
8da1170a16e4d4 Leo Liu 2022-04-13  754  		| UVD_SUVD_CGC_CTRL__ENT_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  755  		| UVD_SUVD_CGC_CTRL__IME_MODE_MASK
8da1170a16e4d4 Leo Liu 2022-04-13  756  		| UVD_SUVD_CGC_CTRL__SITE_MODE_MA=
SK);
8da1170a16e4d4 Leo Liu 2022-04-13  757  	WREG32_SOC15(VCN, inst, regUVD_SUV=
D_CGC_CTRL, data);
8da1170a16e4d4 Leo Liu 2022-04-13  758  }
8da1170a16e4d4 Leo Liu 2022-04-13  759  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1343715562016690601==--

