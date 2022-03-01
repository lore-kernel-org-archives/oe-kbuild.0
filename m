Content-Type: multipart/mixed; boundary="===============8555743452028999011=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c:428:11: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Tue, 01 Mar 2022 12:18:15 +0800
Message-ID: <202203010946.cEit15Y5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8555743452028999011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dennis Li <Dennis.Li@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   719fce7539cd3e186598e2aed36325fe892150cf
commit: 0e0036c7d13b945260ff1ce8377eca7ea877c008 drm/amdgpu: fix no full co=
verage issue for gprs initialization
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arctu=
rus_ppt.c:
>> drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:1559:4: warning: Variable 'num=
_of_active_display' is modified but its new value is never used. [unreadVar=
iable]
      num_of_active_display++;
      ^
>> drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:168:9: warning: Uninitialized =
variable: clk_freq [uninitvar]
    return clk_freq * 100;
           ^
   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c:182:9: warning: Uninitialized =
variable: clk_freq [uninitvar]
    return clk_freq * 100;
           ^
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/s=
mu7_hwmgr.c:
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c:5514:12: warning: %d=
 in format string (no. 1) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%3d %14s %s: %8d %16d %16d %16d %16d %=
16dn",
              ^
   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c:5525:12: warning: %d=
 in format string (no. 1) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%3d %16s: %8d %16d %16d ",
              ^
   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c:5530:12: warning: %d=
 in format string (no. 1) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%3d %16s: %8s %16s %16s ",
              ^
>> drivers/gpu/drm/amd/amdgpu/si.c:2489:7: warning: Identical inner 'if' co=
ndition is always true. [identicalInnerCondition]
     if (!disable_plloff_in_l1) {
         ^
   drivers/gpu/drm/amd/amdgpu/si.c:2453:41: note: 'disable_l1' is assigned =
value 'false' here.
    bool disable_l0s =3D false, disable_l1 =3D false, disable_plloff_in_l1 =
=3D false;
                                           ^
   drivers/gpu/drm/amd/amdgpu/si.c:2453:71: note: 'disable_plloff_in_l1' is=
 assigned value 'false' here.
    bool disable_l0s =3D false, disable_l1 =3D false, disable_plloff_in_l1 =
=3D false;
                                                                         ^
   drivers/gpu/drm/amd/amdgpu/si.c:2483:6: note: outer condition: !disable_=
l1
    if (!disable_l1) {
        ^
   drivers/gpu/drm/amd/amdgpu/si.c:2489:7: note: identical inner condition:=
 !disable_plloff_in_l1
     if (!disable_plloff_in_l1) {
         ^

vim +428 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c

0e0036c7d13b94 Dennis Li 2021-04-27  411  =

0e0036c7d13b94 Dennis Li 2021-04-27  412  static void gfx_v9_4_2_log_wave_a=
ssignment(struct amdgpu_device *adev, uint32_t *wb_ptr)
0e0036c7d13b94 Dennis Li 2021-04-27  413  {
0e0036c7d13b94 Dennis Li 2021-04-27  414  	uint32_t se, cu, simd, wave;
0e0036c7d13b94 Dennis Li 2021-04-27  415  	uint32_t offset =3D 0;
0e0036c7d13b94 Dennis Li 2021-04-27  416  	char *str;
0e0036c7d13b94 Dennis Li 2021-04-27  417  	int size;
0e0036c7d13b94 Dennis Li 2021-04-27  418  =

0e0036c7d13b94 Dennis Li 2021-04-27  419  	str =3D kmalloc(256, GFP_KERNEL);
0e0036c7d13b94 Dennis Li 2021-04-27  420  	if (!str)
0e0036c7d13b94 Dennis Li 2021-04-27  421  		return;
0e0036c7d13b94 Dennis Li 2021-04-27  422  =

0e0036c7d13b94 Dennis Li 2021-04-27  423  	dev_dbg(adev->dev, "wave assignm=
ent:\n");
0e0036c7d13b94 Dennis Li 2021-04-27  424  =

0e0036c7d13b94 Dennis Li 2021-04-27  425  	for (se =3D 0; se < adev->gfx.co=
nfig.max_shader_engines; se++) {
0e0036c7d13b94 Dennis Li 2021-04-27  426  		for (cu =3D 0; cu < CU_ID_MAX; =
cu++) {
0e0036c7d13b94 Dennis Li 2021-04-27  427  			memset(str, 0, 256);
0e0036c7d13b94 Dennis Li 2021-04-27 @428  			size =3D sprintf(str, "SE[%02d=
]CU[%02d]: ", se, cu);
0e0036c7d13b94 Dennis Li 2021-04-27  429  			for (simd =3D 0; simd < SIMD_I=
D_MAX; simd++) {
0e0036c7d13b94 Dennis Li 2021-04-27  430  				size +=3D sprintf(str + size,=
 "[");
0e0036c7d13b94 Dennis Li 2021-04-27  431  				for (wave =3D 0; wave < WAVE_=
ID_MAX; wave++) {
0e0036c7d13b94 Dennis Li 2021-04-27  432  					size +=3D sprintf(str + size=
, "%x", wb_ptr[offset]);
0e0036c7d13b94 Dennis Li 2021-04-27  433  					offset++;
0e0036c7d13b94 Dennis Li 2021-04-27  434  				}
0e0036c7d13b94 Dennis Li 2021-04-27  435  				size +=3D sprintf(str + size,=
 "]  ");
0e0036c7d13b94 Dennis Li 2021-04-27  436  			}
0e0036c7d13b94 Dennis Li 2021-04-27  437  			dev_dbg(adev->dev, "%s\n", str=
);
0e0036c7d13b94 Dennis Li 2021-04-27  438  		}
0e0036c7d13b94 Dennis Li 2021-04-27  439  	}
0e0036c7d13b94 Dennis Li 2021-04-27  440  =

0e0036c7d13b94 Dennis Li 2021-04-27  441  	kfree(str);
0e0036c7d13b94 Dennis Li 2021-04-27  442  }
0e0036c7d13b94 Dennis Li 2021-04-27  443  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8555743452028999011==--

