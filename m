Content-Type: multipart/mixed; boundary="===============7928957520034039120=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6211:6: warning: Unused variable: i [unusedVariable]
Date: Mon, 13 Dec 2021 19:11:36 +0800
Message-ID: <202112131908.rkHdevel-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7928957520034039120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alex Deucher <alexander.deucher@amd.com>
CC: Roman Li <Roman.Li@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2585cf9dfaaddf00b069673f27bb3f8530e2039c
commit: 7fd13baeb7a3a48cae12c36c52f06bf4e9e7d728 drm/amdgpu/display: add su=
pport for multiple backlights
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
compiler: mips-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/v=
ega12_hwmgr.c:
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c:2929:0: warning: S=
yntax error in #if [preprocessorErrorDirective]
   #if 0
   ^
--
        ^
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:6211:6: warning: Unuse=
d variable: i [unusedVariable]
    int i;
        ^

vim +6211 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

526c654a8a0641 Emily Deng        2019-05-31  6204  =

7578ecda14d521 Alex Deucher      2017-10-10  6205  static void amdgpu_dm_co=
nnector_destroy(struct drm_connector *connector)
e7b07ceef2a650 Harry Wentland    2017-08-10  6206  {
c84dec2fe8837f Harry Wentland    2017-09-05  6207  	struct amdgpu_dm_connec=
tor *aconnector =3D to_amdgpu_dm_connector(connector);
e7b07ceef2a650 Harry Wentland    2017-08-10  6208  	const struct dc_link *l=
ink =3D aconnector->dc_link;
1348969ab68cb8 Luben Tuikov      2020-08-24  6209  	struct amdgpu_device *a=
dev =3D drm_to_adev(connector->dev);
e7b07ceef2a650 Harry Wentland    2017-08-10  6210  	struct amdgpu_display_m=
anager *dm =3D &adev->dm;
7fd13baeb7a3a4 Alex Deucher      2021-07-08 @6211  	int i;
ada8ce1530a7d1 Harry Wentland    2018-04-20  6212  =

5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6213  	/*
5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6214  	 * Call only if mst_mgr=
 was iniitalized before since it's not done
5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6215  	 * for all connector ty=
pes.
5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6216  	 */
5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6217  	if (aconnector->mst_mgr=
.dev)
5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6218  		drm_dp_mst_topology_mg=
r_destroy(&aconnector->mst_mgr);
5dff80bdce9e38 Andrey Grodzovsky 2020-10-14  6219  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7928957520034039120==--

