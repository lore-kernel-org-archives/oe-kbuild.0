Content-Type: multipart/mixed; boundary="===============5777947662651917811=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/video/fbdev/core/fbcon.c:605:16-17: WARNING opportunity for min()
Date: Sat, 12 Feb 2022 18:39:39 +0800
Message-ID: <202202121748.vOWEcbGM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5777947662651917811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   83e396641110663d3c7bb25b9bc0c6a750359ecf
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: nds32-randconfig-c003-20220209 (https://download.01.org/0day-ci/arc=
hive/20220212/202202121748.vOWEcbGM-lkp(a)intel.com/config)
compiler: nds32le-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/core/fbcon.c:605:16-17: WARNING opportunity for min()
--
>> fs/btrfs/qgroup.c:515:12-13: WARNING opportunity for min()
--
>> fs/btrfs/scrub.c:3053:12-13: WARNING opportunity for min()
   fs/btrfs/scrub.c:3513:12-13: WARNING opportunity for min()
--
>> fs/btrfs/volumes.c:7531:13-14: WARNING opportunity for min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5777947662651917811==--

