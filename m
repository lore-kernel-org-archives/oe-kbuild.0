Content-Type: multipart/mixed; boundary="===============5137326911145858818=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/core/seq/seq_ports.c:142:12-14: WARNING opportunity for max()
Date: Mon, 28 Mar 2022 20:05:51 +0800
Message-ID: <202203282048.KbPetXnh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5137326911145858818==
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
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
328/202203282048.KbPetXnh-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> sound/core/seq/seq_ports.c:142:12-14: WARNING opportunity for max()
--
>> sound/core/timer.c:279:12-13: WARNING opportunity for min()
   sound/core/timer.c:259:12-13: WARNING opportunity for min()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5137326911145858818==--

