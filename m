Content-Type: multipart/mixed; boundary="===============5799342867591531268=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/mach-omap2/board-n8x0.c:508:13: warning: no previous prototype for 'n8x0_mmc_init'
Date: Sun, 17 Jul 2022 23:42:39 +0800
Message-ID: <202207172350.2dGRjMq5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5799342867591531268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/arm/mach-omap2/board-n8x0.c:508:13: warning: no previous prototype fo=
r 'n8x0_mmc_init' [-Wmissing-prototypes]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   972a278fe60c361eb8f37619f562f092e8786d7c
commit: 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8 ARM: dove: multiplatform s=
upport
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-s052-20220717 (https://download.01.org/0day-ci/archi=
ve/20220717/202207172350.2dGRjMq5-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash arch/arm/mach-at91/ arch/arm/mach-mediatek/ arch/arm/m=
ach-meson/ arch/arm/mach-omap2/ arch/arm/mach-rockchip/ arch/arm/mach-socfp=
ga/ kernel/futex/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-omap2/board-n8x0.c:508:13: warning: no previous prototype =
for 'n8x0_mmc_init' [-Wmissing-prototypes]
     508 | void __init n8x0_mmc_init(void)
         |             ^~~~~~~~~~~~~


sparse warnings: (new ones prefixed by >>)
>> arch/arm/mach-at91/pm.c:775:30: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected void ( *static [assigned] [=
toplevel] at91_suspend_sram_fn )( ... ) @@     got void [noderef] __iomem *=
 @@
   arch/arm/mach-at91/pm.c:775:30: sparse:     expected void ( *static [ass=
igned] [toplevel] at91_suspend_sram_fn )( ... )
   arch/arm/mach-at91/pm.c:775:30: sparse:     got void [noderef] __iomem *
--
>> arch/arm/mach-meson/platsmp.c:40:55: sparse: sparse: Using plain integer=
 as NULL pointer
--
>> arch/arm/mach-mediatek/platsmp.c:105:30: sparse: sparse: incorrect type =
in assignment (different address spaces) @@     expected void [noderef] __i=
omem *static [toplevel] mtk_smp_base @@     got void * @@
   arch/arm/mach-mediatek/platsmp.c:105:30: sparse:     expected void [node=
ref] __iomem *static [toplevel] mtk_smp_base
   arch/arm/mach-mediatek/platsmp.c:105:30: sparse:     got void *
--
>> arch/arm/mach-omap2/board-n8x0.c:508:13: sparse: sparse: symbol 'n8x0_mm=
c_init' was not declared. Should it be static?
--
>> arch/arm/mach-rockchip/pm.c:277:9: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void *dest @@     got vo=
id [noderef] __iomem *static [assigned] [toplevel] rk3288_bootram_base @@
   arch/arm/mach-rockchip/pm.c:277:9: sparse:     expected void *dest
   arch/arm/mach-rockchip/pm.c:277:9: sparse:     got void [noderef] __iome=
m *static [assigned] [toplevel] rk3288_bootram_base
--
>> arch/arm/mach-socfpga/pm.c:75:25: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void *dest @@     got voi=
d [noderef] __iomem *[assigned] suspend_ocram_base @@
   arch/arm/mach-socfpga/pm.c:75:25: sparse:     expected void *dest
   arch/arm/mach-socfpga/pm.c:75:25: sparse:     got void [noderef] __iomem=
 *[assigned] suspend_ocram_base
--
   kernel/futex/core.c: note: in included file (through kernel/futex/futex.=
h):
>> arch/arm/include/asm/futex.h:58:9: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const * @@     got =
unsigned int [noderef] [usertype] __user *uaddr @@
   arch/arm/include/asm/futex.h:58:9: sparse:     expected void const *
   arch/arm/include/asm/futex.h:58:9: sparse:     got unsigned int [noderef=
] [usertype] __user *uaddr

vim +/n8x0_mmc_init +508 arch/arm/mach-omap2/board-n8x0.c

9418c65f9bd861 Tony Lindgren 2010-02-26  471  =

bc593f5d787d0a Igor Grinberg 2011-05-03  472  static void __init n8x0_mmc_i=
nit(void)
9418c65f9bd861 Tony Lindgren 2010-02-26  473  {
9418c65f9bd861 Tony Lindgren 2010-02-26  474  	int err;
9418c65f9bd861 Tony Lindgren 2010-02-26  475  =

c8f27e977310b3 Tony Lindgren 2013-11-25  476  	if (board_is_n810()) {
9418c65f9bd861 Tony Lindgren 2010-02-26  477  		mmc1_data.slots[0].name =3D=
 "external";
9418c65f9bd861 Tony Lindgren 2010-02-26  478  =

9418c65f9bd861 Tony Lindgren 2010-02-26  479  		/*
9418c65f9bd861 Tony Lindgren 2010-02-26  480  		 * Some Samsung Movinand ch=
ips do not like open-ended
9418c65f9bd861 Tony Lindgren 2010-02-26  481  		 * multi-block reads and fa=
ll to braind-dead state
9418c65f9bd861 Tony Lindgren 2010-02-26  482  		 * while doing so. Reducing=
 the number of blocks in
9418c65f9bd861 Tony Lindgren 2010-02-26  483  		 * the transfer or delays i=
n clock disable do not help
9418c65f9bd861 Tony Lindgren 2010-02-26  484  		 */
9418c65f9bd861 Tony Lindgren 2010-02-26  485  		mmc1_data.slots[1].name =3D=
 "internal";
9418c65f9bd861 Tony Lindgren 2010-02-26  486  		mmc1_data.slots[1].ban_open=
ended =3D 1;
9418c65f9bd861 Tony Lindgren 2010-02-26  487  	}
9418c65f9bd861 Tony Lindgren 2010-02-26  488  =

bc593f5d787d0a Igor Grinberg 2011-05-03  489  	err =3D gpio_request_one(N8X=
0_SLOT_SWITCH_GPIO, GPIOF_OUT_INIT_LOW,
bc593f5d787d0a Igor Grinberg 2011-05-03  490  			       "MMC slot switch");
9418c65f9bd861 Tony Lindgren 2010-02-26  491  	if (err)
1dea5c6b5876ea Tony Lindgren 2010-04-21  492  		return;
9418c65f9bd861 Tony Lindgren 2010-02-26  493  =

c8f27e977310b3 Tony Lindgren 2013-11-25  494  	if (board_is_n810()) {
bc593f5d787d0a Igor Grinberg 2011-05-03  495  		err =3D gpio_request_array(=
n810_emmc_gpios,
bc593f5d787d0a Igor Grinberg 2011-05-03  496  					 ARRAY_SIZE(n810_emmc_gp=
ios));
9418c65f9bd861 Tony Lindgren 2010-02-26  497  		if (err) {
9418c65f9bd861 Tony Lindgren 2010-02-26  498  			gpio_free(N8X0_SLOT_SWITCH=
_GPIO);
1dea5c6b5876ea Tony Lindgren 2010-04-21  499  			return;
9418c65f9bd861 Tony Lindgren 2010-02-26  500  		}
9418c65f9bd861 Tony Lindgren 2010-02-26  501  	}
9418c65f9bd861 Tony Lindgren 2010-02-26  502  =

fa590c92340136 Tony Lindgren 2013-11-25  503  	mmc1_data.nr_slots =3D 2;
9418c65f9bd861 Tony Lindgren 2010-02-26  504  	mmc_data[0] =3D &mmc1_data;
9418c65f9bd861 Tony Lindgren 2010-02-26  505  }
9418c65f9bd861 Tony Lindgren 2010-02-26  506  #else
fa590c92340136 Tony Lindgren 2013-11-25  507  static struct omap_mmc_platfo=
rm_data mmc1_data;
9418c65f9bd861 Tony Lindgren 2010-02-26 @508  void __init n8x0_mmc_init(voi=
d)
9418c65f9bd861 Tony Lindgren 2010-02-26  509  {
9418c65f9bd861 Tony Lindgren 2010-02-26  510  }
9418c65f9bd861 Tony Lindgren 2010-02-26  511  #endif	/* CONFIG_MMC_OMAP */
9418c65f9bd861 Tony Lindgren 2010-02-26  512  =


:::::: The code at line 508 was first introduced by commit
:::::: 9418c65f9bd861d0f7e39aab9cfb3aa6f2275d11 omap2: Initialize Menelaus =
and MMC for N8X0

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5799342867591531268==--

