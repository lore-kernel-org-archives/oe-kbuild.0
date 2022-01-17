Content-Type: multipart/mixed; boundary="===============5398238172500431464=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/yocto 12296/20368] drivers/gpu/drm/bridge/ite-it66121.c:538:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 17 Jan 2022 12:41:56 +0800
Message-ID: <202201171222.RXEhqXaB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5398238172500431464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Junxiao Chang <junxiao.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   1941d4b82f36cc6ecc513f3e496ad62726d00514
commit: 6c9a19d3d5af510ad24a4bc5a0e8567938729ce5 [12296/20368] drm: bridge:=
 add it66121 driver
:::::: branch date: 6 days ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20220116 (https://download.01.org/0day-ci/arc=
hive/20220117/202201171222.RXEhqXaB-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c63a31=
75c2947e8c1a2d3bbe16a8586600705c54)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel/linux-intel-lts/commit/6c9a19d3d5af510ad=
24a4bc5a0e8567938729ce5
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 6c9a19d3d5af510ad24a4bc5a0e8567938729ce5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-zydacron.c:53:2: note: Taking false branch
           if ((usage->hid & HID_USAGE_PAGE) !=3D HID_UP_CONSUMER)
           ^
   drivers/hid/hid-zydacron.c:56:2: note: Assuming 'hid_debug' is 0
           dbg_hid("zynacron input mapping event [0x%x]\n",
           ^
   include/linux/hid.h:1178:6: note: expanded from macro 'dbg_hid'
           if (hid_debug)                                                  \
               ^~~~~~~~~
   drivers/hid/hid-zydacron.c:56:2: note: Taking false branch
           dbg_hid("zynacron input mapping event [0x%x]\n",
           ^
   include/linux/hid.h:1178:2: note: expanded from macro 'dbg_hid'
           if (hid_debug)                                                  \
           ^
   drivers/hid/hid-zydacron.c:56:2: note: Loop condition is false.  Exiting=
 loop
           dbg_hid("zynacron input mapping event [0x%x]\n",
           ^
   include/linux/hid.h:1176:32: note: expanded from macro 'dbg_hid'
   #define dbg_hid(fmt, ...)                                               \
                                                                           ^
   drivers/hid/hid-zydacron.c:59:2: note: Control jumps to 'case 50:'  at l=
ine 96
           switch (usage->hid & HID_USAGE) {
           ^
   drivers/hid/hid-zydacron.c:97:3: note: Calling 'hid_map_usage_clear'
                   zc_map_key_clear(KEY_TEXT);
                   ^
   drivers/hid/hid-zydacron.c:43:2: note: expanded from macro 'zc_map_key_c=
lear'
           hid_map_usage_clear(hi, usage, bit, max, EV_KEY, (c))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1021:2: note: Calling 'hid_map_usage'
           hid_map_usage(hidinput, usage, bit, max, type, c);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:975:2: note: 'input' initialized here
           struct input_dev *input =3D hidinput->input;
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:979:2: note: Control jumps to 'case 1:'  at line 988
           switch (type) {
           ^
   include/linux/hid.h:991:3: note:  Execution continues on line 998
                   break;
                   ^
   include/linux/hid.h:998:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:998:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:998:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:998:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:998:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:999:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:511:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:999:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:511:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1000:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:528:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:512:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/gpu/drm/bridge/ite-it66121.c:538:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D drm_bridge_attach(bridge->encoder, ctx->next_bridge, bri=
dge, flags);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/gpu/drm/bridge/ite-it66121.c:538:2: note: Value stored to 'ret' =
is never read
           ret =3D drm_bridge_attach(bridge->encoder, ctx->next_bridge, bri=
dge, flags);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:387:2: warning: Value=
 stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err =3D anx6345_clear_bits(anx6345->map[I2C_IDX_TXCOM],
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:387:2: note: Value st=
ored to 'err' is never read
           err =3D anx6345_clear_bits(anx6345->map[I2C_IDX_TXCOM],
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpu/drm/bridge/analogix/anx7625.c:755:4: warning: Value stored t=
o 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D sp_tx_rst_aux(ctx);
                           ^     ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/analogix/anx7625.c:755:4: note: Value stored to '=
ret' is never read
                           ret =3D sp_tx_rst_aux(ctx);
                           ^     ~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   7 warnings generated.
   drivers/gpu/drm/drm_modes.c:1768:4: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(mode->name, drm_named_modes_whitelist[i]);
                           ^~~~~~
   drivers/gpu/drm/drm_modes.c:1768:4: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
                           strcpy(mode->name, drm_named_modes_whitelist[i]);
                           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/ret +538 drivers/gpu/drm/bridge/ite-it66121.c

6c9a19d3d5af51 Phong LE 2021-04-19  528  =

6c9a19d3d5af51 Phong LE 2021-04-19  529  static int it66121_bridge_attach(s=
truct drm_bridge *bridge,
6c9a19d3d5af51 Phong LE 2021-04-19  530  				 enum drm_bridge_attach_flags =
flags)
6c9a19d3d5af51 Phong LE 2021-04-19  531  {
6c9a19d3d5af51 Phong LE 2021-04-19  532  	struct it66121_ctx *ctx =3D conta=
iner_of(bridge, struct it66121_ctx, bridge);
6c9a19d3d5af51 Phong LE 2021-04-19  533  	int ret;
6c9a19d3d5af51 Phong LE 2021-04-19  534  =

6c9a19d3d5af51 Phong LE 2021-04-19  535  	if (!(flags & DRM_BRIDGE_ATTACH_N=
O_CONNECTOR))
6c9a19d3d5af51 Phong LE 2021-04-19  536  		return -EINVAL;
6c9a19d3d5af51 Phong LE 2021-04-19  537  =

6c9a19d3d5af51 Phong LE 2021-04-19 @538  	ret =3D drm_bridge_attach(bridge-=
>encoder, ctx->next_bridge, bridge, flags);
6c9a19d3d5af51 Phong LE 2021-04-19  539  =

6c9a19d3d5af51 Phong LE 2021-04-19  540  	ret =3D regmap_write_bits(ctx->re=
gmap, IT66121_CLK_BANK_REG,
6c9a19d3d5af51 Phong LE 2021-04-19  541  				IT66121_CLK_BANK_PWROFF_RCLK, =
0);
6c9a19d3d5af51 Phong LE 2021-04-19  542  	if (ret)
6c9a19d3d5af51 Phong LE 2021-04-19  543  		return ret;
6c9a19d3d5af51 Phong LE 2021-04-19  544  =

6c9a19d3d5af51 Phong LE 2021-04-19  545  	ret =3D regmap_write_bits(ctx->re=
gmap, IT66121_INT_REG,
6c9a19d3d5af51 Phong LE 2021-04-19  546  				IT66121_INT_TX_CLK_OFF, 0);
6c9a19d3d5af51 Phong LE 2021-04-19  547  	if (ret)
6c9a19d3d5af51 Phong LE 2021-04-19  548  		return ret;
6c9a19d3d5af51 Phong LE 2021-04-19  549  =

6c9a19d3d5af51 Phong LE 2021-04-19  550  	ret =3D regmap_write_bits(ctx->re=
gmap, IT66121_AFE_DRV_REG,
6c9a19d3d5af51 Phong LE 2021-04-19  551  				IT66121_AFE_DRV_PWD, 0);
6c9a19d3d5af51 Phong LE 2021-04-19  552  	if (ret)
6c9a19d3d5af51 Phong LE 2021-04-19  553  		return ret;
6c9a19d3d5af51 Phong LE 2021-04-19  554  =

6c9a19d3d5af51 Phong LE 2021-04-19  555  	ret =3D regmap_write_bits(ctx->re=
gmap, IT66121_AFE_XP_REG,
6c9a19d3d5af51 Phong LE 2021-04-19  556  				IT66121_AFE_XP_PWDI | IT66121_=
AFE_XP_PWDPLL, 0);
6c9a19d3d5af51 Phong LE 2021-04-19  557  	if (ret)
6c9a19d3d5af51 Phong LE 2021-04-19  558  		return ret;
6c9a19d3d5af51 Phong LE 2021-04-19  559  =

6c9a19d3d5af51 Phong LE 2021-04-19  560  	ret =3D regmap_write_bits(ctx->re=
gmap, IT66121_AFE_IP_REG,
6c9a19d3d5af51 Phong LE 2021-04-19  561  				IT66121_AFE_IP_PWDPLL, 0);
6c9a19d3d5af51 Phong LE 2021-04-19  562  	if (ret)
6c9a19d3d5af51 Phong LE 2021-04-19  563  		return ret;
6c9a19d3d5af51 Phong LE 2021-04-19  564  =

6c9a19d3d5af51 Phong LE 2021-04-19  565  	ret =3D regmap_write_bits(ctx->re=
gmap, IT66121_AFE_DRV_REG,
6c9a19d3d5af51 Phong LE 2021-04-19  566  				IT66121_AFE_DRV_RST, 0);
6c9a19d3d5af51 Phong LE 2021-04-19  567  	if (ret)
6c9a19d3d5af51 Phong LE 2021-04-19  568  		return ret;
6c9a19d3d5af51 Phong LE 2021-04-19  569  =

6c9a19d3d5af51 Phong LE 2021-04-19  570  	ret =3D regmap_write_bits(ctx->re=
gmap, IT66121_AFE_XP_REG,
6c9a19d3d5af51 Phong LE 2021-04-19  571  				IT66121_AFE_XP_RESETB, IT66121=
_AFE_XP_RESETB);
6c9a19d3d5af51 Phong LE 2021-04-19  572  	if (ret)
6c9a19d3d5af51 Phong LE 2021-04-19  573  		return ret;
6c9a19d3d5af51 Phong LE 2021-04-19  574  =

6c9a19d3d5af51 Phong LE 2021-04-19  575  	ret =3D regmap_write_bits(ctx->re=
gmap, IT66121_AFE_IP_REG,
6c9a19d3d5af51 Phong LE 2021-04-19  576  				IT66121_AFE_IP_RESETB, IT66121=
_AFE_IP_RESETB);
6c9a19d3d5af51 Phong LE 2021-04-19  577  	if (ret)
6c9a19d3d5af51 Phong LE 2021-04-19  578  		return ret;
6c9a19d3d5af51 Phong LE 2021-04-19  579  =

6c9a19d3d5af51 Phong LE 2021-04-19  580  	ret =3D regmap_write_bits(ctx->re=
gmap, IT66121_SW_RST_REG,
6c9a19d3d5af51 Phong LE 2021-04-19  581  				IT66121_SW_RST_REF,
6c9a19d3d5af51 Phong LE 2021-04-19  582  				IT66121_SW_RST_REF);
6c9a19d3d5af51 Phong LE 2021-04-19  583  	if (ret)
6c9a19d3d5af51 Phong LE 2021-04-19  584  		return ret;
6c9a19d3d5af51 Phong LE 2021-04-19  585  =

6c9a19d3d5af51 Phong LE 2021-04-19  586  	/* Per programming manual, sleep =
here for bridge to settle */
6c9a19d3d5af51 Phong LE 2021-04-19  587  	msleep(50);
6c9a19d3d5af51 Phong LE 2021-04-19  588  =

6c9a19d3d5af51 Phong LE 2021-04-19  589  	/* Start interrupts */
6c9a19d3d5af51 Phong LE 2021-04-19  590  	return regmap_write_bits(ctx->reg=
map, IT66121_INT_MASK1_REG,
6c9a19d3d5af51 Phong LE 2021-04-19  591  				 IT66121_INT_MASK1_DDC_NOACK |
6c9a19d3d5af51 Phong LE 2021-04-19  592  				 IT66121_INT_MASK1_DDC_FIFOERR=
 |
6c9a19d3d5af51 Phong LE 2021-04-19  593  				 IT66121_INT_MASK1_DDC_BUSHANG=
, 0);
6c9a19d3d5af51 Phong LE 2021-04-19  594  }
6c9a19d3d5af51 Phong LE 2021-04-19  595  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5398238172500431464==--

