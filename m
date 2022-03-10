Content-Type: multipart/mixed; boundary="===============6429855938958482328=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3552 amdgpu_dm_backlight_update_status() error: testing array offset 'i' after use.
Date: Thu, 10 Mar 2022 16:24:28 +0800
Message-ID: <202203101628.ENGWwBfI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6429855938958482328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alex Deucher <alexander.deucher@amd.com>
CC: Roman Li <Roman.Li@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3bf7edc84a9eb4007dd9a0cb8878a7e1d5ec6a3b
commit: 7fd13baeb7a3a48cae12c36c52f06bf4e9e7d728 drm/amdgpu/display: add su=
pport for multiple backlights
date:   7 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-m031-20220301 (https://download.01.org/0day-ci/a=
rchive/20220310/202203101628.ENGWwBfI-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3552 amdgpu_dm_=
backlight_update_status() error: testing array offset 'i' after use.
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3594 amdgpu_dm_=
backlight_get_brightness() error: testing array offset 'i' after use.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1336 amdgpu_dm_=
fini() error: we previously assumed 'adev->dm.dc' could be null (see line 1=
324)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1349 amdgpu_dm_=
fini() warn: variable dereferenced before check 'adev->dm.dc' (see line 133=
6)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5888 create_str=
eam_for_sink() error: we previously assumed 'aconnector->dc_sink' could be =
null (see line 5786)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8194 handle_cur=
sor_update() error: we previously assumed 'afb' could be null (see line 815=
3)

vim +/i +3552 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

4562236b3bc0a2 Harry Wentland 2017-09-12  3542  =

3d6c91641bc8a8 Alex Deucher   2021-05-11  3543  static int amdgpu_dm_backli=
ght_update_status(struct backlight_device *bd)
4562236b3bc0a2 Harry Wentland 2017-09-12  3544  {
620a0d27b211aa David Francis  2018-07-19  3545  	struct amdgpu_display_mana=
ger *dm =3D bl_get_data(bd);
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3546  	int i;
3d6c91641bc8a8 Alex Deucher   2021-05-11  3547  =

7fd13baeb7a3a4 Alex Deucher   2021-07-08  3548  	for (i =3D 0; i < dm->num_=
of_edps; i++) {
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3549  		if (bd =3D=3D dm->backlig=
ht_dev[i])
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3550  			break;
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3551  	}
7fd13baeb7a3a4 Alex Deucher   2021-07-08 @3552  	if (i >=3D AMDGPU_DM_MAX_N=
UM_EDP)
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3553  		i =3D 0;
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3554  	amdgpu_dm_backlight_set_le=
vel(dm, i, bd->props.brightness);
3d6c91641bc8a8 Alex Deucher   2021-05-11  3555  =

3d6c91641bc8a8 Alex Deucher   2021-05-11  3556  	return 0;
3d6c91641bc8a8 Alex Deucher   2021-05-11  3557  }
3d6c91641bc8a8 Alex Deucher   2021-05-11  3558  =

7fd13baeb7a3a4 Alex Deucher   2021-07-08  3559  static u32 amdgpu_dm_backli=
ght_get_level(struct amdgpu_display_manager *dm,
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3560  					 int bl_idx)
3d6c91641bc8a8 Alex Deucher   2021-05-11  3561  {
0ad3e64eb46d8c Alex Deucher   2020-12-10  3562  	struct amdgpu_dm_backlight=
_caps caps;
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3563  	struct dc_link *link =3D (=
struct dc_link *)dm->backlight_link[bl_idx];
0ad3e64eb46d8c Alex Deucher   2020-12-10  3564  =

7fd13baeb7a3a4 Alex Deucher   2021-07-08  3565  	amdgpu_dm_update_backlight=
_caps(dm, bl_idx);
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3566  	caps =3D dm->backlight_cap=
s[bl_idx];
0ad3e64eb46d8c Alex Deucher   2020-12-10  3567  =

0ad3e64eb46d8c Alex Deucher   2020-12-10  3568  	if (caps.aux_support) {
0ad3e64eb46d8c Alex Deucher   2020-12-10  3569  		u32 avg, peak;
0ad3e64eb46d8c Alex Deucher   2020-12-10  3570  		bool rc;
0ad3e64eb46d8c Alex Deucher   2020-12-10  3571  =

0ad3e64eb46d8c Alex Deucher   2020-12-10  3572  		rc =3D dc_link_get_backli=
ght_level_nits(link, &avg, &peak);
0ad3e64eb46d8c Alex Deucher   2020-12-10  3573  		if (!rc)
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3574  			return dm->brightness[bl=
_idx];
0ad3e64eb46d8c Alex Deucher   2020-12-10  3575  		return convert_brightness=
_to_user(&caps, avg);
0ad3e64eb46d8c Alex Deucher   2020-12-10  3576  	} else {
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3577  		int ret =3D dc_link_get_b=
acklight_level(link);
620a0d27b211aa David Francis  2018-07-19  3578  =

620a0d27b211aa David Francis  2018-07-19  3579  		if (ret =3D=3D DC_ERROR_U=
NEXPECTED)
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3580  			return dm->brightness[bl=
_idx];
0ad3e64eb46d8c Alex Deucher   2020-12-10  3581  		return convert_brightness=
_to_user(&caps, ret);
0ad3e64eb46d8c Alex Deucher   2020-12-10  3582  	}
4562236b3bc0a2 Harry Wentland 2017-09-12  3583  }
4562236b3bc0a2 Harry Wentland 2017-09-12  3584  =

3d6c91641bc8a8 Alex Deucher   2021-05-11  3585  static int amdgpu_dm_backli=
ght_get_brightness(struct backlight_device *bd)
3d6c91641bc8a8 Alex Deucher   2021-05-11  3586  {
3d6c91641bc8a8 Alex Deucher   2021-05-11  3587  	struct amdgpu_display_mana=
ger *dm =3D bl_get_data(bd);
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3588  	int i;
3d6c91641bc8a8 Alex Deucher   2021-05-11  3589  =

7fd13baeb7a3a4 Alex Deucher   2021-07-08  3590  	for (i =3D 0; i < dm->num_=
of_edps; i++) {
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3591  		if (bd =3D=3D dm->backlig=
ht_dev[i])
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3592  			break;
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3593  	}
7fd13baeb7a3a4 Alex Deucher   2021-07-08 @3594  	if (i >=3D AMDGPU_DM_MAX_N=
UM_EDP)
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3595  		i =3D 0;
7fd13baeb7a3a4 Alex Deucher   2021-07-08  3596  	return amdgpu_dm_backlight=
_get_level(dm, i);
3d6c91641bc8a8 Alex Deucher   2021-05-11  3597  }
3d6c91641bc8a8 Alex Deucher   2021-05-11  3598  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6429855938958482328==--

