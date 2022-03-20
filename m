Content-Type: multipart/mixed; boundary="===============4080504438562756849=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm-raid.c:3218:44-45: WARNING opportunity for min()
Date: Sun, 20 Mar 2022 12:01:32 +0800
Message-ID: <202203201139.LkZfY1T1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4080504438562756849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   34e047aa16c0123bbae8e2f6df33e5ecc1f56601
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   11 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 11 months ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220320/202203201139.LkZfY1T1-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/md/dm-raid.c:3218:44-45: WARNING opportunity for min()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4080504438562756849==--

