Content-Type: multipart/mixed; boundary="===============5359542116204443495=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/bch.c:842:7-8: WARNING opportunity for swap()
Date: Mon, 31 Jan 2022 20:17:12 +0800
Message-ID: <202201312002.gljszrs9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5359542116204443495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: 7845daa8bd72efa8bbc1de122edfce6e058bbe41 coccinelle: misc: add swap=
 script
date:   9 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c022-20220117 (https://download.01.org/0day-ci/ar=
chive/20220131/202201312002.gljszrs9-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> lib/bch.c:842:7-8: WARNING opportunity for swap()
   lib/bch.c:849:7-8: WARNING opportunity for swap()
   lib/bch.c:518:22-23: WARNING opportunity for swap()
--
>> drivers/leds/leds-tca6507.c:246:14-15: WARNING opportunity for swap()
--
>> drivers/phy/cadence/phy-cadence-torrent.c:2127:18-19: WARNING opportunit=
y for swap()
--
>> drivers/w1/slaves/w1_therm.c:1840:18-19: WARNING opportunity for swap()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5359542116204443495==--

