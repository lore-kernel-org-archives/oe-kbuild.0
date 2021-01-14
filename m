Content-Type: multipart/mixed; boundary="===============0503093392383729479=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: warning: Returning pointer to local variable 'formats' that will be invalid when returning.
Date: Fri, 15 Jan 2021 03:34:11 +0800
Message-ID: <202101150358.8jZMaABn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0503093392383729479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   65f0d2414b7079556fbbcc070b3d1c9f9587606d
commit: 816853f9dc4057b6c7ee3c45ca9bd5905649092e drm/amd/display: Set new f=
ormat info for converted metadata.
date:   9 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 9 weeks ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

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
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1125:14: warning: Shifting s=
igned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigne=
d]
    if (flags & GET_DISTANCE_TO_VBLANKSTART) {
                ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1152:14: warning: Shifting s=
igned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigne=
d]
    if (flags & GET_DISTANCE_TO_VBLANKSTART) {
                ^

vim +/formats +601 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c

816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  592  =

816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  593  static const struct drm=
_format_info *
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  594  lookup_format_info(cons=
t struct drm_format_info formats[],
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  595  		  int num_formats, u3=
2 format)
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  596  {
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  597  	int i;
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  598  =

816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  599  	for (i =3D 0; i < num_=
formats; i++) {
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  600  		if (formats[i].format=
 =3D=3D format)
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11 @601  			return &formats[i];
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  602  	}
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  603  =

816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  604  	return NULL;
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  605  }
816853f9dc4057b6 Bas Nieuwenhuizen 2020-11-11  606  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============0503093392383729479==--

