Content-Type: multipart/mixed; boundary="===============1349134292752773079=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:1031 smu_v13_0_0_force_clk_levels() error: buffer overflow 'single_dpm_table->dpm_levels' 16 <= 31
Date: Sat, 18 Jun 2022 17:17:53 +0800
Message-ID: <202206181704.FRfydS7y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1349134292752773079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Evan Quan <evan.quan@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Lijo Lazar <lijo.lazar@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 276c03a0547068026241decd2c1159df0be5941f drm/amd/smu: Update SMU13 =
support for SMU 13.0.0
date:   6 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 weeks ago
config: ia64-randconfig-m031-20220616 (https://download.01.org/0day-ci/arch=
ive/20220618/202206181704.FRfydS7y-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:1031 smu_v13=
_0_0_force_clk_levels() error: buffer overflow 'single_dpm_table->dpm_level=
s' 16 <=3D 31

vim +1031 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c

276c03a0547068 Evan Quan 2022-04-06   968  =

276c03a0547068 Evan Quan 2022-04-06   969  static int smu_v13_0_0_force_clk=
_levels(struct smu_context *smu,
276c03a0547068 Evan Quan 2022-04-06   970  					enum smu_clk_type clk_type,
276c03a0547068 Evan Quan 2022-04-06   971  					uint32_t mask)
276c03a0547068 Evan Quan 2022-04-06   972  {
276c03a0547068 Evan Quan 2022-04-06   973  	struct smu_dpm_context *smu_dpm=
 =3D &smu->smu_dpm;
276c03a0547068 Evan Quan 2022-04-06   974  	struct smu_13_0_dpm_context *dp=
m_context =3D smu_dpm->dpm_context;
276c03a0547068 Evan Quan 2022-04-06   975  	struct smu_13_0_dpm_table *sing=
le_dpm_table;
276c03a0547068 Evan Quan 2022-04-06   976  	uint32_t soft_min_level, soft_m=
ax_level;
276c03a0547068 Evan Quan 2022-04-06   977  	uint32_t min_freq, max_freq;
276c03a0547068 Evan Quan 2022-04-06   978  	int ret =3D 0;
276c03a0547068 Evan Quan 2022-04-06   979  =

276c03a0547068 Evan Quan 2022-04-06   980  	soft_min_level =3D mask ? (ffs(=
mask) - 1) : 0;
276c03a0547068 Evan Quan 2022-04-06   981  	soft_max_level =3D mask ? (fls(=
mask) - 1) : 0;
276c03a0547068 Evan Quan 2022-04-06   982  =

276c03a0547068 Evan Quan 2022-04-06   983  	switch (clk_type) {
276c03a0547068 Evan Quan 2022-04-06   984  	case SMU_GFXCLK:
276c03a0547068 Evan Quan 2022-04-06   985  	case SMU_SCLK:
276c03a0547068 Evan Quan 2022-04-06   986  		single_dpm_table =3D &(dpm_con=
text->dpm_tables.gfx_table);
276c03a0547068 Evan Quan 2022-04-06   987  		break;
276c03a0547068 Evan Quan 2022-04-06   988  	case SMU_MCLK:
276c03a0547068 Evan Quan 2022-04-06   989  	case SMU_UCLK:
276c03a0547068 Evan Quan 2022-04-06   990  		single_dpm_table =3D &(dpm_con=
text->dpm_tables.uclk_table);
276c03a0547068 Evan Quan 2022-04-06   991  		break;
276c03a0547068 Evan Quan 2022-04-06   992  	case SMU_SOCCLK:
276c03a0547068 Evan Quan 2022-04-06   993  		single_dpm_table =3D &(dpm_con=
text->dpm_tables.soc_table);
276c03a0547068 Evan Quan 2022-04-06   994  		break;
276c03a0547068 Evan Quan 2022-04-06   995  	case SMU_FCLK:
276c03a0547068 Evan Quan 2022-04-06   996  		single_dpm_table =3D &(dpm_con=
text->dpm_tables.fclk_table);
276c03a0547068 Evan Quan 2022-04-06   997  		break;
276c03a0547068 Evan Quan 2022-04-06   998  	case SMU_VCLK:
276c03a0547068 Evan Quan 2022-04-06   999  	case SMU_VCLK1:
276c03a0547068 Evan Quan 2022-04-06  1000  		single_dpm_table =3D &(dpm_con=
text->dpm_tables.vclk_table);
276c03a0547068 Evan Quan 2022-04-06  1001  		break;
276c03a0547068 Evan Quan 2022-04-06  1002  	case SMU_DCLK:
276c03a0547068 Evan Quan 2022-04-06  1003  	case SMU_DCLK1:
276c03a0547068 Evan Quan 2022-04-06  1004  		single_dpm_table =3D &(dpm_con=
text->dpm_tables.dclk_table);
276c03a0547068 Evan Quan 2022-04-06  1005  		break;
276c03a0547068 Evan Quan 2022-04-06  1006  	default:
276c03a0547068 Evan Quan 2022-04-06  1007  		break;
276c03a0547068 Evan Quan 2022-04-06  1008  	}
276c03a0547068 Evan Quan 2022-04-06  1009  =

276c03a0547068 Evan Quan 2022-04-06  1010  	switch (clk_type) {
276c03a0547068 Evan Quan 2022-04-06  1011  	case SMU_GFXCLK:
276c03a0547068 Evan Quan 2022-04-06  1012  	case SMU_SCLK:
276c03a0547068 Evan Quan 2022-04-06  1013  	case SMU_MCLK:
276c03a0547068 Evan Quan 2022-04-06  1014  	case SMU_UCLK:
276c03a0547068 Evan Quan 2022-04-06  1015  	case SMU_SOCCLK:
276c03a0547068 Evan Quan 2022-04-06  1016  	case SMU_FCLK:
276c03a0547068 Evan Quan 2022-04-06  1017  	case SMU_VCLK:
276c03a0547068 Evan Quan 2022-04-06  1018  	case SMU_VCLK1:
276c03a0547068 Evan Quan 2022-04-06  1019  	case SMU_DCLK:
276c03a0547068 Evan Quan 2022-04-06  1020  	case SMU_DCLK1:
276c03a0547068 Evan Quan 2022-04-06  1021  		if (single_dpm_table->is_fine_=
grained) {
276c03a0547068 Evan Quan 2022-04-06  1022  			/* There is only 2 levels for=
 fine grained DPM */
276c03a0547068 Evan Quan 2022-04-06  1023  			soft_max_level =3D (soft_max_=
level >=3D 1 ? 1 : 0);
276c03a0547068 Evan Quan 2022-04-06  1024  			soft_min_level =3D (soft_min_=
level >=3D 1 ? 1 : 0);
276c03a0547068 Evan Quan 2022-04-06  1025  		} else {
276c03a0547068 Evan Quan 2022-04-06  1026  			if ((soft_max_level >=3D sing=
le_dpm_table->count) ||
276c03a0547068 Evan Quan 2022-04-06  1027  			    (soft_min_level >=3D sing=
le_dpm_table->count))
276c03a0547068 Evan Quan 2022-04-06  1028  				return -EINVAL;
276c03a0547068 Evan Quan 2022-04-06  1029  		}
276c03a0547068 Evan Quan 2022-04-06  1030  =

276c03a0547068 Evan Quan 2022-04-06 @1031  		min_freq =3D single_dpm_table-=
>dpm_levels[soft_min_level].value;
276c03a0547068 Evan Quan 2022-04-06  1032  		max_freq =3D single_dpm_table-=
>dpm_levels[soft_max_level].value;
276c03a0547068 Evan Quan 2022-04-06  1033  =

276c03a0547068 Evan Quan 2022-04-06  1034  		ret =3D smu_v13_0_set_soft_fre=
q_limited_range(smu,
276c03a0547068 Evan Quan 2022-04-06  1035  							    clk_type,
276c03a0547068 Evan Quan 2022-04-06  1036  							    min_freq,
276c03a0547068 Evan Quan 2022-04-06  1037  							    max_freq);
276c03a0547068 Evan Quan 2022-04-06  1038  		break;
276c03a0547068 Evan Quan 2022-04-06  1039  	case SMU_DCEFCLK:
276c03a0547068 Evan Quan 2022-04-06  1040  	case SMU_PCIE:
276c03a0547068 Evan Quan 2022-04-06  1041  	default:
276c03a0547068 Evan Quan 2022-04-06  1042  		break;
276c03a0547068 Evan Quan 2022-04-06  1043  	}
276c03a0547068 Evan Quan 2022-04-06  1044  =

276c03a0547068 Evan Quan 2022-04-06  1045  	return ret;
276c03a0547068 Evan Quan 2022-04-06  1046  }
276c03a0547068 Evan Quan 2022-04-06  1047  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1349134292752773079==--

