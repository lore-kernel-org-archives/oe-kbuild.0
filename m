Content-Type: multipart/mixed; boundary="===============8103969387727110722=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c:2329:26: warning: Array index 'i' is used before limits check.
Date: Fri, 27 Nov 2020 09:16:06 +0800
Message-ID: <202011270904.8yUBhJ9Y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8103969387727110722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alvin Lee <alvin.lee2@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>
CC: Hersen Wu <hersenxs.wu@amd.com>
CC: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   85a2c56cb4454c73f56d3099d96942e7919b292f
commit: 88e39834afd5ca1c2367a49db3e0db2ae915f269 drm/amd/display: Update DC=
N3 bounding box
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn=
30_resource.c:
>> drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c:2329:26: warning: =
Array index 'i' is used before limits check. [arrayIndexThenCheck]
      if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j] && i < num_dcf=
clk_sta_targets) {
                            ^

vim +/i +2329 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c

88e39834afd5ca Alvin Lee         2020-06-15  2261  =

5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2262  static void dcn30_update=
_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2263  {
88e39834afd5ca Alvin Lee         2020-06-15  2264  	unsigned int i, j;
88e39834afd5ca Alvin Lee         2020-06-15  2265  	unsigned int num_states=
 =3D 0;
88e39834afd5ca Alvin Lee         2020-06-15  2266  =

88e39834afd5ca Alvin Lee         2020-06-15  2267  	unsigned int dcfclk_mhz=
[DC__VOLTAGE_STATES] =3D {0};
88e39834afd5ca Alvin Lee         2020-06-15  2268  	unsigned int dram_speed=
_mts[DC__VOLTAGE_STATES] =3D {0};
88e39834afd5ca Alvin Lee         2020-06-15  2269  	unsigned int optimal_uc=
lk_for_dcfclk_sta_targets[DC__VOLTAGE_STATES] =3D {0};
88e39834afd5ca Alvin Lee         2020-06-15  2270  	unsigned int optimal_dc=
fclk_for_uclk[DC__VOLTAGE_STATES] =3D {0};
88e39834afd5ca Alvin Lee         2020-06-15  2271  =

88e39834afd5ca Alvin Lee         2020-06-15  2272  	unsigned int dcfclk_sta=
_targets[DC__VOLTAGE_STATES] =3D {694, 875, 1000, 1200};
88e39834afd5ca Alvin Lee         2020-06-15  2273  	unsigned int num_dcfclk=
_sta_targets =3D 4;
88e39834afd5ca Alvin Lee         2020-06-15  2274  	unsigned int num_uclk_s=
tates;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2275  =

d31bdabbf5b6f5 Alvin Lee         2020-06-11  2276  	if (dc->ctx->dc_bios->v=
ram_info.num_chans)
d31bdabbf5b6f5 Alvin Lee         2020-06-11  2277  		dcn3_0_soc.num_chans =
=3D dc->ctx->dc_bios->vram_info.num_chans;
d31bdabbf5b6f5 Alvin Lee         2020-06-11  2278  =

d31bdabbf5b6f5 Alvin Lee         2020-06-11  2279  	if (dc->ctx->dc_bios->v=
ram_info.dram_channel_width_bytes)
d31bdabbf5b6f5 Alvin Lee         2020-06-11  2280  		dcn3_0_soc.dram_channe=
l_width_bytes =3D dc->ctx->dc_bios->vram_info.dram_channel_width_bytes;
d31bdabbf5b6f5 Alvin Lee         2020-06-11  2281  =

5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2282  	dcn3_0_soc.dispclk_dppc=
lk_vco_speed_mhz =3D dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2283  	dc->dml.soc.dispclk_dpp=
clk_vco_speed_mhz =3D dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2284  =

5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2285  	if (bw_params->clk_tabl=
e.entries[0].memclk_mhz) {
88e39834afd5ca Alvin Lee         2020-06-15  2286  =

88e39834afd5ca Alvin Lee         2020-06-15  2287  		if (bw_params->clk_tab=
le.entries[1].dcfclk_mhz > dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
88e39834afd5ca Alvin Lee         2020-06-15  2288  			// If max DCFCLK is g=
reater than the max DCFCLK STA target, insert into the DCFCLK STA target ar=
ray
88e39834afd5ca Alvin Lee         2020-06-15  2289  			dcfclk_sta_targets[nu=
m_dcfclk_sta_targets] =3D bw_params->clk_table.entries[1].dcfclk_mhz;
88e39834afd5ca Alvin Lee         2020-06-15  2290  			num_dcfclk_sta_target=
s++;
88e39834afd5ca Alvin Lee         2020-06-15  2291  		} else if (bw_params->=
clk_table.entries[1].dcfclk_mhz < dcfclk_sta_targets[num_dcfclk_sta_targets=
-1]) {
88e39834afd5ca Alvin Lee         2020-06-15  2292  			// If max DCFCLK is l=
ess than the max DCFCLK STA target, cap values and remove duplicates
88e39834afd5ca Alvin Lee         2020-06-15  2293  			for (i =3D 0; i < num=
_dcfclk_sta_targets; i++) {
88e39834afd5ca Alvin Lee         2020-06-15  2294  				if (dcfclk_sta_targe=
ts[i] > bw_params->clk_table.entries[1].dcfclk_mhz) {
88e39834afd5ca Alvin Lee         2020-06-15  2295  					dcfclk_sta_targets[=
i] =3D bw_params->clk_table.entries[1].dcfclk_mhz;
88e39834afd5ca Alvin Lee         2020-06-15  2296  					break;
88e39834afd5ca Alvin Lee         2020-06-15  2297  				}
88e39834afd5ca Alvin Lee         2020-06-15  2298  			}
88e39834afd5ca Alvin Lee         2020-06-15  2299  			// Update size of arr=
ay since we "removed" duplicates
88e39834afd5ca Alvin Lee         2020-06-15  2300  			num_dcfclk_sta_target=
s =3D i + 1;
88e39834afd5ca Alvin Lee         2020-06-15  2301  		}
88e39834afd5ca Alvin Lee         2020-06-15  2302  =

88e39834afd5ca Alvin Lee         2020-06-15  2303  		num_uclk_states =3D bw=
_params->clk_table.num_entries;
88e39834afd5ca Alvin Lee         2020-06-15  2304  =

88e39834afd5ca Alvin Lee         2020-06-15  2305  		// Calculate optimal d=
cfclk for each uclk
88e39834afd5ca Alvin Lee         2020-06-15  2306  		for (i =3D 0; i < num_=
uclk_states; i++) {
88e39834afd5ca Alvin Lee         2020-06-15  2307  			get_optimal_dcfclk_fc=
lk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
88e39834afd5ca Alvin Lee         2020-06-15  2308  					&optimal_dcfclk_for=
_uclk[i], NULL);
88e39834afd5ca Alvin Lee         2020-06-15  2309  			if (optimal_dcfclk_fo=
r_uclk[i] < bw_params->clk_table.entries[0].dcfclk_mhz) {
88e39834afd5ca Alvin Lee         2020-06-15  2310  				optimal_dcfclk_for_u=
clk[i] =3D bw_params->clk_table.entries[0].dcfclk_mhz;
88e39834afd5ca Alvin Lee         2020-06-15  2311  			}
88e39834afd5ca Alvin Lee         2020-06-15  2312  		}
88e39834afd5ca Alvin Lee         2020-06-15  2313  =

88e39834afd5ca Alvin Lee         2020-06-15  2314  		// Calculate optimal u=
clk for each dcfclk sta target
88e39834afd5ca Alvin Lee         2020-06-15  2315  		for (i =3D 0; i < num_=
dcfclk_sta_targets; i++) {
88e39834afd5ca Alvin Lee         2020-06-15  2316  			for (j =3D 0; j < num=
_uclk_states; j++) {
88e39834afd5ca Alvin Lee         2020-06-15  2317  				if (dcfclk_sta_targe=
ts[i] < optimal_dcfclk_for_uclk[j]) {
88e39834afd5ca Alvin Lee         2020-06-15  2318  					optimal_uclk_for_dc=
fclk_sta_targets[i] =3D
88e39834afd5ca Alvin Lee         2020-06-15  2319  							bw_params->clk_ta=
ble.entries[j].memclk_mhz * 16;
88e39834afd5ca Alvin Lee         2020-06-15  2320  					break;
88e39834afd5ca Alvin Lee         2020-06-15  2321  				}
88e39834afd5ca Alvin Lee         2020-06-15  2322  			}
88e39834afd5ca Alvin Lee         2020-06-15  2323  		}
88e39834afd5ca Alvin Lee         2020-06-15  2324  =

88e39834afd5ca Alvin Lee         2020-06-15  2325  		i =3D 0;
88e39834afd5ca Alvin Lee         2020-06-15  2326  		j =3D 0;
88e39834afd5ca Alvin Lee         2020-06-15  2327  		// create the final dc=
fclk and uclk table
88e39834afd5ca Alvin Lee         2020-06-15  2328  		while (i < num_dcfclk_=
sta_targets && j < num_uclk_states && num_states < DC__VOLTAGE_STATES) {
88e39834afd5ca Alvin Lee         2020-06-15 @2329  			if (dcfclk_sta_target=
s[i] < optimal_dcfclk_for_uclk[j] && i < num_dcfclk_sta_targets) {
88e39834afd5ca Alvin Lee         2020-06-15  2330  				dcfclk_mhz[num_state=
s] =3D dcfclk_sta_targets[i];
88e39834afd5ca Alvin Lee         2020-06-15  2331  				dram_speed_mts[num_s=
tates++] =3D optimal_uclk_for_dcfclk_sta_targets[i++];
88e39834afd5ca Alvin Lee         2020-06-15  2332  			} else {
88e39834afd5ca Alvin Lee         2020-06-15  2333  				if (j < num_uclk_sta=
tes && optimal_dcfclk_for_uclk[j] <=3D bw_params->clk_table.entries[1].dcfc=
lk_mhz) {
88e39834afd5ca Alvin Lee         2020-06-15  2334  					dcfclk_mhz[num_stat=
es] =3D optimal_dcfclk_for_uclk[j];
88e39834afd5ca Alvin Lee         2020-06-15  2335  					dram_speed_mts[num_=
states++] =3D bw_params->clk_table.entries[j++].memclk_mhz * 16;
88e39834afd5ca Alvin Lee         2020-06-15  2336  				} else {
88e39834afd5ca Alvin Lee         2020-06-15  2337  					j =3D num_uclk_stat=
es;
88e39834afd5ca Alvin Lee         2020-06-15  2338  				}
88e39834afd5ca Alvin Lee         2020-06-15  2339  			}
88e39834afd5ca Alvin Lee         2020-06-15  2340  		}
88e39834afd5ca Alvin Lee         2020-06-15  2341  =

88e39834afd5ca Alvin Lee         2020-06-15  2342  		while (i < num_dcfclk_=
sta_targets && num_states < DC__VOLTAGE_STATES) {
88e39834afd5ca Alvin Lee         2020-06-15  2343  			dcfclk_mhz[num_states=
] =3D dcfclk_sta_targets[i];
88e39834afd5ca Alvin Lee         2020-06-15  2344  			dram_speed_mts[num_st=
ates++] =3D optimal_uclk_for_dcfclk_sta_targets[i++];
88e39834afd5ca Alvin Lee         2020-06-15  2345  		}
88e39834afd5ca Alvin Lee         2020-06-15  2346  =

88e39834afd5ca Alvin Lee         2020-06-15  2347  		while (j < num_uclk_st=
ates && num_states < DC__VOLTAGE_STATES &&
88e39834afd5ca Alvin Lee         2020-06-15  2348  				optimal_dcfclk_for_u=
clk[j] <=3D bw_params->clk_table.entries[1].dcfclk_mhz) {
88e39834afd5ca Alvin Lee         2020-06-15  2349  			dcfclk_mhz[num_states=
] =3D optimal_dcfclk_for_uclk[j];
88e39834afd5ca Alvin Lee         2020-06-15  2350  			dram_speed_mts[num_st=
ates++] =3D bw_params->clk_table.entries[j++].memclk_mhz * 16;
88e39834afd5ca Alvin Lee         2020-06-15  2351  		}
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2352  =

5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2353  		for (i =3D 0; i < dcn3=
_0_soc.num_states; i++) {
88e39834afd5ca Alvin Lee         2020-06-15  2354  			dcn3_0_soc.clock_limi=
ts[i].dcfclk_mhz =3D dcfclk_mhz[i];
88e39834afd5ca Alvin Lee         2020-06-15  2355  			dcn3_0_soc.clock_limi=
ts[i].fabricclk_mhz =3D dcfclk_mhz[i];
88e39834afd5ca Alvin Lee         2020-06-15  2356  			dcn3_0_soc.clock_limi=
ts[i].dram_speed_mts =3D dram_speed_mts[i];
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2357  		}
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2358  	}
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2359  =

5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2360  	/* Fill all states with=
 max values of all other clocks */
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2361  	for (i =3D 0; i < dcn3_=
0_soc.num_states; i++) {
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2362  		/* Some clocks can com=
e from bw_params, if so fill from bw_params[1], otherwise fill from dcn3_0_=
soc[1] */
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2363  		/* Temporarily ignore =
bw_params values */
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2364  =

5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2365  		/* DTBCLK */
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2366  		/*if (bw_params->clk_t=
able.entries[0].dtbclk_mhz)
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2367  			dcn3_0_soc.clock_limi=
ts[i].dtbclk_mhz =3D bw_params->clk_table.entries[1].dtbclk_mhz;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2368  		else*/
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2369  			dcn3_0_soc.clock_limi=
ts[i].dtbclk_mhz =3D dcn3_0_soc.clock_limits[1].dtbclk_mhz;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2370  =

5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2371  		/* DISPCLK */
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2372  		/*if (bw_params->clk_t=
able.entries[0].dispclk_mhz)
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2373  			dcn3_0_soc.clock_limi=
ts[i].dispclk_mhz =3D bw_params->clk_table.entries[1].dispclk_mhz;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2374  		else*/
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2375  			dcn3_0_soc.clock_limi=
ts[i].dispclk_mhz =3D dcn3_0_soc.clock_limits[1].dispclk_mhz;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2376  =

5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2377  		/* DPPCLK */
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2378  		/*if (bw_params->clk_t=
able.entries[0].dppclk_mhz)
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2379  			dcn3_0_soc.clock_limi=
ts[i].dppclk_mhz =3D bw_params->clk_table.entries[1].dppclk_mhz;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2380  		else*/
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2381  			dcn3_0_soc.clock_limi=
ts[i].dppclk_mhz =3D dcn3_0_soc.clock_limits[1].dppclk_mhz;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2382  =

5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2383  		/* PHYCLK */
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2384  		/*if (bw_params->clk_t=
able.entries[0].phyclk_mhz)
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2385  			dcn3_0_soc.clock_limi=
ts[i].phyclk_mhz =3D bw_params->clk_table.entries[1].phyclk_mhz;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2386  		else*/
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2387  			dcn3_0_soc.clock_limi=
ts[i].phyclk_mhz =3D dcn3_0_soc.clock_limits[1].phyclk_mhz;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2388  =

5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2389  		/* These clocks cannot=
 come from bw_params, always fill from dcn3_0_soc[1] */
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2390  		/* FCLK, PHYCLK_D18, S=
OCCLK, DSCCLK */
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2391  		dcn3_0_soc.clock_limit=
s[i].phyclk_d18_mhz =3D dcn3_0_soc.clock_limits[1].phyclk_d18_mhz;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2392  		dcn3_0_soc.clock_limit=
s[i].socclk_mhz =3D dcn3_0_soc.clock_limits[1].socclk_mhz;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2393  		dcn3_0_soc.clock_limit=
s[i].dscclk_mhz =3D dcn3_0_soc.clock_limits[1].dscclk_mhz;
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2394  	}
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2395  =

5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2396  	/* re-init DML with upd=
ated bb */
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2397  	dml_init_instance(&dc->=
dml, &dcn3_0_soc, &dcn3_0_ip, DML_PROJECT_DCN30);
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2398  	if (dc->current_state)
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2399  		dml_init_instance(&dc-=
>current_state->bw_ctx.dml, &dcn3_0_soc, &dcn3_0_ip, DML_PROJECT_DCN30);
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2400  }
5dba4991fd338d Bhawanpreet Lakha 2020-05-21  2401  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8103969387727110722==--

