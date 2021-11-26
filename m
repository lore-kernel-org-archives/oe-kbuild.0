Content-Type: multipart/mixed; boundary="===============8902309664646436277=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:568:59: warning: Uninitialized variable: peer_adev [uninitvar]
Date: Fri, 26 Nov 2021 16:11:01 +0800
Message-ID: <202111261602.b5iy5UyS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8902309664646436277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Kim <jonathan.kim@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4849f6000e29235a2707f22e39da6b897bb9543
commit: 3f46c4e9ce25bbcb9d619dbce57c8737c856b272 drm/amdkfd: report xgmi ba=
ndwidth between direct peers to the kfd
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.=
c:
>> drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:1581:4: warning: Variable 'num=
_of_active_display' is modified but its new value is never used. [unreadVar=
iable]
      num_of_active_display++;
      ^
>> drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:169:9: warning: Uninitialized =
variable: clk_freq [uninitvar]
    return clk_freq * 100;
           ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:183:9: warning: Uninitialized =
variable: clk_freq [uninitvar]
    return clk_freq * 100;
           ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:
>> drivers/gpu/drm/amd/pm/amdgpu_pm.c:1109:15: warning: Shifting signed 32-=
bit value by 31 bits is undefined behaviour. See condition at line 1107. [s=
hiftTooManyBitsSigned]
      *mask |=3D 1 << level;
                 ^
   drivers/gpu/drm/amd/pm/amdgpu_pm.c:1107:21: note: Assuming that conditio=
n 'level>31' is not redundant
      if (ret || level > 31)
                       ^
   drivers/gpu/drm/amd/pm/amdgpu_pm.c:1109:15: note: Shift
      *mask |=3D 1 << level;
                 ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4115:7: warning: Identical inner '=
if' condition is always true. [identicalInnerCondition]
     if (grbm_soft_reset) {
         ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4104:6: note: outer condition: grb=
m_soft_reset
    if (grbm_soft_reset) {
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4115:7: note: identical inner cond=
ition: grbm_soft_reset
     if (grbm_soft_reset) {
         ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7589:7: warning: Identical inner =
'if' condition is always true. [identicalInnerCondition]
     if (grbm_soft_reset) {
         ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7579:6: note: outer condition: gr=
bm_soft_reset
    if (grbm_soft_reset) {
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7589:7: note: identical inner con=
dition: grbm_soft_reset
     if (grbm_soft_reset) {
         ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7450:6: warning: Unused variable:=
 r [unusedVariable]
    int r;
        ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:568:59: warning: Uninitialize=
d variable: peer_adev [uninitvar]
    num_links =3D is_min ? 1 : amdgpu_xgmi_get_num_links(adev, peer_adev);
                                                             ^

vim +568 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c

db8b62c04b2344f Shaoyun Liu  2018-07-06  555  =

3f46c4e9ce25bbc Jonathan Kim 2021-05-12  556  int amdgpu_amdkfd_get_xgmi_ba=
ndwidth_mbytes(struct kgd_dev *dst, struct kgd_dev *src, bool is_min)
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  557  {
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  558  	struct amdgpu_device *adev =
=3D (struct amdgpu_device *)dst, *peer_adev;
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  559  	int num_links;
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  560  =

3f46c4e9ce25bbc Jonathan Kim 2021-05-12  561  	if (adev->asic_type !=3D CHI=
P_ALDEBARAN)
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  562  		return 0;
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  563  =

3f46c4e9ce25bbc Jonathan Kim 2021-05-12  564  	if (src)
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  565  		peer_adev =3D (struct amdgp=
u_device *)src;
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  566  =

3f46c4e9ce25bbc Jonathan Kim 2021-05-12  567  	/* num links returns 0 for i=
ndirect peers since indirect route is unknown. */
3f46c4e9ce25bbc Jonathan Kim 2021-05-12 @568  	num_links =3D is_min ? 1 : a=
mdgpu_xgmi_get_num_links(adev, peer_adev);
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  569  	if (num_links < 0) {
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  570  		DRM_ERROR("amdgpu: failed t=
o get xgmi num links between node %d and %d. ret =3D %d\n",
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  571  			adev->gmc.xgmi.physical_no=
de_id,
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  572  			peer_adev->gmc.xgmi.physic=
al_node_id, num_links);
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  573  		num_links =3D 0;
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  574  	}
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  575  =

3f46c4e9ce25bbc Jonathan Kim 2021-05-12  576  	/* Aldebaran xGMI DPM is def=
eatured so assume x16 x 25Gbps for bandwidth. */
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  577  	return (num_links * 16 * 250=
00)/BITS_PER_BYTE;
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  578  }
3f46c4e9ce25bbc Jonathan Kim 2021-05-12  579  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8902309664646436277==--

