Content-Type: multipart/mixed; boundary="===============6852106196077617308=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c:1112:44: warning: Either the condition 'pix_clk_params==NULL' is redundant or there is possible null pointer dereference: pix_clk_params.
Date: Sun, 01 Nov 2020 10:14:40 +0800
Message-ID: <202011011035.1FkfLs6u-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6852106196077617308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c2dc4c073fb71b50904493657a7622b481b346e3
commit: 4d55b0dd1cdd8535ffd6057f210465575117d807 drm/amd/display: Add DCN3 =
CLK_MGR
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
compiler: mips-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_c=
lock_source.c:
>> drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c:1112:44: warning: =
Either the condition 'pix_clk_params=3D=3DNULL' is redundant or there is po=
ssible null pointer dereference: pix_clk_params. [nullPointerRedundantCheck]
    unsigned long long actual_pix_clk_100Hz =3D pix_clk_params->requested_p=
ix_clk_100hz;
                                              ^
   drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c:1118:21: note: Ass=
uming that condition 'pix_clk_params=3D=3DNULL' is not redundant
    if (pix_clk_params =3D=3D NULL || pll_settings =3D=3D NULL
                       ^
   drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c:1112:44: note: Nul=
l pointer dereference
    unsigned long long actual_pix_clk_100Hz =3D pix_clk_params->requested_p=
ix_clk_100hz;
                                              ^

vim +1112 drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c

4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1106  =

4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1107  static uint32_t dcn3_get=
_pix_clk_dividers(
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1108  		struct clock_source *c=
s,
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1109  		struct pixel_clk_param=
s *pix_clk_params,
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1110  		struct pll_settings *p=
ll_settings)
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1111  {
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21 @1112  	unsigned long long actu=
al_pix_clk_100Hz =3D pix_clk_params->requested_pix_clk_100hz;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1113  	struct dce110_clk_src *=
clk_src;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1114  =

4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1115  	clk_src =3D TO_DCE110_C=
LK_SRC(cs);
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1116  	DC_LOGGER_INIT();
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1117  =

4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1118  	if (pix_clk_params =3D=
=3D NULL || pll_settings =3D=3D NULL
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1119  			|| pix_clk_params->re=
quested_pix_clk_100hz =3D=3D 0) {
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1120  		DC_LOG_ERROR(
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1121  			"%s: Invalid paramete=
rs!!\n", __func__);
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1122  		return -1;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1123  	}
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1124  =

4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1125  	memset(pll_settings, 0,=
 sizeof(*pll_settings));
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1126  	/* Adjust for HDMI Type=
 A deep color */
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1127  	if (pix_clk_params->sig=
nal_type =3D=3D SIGNAL_TYPE_HDMI_TYPE_A) {
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1128  		switch (pix_clk_params=
->color_depth) {
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1129  		case COLOR_DEPTH_10101=
0:
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1130  			actual_pix_clk_100Hz =
=3D (actual_pix_clk_100Hz * 5) >> 2;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1131  			break;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1132  		case COLOR_DEPTH_12121=
2:
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1133  			actual_pix_clk_100Hz =
=3D (actual_pix_clk_100Hz * 6) >> 2;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1134  			break;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1135  		case COLOR_DEPTH_16161=
6:
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1136  			actual_pix_clk_100Hz =
=3D actual_pix_clk_100Hz * 2;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1137  			break;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1138  		default:
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1139  			break;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1140  		}
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1141  	}
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1142  	pll_settings->actual_pi=
x_clk_100hz =3D (unsigned int) actual_pix_clk_100Hz;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1143  	pll_settings->adjusted_=
pix_clk_100hz =3D (unsigned int) actual_pix_clk_100Hz;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1144  	pll_settings->calculate=
d_pix_clk_100hz =3D (unsigned int) actual_pix_clk_100Hz;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1145  =

4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1146  	return 0;
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1147  }
4d55b0dd1cdd85 Bhawanpreet Lakha 2020-05-21  1148  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6852106196077617308==--

