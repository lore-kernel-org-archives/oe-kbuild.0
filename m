Content-Type: multipart/mixed; boundary="===============6705953764042314117=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10 348/9999] kismet: WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by GKI_HIDDEN_DMA_CONFIGS
Date: Mon, 16 May 2022 23:02:30 +0800
Message-ID: <202205162216.ObaWIaow-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6705953764042314117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android13-5.10
head:   aadf7ad9db2f7d93ecfb34d0e4f328519460c94e
commit: 0dc97b664f834a1f25ae5cb3a653e131da1d2798 [348/9999] ANDROID: GKI: e=
nable hidden configs for DMA
:::::: branch date: 6 weeks ago
:::::: commit date: 12 months ago
config: (https://download.01.org/0day-ci/archive/20220516/202205162216.ObaW=
Iaow-lkp(a)intel.com/config)
reproduce:
        # https://github.com/ammarfaizi2/linux-block/commit/0dc97b664f834a1=
f25ae5cb3a653e131da1d2798
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android13-5.10
        git checkout 0dc97b664f834a1f25ae5cb3a653e131da1d2798
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_ASYNC_TX_ENABLE_C=
HANNEL_SWITCH --selectors CONFIG_GKI_HIDDEN_DMA_CONFIGS -a=3Dx86_64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Dx86_64 olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_=
CHANNEL_SWITCH when selected by GKI_HIDDEN_DMA_CONFIGS
   =

   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_=
SWITCH
     Depends on [n]: DMADEVICES [=3Dn]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=3Dy]
   =

   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=3Dn]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=3Dy]
   =

   WARNING: unmet direct dependencies detected for IIO_BUFFER_CB
     Depends on [n]: IIO [=3Dy] && IIO_BUFFER [=3Dn]
     Selected by [y]:
     - JOYSTICK_ADC [=3Dy] && !UML && INPUT [=3Dy] && INPUT_JOYSTICK [=3Dy]=
 && IIO [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6705953764042314117==--

