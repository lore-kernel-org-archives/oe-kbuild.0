Content-Type: multipart/mixed; boundary="===============7267311937857271527=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chenxing:msc313_mainlining 40/79] drivers/pinctrl/mstar/pinctrl-msc313-pm.c:35:27: warning: unused variable 'pm_uart_groups'
Date: Sun, 26 Dec 2021 07:46:40 +0800
Message-ID: <202112260724.JNo6H2IW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7267311937857271527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Palmer <daniel@0x0f.com>

tree:   git://github.com/linux-chenxing/linux.git msc313_mainlining
head:   17a0ed91a3dc1dc1074446b16909ead13a6593a4
commit: 5119e24f7f04d53e9b2b0915e0129801befeb37c [40/79] pinctrl: mstar: ms=
c313 pinctrl driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20211225 (https://download.01.org/0day-ci/archi=
ve/20211226/202112260724.JNo6H2IW-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1=
ee7fd44b53c555a7823ae8fd1a8209c520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/linux-chenxing/linux/commit/5119e24f7f04d53e9b=
2b0915e0129801befeb37c
        git remote add chenxing git://github.com/linux-chenxing/linux.git
        git fetch --no-tags chenxing msc313_mainlining
        git checkout 5119e24f7f04d53e9b2b0915e0129801befeb37c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/mstar/pinctrl-msc313-pm.c:35:27: warning: unused variabl=
e 'pm_uart_groups' [-Wunused-const-variable]
   static const char * const pm_uart_groups[] =3D {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313-pm.c:39:27: warning: unused variabl=
e 'pm_spi_groups' [-Wunused-const-variable]
   static const char * const pm_spi_groups[] =3D {
                             ^
>> drivers/pinctrl/mstar/pinctrl-msc313-pm.c:43:27: warning: unused variabl=
e 'pm_irin_groups' [-Wunused-const-variable]
   static const char * const pm_irin_groups[] =3D {
                             ^
   3 warnings generated.


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c:68:3: note: Cal=
l to function 'strcpy' is insecure as it does not provide bounding of the m=
emory buffer. Replace unbounded copy functions with analogous functions tha=
t support length arguments such as 'strlcpy'. CWE-119
                   strcpy(dst, prefix);
                   ^~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c:71:3: warning: =
Call to function 'strcpy' is insecure as it does not provide bounding of th=
e memory buffer. Replace unbounded copy functions with analogous functions =
that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-se=
curity.insecureAPI.strcpy]
                   strcpy(dst, src);
                   ^~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c:71:3: note: Cal=
l to function 'strcpy' is insecure as it does not provide bounding of the m=
emory buffer. Replace unbounded copy functions with analogous functions tha=
t support length arguments such as 'strlcpy'. CWE-119
                   strcpy(dst, src);
                   ^~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:670:49: warning: The result=
 of the left shift is undefined because the left operand is negative [clang=
-analyzer-core.UndefinedBinaryOperatorResult]
           dispc_write_reg(DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->gcb, ct-=
>gcr));
                                                          ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:666:21: note: expanded from=
 macro 'CVAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.h:60:42: note: expanded from ma=
cro 'FLD_VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                            ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:4049:6: note: Assuming the =
condition is true
           if (REG_GET(DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_ONLY) {
               ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:49:2: note: expanded from m=
acro 'REG_GET'
           FLD_GET(dispc_read_reg(idx), start, end)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.h:61:34: note: expanded from ma=
cro 'FLD_GET'
   #define FLD_GET(val, start, end) (((val) & FLD_MASK(start, end)) >> (end=
))
                                    ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:4049:2: note: Taking true b=
ranch
           if (REG_GET(DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_ONLY) {
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:4050:3: note: Calling '_oma=
p_dispc_initial_config'
                   _omap_dispc_initial_config();
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3721:6: note: Assuming the =
condition is false
           if (dss_has_feature(FEAT_CORE_CLK_DIV)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3721:2: note: Taking false =
branch
           if (dss_has_feature(FEAT_CORE_CLK_DIV)) {
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3732:6: note: Assuming the =
condition is false
           if (dss_has_feature(FEAT_FUNCGATED))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3732:2: note: Taking false =
branch
           if (dss_has_feature(FEAT_FUNCGATED))
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3735:2: note: Calling 'disp=
c_setup_color_conv_coef'
           dispc_setup_color_conv_coef();
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:692:14: note: Assuming 'i' =
is >=3D 'num_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:692:2: note: Loop condition=
 is false. Execution continues on line 695
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:695:6: note: Assuming field=
 'has_writeback' is true
           if (dispc.feat->has_writeback)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:695:2: note: Taking true br=
anch
           if (dispc.feat->has_writeback)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:696:3: note: Calling 'dispc=
_ovl_write_color_conv_coef'
                   dispc_ovl_write_color_conv_coef(OMAP_DSS_WB, &ctbl_bt601=
_5_wb);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:670:49: note: The result of=
 the left shift is undefined because the left operand is negative
           dispc_write_reg(DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->gcb, ct-=
>gcr));
                                                          ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:666:21: note: expanded from=
 macro 'CVAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dss.h:60:42: note: expanded from ma=
cro 'FLD_VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                      ~~~~~ ^
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> drivers/pinctrl/mstar/pinctrl-mstar.c:88:2: warning: Undefined or garbag=
e value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:80:9: note: 'ret' declared without=
 an initial value
           int i, ret;
                  ^~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:82:14: note: Assuming 'i' is >=3D =
field 'ngroups'
           for (i =3D 0; i < pinctrl->info->ngroups; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:82:2: note: Loop condition is fals=
e. Execution continues on line 88
           for (i =3D 0; i < pinctrl->info->ngroups; i++) {
           ^
   drivers/pinctrl/mstar/pinctrl-mstar.c:88:2: note: Undefined or garbage v=
alue returned to caller
           return ret;
           ^      ~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:112:2: warning: Undefined or garba=
ge value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:93:9: note: 'ret' declared without=
 an initial value
           int i, ret;
                  ^~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:95:14: note: Assuming 'i' is >=3D =
field 'nfunctions'
           for (i =3D 0; i < pinctrl->info->nfunctions; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:95:2: note: Loop condition is fals=
e. Execution continues on line 112
           for (i =3D 0; i < pinctrl->info->nfunctions; i++) {
           ^
   drivers/pinctrl/mstar/pinctrl-mstar.c:112:2: note: Undefined or garbage =
value returned to caller
           return ret;
           ^      ~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/pinctrl/mstar/pinctrl-msc313-pm.c:391:2: warning: Value stored t=
o 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D mstar_pinctrl_parse_functions(pinctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313-pm.c:391:2: note: Value stored to '=
ret' is never read
           ret =3D mstar_pinctrl_parse_functions(pinctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313-pm.c:392:2: warning: Value stored t=
o 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D mstar_pinctrl_parse_groups(pinctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313-pm.c:392:2: note: Value stored to '=
ret' is never read
           ret =3D mstar_pinctrl_parse_groups(pinctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 with check filters).
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   fs/afs/fsclient.c:685:3: warning: Value stored to 'bp' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   bp =3D (void *) bp + padsz;
                   ^    ~~~~~~~~~~~~~~~~~~~
   fs/afs/fsclient.c:685:3: note: Value stored to 'bp' is never read
                   bp =3D (void *) bp + padsz;
                   ^    ~~~~~~~~~~~~~~~~~~~
   fs/afs/fsclient.c:732:3: warning: Value stored to 'bp' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   bp =3D (void *) bp + padsz;
                   ^    ~~~~~~~~~~~~~~~~~~~
   fs/afs/fsclient.c:732:3: note: Value stored to 'bp' is never read
                   bp =3D (void *) bp + padsz;
                   ^    ~~~~~~~~~~~~~~~~~~~
   fs/afs/fsclient.c:1003:3: warning: Value stored to 'bp' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   bp =3D (void *) bp + n_padsz;
                   ^    ~~~~~~~~~~~~~~~~~~~~~
   fs/afs/fsclient.c:1003:3: note: Value stored to 'bp' is never read
                   bp =3D (void *) bp + n_padsz;
                   ^    ~~~~~~~~~~~~~~~~~~~~~
   fs/afs/fsclient.c:1674:36: warning: The left operand of '-' is a garbage=
 value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   afs_extract_discard(call, (count - 1) * sizeof(__be32));
                                              ~~~~~ ^
   fs/afs/fsclient.c:1638:2: note: 'count' declared without an initial value
           u32 count;
           ^~~~~~~~~
   fs/afs/fsclient.c:1641:2: note: Taking false branch
           _enter("{%u,%zu}", call->unmarshall, iov_iter_count(call->iter));
           ^
   fs/afs/internal.h:1677:25: note: expanded from macro '_enter'
   #define _enter(FMT,...) no_printk("=3D=3D> %s("FMT")",__func__ ,##__VA_A=
RGS__)
                           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/afs/fsclient.c:1643:2: note: Control jumps to 'case 2:'  at line 1669
           switch (call->unmarshall) {
           ^
   fs/afs/fsclient.c:1671:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   fs/afs/fsclient.c:1671:3: note: Taking false branch
                   if (ret < 0)
                   ^
   fs/afs/fsclient.c:1674:36: note: The left operand of '-' is a garbage va=
lue
                   afs_extract_discard(call, (count - 1) * sizeof(__be32));
                                              ~~~~~ ^
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/clk/clk-vt8500.c:301:2: warning: Value stored to 'rc' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           rc =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-vt8500.c:301:2: note: Value stored to 'rc' is never read
           rc =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-vt8500.c:715:2: warning: Value stored to 'rc' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           rc =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-vt8500.c:715:2: note: Value stored to 'rc' is never read
           rc =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/clk/baikal-t1/ccu-pll.c:258:45: warning: The left operand of '-'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           val =3D FIELD_PREP(CCU_PLL_CTL_CLKR_MASK, nr - 1) |
                                                      ^
   include/linux/bitfield.h:94:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:49:41: note: expanded from macro '__BF_FIELD_CH=
ECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
--
                           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   fs/afs/fsclient.c:1643:2: note: Control jumps to 'case 2:' @line 1669
           switch (call->unmarshall) {
           ^
   fs/afs/fsclient.c:1671:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   fs/afs/fsclient.c:1671:3: note: Taking false branch
                   if (ret < 0)
                   ^
   fs/afs/fsclient.c:1674:36: note: The left operand of '-' is a garbage va=
lue
                   afs_extract_discard(call, (count - 1) * sizeof(__be32));
                                              ~~~~~ ^
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/video/fbdev/omap2/omapfb/omapfb-main.c:1554:3: warning: Value st=
ored to 'rg' is never read [clang-analyzer-deadcode.DeadStores]
                   rg =3D ofbi->region;
                   ^    ~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/omapfb-main.c:1554:3: note: Value store=
d to 'rg' is never read
                   rg =3D ofbi->region;
                   ^    ~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c:514:6: warning: Value st=
ored to 'mode_idx' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           int mode_idx =3D mode->mode_idx;
               ^~~~~~~~   ~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c:514:6: note: Value store=
d to 'mode_idx' during its initialization is never read
           int mode_idx =3D mode->mode_idx;
               ^~~~~~~~   ~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> drivers/pinctrl/mstar/pinctrl-mstar.c:88:2: warning: Undefined or garbag=
e value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:80:9: note: 'ret' declared without=
 an initial value
           int i, ret;
                  ^~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:82:14: note: Assuming 'i' is >=3D =
field 'ngroups'
           for (i =3D 0; i < pinctrl->info->ngroups; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:82:2: note: Loop condition is fals=
e. Execution continues on line 88
           for (i =3D 0; i < pinctrl->info->ngroups; i++) {
           ^
   drivers/pinctrl/mstar/pinctrl-mstar.c:88:2: note: Undefined or garbage v=
alue returned to caller
           return ret;
           ^      ~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:112:2: warning: Undefined or garba=
ge value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:93:9: note: 'ret' declared without=
 an initial value
           int i, ret;
                  ^~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:95:14: note: Assuming 'i' is >=3D =
field 'nfunctions'
           for (i =3D 0; i < pinctrl->info->nfunctions; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-mstar.c:95:2: note: Loop condition is fals=
e. Execution continues on line 112
           for (i =3D 0; i < pinctrl->info->nfunctions; i++) {
           ^
   drivers/pinctrl/mstar/pinctrl-mstar.c:112:2: note: Undefined or garbage =
value returned to caller
           return ret;
           ^      ~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/pinctrl/mstar/pinctrl-msc313-pm.c:391:2: warning: Value stored t=
o 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D mstar_pinctrl_parse_functions(pinctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313-pm.c:391:2: note: Value stored to '=
ret' is never read
           ret =3D mstar_pinctrl_parse_functions(pinctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313-pm.c:392:2: warning: Value stored t=
o 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D mstar_pinctrl_parse_groups(pinctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313-pm.c:392:2: note: Value stored to '=
ret' is never read
           ret =3D mstar_pinctrl_parse_groups(pinctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 with check filters).
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c:68:3: warning: =
Call to function 'strcpy' is insecure as it does not provide bounding of th=
e memory buffer. Replace unbounded copy functions with analogous functions =
that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-se=
curity.insecureAPI.strcpy]
                   strcpy(dst, prefix);
                   ^~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c:68:3: note: Cal=
l to function 'strcpy' is insecure as it does not provide bounding of the m=
emory buffer. Replace unbounded copy functions with analogous functions tha=
t support length arguments such as 'strlcpy'. CWE-119
                   strcpy(dst, prefix);
                   ^~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c:71:3: warning: =
Call to function 'strcpy' is insecure as it does not provide bounding of th=
e memory buffer. Replace unbounded copy functions with analogous functions =
that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-se=
curity.insecureAPI.strcpy]
                   strcpy(dst, src);
                   ^~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c:71:3: note: Cal=
l to function 'strcpy' is insecure as it does not provide bounding of the m=
emory buffer. Replace unbounded copy functions with analogous functions tha=
t support length arguments such as 'strlcpy'. CWE-119
                   strcpy(dst, src);
                   ^~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:670:49: warning: The result=
 of the left shift is undefined because the left operand is negative [clang=
-analyzer-core.UndefinedBinaryOperatorResult]
           dispc_write_reg(DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->gcb, ct-=
>gcr));
                                                          ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:666:21: note: expanded from=
 macro 'CVAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.h:60:42: note: expanded from ma=
cro 'FLD_VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                            ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:4049:6: note: Assuming the =
condition is true
           if (REG_GET(DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_ONLY) {
               ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:49:2: note: expanded from m=
acro 'REG_GET'
           FLD_GET(dispc_read_reg(idx), start, end)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dss.h:61:34: note: expanded from ma=
cro 'FLD_GET'
   #define FLD_GET(val, start, end) (((val) & FLD_MASK(start, end)) >> (end=
))
                                    ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:4049:2: note: Taking true b=
ranch
           if (REG_GET(DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_ONLY) {
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:4050:3: note: Calling '_oma=
p_dispc_initial_config'
                   _omap_dispc_initial_config();
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3721:6: note: Assuming the =
condition is false
           if (dss_has_feature(FEAT_CORE_CLK_DIV)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3721:2: note: Taking false =
branch
           if (dss_has_feature(FEAT_CORE_CLK_DIV)) {
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3732:6: note: Assuming the =
condition is false
           if (dss_has_feature(FEAT_FUNCGATED))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3732:2: note: Taking false =
branch
           if (dss_has_feature(FEAT_FUNCGATED))
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:3735:2: note: Calling 'disp=
c_setup_color_conv_coef'
           dispc_setup_color_conv_coef();
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:692:14: note: Assuming 'i' =
is >=3D 'num_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:692:2: note: Loop condition=
 is false. Execution continues on line 695
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/video/fbdev/omap2/omapfb/dss/dispc.c:695:6: note: Assuming field=
 'has_writeback' is true
           if (dispc.feat->has_writeback)
               ^~~~~~~~~~~~~~~~~~~~~~~~~

vim +/pm_uart_groups +35 drivers/pinctrl/mstar/pinctrl-msc313-pm.c

7094a49a4ca2d8 Daniel Palmer 2021-01-10  34  =

7094a49a4ca2d8 Daniel Palmer 2021-01-10 @35  static const char * const pm_u=
art_groups[] =3D {
7094a49a4ca2d8 Daniel Palmer 2021-01-10  36  	GROUPNAME_PM_UART,
7094a49a4ca2d8 Daniel Palmer 2021-01-10  37  };
7094a49a4ca2d8 Daniel Palmer 2021-01-10  38  =

7094a49a4ca2d8 Daniel Palmer 2021-01-10 @39  static const char * const pm_s=
pi_groups[] =3D {
7094a49a4ca2d8 Daniel Palmer 2021-01-10  40  	GROUPNAME_PM_SPI,
7094a49a4ca2d8 Daniel Palmer 2021-01-10  41  };
7094a49a4ca2d8 Daniel Palmer 2021-01-10  42  =

7094a49a4ca2d8 Daniel Palmer 2021-01-10 @43  static const char * const pm_i=
rin_groups[] =3D {
7094a49a4ca2d8 Daniel Palmer 2021-01-10  44  	GROUPNAME_PM_IRIN,
7094a49a4ca2d8 Daniel Palmer 2021-01-10  45  };
7094a49a4ca2d8 Daniel Palmer 2021-01-10  46  =


:::::: The code at line 35 was first introduced by commit
:::::: 7094a49a4ca2d8ebb8a7bf96d8ee2acd717f5c6d pinctrl: mstar: msc313 pm p=
inctrl driver

:::::: TO: Daniel Palmer <daniel@0x0f.com>
:::::: CC: Daniel Palmer <daniel@0x0f.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7267311937857271527==--

