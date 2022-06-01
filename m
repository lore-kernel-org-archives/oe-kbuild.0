Content-Type: multipart/mixed; boundary="===============6110774286691725359=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1067 smu_v13_0_7_force_clk_levels() error: buffer overflow 'single_dpm_table->dpm_levels' 16 <= 31
Date: Wed, 01 Jun 2022 14:25:13 +0800
Message-ID: <202206011404.oQCkAPYj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6110774286691725359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kenneth Feng <kenneth.feng@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Jack Gui <Jack.Gui@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   700170bf6b4d773e328fa54ebb70ba444007c702
commit: 2492d40d6ff2043682316b26c1c6436c9023de8f drm/amd/pm: pp_dpm_* inter=
face for smu_v13_0_7
date:   4 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: ia64-randconfig-m031-20220530 (https://download.01.org/0day-ci/arch=
ive/20220601/202206011404.oQCkAPYj-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1067 smu_v13=
_0_7_force_clk_levels() error: buffer overflow 'single_dpm_table->dpm_level=
s' 16 <=3D 31

vim +1067 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c

2492d40d6ff204 Kenneth Feng 2022-04-15  1004  =

2492d40d6ff204 Kenneth Feng 2022-04-15  1005  static int smu_v13_0_7_force_=
clk_levels(struct smu_context *smu,
2492d40d6ff204 Kenneth Feng 2022-04-15  1006  					enum smu_clk_type clk_ty=
pe,
2492d40d6ff204 Kenneth Feng 2022-04-15  1007  					uint32_t mask)
2492d40d6ff204 Kenneth Feng 2022-04-15  1008  {
2492d40d6ff204 Kenneth Feng 2022-04-15  1009  	struct smu_dpm_context *smu_=
dpm =3D &smu->smu_dpm;
2492d40d6ff204 Kenneth Feng 2022-04-15  1010  	struct smu_13_0_dpm_context =
*dpm_context =3D smu_dpm->dpm_context;
2492d40d6ff204 Kenneth Feng 2022-04-15  1011  	struct smu_13_0_dpm_table *s=
ingle_dpm_table;
2492d40d6ff204 Kenneth Feng 2022-04-15  1012  	uint32_t soft_min_level, sof=
t_max_level;
2492d40d6ff204 Kenneth Feng 2022-04-15  1013  	uint32_t min_freq, max_freq;
2492d40d6ff204 Kenneth Feng 2022-04-15  1014  	int ret =3D 0;
2492d40d6ff204 Kenneth Feng 2022-04-15  1015  =

2492d40d6ff204 Kenneth Feng 2022-04-15  1016  	soft_min_level =3D mask ? (f=
fs(mask) - 1) : 0;
2492d40d6ff204 Kenneth Feng 2022-04-15  1017  	soft_max_level =3D mask ? (f=
ls(mask) - 1) : 0;
2492d40d6ff204 Kenneth Feng 2022-04-15  1018  =

2492d40d6ff204 Kenneth Feng 2022-04-15  1019  	switch (clk_type) {
2492d40d6ff204 Kenneth Feng 2022-04-15  1020  	case SMU_GFXCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1021  	case SMU_SCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1022  		single_dpm_table =3D &(dpm_=
context->dpm_tables.gfx_table);
2492d40d6ff204 Kenneth Feng 2022-04-15  1023  		break;
2492d40d6ff204 Kenneth Feng 2022-04-15  1024  	case SMU_MCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1025  	case SMU_UCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1026  		single_dpm_table =3D &(dpm_=
context->dpm_tables.uclk_table);
2492d40d6ff204 Kenneth Feng 2022-04-15  1027  		break;
2492d40d6ff204 Kenneth Feng 2022-04-15  1028  	case SMU_SOCCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1029  		single_dpm_table =3D &(dpm_=
context->dpm_tables.soc_table);
2492d40d6ff204 Kenneth Feng 2022-04-15  1030  		break;
2492d40d6ff204 Kenneth Feng 2022-04-15  1031  	case SMU_FCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1032  		single_dpm_table =3D &(dpm_=
context->dpm_tables.fclk_table);
2492d40d6ff204 Kenneth Feng 2022-04-15  1033  		break;
2492d40d6ff204 Kenneth Feng 2022-04-15  1034  	case SMU_VCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1035  	case SMU_VCLK1:
2492d40d6ff204 Kenneth Feng 2022-04-15  1036  		single_dpm_table =3D &(dpm_=
context->dpm_tables.vclk_table);
2492d40d6ff204 Kenneth Feng 2022-04-15  1037  		break;
2492d40d6ff204 Kenneth Feng 2022-04-15  1038  	case SMU_DCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1039  	case SMU_DCLK1:
2492d40d6ff204 Kenneth Feng 2022-04-15  1040  		single_dpm_table =3D &(dpm_=
context->dpm_tables.dclk_table);
2492d40d6ff204 Kenneth Feng 2022-04-15  1041  		break;
2492d40d6ff204 Kenneth Feng 2022-04-15  1042  	default:
2492d40d6ff204 Kenneth Feng 2022-04-15  1043  		break;
2492d40d6ff204 Kenneth Feng 2022-04-15  1044  	}
2492d40d6ff204 Kenneth Feng 2022-04-15  1045  =

2492d40d6ff204 Kenneth Feng 2022-04-15  1046  	switch (clk_type) {
2492d40d6ff204 Kenneth Feng 2022-04-15  1047  	case SMU_GFXCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1048  	case SMU_SCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1049  	case SMU_MCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1050  	case SMU_UCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1051  	case SMU_SOCCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1052  	case SMU_FCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1053  	case SMU_VCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1054  	case SMU_VCLK1:
2492d40d6ff204 Kenneth Feng 2022-04-15  1055  	case SMU_DCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1056  	case SMU_DCLK1:
2492d40d6ff204 Kenneth Feng 2022-04-15  1057  		if (single_dpm_table->is_fi=
ne_grained) {
2492d40d6ff204 Kenneth Feng 2022-04-15  1058  			/* There is only 2 levels =
for fine grained DPM */
2492d40d6ff204 Kenneth Feng 2022-04-15  1059  			soft_max_level =3D (soft_m=
ax_level >=3D 1 ? 1 : 0);
2492d40d6ff204 Kenneth Feng 2022-04-15  1060  			soft_min_level =3D (soft_m=
in_level >=3D 1 ? 1 : 0);
2492d40d6ff204 Kenneth Feng 2022-04-15  1061  		} else {
2492d40d6ff204 Kenneth Feng 2022-04-15  1062  			if ((soft_max_level >=3D s=
ingle_dpm_table->count) ||
2492d40d6ff204 Kenneth Feng 2022-04-15  1063  			    (soft_min_level >=3D s=
ingle_dpm_table->count))
2492d40d6ff204 Kenneth Feng 2022-04-15  1064  				return -EINVAL;
2492d40d6ff204 Kenneth Feng 2022-04-15  1065  		}
2492d40d6ff204 Kenneth Feng 2022-04-15  1066  =

2492d40d6ff204 Kenneth Feng 2022-04-15 @1067  		min_freq =3D single_dpm_tab=
le->dpm_levels[soft_min_level].value;
2492d40d6ff204 Kenneth Feng 2022-04-15  1068  		max_freq =3D single_dpm_tab=
le->dpm_levels[soft_max_level].value;
2492d40d6ff204 Kenneth Feng 2022-04-15  1069  =

2492d40d6ff204 Kenneth Feng 2022-04-15  1070  		ret =3D smu_v13_0_set_soft_=
freq_limited_range(smu,
2492d40d6ff204 Kenneth Feng 2022-04-15  1071  							    clk_type,
2492d40d6ff204 Kenneth Feng 2022-04-15  1072  							    min_freq,
2492d40d6ff204 Kenneth Feng 2022-04-15  1073  							    max_freq);
2492d40d6ff204 Kenneth Feng 2022-04-15  1074  		break;
2492d40d6ff204 Kenneth Feng 2022-04-15  1075  	case SMU_DCEFCLK:
2492d40d6ff204 Kenneth Feng 2022-04-15  1076  	case SMU_PCIE:
2492d40d6ff204 Kenneth Feng 2022-04-15  1077  	default:
2492d40d6ff204 Kenneth Feng 2022-04-15  1078  		break;
2492d40d6ff204 Kenneth Feng 2022-04-15  1079  	}
2492d40d6ff204 Kenneth Feng 2022-04-15  1080  =

2492d40d6ff204 Kenneth Feng 2022-04-15  1081  	return ret;
2492d40d6ff204 Kenneth Feng 2022-04-15  1082  }
2492d40d6ff204 Kenneth Feng 2022-04-15  1083  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6110774286691725359==--

