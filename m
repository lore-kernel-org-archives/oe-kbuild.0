Content-Type: multipart/mixed; boundary="===============1929573336457739395=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/dovetail-xenomai 14/207] drivers/clocksource/mmio.c: linux/slab.h is included more than once.
Date: Thu, 11 Aug 2022 07:35:29 +0800
Message-ID: <202208110709.ISTidjAA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1929573336457739395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Hao Li <hao3.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/dovetail-xenomai
head:   1ec5fba16dd51c564b43e1de41ff50e30ecd0e9b
commit: 20fd627143e8652ac182ac06627776b10ce234bd [14/207] clocksource: mmio=
: add user-mappable mmio clocksources
:::::: branch date: 12 days ago
:::::: commit date: 4 months ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/clocksource/mmio.c: linux/slab.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1929573336457739395==--

