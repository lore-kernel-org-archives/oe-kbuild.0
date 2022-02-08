Content-Type: multipart/mixed; boundary="===============0768346606080105824=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/bch.c:842:7-8: WARNING opportunity for swap()
Date: Wed, 09 Feb 2022 01:43:49 +0800
Message-ID: <202202090101.Qk81kJDh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0768346606080105824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   555f3d7be91a873114c9656069f1a9fa476ec41a
commit: 7845daa8bd72efa8bbc1de122edfce6e058bbe41 coccinelle: misc: add swap=
 script
date:   9 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-c022-20220117 (https://download.01.org/0day-ci/ar=
chive/20220209/202202090101.Qk81kJDh-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> lib/bch.c:842:7-8: WARNING opportunity for swap()
   lib/bch.c:849:7-8: WARNING opportunity for swap()
   lib/bch.c:518:22-23: WARNING opportunity for swap()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0768346606080105824==--

