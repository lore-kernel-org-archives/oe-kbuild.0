Content-Type: multipart/mixed; boundary="===============6755557084224390045=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/display/skl_universal_plane.c:1742:42: warning: Possible null pointer dereference: obj [nullPointer]
Date: Thu, 10 Feb 2022 12:55:13 +0800
Message-ID: <202202101238.3ycRXG7E-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6755557084224390045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>
CC: Juston Li <juston.li@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f4bc5bbb5fef3cf421ba3485d6d383c27ec473ed
commit: f9a7b19c484067fdcc5972c88ab6f06898adc40d drm/i915: Move the pxp pla=
ne state computation
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/i915/display/skl_universal_plane.c:1742:42: warning: Pos=
sible null pointer dereference: obj [nullPointer]
    struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
                                            ^
   drivers/gpu/drm/i915/display/skl_universal_plane.c:1797:50: note: Callin=
g function 'bo_has_valid_encryption', 1st argument '(fb)?to_intel_bo(fb->ob=
j[0]):NULL' value is 0
     plane_state->decrypt =3D bo_has_valid_encryption(intel_fb_obj(fb));
                                                    ^
   drivers/gpu/drm/i915/display/skl_universal_plane.c:1742:42: note: Null p=
ointer dereference
    struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
                                            ^

vim +1742 drivers/gpu/drm/i915/display/skl_universal_plane.c

46d12f911821f7 Dave Airlie   2021-02-05  1739  =

f9a7b19c484067 Ville Syrj=C3=A4l=C3=A4 2021-10-07  1740  static bool bo_has=
_valid_encryption(struct drm_i915_gem_object *obj)
f9a7b19c484067 Ville Syrj=C3=A4l=C3=A4 2021-10-07  1741  {
f9a7b19c484067 Ville Syrj=C3=A4l=C3=A4 2021-10-07 @1742  	struct drm_i915_p=
rivate *i915 =3D to_i915(obj->base.dev);
f9a7b19c484067 Ville Syrj=C3=A4l=C3=A4 2021-10-07  1743  =

f9a7b19c484067 Ville Syrj=C3=A4l=C3=A4 2021-10-07  1744  	return intel_pxp_=
key_check(&i915->gt.pxp, obj, false) =3D=3D 0;
f9a7b19c484067 Ville Syrj=C3=A4l=C3=A4 2021-10-07  1745  }
f9a7b19c484067 Ville Syrj=C3=A4l=C3=A4 2021-10-07  1746  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6755557084224390045==--

