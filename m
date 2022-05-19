Content-Type: multipart/mixed; boundary="===============0734860479037685484=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kismet: WARNING: unmet direct dependencies detected for DRM_TTM when selected by DRM_TTM_HELPER
Date: Thu, 19 May 2022 12:23:56 +0800
Message-ID: <202205191240.IKWFnKbQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0734860479037685484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: Paul Gazzillo <paul@pgazz.com>
CC: Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f993aed406eaf968ba3867a76bb46c95336a33d0
commit: a0f25a6bb319aa05e04dcf51707c97c2881b4f47 drm/hisilicon/hibmc: Allow=
 to be built if COMPILE_TEST is enabled
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: (https://download.01.org/0day-ci/archive/20220519/202205191240.IKWF=
nKbQ-lkp(a)intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da0f25a6bb319aa05e04dcf51707c97c2881b4f47
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a0f25a6bb319aa05e04dcf51707c97c2881b4f47
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_DRM_TTM --selecto=
rs CONFIG_DRM_TTM_HELPER -a=3Driscv
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Driscv olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_TTM when sel=
ected by DRM_TTM_HELPER
   =

   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
     Selected by [y]:
     - DRM_TTM_HELPER [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy]
     - DRM_HISI_HIBMC [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy] && PCI [=3Dy=
] && (ARM64 || COMPILE_TEST [=3Dy])

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0734860479037685484==--

