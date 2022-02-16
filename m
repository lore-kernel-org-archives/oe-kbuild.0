Content-Type: multipart/mixed; boundary="===============0695069756005543836=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/thunderbolt/property.c:501:12-13: WARNING opportunity for min()
Date: Thu, 17 Feb 2022 00:21:11 +0800
Message-ID: <202202170042.PCOyRvCo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0695069756005543836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5d9ae265b105d9a67575fb67bd4650a6fc08e25
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c002-20220214 (https://download.01.org/0day-ci/ar=
chive/20220217/202202170042.PCOyRvCo-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/thunderbolt/property.c:501:12-13: WARNING opportunity for min()
--
>> drivers/acpi/thermal.c:425:43-44: WARNING opportunity for min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0695069756005543836==--

