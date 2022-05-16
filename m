Content-Type: multipart/mixed; boundary="===============8611153459127575685=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kismet: WARNING: unmet direct dependencies detected for RESET_TI_SYSCON when selected by SCSI_UFS_MEDIATEK
Date: Tue, 17 May 2022 02:28:26 +0800
Message-ID: <202205170246.U5X90l4I-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8611153459127575685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: Paul Gazzillo <paul@pgazz.com>
CC: Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Peter Wang <peter.wang@mediatek.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Stanley Chu <stanley.chu@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   42226c989789d8da4af1de0c31070c96726d990c
commit: de48898d0cb6a3750558f35e14af799eafc3e6db scsi: ufs-mediatek: Create=
 reset control device_link
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: (https://download.01.org/0day-ci/archive/20220517/202205170246.U5X9=
0l4I-lkp(a)intel.com/config)
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dde48898d0cb6a3750558f35e14af799eafc3e6db
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout de48898d0cb6a3750558f35e14af799eafc3e6db
        # 1. reproduce by kismet
           # install kmax per https://github.com/paulgazz/kmax/blob/master/=
README.md
           kismet --linux-ksrc=3Dlinux --selectees CONFIG_RESET_TI_SYSCON -=
-selectors CONFIG_SCSI_UFS_MEDIATEK -a=3Darm64
        # 2. reproduce by make
           # save the config file to linux source tree
           cd linux
           make ARCH=3Darm64 olddefconfig

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESET_TI_SYSCON =
when selected by SCSI_UFS_MEDIATEK
   =

   WARNING: unmet direct dependencies detected for RESET_TI_SYSCON
     Depends on [n]: RESET_CONTROLLER [=3Dn] && HAS_IOMEM [=3Dy]
     Selected by [y]:
     - SCSI_UFS_MEDIATEK [=3Dy] && SCSI_LOWLEVEL [=3Dy] && SCSI [=3Dy] && S=
CSI_UFSHCD_PLATFORM [=3Dy] && ARCH_MEDIATEK [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8611153459127575685==--

