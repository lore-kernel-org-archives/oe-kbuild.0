Content-Type: multipart/mixed; boundary="===============7092901389749402473=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/input/joystick/adi.c:395:13-14: WARNING opportunity for min()
Date: Thu, 31 Mar 2022 16:33:46 +0800
Message-ID: <202203311613.ig9rkBJl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7092901389749402473==
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
head:   787af64d05cd528aac9ad16752d11bb1c6061bb9
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
331/202203311613.ig9rkBJl-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/input/joystick/adi.c:395:13-14: WARNING opportunity for min()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7092901389749402473==--

