Content-Type: multipart/mixed; boundary="===============1559497803589310564=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/mach-at91/pm.c:598:30: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Mon, 08 Aug 2022 04:38:52 +0800
Message-ID: <202208080402.ehSZX7aq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1559497803589310564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "only Kconfig file updated"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eugen Hristev <eugen.hristev@microchip.com>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>
CC: Claudiu Beznea <claudiu.beznea@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3bc1bc0b59d04e997db25b84babf459ca1cd80b7
commit: 56bc29659182a9d4b58d8364420f5a9c59d709e8 ARM: at91: add new SoC sam=
a7g5
date:   1 year, 1 month ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm-randconfig-s031-20220805 (https://download.01.org/0day-ci/archi=
ve/20220808/202208080402.ehSZX7aq-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D56bc29659182a9d4b58d8364420f5a9c59d709e8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 56bc29659182a9d4b58d8364420f5a9c59d709e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mach-at91/pm.c:598:30: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@     expected void ( *static [assigned] [=
toplevel] at91_suspend_sram_fn )( ... ) @@     got void [noderef] __iomem *=
 @@
   arch/arm/mach-at91/pm.c:598:30: sparse:     expected void ( *static [ass=
igned] [toplevel] at91_suspend_sram_fn )( ... )
   arch/arm/mach-at91/pm.c:598:30: sparse:     got void [noderef] __iomem *

vim +598 arch/arm/mach-at91/pm.c

fbc7edca5a7dd4 Alexandre Belloni  2015-09-30  563  =

d2e46790559676 Alexandre Belloni  2015-01-15  564  static void __init at91_=
pm_sram_init(void)
d2e46790559676 Alexandre Belloni  2015-01-15  565  {
d2e46790559676 Alexandre Belloni  2015-01-15  566  	struct gen_pool *sram_p=
ool;
d2e46790559676 Alexandre Belloni  2015-01-15  567  	phys_addr_t sram_pbase;
d2e46790559676 Alexandre Belloni  2015-01-15  568  	unsigned long sram_base;
d2e46790559676 Alexandre Belloni  2015-01-15  569  	struct device_node *nod=
e;
4a031f7dbe497a Alexandre Belloni  2015-03-03  570  	struct platform_device =
*pdev =3D NULL;
d2e46790559676 Alexandre Belloni  2015-01-15  571  =

4a031f7dbe497a Alexandre Belloni  2015-03-03  572  	for_each_compatible_nod=
e(node, NULL, "mmio-sram") {
4a031f7dbe497a Alexandre Belloni  2015-03-03  573  		pdev =3D of_find_devic=
e_by_node(node);
4a031f7dbe497a Alexandre Belloni  2015-03-03  574  		if (pdev) {
4a031f7dbe497a Alexandre Belloni  2015-03-03  575  			of_node_put(node);
4a031f7dbe497a Alexandre Belloni  2015-03-03  576  			break;
4a031f7dbe497a Alexandre Belloni  2015-03-03  577  		}
d2e46790559676 Alexandre Belloni  2015-01-15  578  	}
d2e46790559676 Alexandre Belloni  2015-01-15  579  =

d2e46790559676 Alexandre Belloni  2015-01-15  580  	if (!pdev) {
d2e46790559676 Alexandre Belloni  2015-01-15  581  		pr_warn("%s: failed to=
 find sram device!\n", __func__);
4a031f7dbe497a Alexandre Belloni  2015-03-03  582  		return;
d2e46790559676 Alexandre Belloni  2015-01-15  583  	}
d2e46790559676 Alexandre Belloni  2015-01-15  584  =

73858173593c31 Vladimir Zapolskiy 2015-09-04  585  	sram_pool =3D gen_pool_=
get(&pdev->dev, NULL);
d2e46790559676 Alexandre Belloni  2015-01-15  586  	if (!sram_pool) {
d2e46790559676 Alexandre Belloni  2015-01-15  587  		pr_warn("%s: sram pool=
 unavailable!\n", __func__);
f87a4f022c44e5 yu kuai            2020-06-04  588  		goto out_put_device;
d2e46790559676 Alexandre Belloni  2015-01-15  589  	}
d2e46790559676 Alexandre Belloni  2015-01-15  590  =

5726a8b9686348 Wenyou Yang        2015-03-09  591  	sram_base =3D gen_pool_=
alloc(sram_pool, at91_pm_suspend_in_sram_sz);
d2e46790559676 Alexandre Belloni  2015-01-15  592  	if (!sram_base) {
5726a8b9686348 Wenyou Yang        2015-03-09  593  		pr_warn("%s: unable to=
 alloc sram!\n", __func__);
f87a4f022c44e5 yu kuai            2020-06-04  594  		goto out_put_device;
d2e46790559676 Alexandre Belloni  2015-01-15  595  	}
d2e46790559676 Alexandre Belloni  2015-01-15  596  =

d2e46790559676 Alexandre Belloni  2015-01-15  597  	sram_pbase =3D gen_pool=
_virt_to_phys(sram_pool, sram_base);
5726a8b9686348 Wenyou Yang        2015-03-09 @598  	at91_suspend_sram_fn =
=3D __arm_ioremap_exec(sram_pbase,
5726a8b9686348 Wenyou Yang        2015-03-09  599  					at91_pm_suspend_in_=
sram_sz, false);
5726a8b9686348 Wenyou Yang        2015-03-09  600  	if (!at91_suspend_sram_=
fn) {
d94e688cae5661 Wenyou Yang        2015-03-09  601  		pr_warn("SRAM: Could n=
ot map\n");
f87a4f022c44e5 yu kuai            2020-06-04  602  		goto out_put_device;
d94e688cae5661 Wenyou Yang        2015-03-09  603  	}
d94e688cae5661 Wenyou Yang        2015-03-09  604  =

5726a8b9686348 Wenyou Yang        2015-03-09  605  	/* Copy the pm suspend =
handler to SRAM */
5726a8b9686348 Wenyou Yang        2015-03-09  606  	at91_suspend_sram_fn =
=3D fncpy(at91_suspend_sram_fn,
5726a8b9686348 Wenyou Yang        2015-03-09  607  			&at91_pm_suspend_in_s=
ram, at91_pm_suspend_in_sram_sz);
f87a4f022c44e5 yu kuai            2020-06-04  608  	return;
f87a4f022c44e5 yu kuai            2020-06-04  609  =

f87a4f022c44e5 yu kuai            2020-06-04  610  out_put_device:
f87a4f022c44e5 yu kuai            2020-06-04  611  	put_device(&pdev->dev);
f87a4f022c44e5 yu kuai            2020-06-04  612  	return;
d2e46790559676 Alexandre Belloni  2015-01-15  613  }
d2e46790559676 Alexandre Belloni  2015-01-15  614  =


:::::: The code at line 598 was first introduced by commit
:::::: 5726a8b9686348e8d203f1bbf9d5fc1bb5899518 ARM: at91/pm: rename functi=
on name: at91_slow_clock() --> at91_pm_suspend_sram_fn()

:::::: TO: Wenyou Yang <wenyou.yang@atmel.com>
:::::: CC: Nicolas Ferre <nicolas.ferre@atmel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1559497803589310564==--

