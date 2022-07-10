Content-Type: multipart/mixed; boundary="===============0379348062513839575=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.19-r2pro-hdmi 35/43] drivers/headset_observe/rk_headset_irq_hook_adc.c: linux/wakelock.h is included more than once.
Date: Sun, 10 Jul 2022 14:47:57 +0800
Message-ID: <202207101459.4Qs2wHDj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0379348062513839575==
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
head:   1ecf2a2cc9eb950ecbde64c6f1cb5ae394c77e0b
commit: adee25d2fa5b89c5709560b7e5a87dda4eaa1eaa [35/43] add rk headset dri=
ver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/headset_observe/rk_headset_irq_hook_adc.c: linux/wakelock.h is i=
ncluded more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0379348062513839575==--

