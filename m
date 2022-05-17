Content-Type: multipart/mixed; boundary="===============8007129186747393155=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_SSD130X
Date: Wed, 18 May 2022 03:24:40 +0800
Message-ID: <202205180326.YcKJ5ha0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8007129186747393155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: Paul Gazzillo <paul@pgazz.com>
CC: Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Javier Martinez Canillas <javierm@redhat.com>
CC: Maxime Ripard <maxime@cerno.tech>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   42226c989789d8da4af1de0c31070c96726d990c
commit: a61732e808672cfa8c8c6028bcf9feacb953ef40 drm: Add driver for Solomo=
n SSD130x OLED displays
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: (https://download.01.org/0day-ci/archive/20220518/202205180326.YcKJ=
5ha0-lkp(a)intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da61732e808672cfa8c8c6028bcf9feacb953ef40
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a61732e808672cfa8c8c6028bcf9feacb953ef40
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_DRM_GEM_SHMEM_HEL=
PER --selectors CONFIG_DRM_SSD130X -a=3Driscv
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Driscv olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HE=
LPER when selected by DRM_SSD130X
   =

   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
     Selected by [y]:
     - DRM_SSD130X [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8007129186747393155==--

