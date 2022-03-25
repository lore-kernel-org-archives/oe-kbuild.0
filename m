Content-Type: multipart/mixed; boundary="===============5471301910765769029=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/core/pcm_lib.c:77:35-36: WARNING opportunity for max()
Date: Fri, 25 Mar 2022 10:13:54 +0800
Message-ID: <202203251057.sCTcquHA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5471301910765769029==
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
head:   52deda9551a01879b3562e7b41748e85c591f14c
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
325/202203251057.sCTcquHA-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> sound/core/pcm_lib.c:77:35-36: WARNING opportunity for max()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5471301910765769029==--

