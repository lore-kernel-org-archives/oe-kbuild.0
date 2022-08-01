Content-Type: multipart/mixed; boundary="===============0347715958883862727=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: timer-of.c:undefined reference to `of_iomap'
Date: Tue, 02 Aug 2022 03:49:12 +0800
Message-ID: <202208020359.MSuwg4RH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0347715958883862727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 timer-of.c:(.init.text+0x42): undefined reference to `of_iomap'"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Michael Ellerman <mpe@ellerman.id.au>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

Hi Michael,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0fac198def2b41138850867b6aa92044c76ff802
commit: 25259f7a5de2de9d67793dc584b15c83a3134c93 clocksource/drivers/timer-=
microchip-pit64b: Select CONFIG_TIMER_OF
date:   2 years, 3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 2 years, 3 months ago
config: s390-randconfig-s053-20220731 (https://download.01.org/0day-ci/arch=
ive/20220802/202208020359.MSuwg4RH-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D25259f7a5de2de9d67793dc584b15c83a3134c93
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 25259f7a5de2de9d67793dc584b15c83a3134c93
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
390 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt=
':
   irq-al-fic.c:(.init.text+0x40): undefined reference to `of_iomap'
   s390-linux-ld: irq-al-fic.c:(.init.text+0x272): undefined reference to `=
iounmap'
   s390-linux-ld: drivers/phy/marvell/phy-mvebu-a3700-utmi.o: in function `=
mvebu_a3700_utmi_phy_probe':
   phy-mvebu-a3700-utmi.c:(.text+0x3c8): undefined reference to `devm_platf=
orm_ioremap_resource'
   s390-linux-ld: drivers/soc/fsl/dpaa2-console.o: in function `dpaa2_conso=
le_close':
   dpaa2-console.c:(.text+0x64): undefined reference to `iounmap'
   s390-linux-ld: drivers/soc/fsl/dpaa2-console.o: in function `dpaa2_conso=
le_probe':
   dpaa2-console.c:(.text+0x124): undefined reference to `of_address_to_res=
ource'
   s390-linux-ld: drivers/soc/fsl/dpaa2-console.o: in function `dpaa2_gener=
ic_console_open.constprop.0':
   dpaa2-console.c:(.text+0x20e): undefined reference to `ioremap'
   s390-linux-ld: dpaa2-console.c:(.text+0x24c): undefined reference to `io=
unmap'
   s390-linux-ld: dpaa2-console.c:(.text+0x260): undefined reference to `io=
remap'
   s390-linux-ld: dpaa2-console.c:(.text+0x2f0): undefined reference to `io=
unmap'
   s390-linux-ld: drivers/reset/reset-brcmstb-rescal.o: in function `brcm_r=
escal_reset_probe':
   reset-brcmstb-rescal.c:(.text+0x176): undefined reference to `devm_iorem=
ap_resource'
   s390-linux-ld: drivers/char/hw_random/exynos-trng.o: in function `exynos=
_trng_probe':
   exynos-trng.c:(.text+0xd8): undefined reference to `devm_platform_iorema=
p_resource'
   s390-linux-ld: drivers/char/hw_random/meson-rng.o: in function `meson_rn=
g_probe':
   meson-rng.c:(.text+0x62): undefined reference to `devm_platform_ioremap_=
resource'
   s390-linux-ld: drivers/char/hw_random/mtk-rng.o: in function `mtk_rng_pr=
obe':
   mtk-rng.c:(.text+0x226): undefined reference to `devm_platform_ioremap_r=
esource'
   s390-linux-ld: drivers/char/hw_random/ks-sa-rng.o: in function `ks_sa_rn=
g_probe':
   ks-sa-rng.c:(.text+0x2b0): undefined reference to `devm_platform_ioremap=
_resource'
   s390-linux-ld: drivers/char/hw_random/npcm-rng.o: in function `npcm_rng_=
probe':
   npcm-rng.c:(.text+0x1cc): undefined reference to `devm_platform_ioremap_=
resource'
   s390-linux-ld: drivers/input/serio/apbps2.o: in function `apbps2_of_prob=
e':
   apbps2.c:(.text+0x284): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/watchdog/sirfsoc_wdt.o: in function `sirfsoc_wdt_=
probe':
   sirfsoc_wdt.c:(.text+0x1fc): undefined reference to `devm_platform_iorem=
ap_resource'
   s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_ini=
t':
>> timer-of.c:(.init.text+0x42): undefined reference to `of_iomap'
>> s390-linux-ld: timer-of.c:(.init.text+0x1d6): undefined reference to `io=
unmap'
   s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_cle=
anup':
>> timer-of.c:(.init.text+0x25e): undefined reference to `iounmap'

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0347715958883862727==--

