Content-Type: multipart/mixed; boundary="===============2467361143180226840=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/rxrpc/input.c:870:38-39: WARNING opportunity for min()
Date: Fri, 22 Apr 2022 07:47:37 +0800
Message-ID: <202204220716.YVD1Mvku-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2467361143180226840==
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
head:   59f0c2447e2553b0918b4a9fd38763a5c0587d02
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
422/202204220716.YVD1Mvku-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> net/rxrpc/input.c:870:38-39: WARNING opportunity for min()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2467361143180226840==--

