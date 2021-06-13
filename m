Content-Type: multipart/mixed; boundary="===============2843592477667455629=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: warning: Returning pointer to local variable 'formats' that will be invalid when returning. [returnDanglingLifetime]
Date: Sun, 13 Jun 2021 09:44:07 +0800
Message-ID: <202106130956.oZTwqo3V-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2843592477667455629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   43cb5d49a99b3ecd9fef9826899aac948c3048da
commit: 816853f9dc4057b6c7ee3c45ca9bd5905649092e drm/amd/display: Set new f=
ormat info for converted metadata.
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/s=
mu10_hwmgr.c:
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c:978:12: warning: %d=
 in format string (no. 1) requires 'int' but the argument type is 'unsigned=
 int'. [invalidPrintfArgType_sint]
      size +=3D sprintf(buf + size, "%d: %uMhz %sn",
              ^
   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c:1356:11: warning: %=
d in format string (no. 1) requires 'int' but the argument type is 'unsigne=
d int'. [invalidPrintfArgType_sint]
     size +=3D sprintf(buf + size, "%3d %14s%s: %14d %3d %10d %14dn",
             ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: warning: Returning p=
ointer to local variable 'formats' that will be invalid when returning. [re=
turnDanglingLifetime]
      return &formats[i];
             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: note: Address of var=
iable taken here.
      return &formats[i];
             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:594:49: note: Variable creat=
ed here.
   lookup_format_info(const struct drm_format_info formats[],
                                                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: note: Returning poin=
ter to local variable 'formats' that will be invalid when returning.
      return &formats[i];
             ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7340:7: warning: Identical inner =
'if' condition is always true. [identicalInnerCondition]
     if (grbm_soft_reset) {
         ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7330:6: note: outer condition: gr=
bm_soft_reset
    if (grbm_soft_reset) {
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7340:7: note: identical inner con=
dition: grbm_soft_reset
     if (grbm_soft_reset) {
         ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:7209:6: warning: Unused variable:=
 r [unusedVariable]
    int r;
        ^

vim +/formats +601 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c

816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  592  =

816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  593  static const struct drm_f=
ormat_info *
816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  594  lookup_format_info(const =
struct drm_format_info formats[],
816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  595  		  int num_formats, u32 =
format)
816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  596  {
816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  597  	int i;
816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  598  =

816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  599  	for (i =3D 0; i < num_fo=
rmats; i++) {
816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  600  		if (formats[i].format =
=3D=3D format)
816853f9dc4057 Bas Nieuwenhuizen 2020-11-11 @601  			return &formats[i];
816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  602  	}
816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  603  =

816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  604  	return NULL;
816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  605  }
816853f9dc4057 Bas Nieuwenhuizen 2020-11-11  606  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2843592477667455629==--

