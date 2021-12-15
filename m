Content-Type: multipart/mixed; boundary="===============3208949749374650799=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 17/17] fortify: Work around Clang inlining bugs
Date: Wed, 15 Dec 2021 11:25:44 +0800
Message-ID: <202112151107.GkUtvCuq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3208949749374650799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211213223331.135412-18-keescook@chromium.org>
References: <20211213223331.135412-18-keescook@chromium.org>
TO: Kees Cook <keescook@chromium.org>

Hi Kees,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.16-rc5 next-20211213]
[cannot apply to rdma/for-next axboe-block/for-next kvm/queue tip/x86/core =
mkp-scsi/for-next jejb-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kees-Cook/Enable-strict-co=
mpile-time-memcpy-fortify-checks/20211214-064002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
aa50faff4416c869b52dff68a937c84d29e12f4b
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: i386-randconfig-c001-20211213 (https://download.01.org/0day-ci/arch=
ive/20211215/202112151107.GkUtvCuq-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e5d600e1abbdd2034dbc84465=
4957a4ec1182dbf
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kees-Cook/Enable-strict-compile-ti=
me-memcpy-fortify-checks/20211214-064002
        git checkout e5d600e1abbdd2034dbc844654957a4ec1182dbf
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1010:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1010:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1010:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1011:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:660:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:643:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1011:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:660:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:643:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1011:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:660:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:644:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:396:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   include/linux/hid.h:1012:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:660:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:644:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:450:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:422:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/gma500/cdv_intel_display.c:752:2: warning: Value stored =
to 'dpll' is never read [clang-analyzer-deadcode.DeadStores]
           dpll |=3D DPLL_VCO_ENABLE;
           ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:752:2: note: Value stored to =
'dpll' is never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/gma500/cdv_intel_dp.c:965:2: warning: Value stored to 'm=
' is never read [clang-analyzer-deadcode.DeadStores]
           m =3D do_div(value, *den);
           ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:965:2: note: Value stored to 'm' i=
s never read
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1405:21: warning: Value stored to =
'dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct drm_device *dev =3D encoder->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1405:21: note: Value stored to 'de=
v' during its initialization is never read
           struct drm_device *dev =3D encoder->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1411:3: warning: Value stored to '=
ddi_reg' is never read [clang-analyzer-deadcode.DeadStores]
                   ddi_reg =3D &ddi_DP_train_table[0];
                   ^         ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1411:3: note: Value stored to 'ddi=
_reg' is never read
                   ddi_reg =3D &ddi_DP_train_table[0];
                   ^         ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1413:3: warning: Value stored to '=
ddi_reg' is never read [clang-analyzer-deadcode.DeadStores]
                   ddi_reg =3D &ddi_DP_train_table[1];
                   ^         ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1413:3: note: Value stored to 'ddi=
_reg' is never read
                   ddi_reg =3D &ddi_DP_train_table[1];
                   ^         ~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/fortify-string.h:61:9: warning: Null pointer passed as 2nd=
 argument to string copy function [clang-analyzer-unix.cstring.NullArg]
           return __underlying_strncpy(p, q, size);
                  ^
   include/linux/fortify-string.h:50:30: note: expanded from macro '__under=
lying_strncpy'
   #define __underlying_strncpy    __builtin_strncpy
                                   ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1958:2: note: 'name' initialized t=
o a null pointer value
           const char *name =3D NULL;
           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1961:16: note: Calling 'kzalloc'
           gma_encoder =3D kzalloc(sizeof(struct gma_encoder), GFP_KERNEL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:578:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:595:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1961:16: note: Returning from 'kza=
lloc'
           gma_encoder =3D kzalloc(sizeof(struct gma_encoder), GFP_KERNEL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1962:6: note: Assuming 'gma_encode=
r' is non-null
           if (!gma_encoder)
               ^~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1962:2: note: Taking false branch
           if (!gma_encoder)
           ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1964:25: note: Calling 'kzalloc'
           gma_connector =3D kzalloc(sizeof(struct gma_connector), GFP_KERN=
EL);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:578:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:595:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1964:25: note: Returning from 'kza=
lloc'
           gma_connector =3D kzalloc(sizeof(struct gma_connector), GFP_KERN=
EL);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1965:13: note: Assuming 'gma_conne=
ctor' is non-null
           if (!gma_connector)
               ^~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1965:9: note: Taking false branch
           if (!gma_connector)
           ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1967:13: note: Calling 'kzalloc'
           intel_dp =3D kzalloc(sizeof(struct cdv_intel_dp), GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:578:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:595:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1967:13: note: Returning from 'kza=
lloc'
           intel_dp =3D kzalloc(sizeof(struct cdv_intel_dp), GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1968:6: note: Assuming 'intel_dp' =
is non-null
           if (!intel_dp)
               ^~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1968:2: note: Taking false branch
           if (!intel_dp)
           ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1971:7: note: Assuming 'output_reg=
' is not equal to DP_C
           if ((output_reg =3D=3D DP_C) && cdv_intel_dpc_is_edp(dev))
                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1971:27: note: Left side of '&&' i=
s false
           if ((output_reg =3D=3D DP_C) && cdv_intel_dpc_is_edp(dev))
                                    ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1982:6: note: 'type' is equal to D=
RM_MODE_CONNECTOR_DisplayPort
           if (type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
               ^~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1982:2: note: Taking true branch
           if (type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)

vim +61 include/linux/fortify-string.h

a28a6e860c6cf23 Francis Laniel 2021-02-25  52  =

e5d600e1abbdd20 Kees Cook      2021-12-13  53  #define strncpy(p, q, s) __f=
ortify_strncpy(p, q, s, __builtin_object_size(p, 1))
e5d600e1abbdd20 Kees Cook      2021-12-13  54  __FORTIFY_INLINE char *__for=
tify_strncpy(char *p, const char *q,
e5d600e1abbdd20 Kees Cook      2021-12-13  55  					 __kernel_size_t size, =
size_t p_size)
a28a6e860c6cf23 Francis Laniel 2021-02-25  56  {
a28a6e860c6cf23 Francis Laniel 2021-02-25  57  	if (__builtin_constant_p(si=
ze) && p_size < size)
a28a6e860c6cf23 Francis Laniel 2021-02-25  58  		__write_overflow();
a28a6e860c6cf23 Francis Laniel 2021-02-25  59  	if (p_size < size)
a28a6e860c6cf23 Francis Laniel 2021-02-25  60  		fortify_panic(__func__);
a28a6e860c6cf23 Francis Laniel 2021-02-25 @61  	return __underlying_strncpy=
(p, q, size);
a28a6e860c6cf23 Francis Laniel 2021-02-25  62  }
a28a6e860c6cf23 Francis Laniel 2021-02-25  63  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3208949749374650799==--

