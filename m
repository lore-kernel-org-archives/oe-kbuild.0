Content-Type: multipart/mixed; boundary="===============7065366203672176731=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gem/i915_gem_object.h:39:27: warning: Uninitialized variable: obj [uninitvar]
Date: Tue, 13 Jul 2021 12:50:32 +0800
Message-ID: <202107131227.nX6IiXa6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7065366203672176731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Matthew Auld <matthew.auld@intel.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Chris Wilson <chris@chris-wilson.co.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7fef2edf7cc753b51f7ccc74993971b0a9c81eca
commit: ae2fb480f32f657d896d78b6214c2efebfa61993 drm/i915/gem: consolidate =
2big error checking for object sizes
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/i915/gem/i915_gem_object.h:39:27: warning: Uninitialized=
 variable: obj [uninitvar]
    if (overflows_type(size, obj->base.size))
                             ^

vim +39 drivers/gpu/drm/i915/gem/i915_gem_object.h

f0e4a06397526d Chris Wilson 2019-05-28  18  =

ae2fb480f32f65 Matthew Auld 2021-01-22  19  /*
ae2fb480f32f65 Matthew Auld 2021-01-22  20   * XXX: There is a prevalence o=
f the assumption that we fit the
ae2fb480f32f65 Matthew Auld 2021-01-22  21   * object's page count inside a=
 32bit _signed_ variable. Let's document
ae2fb480f32f65 Matthew Auld 2021-01-22  22   * this and catch if we ever ne=
ed to fix it. In the meantime, if you do
ae2fb480f32f65 Matthew Auld 2021-01-22  23   * spot such a local variable, =
please consider fixing!
ae2fb480f32f65 Matthew Auld 2021-01-22  24   *
ae2fb480f32f65 Matthew Auld 2021-01-22  25   * Aside from our own locals (f=
or which we have no excuse!):
ae2fb480f32f65 Matthew Auld 2021-01-22  26   * - sg_table embeds unsigned i=
nt for num_pages
ae2fb480f32f65 Matthew Auld 2021-01-22  27   * - get_user_pages*() mixed in=
ts with longs
ae2fb480f32f65 Matthew Auld 2021-01-22  28   */
ae2fb480f32f65 Matthew Auld 2021-01-22  29  #define GEM_CHECK_SIZE_OVERFLOW=
(sz) \
ae2fb480f32f65 Matthew Auld 2021-01-22  30  	GEM_WARN_ON((sz) >> PAGE_SHIFT=
 > INT_MAX)
ae2fb480f32f65 Matthew Auld 2021-01-22  31  =

ae2fb480f32f65 Matthew Auld 2021-01-22  32  static inline bool i915_gem_obj=
ect_size_2big(u64 size)
ae2fb480f32f65 Matthew Auld 2021-01-22  33  {
ae2fb480f32f65 Matthew Auld 2021-01-22  34  	struct drm_i915_gem_object *ob=
j;
ae2fb480f32f65 Matthew Auld 2021-01-22  35  =

ae2fb480f32f65 Matthew Auld 2021-01-22  36  	if (GEM_CHECK_SIZE_OVERFLOW(si=
ze))
ae2fb480f32f65 Matthew Auld 2021-01-22  37  		return true;
ae2fb480f32f65 Matthew Auld 2021-01-22  38  =

ae2fb480f32f65 Matthew Auld 2021-01-22 @39  	if (overflows_type(size, obj->=
base.size))
ae2fb480f32f65 Matthew Auld 2021-01-22  40  		return true;
ae2fb480f32f65 Matthew Auld 2021-01-22  41  =

ae2fb480f32f65 Matthew Auld 2021-01-22  42  	return false;
ae2fb480f32f65 Matthew Auld 2021-01-22  43  }
ae2fb480f32f65 Matthew Auld 2021-01-22  44  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7065366203672176731==--

