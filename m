Content-Type: multipart/mixed; boundary="===============3527998640412944520=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/leds/leds-tca6507.c:246:14-15: WARNING opportunity for swap()
Date: Sat, 11 Dec 2021 23:42:13 +0800
Message-ID: <202112112245.cEbaJtKw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3527998640412944520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6f513529296fd4f696afb4354c46508abe646541
commit: 7845daa8bd72efa8bbc1de122edfce6e058bbe41 coccinelle: misc: add swap=
 script
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c022-20211210 (https://download.01.org/0day-ci/ar=
chive/20211211/202112112245.cEbaJtKw-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/leds/leds-tca6507.c:246:14-15: WARNING opportunity for swap()
--
>> drivers/w1/slaves/w1_therm.c:1840:18-19: WARNING opportunity for swap()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3527998640412944520==--

