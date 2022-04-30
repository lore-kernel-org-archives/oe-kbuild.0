Content-Type: multipart/mixed; boundary="===============4338312048113936579=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpio/gpio-tegra186.c:577:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 01 May 2022 04:24:01 +0800
Message-ID: <202205010440.oCzWMMDp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4338312048113936579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thierry Reding <treding@nvidia.com>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   57ae8a492116910bad2b3497ffe555b3a4b4180f
commit: 2103868047456e5f3e431ebb253d87e1fb806c76 gpio: tegra186: Support mu=
ltiple interrupts per bank
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-c006-20220427 (https://download.01.org/0day-ci/arc=
hive/20220501/202205010440.oCzWMMDp-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2103868047456e5f3e431ebb253d87e1fb806c76
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2103868047456e5f3e431ebb253d87e1fb806c76
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/dma/sun6i-dma.c:601:18: note: '?' condition is false
   drivers/dma/sun6i-dma.c:602:3: note:  Execution continues on line 607
                   break;
                   ^
   drivers/dma/sun6i-dma.c:607:6: note: Assuming the condition is false
           if (!(BIT(src_addr_width) & sdev->slave.src_addr_widths))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:607:2: note: Taking false branch
           if (!(BIT(src_addr_width) & sdev->slave.src_addr_widths))
           ^
   drivers/dma/sun6i-dma.c:609:6: note: Assuming the condition is false
           if (!(BIT(dst_addr_width) & sdev->slave.dst_addr_widths))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:609:2: note: Taking false branch
           if (!(BIT(dst_addr_width) & sdev->slave.dst_addr_widths))
           ^
   drivers/dma/sun6i-dma.c:611:6: note: Assuming the condition is false
           if (!(BIT(src_maxburst) & sdev->cfg->src_burst_lengths))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:611:2: note: Taking false branch
           if (!(BIT(src_maxburst) & sdev->cfg->src_burst_lengths))
           ^
   drivers/dma/sun6i-dma.c:613:6: note: Assuming the condition is false
           if (!(BIT(dst_maxburst) & sdev->cfg->dst_burst_lengths))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:613:2: note: Taking false branch
           if (!(BIT(dst_maxburst) & sdev->cfg->dst_burst_lengths))
           ^
   drivers/dma/sun6i-dma.c:626:2: note: Returning zero, which participates =
in a condition later
           return 0;
           ^~~~~~~~
   drivers/dma/sun6i-dma.c:779:8: note: Returning from 'set_config'
           ret =3D set_config(sdev, sconfig, dir, &lli_cfg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:780:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/dma/sun6i-dma.c:780:2: note: Taking false branch
           if (ret) {
           ^
   drivers/dma/sun6i-dma.c:785:8: note: Calling 'kzalloc'
           txd =3D kzalloc(sizeof(*txd), GFP_NOWAIT);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:785:8: note: Returning from 'kzalloc'
           txd =3D kzalloc(sizeof(*txd), GFP_NOWAIT);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:786:6: note: Assuming 'txd' is non-null
           if (!txd)
               ^~~~
   drivers/dma/sun6i-dma.c:786:2: note: Taking false branch
           if (!txd)
           ^
   drivers/dma/sun6i-dma.c:789:14: note: Assuming 'i' is >=3D 'periods'
           for (i =3D 0; i < periods; i++) {
                       ^~~~~~~~~~~
   drivers/dma/sun6i-dma.c:789:2: note: Loop condition is false. Execution =
continues on line 816
           for (i =3D 0; i < periods; i++) {
           ^
   drivers/dma/sun6i-dma.c:816:19: note: Access to field 'p_lli_next' resul=
ts in a dereference of a null pointer (loaded from variable 'prev')
           prev->p_lli_next =3D txd->p_lli;          /* cyclic list */
           ~~~~             ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
>> drivers/gpio/gpio-tegra186.c:577:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D gpio->gpio.parent;
                          ^~~   ~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-tegra186.c:577:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D gpio->gpio.parent;
                          ^~~   ~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-tegra186.c:616:6: warning: Value stored to 'value' is =
never read [clang-analyzer-deadcode.DeadStores]
                                           value =3D readl(base + offset);
                                           ^
   drivers/gpio/gpio-tegra186.c:616:6: note: Value stored to 'value' is nev=
er read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/regulator/bd9571mwv-regulator.c:91:6: warning: Assigned value is=
 garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           val >>=3D ffs(rdev->desc->vsel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/bd9571mwv-regulator.c:83:6: note: Assuming 'ret' is >=
=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/regulator/bd9571mwv-regulator.c:83:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/regulator/bd9571mwv-regulator.c:87:6: note: Assuming 'ret' is eq=
ual to 0
           if (ret !=3D 0)
               ^~~~~~~~
   drivers/regulator/bd9571mwv-regulator.c:87:2: note: Taking false branch
           if (ret !=3D 0)
           ^
   drivers/regulator/bd9571mwv-regulator.c:91:6: note: Assigned value is ga=
rbage or undefined
           val >>=3D ffs(rdev->desc->vsel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/clk/clk-gemini.c:334:2: warning: Value stored to 'hw' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           hw =3D clk_hw_register_fixed_factor(NULL, "secdiv", "ahb", 0, mu=
lt, div);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/clk/clk-gemini.c:334:2: note: Value stored to 'hw' is never read
           hw =3D clk_hw_register_fixed_factor(NULL, "secdiv", "ahb", 0, mu=
lt, div);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/clk/clk-gemini.c:359:2: warning: Value stored to 'mult' is never=
 read [clang-analyzer-deadcode.DeadStores]
           mult =3D 1;
           ^      ~
   drivers/clk/clk-gemini.c:359:2: note: Value stored to 'mult' is never re=
ad
           mult =3D 1;
           ^      ~
   drivers/clk/clk-gemini.c:362:2: warning: Value stored to 'div' is never =
read [clang-analyzer-deadcode.DeadStores]
           div +=3D 1;
           ^      ~
   drivers/clk/clk-gemini.c:362:2: note: Value stored to 'div' is never read
           div +=3D 1;
           ^      ~
   drivers/clk/clk-gemini.c:440:2: warning: Value stored to 'hw' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           hw =3D clk_hw_register_fixed_rate(NULL, "xtal", NULL, 0, freq);
           ^
   drivers/clk/clk-gemini.c:440:2: note: Value stored to 'hw' is never read
   drivers/clk/clk-gemini.c:449:2: warning: Value stored to 'hw' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           hw =3D clk_hw_register_fixed_factor(NULL, "vco", "xtal", 0, mult=
, div);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~

vim +/dev +577 drivers/gpio/gpio-tegra186.c

5b2b135a87fcfb Thierry Reding 2017-11-07  574  =

22635ed8a20d47 Thierry Reding 2019-11-08  575  static void tegra186_gpio_in=
it_route_mapping(struct tegra_gpio *gpio)
22635ed8a20d47 Thierry Reding 2019-11-08  576  {
2103868047456e Thierry Reding 2021-09-17 @577  	struct device *dev =3D gpio=
->gpio.parent;
22635ed8a20d47 Thierry Reding 2019-11-08  578  	unsigned int i, j;
22635ed8a20d47 Thierry Reding 2019-11-08  579  	u32 value;
22635ed8a20d47 Thierry Reding 2019-11-08  580  =

22635ed8a20d47 Thierry Reding 2019-11-08  581  	for (i =3D 0; i < gpio->soc=
->num_ports; i++) {
22635ed8a20d47 Thierry Reding 2019-11-08  582  		const struct tegra_gpio_po=
rt *port =3D &gpio->soc->ports[i];
22635ed8a20d47 Thierry Reding 2019-11-08  583  		unsigned int offset, p =3D=
 port->port;
22635ed8a20d47 Thierry Reding 2019-11-08  584  		void __iomem *base;
22635ed8a20d47 Thierry Reding 2019-11-08  585  =

22635ed8a20d47 Thierry Reding 2019-11-08  586  		base =3D gpio->secure + po=
rt->bank * 0x1000 + 0x800;
22635ed8a20d47 Thierry Reding 2019-11-08  587  =

22635ed8a20d47 Thierry Reding 2019-11-08  588  		value =3D readl(base + TEG=
RA186_GPIO_CTL_SCR);
22635ed8a20d47 Thierry Reding 2019-11-08  589  =

22635ed8a20d47 Thierry Reding 2019-11-08  590  		/*
22635ed8a20d47 Thierry Reding 2019-11-08  591  		 * For controllers that ha=
ven't been locked down yet, make
22635ed8a20d47 Thierry Reding 2019-11-08  592  		 * sure to program the def=
ault interrupt route mapping.
22635ed8a20d47 Thierry Reding 2019-11-08  593  		 */
22635ed8a20d47 Thierry Reding 2019-11-08  594  		if ((value & TEGRA186_GPIO=
_CTL_SCR_SEC_REN) =3D=3D 0 &&
22635ed8a20d47 Thierry Reding 2019-11-08  595  		    (value & TEGRA186_GPIO=
_CTL_SCR_SEC_WEN) =3D=3D 0) {
2103868047456e Thierry Reding 2021-09-17  596  			/*
2103868047456e Thierry Reding 2021-09-17  597  			 * On Tegra194 and later,=
 each pin can be routed to one or more
2103868047456e Thierry Reding 2021-09-17  598  			 * interrupts.
2103868047456e Thierry Reding 2021-09-17  599  			 */
2103868047456e Thierry Reding 2021-09-17  600  			for (j =3D 0; j < gpio->n=
um_irqs_per_bank; j++) {
2103868047456e Thierry Reding 2021-09-17  601  				dev_dbg(dev, "programmin=
g default interrupt routing for port %s\n",
2103868047456e Thierry Reding 2021-09-17  602  					port->name);
2103868047456e Thierry Reding 2021-09-17  603  =

22635ed8a20d47 Thierry Reding 2019-11-08  604  				offset =3D TEGRA186_GPIO=
_INT_ROUTE_MAPPING(p, j);
22635ed8a20d47 Thierry Reding 2019-11-08  605  =

2103868047456e Thierry Reding 2021-09-17  606  				/*
2103868047456e Thierry Reding 2021-09-17  607  				 * By default we only wa=
nt to route GPIO pins to IRQ 0. This works
2103868047456e Thierry Reding 2021-09-17  608  				 * only under the assump=
tion that we're running as the host kernel
2103868047456e Thierry Reding 2021-09-17  609  				 * and hence all GPIO pi=
ns are owned by Linux.
2103868047456e Thierry Reding 2021-09-17  610  				 *
2103868047456e Thierry Reding 2021-09-17  611  				 * For cases where Linux=
 is the guest OS, the hypervisor will have
2103868047456e Thierry Reding 2021-09-17  612  				 * to configure the inte=
rrupt routing and pass only the valid
2103868047456e Thierry Reding 2021-09-17  613  				 * interrupts via device=
 tree.
2103868047456e Thierry Reding 2021-09-17  614  				 */
2103868047456e Thierry Reding 2021-09-17  615  				if (j =3D=3D 0) {
22635ed8a20d47 Thierry Reding 2019-11-08  616  					value =3D readl(base + =
offset);
22635ed8a20d47 Thierry Reding 2019-11-08  617  					value =3D BIT(port->pin=
s) - 1;
22635ed8a20d47 Thierry Reding 2019-11-08  618  					writel(value, base + of=
fset);
22635ed8a20d47 Thierry Reding 2019-11-08  619  				}
22635ed8a20d47 Thierry Reding 2019-11-08  620  			}
22635ed8a20d47 Thierry Reding 2019-11-08  621  		}
22635ed8a20d47 Thierry Reding 2019-11-08  622  	}
2103868047456e Thierry Reding 2021-09-17  623  }
22635ed8a20d47 Thierry Reding 2019-11-08  624  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4338312048113936579==--

