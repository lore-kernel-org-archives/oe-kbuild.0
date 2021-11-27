Content-Type: multipart/mixed; boundary="===============1888630192897854741=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kernel/unwind_orc.c:212:16-17: WARNING opportunity for swap()
Date: Sun, 28 Nov 2021 02:45:59 +0800
Message-ID: <202111280236.BjrkRXA9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1888630192897854741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: 7845daa8bd72efa8bbc1de122edfce6e058bbe41 coccinelle: misc: add swap=
 script
date:   7 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c023-20211126 (https://download.01.org/0day-ci/ar=
chive/20211128/202111280236.BjrkRXA9-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> arch/x86/kernel/unwind_orc.c:212:16-17: WARNING opportunity for swap()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1888630192897854741==--

