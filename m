Content-Type: multipart/mixed; boundary="===============5529840313079644867=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arnd-playground:randconfig-5.17-next 132/205] drivers/video/fbdev/core/fb_logo.c:225:30-31: WARNING opportunity for swap()
Date: Thu, 09 Dec 2021 07:58:14 +0800
Message-ID: <202112090704.xrqZQIpl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5529840313079644867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 randconfig-5.17-next
head:   fdcc9acc26de65e7b1b8cebc3089b7666be25681
commit: 8bbaa3711d100f22e3211cc2c223f7e62d4ba50b [132/205] fbdev: move logo=
 code into separate file
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-c023-20211207 (https://download.01.org/0day-ci/arc=
hive/20211209/202112090704.xrqZQIpl-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/core/fb_logo.c:225:30-31: WARNING opportunity for sw=
ap()
   drivers/video/fbdev/core/fb_logo.c:234:30-31: WARNING opportunity for sw=
ap()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5529840313079644867==--

