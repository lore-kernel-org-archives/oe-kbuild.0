Content-Type: multipart/mixed; boundary="===============7083136708490281250=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/rc/meson-ir-tx.c:327:2-9: line 327 is redundant because platform_get_irq() already prints an error
Date: Thu, 02 Dec 2021 05:53:20 +0800
Message-ID: <202112020519.TtRIzUS1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7083136708490281250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sean Young <sean@mess.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: 49be1c78d575eedf862a05aebfd5ab5c24193f61 media: rc: introduce Meson=
 IR TX driver
date:   4 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 4 months ago
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20211=
202/202112020519.TtRIzUS1-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/media/rc/meson-ir-tx.c:327:2-9: line 327 is redundant because pl=
atform_get_irq() already prints an error

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7083136708490281250==--

