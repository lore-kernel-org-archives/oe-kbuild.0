Content-Type: multipart/mixed; boundary="===============6257827253962748964=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display controller
Date: Fri, 11 Feb 2022 07:10:20 +0800
Message-ID: <202202110707.gB1LATq7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6257827253962748964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220203082546.3099-2-15330273260@189.cn>
References: <20220203082546.3099-2-15330273260@189.cn>
TO: Sui Jingfeng <15330273260@189.cn>

Hi Sui,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on robh/for-next drm-intel/for-linux-next drm-tip/=
drm-tip v5.17-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sui-Jingfeng/drm-lsdc-add-=
drm-driver-for-loongson-display-controller/20220203-162953
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-c006-20220205 (https://download.01.org/0day-ci/arc=
hive/20220211/202202110707.gB1LATq7-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project dee058=
c670593b999fec19c458dbbd882ad9de56)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/983916ec4a8df390a947a7f53=
9dbc99f5d511e26
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sui-Jingfeng/drm-lsdc-add-drm-driv=
er-for-loongson-display-controller/20220203-162953
        git checkout 983916ec4a8df390a947a7f539dbc99f5d511e26
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:23:2: note: Taking true branch
           if ((word & 0xffff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:27:6: note: Assuming the condition is=
 true
           if ((word & 0xff) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:27:2: note: Taking true branch
           if ((word & 0xff) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:31:6: note: Assuming the condition is=
 true
           if ((word & 0xf) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:31:2: note: Taking true branch
           if ((word & 0xf) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:35:6: note: Assuming the condition is=
 true
           if ((word & 0x3) =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:35:2: note: Taking true branch
           if ((word & 0x3) =3D=3D 0) {
           ^
   include/asm-generic/bitops/__ffs.h:39:6: note: Assuming the condition is=
 true
           if ((word & 0x1) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/__ffs.h:39:2: note: Taking true branch
           if ((word & 0x1) =3D=3D 0)
           ^
   include/asm-generic/bitops/__ffs.h:40:3: note: The value 63 is assigned =
to 'num'
                   num +=3D 1;
                   ^~~~~~~~
   include/asm-generic/bitops/__ffs.h:41:2: note: Returning the value 63 (l=
oaded from 'num')
           return num;
           ^~~~~~~~~~
   drivers/mfd/stmpe.c:1124:14: note: Returning from '__ffs'
                           int bit =3D __ffs(status);
                                     ^~~~~~~~~~~~~
   drivers/mfd/stmpe.c:1124:4: note: 'bit' initialized to 63
                           int bit =3D __ffs(status);
                           ^~~~~~~
   drivers/mfd/stmpe.c:1129:18: note: The result of the left shift is undef=
ined due to shifting by '63', which is greater or equal to the width of typ=
e 'int'
                           status &=3D ~(1 << bit);
                                         ^  ~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/drm/lsdc/lsdc_crtc.c:123:33: warning: The left operand of '&=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           priv_crtc_state->pix_fmt =3D val & CFG_PIX_FMT_MASK;
                                      ~~~ ^
   drivers/gpu/drm/lsdc/lsdc_crtc.c:97:2: note: 'val' declared without an i=
nitial value
           u32 val;
           ^~~~~~~
   drivers/gpu/drm/lsdc/lsdc_crtc.c:104:6: note: Assuming 'index' is not eq=
ual to 0
           if (index =3D=3D 0) {
               ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_crtc.c:104:2: note: Taking false branch
           if (index =3D=3D 0) {
           ^
   drivers/gpu/drm/lsdc/lsdc_crtc.c:107:13: note: Assuming 'index' is not e=
qual to 1
           } else if (index =3D=3D 1) {
                      ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_crtc.c:107:9: note: Taking false branch
           } else if (index =3D=3D 1) {
                  ^
   drivers/gpu/drm/lsdc/lsdc_crtc.c:113:6: note: Assuming field 'state' is =
null
           if (crtc->state) {
               ^~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_crtc.c:113:2: note: Taking false branch
           if (crtc->state) {
           ^
   drivers/gpu/drm/lsdc/lsdc_crtc.c:119:20: note: Calling 'kzalloc'
           priv_crtc_state =3D kzalloc(sizeof(*priv_crtc_state), GFP_KERNEL=
);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:569:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:586:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_crtc.c:119:20: note: Returning from 'kzalloc'
           priv_crtc_state =3D kzalloc(sizeof(*priv_crtc_state), GFP_KERNEL=
);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_crtc.c:120:6: note: Assuming 'priv_crtc_state'=
 is non-null
           if (!priv_crtc_state)
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_crtc.c:120:2: note: Taking false branch
           if (!priv_crtc_state)
           ^
   drivers/gpu/drm/lsdc/lsdc_crtc.c:123:33: note: The left operand of '&' i=
s a garbage value
           priv_crtc_state->pix_fmt =3D val & CFG_PIX_FMT_MASK;
                                      ~~~ ^
>> drivers/gpu/drm/lsdc/lsdc_crtc.c:146:21: warning: Value stored to 'ddev'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct drm_device *ddev =3D crtc->dev;
                              ^~~~   ~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_crtc.c:146:21: note: Value stored to 'ddev' du=
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
   22 warnings generated.
   drivers/gpu/drm/lsdc/lsdc_plane.c:163:13: warning: The left operand of '=
&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return val & CFG_PIX_FMT_MASK;
                      ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:277:6: note: Assuming 'crtc' is non-nu=
ll
           if (!crtc)
               ^~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:277:2: note: Taking false branch
           if (!crtc)
           ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:281:14: note: Assuming 'new_crtc_state=
' is non-null
           if (WARN_ON(!new_crtc_state))
                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:281:2: note: Taking false branch
           if (WARN_ON(!new_crtc_state))
           ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:292:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:292:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:299:8: note: 'new_fb' is non-null
           if ((!new_fb || !old_fb ||
                 ^~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:299:7: note: Left side of '||' is false
           if ((!new_fb || !old_fb ||
                ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:299:18: note: Assuming 'old_fb' is null
           if ((!new_fb || !old_fb ||
                           ^~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:299:26: note: Left side of '||' is true
           if ((!new_fb || !old_fb ||
                                   ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:308:29: note: Calling 'lsdc_primary_ge=
t_default_format'
           priv_crtc_state->pix_fmt =3D lsdc_primary_get_default_format(crt=
c);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:156:2: note: 'val' declared without an=
 initial value
           u32 val;
           ^~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:158:6: note: Assuming 'index' is not e=
qual to 0
           if (index =3D=3D 0)
               ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:158:2: note: Taking false branch
           if (index =3D=3D 0)
           ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:160:11: note: Assuming 'index' is not =
equal to 1
           else if (index =3D=3D 1)
                    ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:160:7: note: Taking false branch
           else if (index =3D=3D 1)
                ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:163:13: note: The left operand of '&' =
is a garbage value
           return val & CFG_PIX_FMT_MASK;
                  ~~~ ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:209:2: warning: 2nd function call argu=
ment is an uninitialized value [clang-analyzer-core.CallAndMessage]
           lsdc_reg_write32(ldev, addr_reg, paddr);
           ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:365:6: note: Assuming field 'use_vram_=
helper' is false
           if (ldev->use_vram_helper) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:365:2: note: Taking false branch
           if (ldev->use_vram_helper) {
           ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:378:7: note: Assuming field 'dirty_upd=
ate' is true
                   if (ldev->dirty_update)
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:378:3: note: Taking true branch
                   if (ldev->dirty_update)
                   ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:384:2: note: Calling 'lsdc_update_fb_s=
tart_addr'
           lsdc_update_fb_start_addr(ldev, crtc, fb_addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:172:2: note: 'addr_reg' declared witho=
ut an initial value
           u32 addr_reg;
           ^~~~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:181:6: note: Assuming 'index' is not e=
qual to 0
           if (index =3D=3D 0) {
               ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:181:2: note: Taking false branch
           if (index =3D=3D 0) {
           ^
   drivers/gpu/drm/lsdc/lsdc_plane.c:194:13: note: Assuming 'index' is not =
equal to 1
           } else if (index =3D=3D 1) {
                      ^~~~~~~~~~
   drivers/gpu/drm/lsdc/lsdc_plane.c:194:9: note: Taking false branch
           } else if (index =3D=3D 1) {

vim +/ddev +146 drivers/gpu/drm/lsdc/lsdc_crtc.c

983916ec4a8df3 suijingfeng 2022-02-03   89  =

983916ec4a8df3 suijingfeng 2022-02-03   90  =

983916ec4a8df3 suijingfeng 2022-02-03   91  static void lsdc_crtc_reset(str=
uct drm_crtc *crtc)
983916ec4a8df3 suijingfeng 2022-02-03   92  {
983916ec4a8df3 suijingfeng 2022-02-03   93  	struct drm_device *ddev =3D cr=
tc->dev;
983916ec4a8df3 suijingfeng 2022-02-03   94  	struct lsdc_device *ldev =3D t=
o_lsdc(ddev);
983916ec4a8df3 suijingfeng 2022-02-03   95  	unsigned int index =3D drm_crt=
c_index(crtc);
983916ec4a8df3 suijingfeng 2022-02-03   96  	struct lsdc_crtc_state *priv_c=
rtc_state;
983916ec4a8df3 suijingfeng 2022-02-03   97  	u32 val;
983916ec4a8df3 suijingfeng 2022-02-03   98  =

983916ec4a8df3 suijingfeng 2022-02-03   99  	/* The crtc get soft reset if =
bit 20 of CRTC*_CFG_REG
983916ec4a8df3 suijingfeng 2022-02-03  100  	 * is write with falling edge.
983916ec4a8df3 suijingfeng 2022-02-03  101  	 *
983916ec4a8df3 suijingfeng 2022-02-03  102  	 * Doing this to switch from s=
oft reset state to working state
983916ec4a8df3 suijingfeng 2022-02-03  103  	 */
983916ec4a8df3 suijingfeng 2022-02-03  104  	if (index =3D=3D 0) {
983916ec4a8df3 suijingfeng 2022-02-03  105  		val =3D CFG_RESET_BIT | CFG_O=
UTPUT_EN_BIT | LSDC_PF_XRGB8888;
983916ec4a8df3 suijingfeng 2022-02-03  106  		lsdc_reg_write32(ldev, LSDC_C=
RTC0_CFG_REG, val);
983916ec4a8df3 suijingfeng 2022-02-03  107  	} else if (index =3D=3D 1) {
983916ec4a8df3 suijingfeng 2022-02-03  108  		val =3D CFG_RESET_BIT | CFG_O=
UTPUT_EN_BIT | LSDC_PF_XRGB8888;
983916ec4a8df3 suijingfeng 2022-02-03  109  		lsdc_reg_write32(ldev, LSDC_C=
RTC1_CFG_REG, val);
983916ec4a8df3 suijingfeng 2022-02-03  110  	}
983916ec4a8df3 suijingfeng 2022-02-03  111  =

983916ec4a8df3 suijingfeng 2022-02-03  112  =

983916ec4a8df3 suijingfeng 2022-02-03  113  	if (crtc->state) {
983916ec4a8df3 suijingfeng 2022-02-03  114  		priv_crtc_state =3D to_lsdc_c=
rtc_state(crtc->state);
983916ec4a8df3 suijingfeng 2022-02-03  115  		__drm_atomic_helper_crtc_dest=
roy_state(&priv_crtc_state->base);
983916ec4a8df3 suijingfeng 2022-02-03  116  		kfree(priv_crtc_state);
983916ec4a8df3 suijingfeng 2022-02-03  117  	}
983916ec4a8df3 suijingfeng 2022-02-03  118  =

983916ec4a8df3 suijingfeng 2022-02-03  119  	priv_crtc_state =3D kzalloc(si=
zeof(*priv_crtc_state), GFP_KERNEL);
983916ec4a8df3 suijingfeng 2022-02-03 @120  	if (!priv_crtc_state)
983916ec4a8df3 suijingfeng 2022-02-03  121  		return;
983916ec4a8df3 suijingfeng 2022-02-03  122  =

983916ec4a8df3 suijingfeng 2022-02-03  123  	priv_crtc_state->pix_fmt =3D v=
al & CFG_PIX_FMT_MASK;
983916ec4a8df3 suijingfeng 2022-02-03  124  =

983916ec4a8df3 suijingfeng 2022-02-03  125  	__drm_atomic_helper_crtc_reset=
(crtc, &priv_crtc_state->base);
983916ec4a8df3 suijingfeng 2022-02-03  126  =

983916ec4a8df3 suijingfeng 2022-02-03  127  	drm_info(ddev, "crtc%u reset\n=
", index);
983916ec4a8df3 suijingfeng 2022-02-03  128  }
983916ec4a8df3 suijingfeng 2022-02-03  129  =

983916ec4a8df3 suijingfeng 2022-02-03  130  =

983916ec4a8df3 suijingfeng 2022-02-03  131  static void lsdc_crtc_atomic_de=
stroy_state(struct drm_crtc *crtc,
983916ec4a8df3 suijingfeng 2022-02-03  132  				    struct drm_crtc_state *=
state)
983916ec4a8df3 suijingfeng 2022-02-03  133  {
983916ec4a8df3 suijingfeng 2022-02-03  134  	struct lsdc_crtc_state *priv_c=
rtc_state =3D to_lsdc_crtc_state(state);
983916ec4a8df3 suijingfeng 2022-02-03  135  =

983916ec4a8df3 suijingfeng 2022-02-03  136  	__drm_atomic_helper_crtc_destr=
oy_state(&priv_crtc_state->base);
983916ec4a8df3 suijingfeng 2022-02-03  137  =

983916ec4a8df3 suijingfeng 2022-02-03  138  	kfree(priv_crtc_state);
983916ec4a8df3 suijingfeng 2022-02-03  139  }
983916ec4a8df3 suijingfeng 2022-02-03  140  =

983916ec4a8df3 suijingfeng 2022-02-03  141  =

983916ec4a8df3 suijingfeng 2022-02-03  142  static struct drm_crtc_state *l=
sdc_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
983916ec4a8df3 suijingfeng 2022-02-03  143  {
983916ec4a8df3 suijingfeng 2022-02-03  144  	struct lsdc_crtc_state *new_pr=
iv_state;
983916ec4a8df3 suijingfeng 2022-02-03  145  	struct lsdc_crtc_state *old_pr=
iv_state;
983916ec4a8df3 suijingfeng 2022-02-03 @146  	struct drm_device *ddev =3D cr=
tc->dev;
983916ec4a8df3 suijingfeng 2022-02-03  147  =

983916ec4a8df3 suijingfeng 2022-02-03  148  	if (drm_WARN_ON(ddev, !crtc->s=
tate))
983916ec4a8df3 suijingfeng 2022-02-03  149  		return NULL;
983916ec4a8df3 suijingfeng 2022-02-03  150  =

983916ec4a8df3 suijingfeng 2022-02-03  151  	new_priv_state =3D kmalloc(siz=
eof(*new_priv_state), GFP_KERNEL);
983916ec4a8df3 suijingfeng 2022-02-03  152  	if (!new_priv_state)
983916ec4a8df3 suijingfeng 2022-02-03  153  		return NULL;
983916ec4a8df3 suijingfeng 2022-02-03  154  =

983916ec4a8df3 suijingfeng 2022-02-03  155  	__drm_atomic_helper_crtc_dupli=
cate_state(crtc, &new_priv_state->base);
983916ec4a8df3 suijingfeng 2022-02-03  156  =

983916ec4a8df3 suijingfeng 2022-02-03  157  	old_priv_state =3D to_lsdc_crt=
c_state(crtc->state);
983916ec4a8df3 suijingfeng 2022-02-03  158  =

983916ec4a8df3 suijingfeng 2022-02-03  159  	memcpy(&new_priv_state->pparam=
s, &old_priv_state->pparams,
983916ec4a8df3 suijingfeng 2022-02-03  160  		sizeof(new_priv_state->pparam=
s));
983916ec4a8df3 suijingfeng 2022-02-03  161  =

983916ec4a8df3 suijingfeng 2022-02-03  162  	new_priv_state->pix_fmt =3D ol=
d_priv_state->pix_fmt;
983916ec4a8df3 suijingfeng 2022-02-03  163  =

983916ec4a8df3 suijingfeng 2022-02-03  164  	return &new_priv_state->base;
983916ec4a8df3 suijingfeng 2022-02-03  165  }
983916ec4a8df3 suijingfeng 2022-02-03  166  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6257827253962748964==--

