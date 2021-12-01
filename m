Content-Type: multipart/mixed; boundary="===============2705132100494855000=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4206/4626] drivers/gpu/drm/drm_mipi_dbi.c:212:6: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 02 Dec 2021 03:20:27 +0800
Message-ID: <202112020332.7dlilGsy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2705132100494855000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   048aeae86c3967f4c40666cd26f2c1eb73a4b805
commit: c47160d8edcdb4d9fb2b333569a3fc13fca5db43 [4206/4626] drm/mipi-dbi: =
Remove dependency on GEM CMA helper library
:::::: branch date: 14 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-c007-20211130 (https://download.01.org/0day-ci/ar=
chive/20211202/202112020332.7dlilGsy-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dc47160d8edcdb4d9fb2b333569a3fc13fca5db43
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c47160d8edcdb4d9fb2b333569a3fc13fca5db43
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^
   arch/x86/include/asm/uaccess.h:155:25: note: expanded from macro 'get_us=
er'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,pt=
r); })
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/tty/vt/keyboard.c:2055:2: note: Taking false branch
           if (get_user(kb_func, &user_kdgkb->kb_func))
           ^
   drivers/tty/vt/keyboard.c:2058:12: note: Taking false branch
           kb_func =3D array_index_nospec(kb_func, MAX_NR_FUNC);
                     ^
   include/linux/nospec.h:57:2: note: expanded from macro 'array_index_nosp=
ec'
           BUILD_BUG_ON(sizeof(_i) > sizeof(long));                        \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/tty/vt/keyboard.c:2058:12: note: Loop condition is false.  Exiti=
ng loop
           kb_func =3D array_index_nospec(kb_func, MAX_NR_FUNC);
                     ^
   include/linux/nospec.h:57:2: note: expanded from macro 'array_index_nosp=
ec'
           BUILD_BUG_ON(sizeof(_i) > sizeof(long));                        \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/tty/vt/keyboard.c:2058:12: note: Taking false branch
           kb_func =3D array_index_nospec(kb_func, MAX_NR_FUNC);
                     ^
   include/linux/nospec.h:58:2: note: expanded from macro 'array_index_nosp=
ec'
           BUILD_BUG_ON(sizeof(_s) > sizeof(long));                        \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/tty/vt/keyboard.c:2058:12: note: Loop condition is false.  Exiti=
ng loop
           kb_func =3D array_index_nospec(kb_func, MAX_NR_FUNC);
                     ^
   include/linux/nospec.h:58:2: note: expanded from macro 'array_index_nosp=
ec'
           BUILD_BUG_ON(sizeof(_s) > sizeof(long));                        \
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/tty/vt/keyboard.c:2060:2: note: 'Default' branch taken. Executio=
n continues on line 2095
           switch (cmd) {
           ^
   drivers/tty/vt/keyboard.c:2095:2: note: 1st function call argument is an=
 uninitialized value
           kfree(kbs);
           ^     ~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/gpu/drm/drm_mipi_dbi.c:212:6: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
           src =3D data[0].vaddr; /* TODO: Use mapping abstraction properly=
 */
               ^
   drivers/gpu/drm/drm_mipi_dbi.c:359:6: note: Assuming the condition is fa=
lse
           if (!drm_dev_enter(&dbidev->drm, &idx))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mipi_dbi.c:359:2: note: Taking false branch
           if (!drm_dev_enter(&dbidev->drm, &idx))
           ^
   drivers/gpu/drm/drm_mipi_dbi.c:362:2: note: Calling 'mipi_dbi_fb_dirty'
           mipi_dbi_fb_dirty(fb, &rect);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mipi_dbi.c:272:15: note: 'fb' is non-null
           if (WARN_ON(!fb))
                        ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/drm_mipi_dbi.c:272:6: note: Taking false branch
           if (WARN_ON(!fb))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/gpu/drm/drm_mipi_dbi.c:272:2: note: Taking false branch
           if (WARN_ON(!fb))
           ^
   drivers/gpu/drm/drm_mipi_dbi.c:275:6: note: Assuming the condition is fa=
lse
           if (!drm_dev_enter(fb->dev, &idx))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mipi_dbi.c:275:2: note: Taking false branch
           if (!drm_dev_enter(fb->dev, &idx))
           ^
   drivers/gpu/drm/drm_mipi_dbi.c:279:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/drm_mipi_dbi.c:279:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/drm_mipi_dbi.c:282:9: note: Assuming 'width' is not equa=
l to field 'width'
           full =3D width =3D=3D fb->width && height =3D=3D fb->height;
                  ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mipi_dbi.c:282:28: note: Left side of '&&' is false
           full =3D width =3D=3D fb->width && height =3D=3D fb->height;
                                     ^
   drivers/gpu/drm/drm_mipi_dbi.c:286:6: note: Assuming field 'dc' is null
           if (!dbi->dc || !full || swap ||
               ^~~~~~~~
   drivers/gpu/drm/drm_mipi_dbi.c:286:15: note: Left side of '||' is true
           if (!dbi->dc || !full || swap ||
                        ^
   drivers/gpu/drm/drm_mipi_dbi.c:289:9: note: Calling 'mipi_dbi_buf_copy'
                   ret =3D mipi_dbi_buf_copy(dbidev->tx_buf, fb, rect, swap=
);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mipi_dbi.c:210:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/drm_mipi_dbi.c:210:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/drm_mipi_dbi.c:212:6: note: Assigned value is garbage or=
 undefined
           src =3D data[0].vaddr; /* TODO: Use mapping abstraction properly=
 */
               ^ ~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +212 drivers/gpu/drm/drm_mipi_dbi.c

a89bfc5d9a0732 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
19-02-22  189  =

13deee8111ed60 drivers/gpu/drm/tinydrm/mipi-dbi.c David Lechner     2017-11=
-19  190  /**
13deee8111ed60 drivers/gpu/drm/tinydrm/mipi-dbi.c David Lechner     2017-11=
-19  191   * mipi_dbi_buf_copy - Copy a framebuffer, transforming it if nec=
essary
13deee8111ed60 drivers/gpu/drm/tinydrm/mipi-dbi.c David Lechner     2017-11=
-19  192   * @dst: The destination buffer
13deee8111ed60 drivers/gpu/drm/tinydrm/mipi-dbi.c David Lechner     2017-11=
-19  193   * @fb: The source framebuffer
13deee8111ed60 drivers/gpu/drm/tinydrm/mipi-dbi.c David Lechner     2017-11=
-19  194   * @clip: Clipping rectangle of the area to be copied
13deee8111ed60 drivers/gpu/drm/tinydrm/mipi-dbi.c David Lechner     2017-11=
-19  195   * @swap: When true, swap MSB/LSB of 16-bit values
13deee8111ed60 drivers/gpu/drm/tinydrm/mipi-dbi.c David Lechner     2017-11=
-19  196   *
13deee8111ed60 drivers/gpu/drm/tinydrm/mipi-dbi.c David Lechner     2017-11=
-19  197   * Returns:
13deee8111ed60 drivers/gpu/drm/tinydrm/mipi-dbi.c David Lechner     2017-11=
-19  198   * Zero on success, negative error code on failure.
13deee8111ed60 drivers/gpu/drm/tinydrm/mipi-dbi.c David Lechner     2017-11=
-19  199   */
13deee8111ed60 drivers/gpu/drm/tinydrm/mipi-dbi.c David Lechner     2017-11=
-19  200  int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
b051b3459bbae9 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
19-01-15  201  		      struct drm_rect *clip, bool swap)
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  202  {
7c9f1312cfca15 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
19-07-22  203  	struct drm_gem_object *gem =3D drm_gem_fb_get_obj(fb, 0);
c47160d8edcdb4 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-06  204  	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
c47160d8edcdb4 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-06  205  	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
c47160d8edcdb4 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-06  206  	void *src;
08971eea06db33 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-07=
-16  207  	int ret;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  208  =

08971eea06db33 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-07=
-16  209  	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  210  	if (ret)
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  211  		return ret;
c47160d8edcdb4 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-06 @212  	src =3D data[0].vaddr; /* TODO: Use mapping abstraction properly=
 */
c47160d8edcdb4 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-06  213  =

c47160d8edcdb4 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-06  214  	ret =3D drm_gem_fb_vmap(fb, map, data);
c47160d8edcdb4 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-06  215  	if (ret)
c47160d8edcdb4 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-06  216  		goto out_drm_gem_fb_end_cpu_access;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  217  =

02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  218  	switch (fb->format->format) {
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  219  	case DRM_FORMAT_RGB565:
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  220  		if (swap)
3e3543c8a19cad drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-10  221  			drm_fb_swab(dst, 0, src, fb, clip, !gem->import_attach);
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  222  		else
27bd66dd6419c4 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-10  223  			drm_fb_memcpy(dst, 0, src, fb, clip);
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  224  		break;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  225  	case DRM_FORMAT_XRGB8888:
53bc2098d2b6cc drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-10  226  		drm_fb_xrgb8888_to_rgb565(dst, 0, src, fb, clip, swap);
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  227  		break;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  228  	default:
92f1d09ca4ed4a drivers/gpu/drm/drm_mipi_dbi.c     Sakari Ailus      2021-02=
-16  229  		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
92f1d09ca4ed4a drivers/gpu/drm/drm_mipi_dbi.c     Sakari Ailus      2021-02=
-16  230  			     &fb->format->format);
c47160d8edcdb4 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-06  231  		ret =3D -EINVAL;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  232  	}
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  233  =

c47160d8edcdb4 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-06  234  	drm_gem_fb_vunmap(fb, map);
c47160d8edcdb4 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-11=
-06  235  out_drm_gem_fb_end_cpu_access:
08971eea06db33 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-07=
-16  236  	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
08971eea06db33 drivers/gpu/drm/drm_mipi_dbi.c     Thomas Zimmermann 2021-07=
-16  237  =

02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  238  	return ret;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  239  }
13deee8111ed60 drivers/gpu/drm/tinydrm/mipi-dbi.c David Lechner     2017-11=
-19  240  EXPORT_SYMBOL(mipi_dbi_buf_copy);
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes    20=
17-01-22  241  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2705132100494855000==--

