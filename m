Content-Type: multipart/mixed; boundary="===============2588356242769553413=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v10 3/4] drm/lsdc: add drm driver for loongson display controller
Date: Thu, 24 Feb 2022 20:57:02 +0800
Message-ID: <202202242042.vva4KgZu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2588356242769553413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220220145554.117854-4-15330273260@189.cn>
References: <20220220145554.117854-4-15330273260@189.cn>
TO: Sui Jingfeng <15330273260@189.cn>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Roland Scheidegger <sroland@vmware.com>
TO: Zack Rusin <zackr@vmware.com>
TO: Christian Gmeiner <christian.gmeiner@gmail.com>
TO: David Airlie <airlied@linux.ie>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Rob Herring <robh+dt@kernel.org>
TO: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
TO: Dan Carpenter <error27@gmail.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
TO: Sam Ravnborg <sam@ravnborg.org>
TO: "David S . Miller" <davem@davemloft.net>
TO: Jiaxun Yang <jiaxun.yang@flygoat.com>
TO: Lucas Stach <l.stach@pengutronix.de>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Ilia Mirkin <imirkin@alum.mit.edu>
TO: Qing Zhang <zhangqing@loongson.cn>
TO: suijingfeng <suijingfeng@loongson.cn>
CC: linux-mips(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: dri-devel(a)lists.freedesktop.org
CC: Randy Dunlap <rdunlap@infradead.org>
CC: kernel test robot <lkp@intel.com>

Hi Sui,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on robh/for-next v5.17-rc5 next-20220223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sui-Jingfeng/drm-lsdc-add-=
drm-driver-for-loongson-display-controller/20220220-225801
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20220221 (https://download.01.org/0day-ci/arc=
hive/20220224/202202242042.vva4KgZu-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/3891cda03ed77e66fafaf7cfe=
075042e13f20173
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sui-Jingfeng/drm-lsdc-add-drm-driv=
er-for-loongson-display-controller/20220220-225801
        git checkout 3891cda03ed77e66fafaf7cfe075042e13f20173
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/clk/clk-max9485.c:199:9: warning: Access to field 'out' results =
in a dereference of a null pointer (loaded from variable 'prev') [clang-ana=
lyzer-core.NullDereference]
           return prev->out;
                  ^~~~
   drivers/clk/clk-max9485.c:165:36: note: 'prev' initialized to a null poi=
nter value
           const struct max9485_rate *curr, *prev =3D NULL;
                                             ^~~~
   drivers/clk/clk-max9485.c:167:29: note: Assuming field 'out' is equal to=
 0
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
                                      ^~~~~~~~~~~~~~
   drivers/clk/clk-max9485.c:167:2: note: Loop condition is false. Executio=
n continues on line 199
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
           ^
   drivers/clk/clk-max9485.c:199:9: note: Access to field 'out' results in =
a dereference of a null pointer (loaded from variable 'prev')
           return prev->out;
                  ^~~~
   drivers/clk/clk-max9485.c:202:8: warning: Excessive padding in 'struct m=
ax9485_clk' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   name, =

   ops, =

   parent_index, =

   enable_bit, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct max9485_clk {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/clk/clk-max9485.c:202:8: note: Excessive padding in 'struct max9=
485_clk' (11 padding bytes, where 3 is optimal). Optimal fields order: name=
, ops, parent_index, enable_bit, consider reordering the fields or adding e=
xplicit padding members
   struct max9485_clk {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   crypto/pcbc.c:74:10: warning: Although the value stored to 'nbytes' is u=
sed in the enclosing expression, the value is never actually read from 'nby=
tes' [clang-analyzer-deadcode.DeadStores]
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   crypto/pcbc.c:74:10: note: Although the value stored to 'nbytes' is used=
 in the enclosing expression, the value is never actually read from 'nbytes'
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   crypto/pcbc.c:141:10: warning: Although the value stored to 'nbytes' is =
used in the enclosing expression, the value is never actually read from 'nb=
ytes' [clang-analyzer-deadcode.DeadStores]
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   crypto/pcbc.c:141:10: note: Although the value stored to 'nbytes' is use=
d in the enclosing expression, the value is never actually read from 'nbyte=
s'
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/gpu/drm/lsdc/lsdc_crtc.c:104:21: warning: Value stored to 'ddev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct drm_device *ddev =3D crtc->dev;
                              ^~~~   ~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_crtc.c:104:21: note: Value stored to 'ddev' du=
ring its initialization is never read
           struct drm_device *ddev =3D crtc->dev;
                              ^~~~   ~~~~~~~~~
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/gpu/drm/lsdc/lsdc_plane.c:118:2: warning: 2nd function call argu=
ment is an uninitialized value [clang-analyzer-core.CallAndMessage]
           lsdc_reg_write32(ldev, addr_reg, paddr);
           ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:237:6: note: Assuming field 'use_vram_=
helper' is false
           if (ldev->use_vram_helper) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:237:2: note: Taking false branch
           if (ldev->use_vram_helper) {
           ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:251:2: note: Calling 'lsdc_update_fb_s=
tart_addr'
           lsdc_update_fb_start_addr(ldev, crtc, fb_addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:81:2: note: 'addr_reg' declared withou=
t an initial value
           u32 addr_reg;
           ^~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:90:6: note: Assuming 'index' is not eq=
ual to 0
           if (index =3D=3D 0) {
               ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:90:2: note: Taking false branch
           if (index =3D=3D 0) {
           ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:103:13: note: Assuming 'index' is not =
equal to 1
           } else if (index =3D=3D 1) {
                      ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:103:9: note: Taking false branch
           } else if (index =3D=3D 1) {
                  ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:118:2: note: 2nd function call argumen=
t is an uninitialized value
           lsdc_reg_write32(ldev, addr_reg, paddr);
           ^                      ~~~~~~~~
>> drivers/gpu/drm/lsdc/lsdc_plane.c:416:3: warning: Value stored to 'crtc'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   crtc =3D old_plane_state->crtc;
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:416:3: note: Value stored to 'crtc' is=
 never read
                   crtc =3D old_plane_state->crtc;
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:490:8: warning: 5th function call argu=
ment is an uninitialized value [clang-analyzer-core.CallAndMessage]
           ret =3D drm_universal_plane_init(ddev, plane, 1 << index,
                 ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:470:2: note: 'formats' declared withou=
t an initial value
           const u32 *formats;
           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:474:2: note: Control jumps to 'case DR=
M_PLANE_TYPE_OVERLAY:' @line 485
           switch (type) {
           ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:486:3: note: Loop condition is false. =
 Exiting loop
                   drm_err(ddev, "overlay plane is not supported\n");
                   ^
   include/drm/drm_print.h:438:2: note: expanded from macro 'drm_err'
           __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
           ^
   include/drm/drm_print.h:425:2: note: expanded from macro '__drm_printk'
           dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
           ^
   note: expanded from here
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:487:3: note:  Execution continues on l=
ine 490
                   break;
                   ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:490:8: note: 5th function call argumen=
t is an uninitialized value
           ret =3D drm_universal_plane_init(ddev, plane, 1 << index,
                 ^
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/xfs/libxfs/xfs_inode_fork.c:442:3: warning: Null pointer passed as 1s=
t argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(np, op, new_max * (uint)sizeof(xfs_bmbt_rec_t));
                   ^      ~~
   fs/xfs/libxfs/xfs_inode_fork.c:370:6: note: Assuming 'rec_diff' is not e=
qual to 0
           if (rec_diff =3D=3D 0) {
               ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_inode_fork.c:370:2: note: Taking false branch
           if (rec_diff =3D=3D 0) {
           ^
   fs/xfs/libxfs/xfs_inode_fork.c:374:8: note: Assuming 'whichfork' is equa=
l to 0
           ifp =3D XFS_IFORK_PTR(ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_inode_fork.c:374:8: note: '?' condition is true
           ifp =3D XFS_IFORK_PTR(ip, whichfork);
                 ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^
   fs/xfs/libxfs/xfs_inode_fork.c:375:6: note: Assuming 'rec_diff' is <=3D 0
           if (rec_diff > 0) {
               ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_inode_fork.c:375:2: note: Taking false branch
           if (rec_diff > 0) {
           ^
   fs/xfs/libxfs/xfs_inode_fork.c:414:10: note: Assuming field 'if_broot' i=
s not equal to null
           ASSERT((ifp->if_broot !=3D NULL) && (ifp->if_broot_bytes > 0));
                   ^
   fs/xfs/xfs_linux.h:208:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ~~~~~~~^~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_inode_fork.c:414:9: note: Left side of '&&' is true
           ASSERT((ifp->if_broot !=3D NULL) && (ifp->if_broot_bytes > 0));
                  ^
   fs/xfs/libxfs/xfs_inode_fork.c:414:37: note: Assuming field 'if_broot_by=
tes' is > 0
           ASSERT((ifp->if_broot !=3D NULL) && (ifp->if_broot_bytes > 0));
                                              ^
   fs/xfs/xfs_linux.h:208:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_inode_fork.c:414:2: note: '?' condition is true
           ASSERT((ifp->if_broot !=3D NULL) && (ifp->if_broot_bytes > 0));
           ^
   fs/xfs/xfs_linux.h:208:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^

vim +/ddev +104 drivers/gpu/drm/lsdc/lsdc_crtc.c

3891cda03ed77e suijingfeng 2022-02-20   99  =

3891cda03ed77e suijingfeng 2022-02-20  100  static struct drm_crtc_state *l=
sdc_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
3891cda03ed77e suijingfeng 2022-02-20  101  {
3891cda03ed77e suijingfeng 2022-02-20  102  	struct lsdc_crtc_state *new_pr=
iv_state;
3891cda03ed77e suijingfeng 2022-02-20  103  	struct lsdc_crtc_state *old_pr=
iv_state;
3891cda03ed77e suijingfeng 2022-02-20 @104  	struct drm_device *ddev =3D cr=
tc->dev;
3891cda03ed77e suijingfeng 2022-02-20  105  =

3891cda03ed77e suijingfeng 2022-02-20  106  	if (drm_WARN_ON(ddev, !crtc->s=
tate))
3891cda03ed77e suijingfeng 2022-02-20  107  		return NULL;
3891cda03ed77e suijingfeng 2022-02-20  108  =

3891cda03ed77e suijingfeng 2022-02-20  109  	new_priv_state =3D kmalloc(siz=
eof(*new_priv_state), GFP_KERNEL);
3891cda03ed77e suijingfeng 2022-02-20  110  	if (!new_priv_state)
3891cda03ed77e suijingfeng 2022-02-20  111  		return NULL;
3891cda03ed77e suijingfeng 2022-02-20  112  =

3891cda03ed77e suijingfeng 2022-02-20  113  	__drm_atomic_helper_crtc_dupli=
cate_state(crtc, &new_priv_state->base);
3891cda03ed77e suijingfeng 2022-02-20  114  =

3891cda03ed77e suijingfeng 2022-02-20  115  	old_priv_state =3D to_lsdc_crt=
c_state(crtc->state);
3891cda03ed77e suijingfeng 2022-02-20  116  =

3891cda03ed77e suijingfeng 2022-02-20  117  	memcpy(&new_priv_state->pparam=
s, &old_priv_state->pparams, sizeof(new_priv_state->pparams));
3891cda03ed77e suijingfeng 2022-02-20  118  =

3891cda03ed77e suijingfeng 2022-02-20  119  	return &new_priv_state->base;
3891cda03ed77e suijingfeng 2022-02-20  120  }
3891cda03ed77e suijingfeng 2022-02-20  121  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2588356242769553413==--

