Content-Type: multipart/mixed; boundary="===============3079405863199037604=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.19-r2pro-hdmi 36/41] drivers/headset_observe/rk_headset_irq_hook_adc.c: linux/wakelock.h is included more than once.
Date: Mon, 20 Jun 2022 12:26:25 +0800
Message-ID: <202206201201.utagIl57-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3079405863199037604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.19-r2pro-hdmi
head:   48dd6a7cc2db9b16fe4ed092616f9b3494542637
commit: 45dc5035a7865a586f08727098716a91de524b7d [36/41] add rk headset dri=
ver
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/headset_observe/rk_headset_irq_hook_adc.c: linux/wakelock.h is i=
ncluded more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3079405863199037604==--

