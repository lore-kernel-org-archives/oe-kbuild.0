Content-Type: multipart/mixed; boundary="===============8314984885854639302=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kismet: WARNING: unmet direct dependencies detected for ARM_CPU_SUSPEND when selected by ARM_TEGRA_CPUIDLE
Date: Fri, 20 May 2022 11:28:17 +0800
Message-ID: <202205201109.7MpP7Bix-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8314984885854639302==
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
head:   b015dcd62b86d298829990f8261d5d154b8d7af5
commit: faae6c9f2e68e62687636a7d6e0517b3bf594add cpuidle: tegra: Enable com=
pile testing
date:   8 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 months ago
config: (https://download.01.org/0day-ci/archive/20220520/202205201109.7MpP=
7Bix-lkp(a)intel.com/config)
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

   WARNING: unmet direct dependencies detected for QCOM_SCM
     Depends on [n]: (ARM [=3Dy] || ARM64) && HAVE_ARM_SMCCC [=3Dn]
     Selected by [y]:
     - ARM_QCOM_SPM_CPUIDLE [=3Dy] && CPU_IDLE [=3Dy] && (ARM [=3Dy] || ARM=
64) && (ARCH_QCOM [=3Dn] || COMPILE_TEST [=3Dy]) && !ARM64 && MMU [=3Dy]
   =

   WARNING: unmet direct dependencies detected for ARM_CPU_SUSPEND
     Depends on [n]: ARCH_SUSPEND_POSSIBLE [=3Dn]
     Selected by [y]:
     - ARM_TEGRA_CPUIDLE [=3Dy] && CPU_IDLE [=3Dy] && (ARM [=3Dy] || ARM64)=
 && (ARCH_TEGRA [=3Dn] || COMPILE_TEST [=3Dy]) && !ARM64 && MMU [=3Dy]
     - ARM_QCOM_SPM_CPUIDLE [=3Dy] && CPU_IDLE [=3Dy] && (ARM [=3Dy] || ARM=
64) && (ARCH_QCOM [=3Dn] || COMPILE_TEST [=3Dy]) && !ARM64 && MMU [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8314984885854639302==--

