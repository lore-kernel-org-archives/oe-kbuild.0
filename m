Content-Type: multipart/mixed; boundary="===============6089345212977981017=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:139 smu_set_gfx_power_up_by_imu() error: we previously assumed 'smu->ppt_funcs' could be null (see line 139)
Date: Wed, 17 Aug 2022 08:30:47 +0800
Message-ID: <202208170856.yBfp0n9q-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6089345212977981017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Huang Rui <ray.huang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Tim Huang <Tim.Huang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3cc40a443a04d52b0c95255dce264068b01e9bfe
commit: 7101ab97e3b00ec1c68d09826bb0521d17783673 drm/amdgpu/pm: implement t=
he SMU_MSG_EnableGfxImu function
date:   2 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 months ago
config: ia64-randconfig-m031-20220814 (https://download.01.org/0day-ci/arch=
ive/20220817/202208170856.yBfp0n9q-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:139 smu_set_gfx_power_u=
p_by_imu() error: we previously assumed 'smu->ppt_funcs' could be null (see=
 line 139)

vim +139 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c

8b3d243e47ddd4 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kevin Wang 2019-0=
4-18  136  =

7101ab97e3b00e drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-0=
5-18  137  int smu_set_gfx_power_up_by_imu(struct smu_context *smu)
7101ab97e3b00e drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-0=
5-18  138  {
7101ab97e3b00e drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-0=
5-18 @139  	if (!smu->ppt_funcs && !smu->ppt_funcs->set_gfx_power_up_by_imu)
7101ab97e3b00e drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-0=
5-18  140  		return -EOPNOTSUPP;
7101ab97e3b00e drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-0=
5-18  141  =

7101ab97e3b00e drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-0=
5-18  142  	return smu->ppt_funcs->set_gfx_power_up_by_imu(smu);
7101ab97e3b00e drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-0=
5-18  143  }
7101ab97e3b00e drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-0=
5-18  144  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6089345212977981017==--

