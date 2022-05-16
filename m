Content-Type: multipart/mixed; boundary="===============6993246045329267763=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android-trusty-5.4 2532/6879] kismet: WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by INCREMENTAL_FS
Date: Tue, 17 May 2022 02:16:17 +0800
Message-ID: <202205170223.WE6zhTqR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6993246045329267763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android-trusty-5.4
head:   d556bac5a4d65c759ce3c5a7529aef568f05f650
commit: 1be052b20ba04b635cf87bcff80de5314697953e [2532/6879] ANDROID: Initi=
al commit of Incremental FS
:::::: branch date: 1 year ago
:::::: commit date: 2 years, 4 months ago
config: (https://download.01.org/0day-ci/archive/20220517/202205170223.WE6z=
hTqR-lkp(a)intel.com/config)
reproduce:
        # https://github.com/ammarfaizi2/linux-block/commit/1be052b20ba04b6=
35cf87bcff80de5314697953e
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android-trusty-5.4
        git checkout 1be052b20ba04b635cf87bcff80de5314697953e
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_ASYMMETRIC_KEY_TY=
PE --selectors CONFIG_INCREMENTAL_FS -a=3Dx86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Dx86_64 olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_T=
YPE when selected by INCREMENTAL_FS
   =

   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dn]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=3Dy]
   =

   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
     Depends on [n]: CRYPTO [=3Dy] && KEYS [=3Dn]
     Selected by [y]:
     - INCREMENTAL_FS [=3Dy] && BLOCK [=3Dy]
   =

   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dn]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=3Dy]
   =

   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=3Dn] && !UML && SND [=3Dn]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=3Dy]
   =

   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dn]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6993246045329267763==--

