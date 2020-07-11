Content-Type: multipart/mixed; boundary="===============3489969877422575789=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/display/dc/core/dc.c:1368:4: warning: Same expression on both sides of '||'.
Date: Sun, 12 Jul 2020 01:48:15 +0800
Message-ID: <202007120112.E1yySK0W%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3489969877422575789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Charlene Liu <Charlene.Liu@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1df0d8960499e58963fd6c8ac75e544f2b417b29
commit: 12e2b2d4c65f6164830e25fcd9624519a424b182 drm/amd/display: add dcc p=
rogramming for dual plane
date:   12 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 12 months ago
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:
>> drivers/gpu/drm/amd/display/dc/core/dc.c:1368:4: warning: Same expressio=
n on both sides of '||'. [duplicateExpression]
      || u->plane_info->plane_size.surface_pitch !=3D u->surface->plane_siz=
e.surface_pitch
      ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D12e2b2d4c65f6164830e25fcd9624519a424b182
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 12e2b2d4c65f6164830e25fcd9624519a424b182
vim +1368 drivers/gpu/drm/amd/display/dc/core/dc.c

4562236b3bc0a2 Harry Wentland      2017-09-12  1302  =

9f89df7d9bdff3 Andrew Jiang        2017-11-07  1303  static enum surface_up=
date_type get_plane_info_update_type(const struct dc_surface_update *u)
5869b0f6bc631d Leon Elazar         2017-03-01  1304  {
19ec320e82c63a Andrew Jiang        2017-11-06  1305  	union surface_update_=
flags *update_flags =3D &u->surface->update_flags;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1306  	enum surface_update_t=
ype update_type =3D UPDATE_TYPE_FAST;
5869b0f6bc631d Leon Elazar         2017-03-01  1307  =

5869b0f6bc631d Leon Elazar         2017-03-01  1308  	if (!u->plane_info)
5869b0f6bc631d Leon Elazar         2017-03-01  1309  		return UPDATE_TYPE_F=
AST;
5869b0f6bc631d Leon Elazar         2017-03-01  1310  =

aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1311  	if (u->plane_info->co=
lor_space !=3D u->surface->color_space) {
19ec320e82c63a Andrew Jiang        2017-11-06  1312  		update_flags->bits.c=
olor_space_change =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1313  		elevate_update_type(=
&update_type, UPDATE_TYPE_MED);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1314  	}
80b4c5a8c1e185 Dmytro Laktyushkin  2017-06-13  1315  =

aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1316  	if (u->plane_info->ho=
rizontal_mirror !=3D u->surface->horizontal_mirror) {
19ec320e82c63a Andrew Jiang        2017-11-06  1317  		update_flags->bits.h=
orizontal_mirror_change =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1318  		elevate_update_type(=
&update_type, UPDATE_TYPE_MED);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1319  	}
5869b0f6bc631d Leon Elazar         2017-03-01  1320  =

aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1321  	if (u->plane_info->ro=
tation !=3D u->surface->rotation) {
19ec320e82c63a Andrew Jiang        2017-11-06  1322  		update_flags->bits.r=
otation_change =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1323  		elevate_update_type(=
&update_type, UPDATE_TYPE_FULL);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1324  	}
19ec320e82c63a Andrew Jiang        2017-11-06  1325  =

aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1326  	if (u->plane_info->fo=
rmat !=3D u->surface->format) {
3aa0caddf6997a Duke Du             2018-01-04  1327  		update_flags->bits.p=
ixel_format_change =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1328  		elevate_update_type(=
&update_type, UPDATE_TYPE_FULL);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1329  	}
3aa0caddf6997a Duke Du             2018-01-04  1330  =

aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1331  	if (u->plane_info->st=
ereo_format !=3D u->surface->stereo_format) {
19ec320e82c63a Andrew Jiang        2017-11-06  1332  		update_flags->bits.s=
tereo_format_change =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1333  		elevate_update_type(=
&update_type, UPDATE_TYPE_FULL);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1334  	}
19ec320e82c63a Andrew Jiang        2017-11-06  1335  =

aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1336  	if (u->plane_info->pe=
r_pixel_alpha !=3D u->surface->per_pixel_alpha) {
19ec320e82c63a Andrew Jiang        2017-11-06  1337  		update_flags->bits.p=
er_pixel_alpha_change =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1338  		elevate_update_type(=
&update_type, UPDATE_TYPE_MED);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1339  	}
5869b0f6bc631d Leon Elazar         2017-03-01  1340  =

aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1341  	if (u->plane_info->gl=
obal_alpha_value !=3D u->surface->global_alpha_value) {
94a4ffd1d40b84 Gloria Li           2018-07-26  1342  		update_flags->bits.g=
lobal_alpha_change =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1343  		elevate_update_type(=
&update_type, UPDATE_TYPE_MED);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1344  	}
94a4ffd1d40b84 Gloria Li           2018-07-26  1345  =

aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1346  	if (u->plane_info->sd=
r_white_level !=3D u->surface->sdr_white_level) {
24c18794946ad1 Dmytro Laktyushkin  2019-04-08  1347  		update_flags->bits.s=
dr_white_level =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1348  		elevate_update_type(=
&update_type, UPDATE_TYPE_MED);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1349  	}
24c18794946ad1 Dmytro Laktyushkin  2019-04-08  1350  =

e9dd9223c6d633 Andrew Jiang        2017-11-16  1351  	if (u->plane_info->dc=
c.enable !=3D u->surface->dcc.enable
12e2b2d4c65f61 Dmytro Laktyushkin  2019-07-03  1352  			|| u->plane_info->d=
cc.independent_64b_blks !=3D u->surface->dcc.independent_64b_blks
12e2b2d4c65f61 Dmytro Laktyushkin  2019-07-03  1353  			|| u->plane_info->d=
cc.meta_pitch !=3D u->surface->dcc.meta_pitch) {
e9dd9223c6d633 Andrew Jiang        2017-11-16  1354  		update_flags->bits.d=
cc_change =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1355  		elevate_update_type(=
&update_type, UPDATE_TYPE_MED);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1356  	}
e9dd9223c6d633 Andrew Jiang        2017-11-16  1357  =

74eac5f3b43eda Su Sung Chung       2018-09-13  1358  	if (resource_pixel_fo=
rmat_to_bpp(u->plane_info->format) !=3D
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1359  			resource_pixel_form=
at_to_bpp(u->surface->format)) {
4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1360  		/* different bytes p=
er element will require full bandwidth
4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1361  		 * and DML calculati=
on
4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1362  		 */
19ec320e82c63a Andrew Jiang        2017-11-06  1363  		update_flags->bits.b=
pp_change =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1364  		elevate_update_type(=
&update_type, UPDATE_TYPE_FULL);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1365  	}
4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1366  =

12e2b2d4c65f61 Dmytro Laktyushkin  2019-07-03  1367  	if (u->plane_info->pl=
ane_size.surface_pitch !=3D u->surface->plane_size.surface_pitch
12e2b2d4c65f61 Dmytro Laktyushkin  2019-07-03 @1368  			|| u->plane_info->p=
lane_size.surface_pitch !=3D u->surface->plane_size.surface_pitch
12e2b2d4c65f61 Dmytro Laktyushkin  2019-07-03  1369  			|| u->plane_info->p=
lane_size.chroma_pitch !=3D u->surface->plane_size.chroma_pitch) {
ebd084cd650931 Lewis Huang         2018-11-16  1370  		update_flags->bits.p=
lane_size_change =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1371  		elevate_update_type(=
&update_type, UPDATE_TYPE_MED);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1372  	}
ebd084cd650931 Lewis Huang         2018-11-16  1373  =

ebd084cd650931 Lewis Huang         2018-11-16  1374  =

4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1375  	if (memcmp(&u->plane_=
info->tiling_info, &u->surface->tiling_info,
4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1376  			sizeof(union dc_til=
ing_info)) !=3D 0) {
19ec320e82c63a Andrew Jiang        2017-11-06  1377  		update_flags->bits.s=
wizzle_change =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1378  		elevate_update_type(=
&update_type, UPDATE_TYPE_MED);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1379  =

4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1380  		/* todo: below are H=
W dependent, we should add a hook to
4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1381  		 * DCE/N resource an=
d validated there.
4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1382  		 */
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1383  		if (u->plane_info->t=
iling_info.gfx9.swizzle !=3D DC_SW_LINEAR) {
4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1384  			/* swizzled mode re=
quires RQ to be setup properly,
4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1385  			 * thus need to run=
 DML to calculate RQ settings
4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1386  			 */
19ec320e82c63a Andrew Jiang        2017-11-06  1387  			update_flags->bits.=
bandwidth_change =3D 1;
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1388  			elevate_update_type=
(&update_type, UPDATE_TYPE_FULL);
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1389  		}
4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1390  	}
4b7e7e2b1bb2c7 ShihChen Chen       2017-09-12  1391  =

aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1392  	/* This should be UPD=
ATE_TYPE_FAST if nothing has changed. */
aa5fdb1ab5b655 Nicholas Kazlauskas 2019-05-02  1393  	return update_type;
5869b0f6bc631d Leon Elazar         2017-03-01  1394  }
5869b0f6bc631d Leon Elazar         2017-03-01  1395  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3489969877422575789==--

