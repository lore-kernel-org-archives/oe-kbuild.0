Content-Type: multipart/mixed; boundary="===============0380259144133540155=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/tty/goldfish.c:95:12-13: WARNING opportunity for min()
Date: Sun, 17 Apr 2022 01:52:04 +0800
Message-ID: <202204170102.nEbrjlA2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0380259144133540155==
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
head:   59250f8a7f3a60a2661b84cbafc1e0eb5d05ec9b
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   12 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20417/202204170102.nEbrjlA2-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/tty/goldfish.c:95:12-13: WARNING opportunity for min()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0380259144133540155==--

