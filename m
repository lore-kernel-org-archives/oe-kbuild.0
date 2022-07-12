Content-Type: multipart/mixed; boundary="===============9130535849840540951=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct gve_tx_context_cmd_dtype) == 2"
Date: Wed, 13 Jul 2022 06:39:40 +0800
Message-ID: <202207130653.LoDitT3R-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9130535849840540951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(s=
truct gve_tx_context_cmd_dtype) =3D=3D 2""
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   72a8e05d4f66b5af7854df4490e3135168694b6b
commit: 7036440eab3e2d47a775d4616909f8235488d714 ARM: omap1: enable multipl=
atform
date:   6 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-s031-20220712 (https://download.01.org/0day-ci/archi=
ve/20220713/202207130653.LoDitT3R-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7036440eab3e2d47a775d4616909f8235488d714
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7036440eab3e2d47a775d4616909f8235488d714
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash arch/arm/mach-iop32x/ arch/arm/mach-mmp/ arch/arm/mach=
-mv78xx0/ arch/arm/mach-orion5x/ arch/arm/mach-spear/ arch/arm/mm/ drivers/=
clk/spear/ drivers/isdn/hardware/mISDN/ drivers/net/ethernet/google/gve/ dr=
ivers/scsi/ sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> arch/arm/mach-iop32x/em7210.c:64:13: warning: no previous prototype for =
'em7210_map_io' [-Wmissing-prototypes]
      64 | void __init em7210_map_io(void)
         |             ^~~~~~~~~~~~~
>> arch/arm/mach-iop32x/em7210.c:180:6: warning: no previous prototype for =
'em7210_power_off' [-Wmissing-prototypes]
     180 | void em7210_power_off(void)
         |      ^~~~~~~~~~~~~~~~
--
>> drivers/clk/spear/spear3xx_clock.c:390:13: warning: no previous prototyp=
e for 'spear3xx_clk_init' [-Wmissing-prototypes]
     390 | void __init spear3xx_clk_init(void __iomem *misc_base, void __io=
mem *soc_config_base)
         |             ^~~~~~~~~~~~~~~~~
--
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from include/linux/cpumask.h:10,
                    from drivers/net/ethernet/google/gve/gve_main.c:7:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof=
(struct gve_tx_context_cmd_dtype) =3D=3D 2"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_a=
ssert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_desc_dqo.h:68:1: note: in expansion =
of macro 'static_assert'
      68 | static_assert(sizeof(struct gve_tx_context_cmd_dtype) =3D=3D 2);
         | ^~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof=
(struct gve_tx_tso_context_desc_dqo) =3D=3D 16"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_a=
ssert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_desc_dqo.h:93:1: note: in expansion =
of macro 'static_assert'
      93 | static_assert(sizeof(struct gve_tx_tso_context_desc_dqo) =3D=3D =
16);
         | ^~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof=
(struct gve_tx_general_context_desc_dqo) =3D=3D 16"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_a=
ssert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_desc_dqo.h:114:1: note: in expansion=
 of macro 'static_assert'
     114 | static_assert(sizeof(struct gve_tx_general_context_desc_dqo) =3D=
=3D 16);
         | ^~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof=
(struct gve_tx_compl_desc) =3D=3D 8"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_a=
ssert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_desc_dqo.h:172:1: note: in expansion=
 of macro 'static_assert'
     172 | static_assert(sizeof(struct gve_tx_compl_desc) =3D=3D 8);
         | ^~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof=
(struct gve_rx_compl_desc_dqo) =3D=3D 32"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_a=
ssert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_desc_dqo.h:248:1: note: in expansion=
 of macro 'static_assert'
     248 | static_assert(sizeof(struct gve_rx_compl_desc_dqo) =3D=3D 32);
         | ^~~~~~~~~~~~~


sparse warnings: (new ones prefixed by >>)
>> arch/arm/mm/copypage-v4wb.c:47:6: sparse: sparse: symbol 'v4wb_copy_user=
_highpage' was not declared. Should it be static?
>> arch/arm/mm/copypage-v4wb.c:65:6: sparse: sparse: symbol 'v4wb_clear_use=
r_highpage' was not declared. Should it be static?
--
>> arch/arm/mm/copypage-feroceon.c:65:6: sparse: sparse: symbol 'feroceon_c=
opy_user_highpage' was not declared. Should it be static?
>> arch/arm/mm/copypage-feroceon.c:78:6: sparse: sparse: symbol 'feroceon_c=
lear_user_highpage' was not declared. Should it be static?
--
>> arch/arm/mach-iop32x/irq.c:55:17: sparse: sparse: symbol 'ext_chip' was =
not declared. Should it be static?
--
>> arch/arm/mach-iop32x/iq31244.c:89:13: sparse: sparse: symbol 'iq31244_ma=
p_io' was not declared. Should it be static?
>> arch/arm/mach-iop32x/iq31244.c:217:36: sparse: sparse: incorrect type in=
 initializer (different address spaces) @@     expected void [noderef] __io=
mem *membase @@     got char * @@
   arch/arm/mach-iop32x/iq31244.c:217:36: sparse:     expected void [nodere=
f] __iomem *membase
   arch/arm/mach-iop32x/iq31244.c:217:36: sparse:     got char *
>> arch/arm/mach-iop32x/iq31244.c:248:6: sparse: sparse: symbol 'ep80219_po=
wer_off' was not declared. Should it be static?
--
>> arch/arm/mach-iop32x/em7210.c:64:13: sparse: sparse: symbol 'em7210_map_=
io' was not declared. Should it be static?
>> arch/arm/mach-iop32x/em7210.c:152:36: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected void [noderef] __iom=
em *membase @@     got char * @@
   arch/arm/mach-iop32x/em7210.c:152:36: sparse:     expected void [noderef=
] __iomem *membase
   arch/arm/mach-iop32x/em7210.c:152:36: sparse:     got char *
>> arch/arm/mach-iop32x/em7210.c:180:6: sparse: sparse: symbol 'em7210_powe=
r_off' was not declared. Should it be static?
--
>> arch/arm/mach-iop32x/pci.c:217:13: sparse: sparse: symbol 'iop3xx_atu_se=
tup' was not declared. Should it be static?
>> arch/arm/mach-iop32x/pci.c:268:13: sparse: sparse: symbol 'iop3xx_atu_di=
sable' was not declared. Should it be static?
--
>> arch/arm/mach-iop32x/iq80321.c:57:13: sparse: sparse: symbol 'iq80321_ma=
p_io' was not declared. Should it be static?
>> arch/arm/mach-iop32x/iq80321.c:143:36: sparse: sparse: incorrect type in=
 initializer (different address spaces) @@     expected void [noderef] __io=
mem *membase @@     got char * @@
   arch/arm/mach-iop32x/iq80321.c:143:36: sparse:     expected void [nodere=
f] __iomem *membase
   arch/arm/mach-iop32x/iq80321.c:143:36: sparse:     got char *
--
>> arch/arm/mach-mmp/devices.c:241:17: sparse: sparse: symbol 'pxa168_usb_p=
hy_resources' was not declared. Should it be static?
>> arch/arm/mach-mmp/devices.c:262:17: sparse: sparse: symbol 'pxa168_u2o_r=
esources' was not declared. Should it be static?
--
>> arch/arm/mach-mv78xx0/pcie.c:46:5: sparse: sparse: symbol 'pcie_port_siz=
e' was not declared. Should it be static?
--
>> arch/arm/mach-orion5x/tsx09-common.c:120:26: sparse: sparse: incorrect t=
ype in assignment (different address spaces) @@     expected char *nor_page=
 @@     got void [noderef] __iomem * @@
   arch/arm/mach-orion5x/tsx09-common.c:120:26: sparse:     expected char *=
nor_page
   arch/arm/mach-orion5x/tsx09-common.c:120:26: sparse:     got void [noder=
ef] __iomem *
   arch/arm/mach-orion5x/tsx09-common.c:123:33: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void volatile =
[noderef] __iomem *iomem_cookie @@     got char *nor_page @@
   arch/arm/mach-orion5x/tsx09-common.c:123:33: sparse:     expected void v=
olatile [noderef] __iomem *iomem_cookie
   arch/arm/mach-orion5x/tsx09-common.c:123:33: sparse:     got char *nor_p=
age
--
>> arch/arm/mach-spear/spear3xx.c:53:17: sparse: sparse: symbol 'spear3xx_i=
o_desc' was not declared. Should it be static?
--
>> arch/arm/mach-spear/spear6xx.c:345:17: sparse: sparse: symbol 'spear6xx_=
io_desc' was not declared. Should it be static?
>> arch/arm/mach-spear/spear6xx.c:365:13: sparse: sparse: symbol 'spear6xx_=
map_io' was not declared. Should it be static?
>> arch/arm/mach-spear/spear6xx.c:370:13: sparse: sparse: symbol 'spear6xx_=
timer_init' was not declared. Should it be static?
>> arch/arm/mach-spear/spear6xx.c:400:23: sparse: sparse: symbol 'spear6xx_=
auxdata_lookup' was not declared. Should it be static?
--
>> arch/arm/mach-spear/spear310.c:30:27: sparse: sparse: symbol 'spear310_d=
ma_info' was not declared. Should it be static?

vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  =

6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check in=
teger constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wra=
pper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to ma=
ke the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the t=
ested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON=
(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the =
expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is =
not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG=
_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_asser=
t() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr,=
 ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(exp=
r, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  =


:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper fo=
r _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9130535849840540951==--

