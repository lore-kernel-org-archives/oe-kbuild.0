Content-Type: multipart/mixed; boundary="===============5072138087000408756=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/4] drm/gem: Warn on trying to use a non-existing framebuffer plane
Date: Fri, 13 May 2022 21:35:54 +0800
Message-ID: <202205132133.TO6CH9hx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5072138087000408756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220509081602.474-5-tzimmermann@suse.de>
References: <20220509081602.474-5-tzimmermann@suse.de>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: daniel(a)ffwll.ch
TO: airlied(a)linux.ie
TO: mripard(a)kernel.org
TO: maarten.lankhorst(a)linux.intel.com
TO: noralf(a)tronnes.org
TO: christian.koenig(a)amd.com
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: dri-devel(a)lists.freedesktop.org

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on b0b93865a24c910fcbfa6e6fa0955fae930a56d3]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/dr=
m-Ignore-non-existing-color-planes-in-helpers/20220509-161931
base:   b0b93865a24c910fcbfa6e6fa0955fae930a56d3
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20220512 (https://download.01.org/0day-ci/archi=
ve/20220513/202205132133.TO6CH9hx-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519da=
cab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/74626e0c7dc11284a12=
f3e8c046612eec6e7bc4e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-Ignore-non-e=
xisting-color-planes-in-helpers/20220509-161931
        git checkout 74626e0c7dc11284a12f3e8c046612eec6e7bc4e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~
   lib/mpi/mpi-pow.c:71:2: note: Taking false branch
           if (!mp)
           ^
   lib/mpi/mpi-pow.c:74:6: note: 'mod_shift_cnt' is 32
           if (mod_shift_cnt)
               ^~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:74:2: note: Taking true branch
           if (mod_shift_cnt)
           ^
   lib/mpi/mpi-pow.c:81:6: note: Assuming 'bsize' is <=3D 'msize'
           if (bsize > msize) {    /* The base is larger than the module. R=
educe it. */
               ^~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:81:2: note: Taking false branch
           if (bsize > msize) {    /* The base is larger than the module. R=
educe it. */
           ^
   lib/mpi/mpi-pow.c:98:6: note: Assuming 'bsize' is not equal to 0
           if (!bsize) {
               ^~~~~~
   lib/mpi/mpi-pow.c:98:2: note: Taking false branch
           if (!bsize) {
           ^
   lib/mpi/mpi-pow.c:104:6: note: Assuming 'size' is <=3D field 'alloced'
           if (res->alloced < size) {
               ^~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:104:2: note: Taking false branch
           if (res->alloced < size) {
           ^
   lib/mpi/mpi-pow.c:119:7: note: Assuming 'rp' is not equal to 'bp'
                   if (rp =3D=3D bp) {
                       ^~~~~~~~
   lib/mpi/mpi-pow.c:119:3: note: Taking false branch
                   if (rp =3D=3D bp) {
                   ^
   lib/mpi/mpi-pow.c:127:7: note: Assuming 'rp' is not equal to 'ep'
                   if (rp =3D=3D ep) {
                       ^~~~~~~~
   lib/mpi/mpi-pow.c:127:3: note: Taking false branch
                   if (rp =3D=3D ep) {
                   ^
   lib/mpi/mpi-pow.c:134:7: note: Assuming 'rp' is not equal to 'mp'
                   if (rp =3D=3D mp) {
                       ^~~~~~~~
   lib/mpi/mpi-pow.c:134:3: note: Taking false branch
                   if (rp =3D=3D mp) {
                   ^
   lib/mpi/mpi-pow.c:144:2: note: Assuming '_i' is >=3D 'bsize'
           MPN_COPY(rp, bp, bsize);
           ^
   lib/mpi/mpi-internal.h:65:16: note: expanded from macro 'MPN_COPY'
                   for (_i =3D 0; _i < (n); _i++)    \
                                ^~~~~~~~
   lib/mpi/mpi-pow.c:144:2: note: Loop condition is false. Execution contin=
ues on line 144
           MPN_COPY(rp, bp, bsize);
           ^
   lib/mpi/mpi-internal.h:65:3: note: expanded from macro 'MPN_COPY'
                   for (_i =3D 0; _i < (n); _i++)    \
                   ^
   lib/mpi/mpi-pow.c:144:2: note: Loop condition is false.  Exiting loop
           MPN_COPY(rp, bp, bsize);
           ^
   lib/mpi/mpi-internal.h:63:2: note: expanded from macro 'MPN_COPY'
           do {                                    \
           ^
   lib/mpi/mpi-pow.c:156:7: note: Assuming 'xp' is non-null
                   if (!xp)
                       ^~~
   lib/mpi/mpi-pow.c:156:3: note: Taking false branch
                   if (!xp)
                   ^
   lib/mpi/mpi-pow.c:159:22: note: Assuming the condition is false
                   negative_result =3D (ep[0] & 1) && base->sign;
                                      ^~~~~~~~~
   lib/mpi/mpi-pow.c:159:33: note: Left side of '&&' is false
                   negative_result =3D (ep[0] & 1) && base->sign;
                                                 ^
   lib/mpi/mpi-pow.c:163:7: note: Calling 'count_leading_zeros'
                   c =3D count_leading_zeros(e);
                       ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/count_zeros.h:25:2: note: Taking true branch
           if (sizeof(x) =3D=3D 4)
           ^
   include/linux/count_zeros.h:26:3: note: Returning the value 32
                   return BITS_PER_LONG - fls(x);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:163:7: note: Returning from 'count_leading_zeros'
                   c =3D count_leading_zeros(e);
                       ^~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:163:3: note: The value 32 is assigned to 'c'
                   c =3D count_leading_zeros(e);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpi-pow.c:164:10: note: The result of the left shift is undefine=
d due to shifting by '32', which is greater or equal to the width of type '=
mpi_limb_t'
                   e =3D (e << c) << 1;      /* shift the exp bits to the l=
eft, lose msb */
                          ^  ~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
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
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
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
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/gpu/drm/drm_atomic_state_helper.c:134:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state, crtc->state, sizeof(*state));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:134:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(state, crtc->state, sizeof(*state));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:331:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state, plane->state, sizeof(*state));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:331:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(state, plane->state, sizeof(*state));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:494:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(state, connector->state, sizeof(*state));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_atomic_state_helper.c:494:2: note: Call to function =
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
74626e0c7dc112 Thomas Zimmermann     2022-05-09 @56  	struct drm_device *de=
v =3D fb->dev;
74626e0c7dc112 Thomas Zimmermann     2022-05-09  57  =

74626e0c7dc112 Thomas Zimmermann     2022-05-09  58  	if (drm_WARN_ON_ONCE(=
dev, plane >=3D ARRAY_SIZE(fb->obj)))
74626e0c7dc112 Thomas Zimmermann     2022-05-09  59  		return NULL;
74626e0c7dc112 Thomas Zimmermann     2022-05-09  60  	else if (drm_WARN_ON_=
ONCE(dev, !fb->obj[plane]))
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  61  		return NULL;
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  62  =

4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  63  	return fb->obj[p=
lane];
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  64  }
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  65  EXPORT_SYMBOL_GPL=
(drm_gem_fb_get_obj);
4c3dbb2c312c9f Noralf Tr=C3=B8nnes        2017-08-13  66  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5072138087000408756==--

