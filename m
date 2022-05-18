Content-Type: multipart/mixed; boundary="===============0951015666111106780=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kismet: WARNING: unmet direct dependencies detected for ARM_CPU_SUSPEND when selected by ARM_TEGRA_CPUIDLE
Date: Thu, 19 May 2022 00:55:44 +0800
Message-ID: <202205190056.OOT2xvSZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0951015666111106780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: Paul Gazzillo <paul@pgazz.com>
CC: Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   210e04ff768142b96452030c4c2627512b30ad95
commit: faae6c9f2e68e62687636a7d6e0517b3bf594add cpuidle: tegra: Enable com=
pile testing
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: (https://download.01.org/0day-ci/archive/20220519/202205190056.OOT2=
xvSZ-lkp(a)intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfaae6c9f2e68e62687636a7d6e0517b3bf594add
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout faae6c9f2e68e62687636a7d6e0517b3bf594add
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_ARM_CPU_SUSPEND -=
-selectors CONFIG_ARM_TEGRA_CPUIDLE -a=3Darm
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Darm olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ARM_CPU_SUSPEND =
when selected by ARM_TEGRA_CPUIDLE
   =

   WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
     Depends on [n]: GPIOLIB [=3Dn]
     Selected by [y]:
     - PINCTRL_QCOM_SSBI_PMIC [=3Dy] && PINCTRL [=3Dy] && (ARCH_QCOM [=3Dn]=
 || COMPILE_TEST [=3Dy]) && OF [=3Dy]
   =

   WARNING: unmet direct dependencies detected for CRYPTO_LIB_ARC4
     Depends on [n]: CRYPTO [=3Dn]
     Selected by [m]:
     - RTLLIB_CRYPTO_WEP [=3Dm] && STAGING [=3Dy] && RTLLIB [=3Dm]
   =

   WARNING: unmet direct dependencies detected for SND_SOC_DMIC
     Depends on [n]: SOUND [=3Dy] && !UML && SND [=3Dy] && SND_SOC [=3Dy] &=
& GPIOLIB [=3Dn]
     Selected by [y]:
     - SND_SOC_MT8195_MT6359_RT1019_RT5682 [=3Dy] && SOUND [=3Dy] && !UML &=
& SND [=3Dy] && SND_SOC [=3Dy] && I2C [=3Dy] && SND_SOC_MT8195 [=3Dy] && MT=
K_PMIC_WRAP [=3Dy]
   =

   WARNING: unmet direct dependencies detected for SND_SOC_RT1015P
     Depends on [n]: SOUND [=3Dy] && !UML && SND [=3Dy] && SND_SOC [=3Dy] &=
& GPIOLIB [=3Dn]
     Selected by [y]:
     - SND_SOC_MT8195_MT6359_RT1019_RT5682 [=3Dy] && SOUND [=3Dy] && !UML &=
& SND [=3Dy] && SND_SOC [=3Dy] && I2C [=3Dy] && SND_SOC_MT8195 [=3Dy] && MT=
K_PMIC_WRAP [=3Dy]
   =

   WARNING: unmet direct dependencies detected for ARM_CPU_SUSPEND
     Depends on [n]: ARCH_SUSPEND_POSSIBLE [=3Dn]
     Selected by [y]:
     - ARM_TEGRA_CPUIDLE [=3Dy] && CPU_IDLE [=3Dy] && (ARM [=3Dy] || ARM64)=
 && (ARCH_TEGRA [=3Dn] || COMPILE_TEST [=3Dy]) && !ARM64 && MMU [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0951015666111106780==--

