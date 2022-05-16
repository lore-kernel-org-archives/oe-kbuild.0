Content-Type: multipart/mixed; boundary="===============0700714140004732352=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.10-2022-03 1757/9999] kismet: WARNING: unmet direct dependencies detected for BALLOON_COMPACTION when selected by GKI_HIDDEN_MM_CONFIGS
Date: Tue, 17 May 2022 03:01:36 +0800
Message-ID: <202205170241.qESREHQ8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0700714140004732352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android12-5.10-2022-03
head:   64099431c232d4a95f621411747a3972cc1c8061
commit: 1d3b80670f543f532f0d8e588c71e5be6861441a [1757/9999] ANDROID: Add G=
KI_HIDDEN_MM_CONFIGS to support ballooning.
:::::: branch date: 7 weeks ago
:::::: commit date: 1 year, 1 month ago
config: (https://download.01.org/0day-ci/archive/20220517/202205170241.qESR=
EHQ8-lkp(a)intel.com/config)
reproduce:
        # https://github.com/ammarfaizi2/linux-block/commit/1d3b80670f543f5=
32f0d8e588c71e5be6861441a
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android12-5.10-2022-03
        git checkout 1d3b80670f543f532f0d8e588c71e5be6861441a
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_BALLOON_COMPACTIO=
N --selectors CONFIG_GKI_HIDDEN_MM_CONFIGS -a=3Dx86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Dx86_64 olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BALLOON_COMPACTI=
ON when selected by GKI_HIDDEN_MM_CONFIGS
   =

   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=3Dn]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=3Dy]
   =

   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dn]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=3Dy]
   =

   WARNING: unmet direct dependencies detected for SERIAL_EARLYCON
     Depends on [n]: TTY [=3Dy] && HAS_IOMEM [=3Dy] && SERIAL_CORE [=3Dn]
     Selected by [y]:
     - SERIAL_MSM_GENI_EARLY_CONSOLE [=3Dy] && TTY [=3Dy] && HAS_IOMEM [=3D=
y]
   =

   WARNING: unmet direct dependencies detected for ADI_AXI_ADC
     Depends on [n]: IIO [=3Dy] && HAS_IOMEM [=3Dy] && OF [=3Dn]
     Selected by [y]:
     - AD9467 [=3Dy] && IIO [=3Dy] && SPI [=3Dy]
   =

   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dn]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=3Dy]
   =

   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dn]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=3Dy]
   =

   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
     Depends on [n]: COMPACTION [=3Dn] && MEMORY_BALLOON [=3Dy]
     Selected by [y]:
     - GKI_HIDDEN_MM_CONFIGS [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0700714140004732352==--

