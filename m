Content-Type: multipart/mixed; boundary="===============2939696898764666233=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11781/12392] drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c:7035:2-4: WARNING: possible condition with no effect (if == else)
Date: Mon, 17 Jan 2022 21:58:39 +0800
Message-ID: <202201172034.UclsXCtq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2939696898764666233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Evan Quan <evan.quan@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Lijo Lazar <lijo.lazar@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   68e0667e38d92a8f461fa2e4ccf268ecf4ea1307
commit: 837d542a09cd533055423dfca7e621a9c1d13c5b [11781/12392] drm/amd/pm: =
relocate the power related headers
:::::: branch date: 11 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20117/202201172034.UclsXCtq-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c:7035:2-4: WARNING: possible c=
ondition with no effect (if =3D=3D else)

vim +7035 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c

841686df9f7d29 drivers/gpu/drm/amd/amdgpu/si_dpm.c Maruthi Bayyavarapu 2016=
-08-01  7027  =

a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7028  static void si_set_vce_clock(struct amdgpu_device *adev,
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7029  			     struct amdgpu_ps *new_rps,
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7030  			     struct amdgpu_ps *old_rps)
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7031  {
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7032  	if ((old_rps->evclk !=3D new_rps->evclk) ||
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7033  	    (old_rps->ecclk !=3D new_rps->ecclk)) {
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7034  		/* Turn the clocks on when encoding, off otherwise */
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24 @7035  		if (new_rps->evclk || new_rps->ecclk) {
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7036  			/* Place holder for future VCE1.0 porting to amdgpu
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7037  			vce_v1_0_enable_mgcg(adev, false, false);*/
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7038  		} else {
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7039  			/* Place holder for future VCE1.0 porting to amdgpu
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7040  			vce_v1_0_enable_mgcg(adev, true, false);
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7041  			amdgpu_asic_set_vce_clocks(adev, new_rps->evclk, new_rps->=
ecclk);*/
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7042  		}
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7043  	}
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7044  }
a71a4f501586c9 drivers/gpu/drm/amd/amdgpu/si_dpm.c Alex Jivin          2020=
-06-24  7045  =


:::::: The code at line 7035 was first introduced by commit
:::::: a71a4f501586c9a1c710c3d5c1db4ff6650e5fc4 drm/amdgpu: SI support for =
UVD and VCE power managment

:::::: TO: Alex Jivin <alex.jivin@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2939696898764666233==--

