Content-Type: multipart/mixed; boundary="===============6868706175130018526=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.c:2538 vega20_force_clock_level() error: buffer overflow 'data->dpm_table.gfx_table.dpm_levels' 16 <= 31
Date: Thu, 14 Jan 2021 20:23:16 +0800
Message-ID: <202101142009.JzYLCydw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6868706175130018526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   65f0d2414b7079556fbbcc070b3d1c9f9587606d
commit: 6f6573a4044adefbd07f1bd951a2041150e888d7 asm-generic: fix ffs -Wsha=
dow warning
date:   3 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 months ago
config: powerpc-randconfig-m031-20210114 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.c:2538 vega20=
_force_clock_level() error: buffer overflow 'data->dpm_table.gfx_table.dpm_=
levels' 16 <=3D 31
drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.c:2565 vega20=
_force_clock_level() error: buffer overflow 'data->dpm_table.mem_table.dpm_=
levels' 16 <=3D 31
drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.c:2593 vega20=
_force_clock_level() error: buffer overflow 'data->dpm_table.soc_table.dpm_=
levels' 16 <=3D 31
drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.c:2621 vega20=
_force_clock_level() error: buffer overflow 'data->dpm_table.fclk_table.dpm=
_levels' 16 <=3D 31
drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.c:2648 vega20=
_force_clock_level() error: buffer overflow 'data->dpm_table.dcef_table.dpm=
_levels' 16 <=3D 31
drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_hwmgr.c:1918 vega12=
_force_clock_level() error: buffer overflow 'data->dpm_table.gfx_table.dpm_=
levels' 16 <=3D 31
drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_hwmgr.c:1938 vega12=
_force_clock_level() error: buffer overflow 'data->dpm_table.mem_table.dpm_=
levels' 16 <=3D 31
drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_hwmgr.c:1966 vega12=
_force_clock_level() error: buffer overflow 'data->dpm_table.soc_table.dpm_=
levels' 16 <=3D 31
drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_hwmgr.c:1993 vega12=
_force_clock_level() error: buffer overflow 'data->dpm_table.dcef_table.dpm=
_levels' 16 <=3D 31

vim +2538 drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega20_hwmgr.c

da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2517  =

da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2518  static int vega20_force_clock_level(struct pp_hwmgr *h=
wmgr,
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2519  		enum pp_clock_type type, uint32_t mask)
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2520  {
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2521  	struct vega20_hwmgr *data =3D (struct vega20_hwmgr *)=
(hwmgr->backend);
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2522  	uint32_t soft_min_level, soft_max_level, hard_min_lev=
el;
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2523  	int ret =3D 0;
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2524  =

da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2525  	switch (type) {
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2526  	case PP_SCLK:
fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08  2527  		soft_min_level =3D mask ? (ffs(mask) - 1) : 0;
fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08  2528  		soft_max_level =3D mask ? (fls(mask) - 1) : 0;
fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08  2529  =

c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2530  		if (soft_max_level >=3D data->dpm_table.gfx_table.co=
unt) {
c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2531  			pr_err("Clock level specified %d is over max allowe=
d %d\n",
c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2532  					soft_max_level,
c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2533  					data->dpm_table.gfx_table.count - 1);
c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2534  			return -EINVAL;
c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2535  		}
c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2536  =

fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08  2537  		data->dpm_table.gfx_table.dpm_state.soft_min_level =
=3D
fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08 @2538  			data->dpm_table.gfx_table.dpm_levels[soft_min_level=
].value;
fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08  2539  		data->dpm_table.gfx_table.dpm_state.soft_max_level =
=3D
fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08  2540  			data->dpm_table.gfx_table.dpm_levels[soft_max_level=
].value;
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2541  =

106ea7feb98f1183 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-11-28  2542  		ret =3D vega20_upload_dpm_min_level(hwmgr, FEATURE_D=
PM_GFXCLK_MASK);
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2543  		PP_ASSERT_WITH_CODE(!ret,
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2544  			"Failed to upload boot level to lowest!",
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2545  			return ret);
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2546  =

106ea7feb98f1183 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-11-28  2547  		ret =3D vega20_upload_dpm_max_level(hwmgr, FEATURE_D=
PM_GFXCLK_MASK);
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2548  		PP_ASSERT_WITH_CODE(!ret,
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2549  			"Failed to upload dpm max level to highest!",
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2550  			return ret);
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2551  		break;
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2552  =

da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2553  	case PP_MCLK:
fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08  2554  		soft_min_level =3D mask ? (ffs(mask) - 1) : 0;
fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08  2555  		soft_max_level =3D mask ? (fls(mask) - 1) : 0;
fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08  2556  =

c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2557  		if (soft_max_level >=3D data->dpm_table.mem_table.co=
unt) {
c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2558  			pr_err("Clock level specified %d is over max allowe=
d %d\n",
c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2559  					soft_max_level,
c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2560  					data->dpm_table.mem_table.count - 1);
c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2561  			return -EINVAL;
c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2562  		}
c81e42f036232cdb drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-08  2563  =

fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08  2564  		data->dpm_table.mem_table.dpm_state.soft_min_level =
=3D
fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08 @2565  			data->dpm_table.mem_table.dpm_levels[soft_min_level=
].value;
fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08  2566  		data->dpm_table.mem_table.dpm_state.soft_max_level =
=3D
fff7e3e049d89780 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-05-08  2567  			data->dpm_table.mem_table.dpm_levels[soft_max_level=
].value;
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2568  =

106ea7feb98f1183 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-11-28  2569  		ret =3D vega20_upload_dpm_min_level(hwmgr, FEATURE_D=
PM_UCLK_MASK);
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2570  		PP_ASSERT_WITH_CODE(!ret,
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2571  			"Failed to upload boot level to lowest!",
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2572  			return ret);
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2573  =

106ea7feb98f1183 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-11-28  2574  		ret =3D vega20_upload_dpm_max_level(hwmgr, FEATURE_D=
PM_UCLK_MASK);
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2575  		PP_ASSERT_WITH_CODE(!ret,
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2576  			"Failed to upload dpm max level to highest!",
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2577  			return ret);
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2578  =

da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2579  		break;
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2580  =

d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2581  	case PP_SOCCLK:
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2582  		soft_min_level =3D mask ? (ffs(mask) - 1) : 0;
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2583  		soft_max_level =3D mask ? (fls(mask) - 1) : 0;
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2584  =

d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2585  		if (soft_max_level >=3D data->dpm_table.soc_table.co=
unt) {
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2586  			pr_err("Clock level specified %d is over max allowe=
d %d\n",
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2587  					soft_max_level,
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2588  					data->dpm_table.soc_table.count - 1);
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2589  			return -EINVAL;
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2590  		}
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2591  =

d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2592  		data->dpm_table.soc_table.dpm_state.soft_min_level =
=3D
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14 @2593  			data->dpm_table.soc_table.dpm_levels[soft_min_level=
].value;
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2594  		data->dpm_table.soc_table.dpm_state.soft_max_level =
=3D
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2595  			data->dpm_table.soc_table.dpm_levels[soft_max_level=
].value;
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2596  =

d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2597  		ret =3D vega20_upload_dpm_min_level(hwmgr, FEATURE_D=
PM_SOCCLK_MASK);
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2598  		PP_ASSERT_WITH_CODE(!ret,
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2599  			"Failed to upload boot level to lowest!",
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2600  			return ret);
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2601  =

d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2602  		ret =3D vega20_upload_dpm_max_level(hwmgr, FEATURE_D=
PM_SOCCLK_MASK);
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2603  		PP_ASSERT_WITH_CODE(!ret,
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2604  			"Failed to upload dpm max level to highest!",
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2605  			return ret);
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2606  =

d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2607  		break;
d7337ca2640cde21 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2608  =

828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2609  	case PP_FCLK:
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2610  		soft_min_level =3D mask ? (ffs(mask) - 1) : 0;
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2611  		soft_max_level =3D mask ? (fls(mask) - 1) : 0;
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2612  =

828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2613  		if (soft_max_level >=3D data->dpm_table.fclk_table.c=
ount) {
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2614  			pr_err("Clock level specified %d is over max allowe=
d %d\n",
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2615  					soft_max_level,
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2616  					data->dpm_table.fclk_table.count - 1);
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2617  			return -EINVAL;
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2618  		}
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2619  =

828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2620  		data->dpm_table.fclk_table.dpm_state.soft_min_level =
=3D
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14 @2621  			data->dpm_table.fclk_table.dpm_levels[soft_min_leve=
l].value;
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2622  		data->dpm_table.fclk_table.dpm_state.soft_max_level =
=3D
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2623  			data->dpm_table.fclk_table.dpm_levels[soft_max_leve=
l].value;
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2624  =

828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2625  		ret =3D vega20_upload_dpm_min_level(hwmgr, FEATURE_D=
PM_FCLK_MASK);
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2626  		PP_ASSERT_WITH_CODE(!ret,
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2627  			"Failed to upload boot level to lowest!",
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2628  			return ret);
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2629  =

828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2630  		ret =3D vega20_upload_dpm_max_level(hwmgr, FEATURE_D=
PM_FCLK_MASK);
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2631  		PP_ASSERT_WITH_CODE(!ret,
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2632  			"Failed to upload dpm max level to highest!",
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2633  			return ret);
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2634  =

828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2635  		break;
828e37efe802ba8c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2636  =

d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2637  	case PP_DCEFCLK:
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2638  		hard_min_level =3D mask ? (ffs(mask) - 1) : 0;
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2639  =

d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2640  		if (hard_min_level >=3D data->dpm_table.dcef_table.c=
ount) {
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2641  			pr_err("Clock level specified %d is over max allowe=
d %d\n",
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2642  					hard_min_level,
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2643  					data->dpm_table.dcef_table.count - 1);
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2644  			return -EINVAL;
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2645  		}
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2646  =

d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2647  		data->dpm_table.dcef_table.dpm_state.hard_min_level =
=3D
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14 @2648  			data->dpm_table.dcef_table.dpm_levels[hard_min_leve=
l].value;
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2649  =

d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2650  		ret =3D vega20_upload_dpm_min_level(hwmgr, FEATURE_D=
PM_DCEFCLK_MASK);
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2651  		PP_ASSERT_WITH_CODE(!ret,
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2652  			"Failed to upload boot level to lowest!",
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2653  			return ret);
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2654  =

d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2655  		//TODO: Setting DCEFCLK max dpm level is not support=
ed
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2656  =

d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2657  		break;
d7e28e2d6b518af7 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2019-01-14  2658  =

da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2659  	case PP_PCIE:
c1973a1078dee6e8 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-12-18  2660  		soft_min_level =3D mask ? (ffs(mask) - 1) : 0;
c1973a1078dee6e8 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-12-18  2661  		soft_max_level =3D mask ? (fls(mask) - 1) : 0;
c1973a1078dee6e8 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-12-18  2662  		if (soft_min_level >=3D NUM_LINK_LEVELS ||
c1973a1078dee6e8 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-12-18  2663  		    soft_max_level >=3D NUM_LINK_LEVELS)
c1973a1078dee6e8 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-12-18  2664  			return -EINVAL;
c1973a1078dee6e8 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-12-18  2665  =

c1973a1078dee6e8 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-12-18  2666  		ret =3D smum_send_msg_to_smc_with_parameter(hwmgr,
a0ec225633d9f681 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2020-03-27  2667  			PPSMC_MSG_SetMinLinkDpmByIndex, soft_min_level,
a0ec225633d9f681 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2020-03-27  2668  			NULL);
c1973a1078dee6e8 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-12-18  2669  		PP_ASSERT_WITH_CODE(!ret,
c1973a1078dee6e8 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-12-18  2670  			"Failed to set min link dpm level!",
c1973a1078dee6e8 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-12-18  2671  			return ret);
c1973a1078dee6e8 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-12-18  2672  =

da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2673  		break;
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2674  =

da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2675  	default:
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2676  		break;
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2677  	}
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2678  =

da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2679  	return 0;
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2680  }
da958630d530250c drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c Evan Qu=
an 2018-08-02  2681  =


:::::: The code at line 2538 was first introduced by commit
:::::: fff7e3e049d897801addf2e9051b3f26e48bdf46 drm/amd/powerplay: correct =
force clock level related settings for vega20 (v2)

:::::: TO: Evan Quan <evan.quan@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6868706175130018526==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
uW5pFrasDN8SW52bKPiC7VP/AfhxXBU9jQEA
--===============6868706175130018526==--

