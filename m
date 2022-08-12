Content-Type: multipart/mixed; boundary="===============9118073217851429751=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/drm_gem_framebuffer_helper.c:56:21: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 13 Aug 2022 04:32:11 +0800
Message-ID: <202208130427.E4WYEdJb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9118073217851429751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/gpu/drm/drm_gem_framebuffer_helper.c:56:21: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: Dave Airlie <airlied@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4a9350597aff50bbd0f4b80ccf49d2e02d1111f5
commit: e23a5e14aa278858c2e3d81ec34e83aa9a4177c5 Backmerge tag 'v5.19-rc6' =
of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into drm-ne=
xt
date:   4 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20220811 (https://download.01.org/0day-ci/arc=
hive/20220813/202208130427.E4WYEdJb-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e=
2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De23a5e14aa278858c2e3d81ec34e83aa9a4177c5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e23a5e14aa278858c2e3d81ec34e83aa9a4177c5
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   45 warnings generated.
   drivers/w1/masters/ds1wm.c:567:2: warning: Value stored to 'inten' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           inten =3D ds1wm_read_register(ds1wm_data, DS1WM_INT_EN);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/masters/ds1wm.c:567:2: note: Value stored to 'inten' is never=
 read
           inten =3D ds1wm_read_register(ds1wm_data, DS1WM_INT_EN);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/gpu/drm/arm/display/komeda/komeda_dev.c:77:2: warning: Call to f=
unction 'memset' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memset_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&config_id, 0, sizeof(config_id));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_dev.c:77:2: note: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(&config_id, 0, sizeof(config_id));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   drivers/usb/gadget/udc/bdc/bdc_udc.c:349:2: warning: Value stored to 'sr=
r_int' is never read [clang-analyzer-deadcode.DeadStores]
           srr_int =3D bdc_readl(bdc->regs, BDC_SRRINT(0));
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/bdc/bdc_udc.c:349:2: note: Value stored to 'srr_i=
nt' is never read
           srr_int =3D bdc_readl(bdc->regs, BDC_SRRINT(0));
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 57 warnings (57 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/gpu/drm/bridge/tc358768.c:217:13: warning: The left operand of '=
&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           tmp =3D orig & ~mask;
                      ^
   drivers/gpu/drm/bridge/tc358768.c:898:6: note: Assuming field 'enabled' =
is not equal to 0
           if (!priv->enabled) {
               ^~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:898:2: note: Taking false branch
           if (!priv->enabled) {
           ^
   drivers/gpu/drm/bridge/tc358768.c:904:2: note: Calling 'tc358768_update_=
bits'
           tc358768_update_bits(priv, TC358768_PP_MISC, 0x3 << 14, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:214:11: note: 'orig' declared without =
an initial value
           u32 tmp, orig;
                    ^~~~
   drivers/gpu/drm/bridge/tc358768.c:216:2: note: Calling 'tc358768_read'
           tc358768_read(priv, reg, &orig);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:199:6: note: Assuming field 'error' is=
 not equal to 0
           if (priv->error)
               ^~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:199:2: note: Taking true branch
           if (priv->error)
           ^
   drivers/gpu/drm/bridge/tc358768.c:200:3: note: Returning without writing=
 to '*val'
                   return;
                   ^
   drivers/gpu/drm/bridge/tc358768.c:216:2: note: Returning from 'tc358768_=
read'
           tc358768_read(priv, reg, &orig);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358768.c:217:13: note: The left operand of '&' =
is a garbage value
           tmp =3D orig & ~mask;
                 ~~~~ ^
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (55 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   61 warnings generated.
>> drivers/gpu/drm/drm_gem_framebuffer_helper.c:56:21: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct drm_device *dev =3D fb->dev;
                              ^~~   ~~~~~~~
   drivers/gpu/drm/drm_gem_framebuffer_helper.c:56:21: note: Value stored t=
o 'dev' during its initialization is never read
           struct drm_device *dev =3D fb->dev;
                              ^~~   ~~~~~~~
   drivers/gpu/drm/drm_gem_framebuffer_helper.c:364:4: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&data[i], &map[i], sizeof(data[i]));
                           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gem_framebuffer_helper.c:364:4: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&data[i], &map[i], sizeof(data[i]));
                           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 59 warnings (59 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/gpu/drm/drm_atomic_state_helper.c:136:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state, crtc->state, sizeof(*state));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:136:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(state, crtc->state, sizeof(*state));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:333:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state, plane->state, sizeof(*state));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:333:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(state, plane->state, sizeof(*state));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:496:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state, connector->state, sizeof(*state));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:496:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11

vim +/dev +56 drivers/gpu/drm/drm_gem_framebuffer_helper.c

55f7f72753abdd Andrzej Pietrasiewicz 2020-03-11  29  =

4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  30  /**
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  31   * DOC: overview
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  32   *
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  33   * This library p=
rovides helpers for drivers that don't subclass
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  34   * &drm_framebuff=
er and use &drm_gem_object for their backing storage.
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  35   *
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  36   * Drivers withou=
t additional needs to validate framebuffers can simply use
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  37   * drm_gem_fb_cre=
ate() and everything is wired up automatically. Other drivers
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  38   * can use all pa=
rts independently.
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  39   */
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  40  =

4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  41  /**
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  42   * drm_gem_fb_get=
_obj() - Get GEM object backing the framebuffer
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  43   * @fb: Framebuff=
er
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  44   * @plane: Plane =
index
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  45   *
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  46   * No additional =
reference is taken beyond the one that the &drm_frambuffer
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  47   * already holds.
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  48   *
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  49   * Returns:
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  50   * Pointer to &dr=
m_gem_object for the given framebuffer and plane index or NULL
2e187b2099034a Noralf Tr=C3=B8nnes        2017-09-22  51   * if it does not=
 exist.
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  52   */
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  53  struct drm_gem_ob=
ject *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  54  					  unsigned i=
nt plane)
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  55  {
4f093a527b0b8f Thomas Zimmermann     2022-05-17 @56  	struct drm_device *de=
v =3D fb->dev;
4f093a527b0b8f Thomas Zimmermann     2022-05-17  57  =

4f093a527b0b8f Thomas Zimmermann     2022-05-17  58  	if (drm_WARN_ON_ONCE(=
dev, plane >=3D ARRAY_SIZE(fb->obj)))
4f093a527b0b8f Thomas Zimmermann     2022-05-17  59  		return NULL;
4f093a527b0b8f Thomas Zimmermann     2022-05-17  60  	else if (drm_WARN_ON_=
ONCE(dev, !fb->obj[plane]))
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  61  		return NULL;
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  62  =

4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  63  	return fb->obj[p=
lane];
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  64  }
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  65  EXPORT_SYMBOL_GPL=
(drm_gem_fb_get_obj);
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  66  =


:::::: The code at line 56 was first introduced by commit
:::::: 4f093a527b0b8f9d3059a4e8376e582fd14cf09e drm/gem: Warn on trying to =
use a non-existing framebuffer plane

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9118073217851429751==--

