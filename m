Content-Type: multipart/mixed; boundary="===============3366230433596768265=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:139 smu_set_gfx_power_up_by_imu() error: we previously assumed 'smu->ppt_funcs' could be null (see line 139)
Date: Fri, 19 Aug 2022 04:42:05 +0800
Message-ID: <202208190418.1Y3QCIis-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3366230433596768265==
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
head:   573ae4f13f630d6660008f1974c0a8a29c30e18a
commit: 7101ab97e3b00ec1c68d09826bb0521d17783673 drm/amdgpu/pm: implement t=
he SMU_MSG_EnableGfxImu function
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: ia64-randconfig-m031-20220814 (https://download.01.org/0day-ci/arch=
ive/20220819/202208190418.1Y3QCIis-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:139 smu_set_gfx_power_u=
p_by_imu() error: we previously assumed 'smu->ppt_funcs' could be null (see=
 line 139)

vim +139 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c

8b3d243e47ddd4a drivers/gpu/drm/amd/powerplay/amdgpu_smu.c Kevin Wang 2019-=
04-18  136  =

7101ab97e3b00ec drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-=
05-18  137  int smu_set_gfx_power_up_by_imu(struct smu_context *smu)
7101ab97e3b00ec drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-=
05-18  138  {
7101ab97e3b00ec drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-=
05-18 @139  	if (!smu->ppt_funcs && !smu->ppt_funcs->set_gfx_power_up_by_im=
u)
7101ab97e3b00ec drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-=
05-18  140  		return -EOPNOTSUPP;
7101ab97e3b00ec drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-=
05-18  141  =

7101ab97e3b00ec drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-=
05-18  142  	return smu->ppt_funcs->set_gfx_power_up_by_imu(smu);
7101ab97e3b00ec drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-=
05-18  143  }
7101ab97e3b00ec drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c  Huang Rui  2022-=
05-18  144  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3366230433596768265==--

