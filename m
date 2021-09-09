Content-Type: multipart/mixed; boundary="===============7714203741529858542=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-intel:drm-intel-next 14/14] drivers/gpu/drm/i915/display/intel_fb.c:1220:42: warning: Possible null pointer dereference: obj [nullPointer]
Date: Fri, 10 Sep 2021 05:54:58 +0800
Message-ID: <202109100541.CSwL7FSX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7714203741529858542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: intel-gfx(a)lists.freedesktop.org
CC: dri-devel(a)lists.freedesktop.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-next
head:   705d4feeb269e22c4850ad66e2210b737b553236
commit: 705d4feeb269e22c4850ad66e2210b737b553236 [14/14] drm/i915/fb: move =
user framebuffer stuff to intel_fb.c
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/ttm/ttm_bo.c:556:35: warning: Uninitialized variable: ev=
ict_mem [uninitvar]
    ret =3D ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
                                     ^
--
>> drivers/gpu/drm/i915/display/intel_fb.c:1220:42: warning: Possible null =
pointer dereference: obj [nullPointer]
    struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
                                            ^
   drivers/gpu/drm/i915/display/intel_fb.c:1219:36: note: Assignment 'obj=
=3D(fb)?to_intel_bo(fb->obj[0]):NULL', assigned value is 0
    struct drm_i915_gem_object *obj =3D intel_fb_obj(fb);
                                      ^
   drivers/gpu/drm/i915/display/intel_fb.c:1220:42: note: Null pointer dere=
ference
    struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
                                            ^

vim +1220 drivers/gpu/drm/i915/display/intel_fb.c

705d4feeb269e2 Jani Nikula 2021-08-23  1214  =

705d4feeb269e2 Jani Nikula 2021-08-23  1215  static int intel_user_framebuf=
fer_create_handle(struct drm_framebuffer *fb,
705d4feeb269e2 Jani Nikula 2021-08-23  1216  						struct drm_file *file,
705d4feeb269e2 Jani Nikula 2021-08-23  1217  						unsigned int *handle)
705d4feeb269e2 Jani Nikula 2021-08-23  1218  {
705d4feeb269e2 Jani Nikula 2021-08-23  1219  	struct drm_i915_gem_object *o=
bj =3D intel_fb_obj(fb);
705d4feeb269e2 Jani Nikula 2021-08-23 @1220  	struct drm_i915_private *i915=
 =3D to_i915(obj->base.dev);
705d4feeb269e2 Jani Nikula 2021-08-23  1221  =

705d4feeb269e2 Jani Nikula 2021-08-23  1222  	if (i915_gem_object_is_userpt=
r(obj)) {
705d4feeb269e2 Jani Nikula 2021-08-23  1223  		drm_dbg(&i915->drm,
705d4feeb269e2 Jani Nikula 2021-08-23  1224  			"attempting to use a userpt=
r for a framebuffer, denied\n");
705d4feeb269e2 Jani Nikula 2021-08-23  1225  		return -EINVAL;
705d4feeb269e2 Jani Nikula 2021-08-23  1226  	}
705d4feeb269e2 Jani Nikula 2021-08-23  1227  =

705d4feeb269e2 Jani Nikula 2021-08-23  1228  	return drm_gem_handle_create(=
file, &obj->base, handle);
705d4feeb269e2 Jani Nikula 2021-08-23  1229  }
705d4feeb269e2 Jani Nikula 2021-08-23  1230  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7714203741529858542==--

