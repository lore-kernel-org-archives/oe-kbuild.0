Content-Type: multipart/mixed; boundary="===============9103792423887595763=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/yocto 12296/20393] drivers/gpu/drm/bridge/ite-it66121.c:538:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 12 Feb 2022 02:30:13 +0800
Message-ID: <202202120225.mmXWJxVv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9103792423887595763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Junxiao Chang <junxiao.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   2dafc777a64181d42982628c7f5907a03da5f070
commit: 6c9a19d3d5af510ad24a4bc5a0e8567938729ce5 [12296/20393] drm: bridge:=
 add it66121 driver
:::::: branch date: 3 days ago
:::::: commit date: 7 months ago
config: riscv-randconfig-c006-20220209 (https://download.01.org/0day-ci/arc=
hive/20220212/202202120225.mmXWJxVv-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa845d=
7a245d85c441d0bd44fc7b6c3be8f3de8d)
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
   drivers/md/bcache/super.c:2151:7: note: Loop condition is false.  Exitin=
g loop
                   l =3D list_first_entry(&journal, struct journal_replay, =
list);
                       ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/md/bcache/super.c:2152:3: note: Calling 'list_del'
                   list_del(&l->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '64', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/md/bcache/super.c:2267:18: note: '?' condition is false
           btree_buckets =3D ca->sb.njournal_buckets ?: 8;
                           ^
   drivers/md/bcache/super.c:2268:9: note: '?' condition is false
           free =3D roundup_pow_of_two(ca->sb.nbuckets) >> 10;
                  ^
   include/linux/log2.h:175:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/md/bcache/super.c:2268:9: note: Calling '__roundup_pow_of_two'
           free =3D roundup_pow_of_two(ca->sb.nbuckets) >> 10;
                  ^
   include/linux/log2.h:179:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:184:2: note: Taking false branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:186:9: note: Calling 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/asm-generic/bitops/fls64.h:29:6: note: Assuming 'x' is not equal=
 to 0
           if (x =3D=3D 0)
               ^~~~~~
   include/asm-generic/bitops/fls64.h:29:2: note: Taking false branch
           if (x =3D=3D 0)
           ^
   include/asm-generic/bitops/fls64.h:31:2: note: Returning the value 64
           return __fls(x) + 1;
           ^~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:186:9: note: Returning from 'fls64'
           return fls64(l);
                  ^~~~~~~~
   include/linux/bitops.h:186:2: note: Returning the value 64
           return fls64(l);
           ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '64', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
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
   11 warnings generated.
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
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
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/drm/bridge/analogix/anx7625.c:755:4: warning: Value stored t=
o 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D sp_tx_rst_aux(ctx);
                           ^     ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/analogix/anx7625.c:755:4: note: Value stored to '=
ret' is never read
                           ret =3D sp_tx_rst_aux(ctx);
                           ^     ~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:426:2: warning: 4th =
function call argument is an uninitialized value [clang-analyzer-core.CallA=
ndMessage]
           dev_err(mhdp->dev, "HDCP authentication failed (%d tries/%d)\n",
           ^
   include/linux/dev_printk.h:112:2: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:535:8: note: Calling=
 '_cdns_mhdp_hdcp_enable'
           ret =3D _cdns_mhdp_hdcp_enable(mhdp, content_type);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:406:6: note: 'ret' d=
eclared without an initial value
           int ret, tries =3D 3;
               ^~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:409:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < tries; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: Assumin=
g 'content_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: Left si=
de of '||' is false
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:411:7: note: Assumin=
g 'content_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE1
                       content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:409:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < tries; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: Left si=
de of '||' is false
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:411:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE1
                       content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:409:2: note: Loop co=
ndition is true.  Entering loop body
           for (i =3D 0; i < tries; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:7: note: Left si=
de of '||' is false
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:411:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE1
                       content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE1) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:410:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0 ||
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:7: note: 'conten=
t_type' is not equal to DRM_MODE_HDCP_CONTENT_TYPE0
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                       ^~~~~~~~~~~~
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:418:3: note: Taking =
false branch
                   if (content_type =3D=3D DRM_MODE_HDCP_CONTENT_TYPE0) {
                   ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:409:2: note: Loop co=
ndition is false. Execution continues on line 426
           for (i =3D 0; i < tries; i++) {
           ^
   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c:426:2: note: 4th fun=
ction call argument is an uninitialized value
           dev_err(mhdp->dev, "HDCP authentication failed (%d tries/%d)\n",
           ^
   include/linux/dev_printk.h:112:2: note: expanded from macro 'dev_err'
           _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^                             ~~~~~~~~~~~
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
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
--===============9103792423887595763==--

