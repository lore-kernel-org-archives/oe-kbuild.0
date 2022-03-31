Content-Type: multipart/mixed; boundary="===============5611227519959712101=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/tty/goldfish.c:95:12-13: WARNING opportunity for min()
Date: Thu, 31 Mar 2022 09:56:31 +0800
Message-ID: <202203310917.O9uawonS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5611227519959712101==
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
head:   74164d284b2909de0ba13518cc063e9ea9334749
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20331/202203310917.O9uawonS-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/tty/goldfish.c:95:12-13: WARNING opportunity for min()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5611227519959712101==--

