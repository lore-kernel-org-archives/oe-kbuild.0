Content-Type: multipart/mixed; boundary="===============6557919134570329151=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.4 31/83] drivers/gpu/drm/i915/display/intel_sprite.c:2273:42: warning: Possible null pointer dereference: obj [nullPointer]
Date: Sat, 11 Dec 2021 17:49:22 +0800
Message-ID: <202112111749.JJwcmyBY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6557919134570329151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.4
head:   7ba45329e79ddb80de9234a8f0bd61b1c897261e
commit: 2b9613b207a96e9b2fa9fb8545dcdc5ed6c4a61a [31/83] FROMGIT: BACKPORT:=
 drm/i915: Move the pxp plane state computation
:::::: branch date: 11 hours ago
:::::: commit date: 8 days ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/i915/display/intel_sprite.c:2273:42: warning: Possible n=
ull pointer dereference: obj [nullPointer]
    struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
                                            ^
   drivers/gpu/drm/i915/display/intel_sprite.c:2330:50: note: Calling funct=
ion 'bo_has_valid_encryption', 1st argument '(fb)?to_intel_bo(fb->obj[0]):N=
ULL' value is 0
     plane_state->decrypt =3D bo_has_valid_encryption(intel_fb_obj(fb));
                                                    ^
   drivers/gpu/drm/i915/display/intel_sprite.c:2273:42: note: Null pointer =
dereference
    struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
                                            ^
   drivers/gpu/drm/i915/display/intel_sprite.c:1492:2: warning: Variable 'i=
' is modified but its new value is never used. [unreadVariable]
    i++;
    ^
   drivers/gpu/drm/i915/display/intel_sprite.c:1521:2: warning: Variable 'i=
' is modified but its new value is never used. [unreadVariable]
    i++;
    ^
   drivers/gpu/drm/i915/display/intel_sprite.c:1831:2: warning: Variable 'i=
' is modified but its new value is never used. [unreadVariable]
    i++;
    ^

vim +2273 drivers/gpu/drm/i915/display/intel_sprite.c

80816bb6075585 Ville Syrj=C3=A4l=C3=A4 2019-10-15  2270  =

2b9613b207a96e Ville Syrj=C3=A4l=C3=A4 2021-10-07  2271  static bool bo_has=
_valid_encryption(struct drm_i915_gem_object *obj)
2b9613b207a96e Ville Syrj=C3=A4l=C3=A4 2021-10-07  2272  {
2b9613b207a96e Ville Syrj=C3=A4l=C3=A4 2021-10-07 @2273  	struct drm_i915_p=
rivate *i915 =3D to_i915(obj->base.dev);
2b9613b207a96e Ville Syrj=C3=A4l=C3=A4 2021-10-07  2274  =

2b9613b207a96e Ville Syrj=C3=A4l=C3=A4 2021-10-07  2275  	return intel_pxp_=
key_check(&i915->gt.pxp, obj, false) =3D=3D 0;
2b9613b207a96e Ville Syrj=C3=A4l=C3=A4 2021-10-07  2276  }
2b9613b207a96e Ville Syrj=C3=A4l=C3=A4 2021-10-07  2277  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6557919134570329151==--

