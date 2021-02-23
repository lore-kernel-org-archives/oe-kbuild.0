Content-Type: multipart/mixed; boundary="===============5589043353733013749=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:601:11: warning: Returning pointer to local variable 'formats' that will be invalid when returning.
Date: Wed, 24 Feb 2021 06:08:43 +0800
Message-ID: <202102240637.gkIXs3S1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5589043353733013749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3b9cdafb5358eb9f3790de2f728f765fef100731
commit: 816853f9dc4057b6c7ee3c45ca9bd5905649092e drm/amd/display: Set new f=
ormat info for converted metadata.
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:
>> drivers/gpu/drm/amd/display/dc/core/dc.c:2617:43: warning: Either the co=
ndition 'if(stream&&should_use_dmub_lock(stream->link))' is redundant or th=
ere is possible null pointer dereference: stream. [nullPointerRedundantChec=
k]
    if ((update_type !=3D UPDATE_TYPE_FAST) && stream->update_flags.bits.ds=
c_changed)
                                             ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:2629:7: note: Assuming that con=
dition 'if(stream&&should_use_dmub_lock(stream->link))' is not redundant
      if (stream && should_use_dmub_lock(stream->link)) {
         ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:2617:43: note: Null pointer der=
eference
    if ((update_type !=3D UPDATE_TYPE_FAST) && stream->update_flags.bits.ds=
c_changed)
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
>> drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1125:14: warning: Shifting s=
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
--===============5589043353733013749==--

