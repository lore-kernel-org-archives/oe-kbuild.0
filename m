Content-Type: multipart/mixed; boundary="===============7763074522459166883=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [char-misc:char-misc-next 21/24] drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c: linux/spinlock.h is included more than once.
Date: Sat, 03 Sep 2022 20:40:18 +0800
Message-ID: <202209032043.kTT0JeZP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7763074522459166883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t char-misc-next
head:   4ec7ac90ff399b7d9af81cc8afd430a22786c61b
commit: 7d3e4d807df2a216b9aa2944372f2b3f6ef3f205 [21/24] misc: microchip: p=
ci1xxxx: load gpio driver for the gpio controller auxiliary device enumerat=
ed by the auxiliary bus driver.
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c: linux/spinlock.h is inc=
luded more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7763074522459166883==--

