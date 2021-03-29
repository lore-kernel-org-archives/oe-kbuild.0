Content-Type: multipart/mixed; boundary="===============0791629038408630373=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:1370:4: warning: Variable 'num_of_active_display' is modified but its new value is never used. [unreadVariable]
Date: Mon, 29 Mar 2021 18:52:58 +0800
Message-ID: <202103291849.74uUyDBo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0791629038408630373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alex Deucher <alexander.deucher@amd.com>
CC: Evan Quan <evan.quan@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a5e13c6df0e41702d2b2c77c8ad41677ebb065b3
commit: 75145aab7a0d865b361de687b201e8c4b76425eb drm/amdgpu/swsmu: clean up=
 a bunch of stale interfaces
date:   6 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.=
c:
>> drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:1370:4: warning: Variable 'num=
_of_active_display' is modified but its new value is never used. [unreadVar=
iable]
      num_of_active_display++;
      ^

vim +/num_of_active_display +1370 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c

137d63abbf6a08 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2018-11=
-29  1350  =

94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1351  int smu_display_configuration_change(struct smu_context *smu,
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1352  				     const struct amd_pp_display_configuration *display_conf=
ig)
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1353  {
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1354  	int index =3D 0;
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1355  	int num_of_active_display =3D 0;
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1356  =

2b7ad277e96577 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan 2020-05=
-25  1357  	if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
2b7ad277e96577 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan 2020-05=
-25  1358  		return -EOPNOTSUPP;
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1359  =

94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1360  	if (!display_config)
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1361  		return -EINVAL;
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1362  =

94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1363  	mutex_lock(&smu->mutex);
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1364  =

ce63d8f8b55d28 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Evan Quan 2020-06=
-08  1365  	smu_set_min_dcef_deep_sleep(smu,
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1366  				    display_config->min_dcef_deep_sleep_set_clk / 100);
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1367  =

94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1368  	for (index =3D 0; index < display_config->num_path_including_no=
n_display; index++) {
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1369  		if (display_config->displays[index].controller_id !=3D 0)
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11 @1370  			num_of_active_display++;
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1371  	}
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1372  =

94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1373  	mutex_unlock(&smu->mutex);
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1374  =

94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1375  	return 0;
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1376  }
94ed6d0cfdb867 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Huang Rui 2019-01=
-11  1377  =


:::::: The code at line 1370 was first introduced by commit
:::::: 94ed6d0cfdb867be9bf05f03d682980bce5d0036 drm/amd/powerplay: add smu =
display configuration change function

:::::: TO: Huang Rui <ray.huang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0791629038408630373==--

