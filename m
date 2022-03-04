Content-Type: multipart/mixed; boundary="===============6030204341770479107=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/altera-stapl/altera-lpt.c:20 byteblaster_write() warn: ignoring unreachable code.
Date: Fri, 04 Mar 2022 12:09:04 +0800
Message-ID: <202203041254.rRtAQNsL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6030204341770479107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   38f80f42147ff658aff218edb0a88c37e58bf44f
commit: 6968e707d371ef80511448c6771daf445b4a5cf5 parisc: io: Improve the ou=
tb(), outw() and outl() macros
date:   8 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 weeks ago
config: parisc-randconfig-m031-20220304 (https://download.01.org/0day-ci/ar=
chive/20220304/202203041254.rRtAQNsL-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/misc/altera-stapl/altera-lpt.c:20 byteblaster_write() warn: ignorin=
g unreachable code.

vim +20 drivers/misc/altera-stapl/altera-lpt.c

fa766c9be58bd8 drivers/staging/altera-stapl/altera-lpt.c Igor M. Liplianin =
2011-01-25  17  =

fa766c9be58bd8 drivers/staging/altera-stapl/altera-lpt.c Igor M. Liplianin =
2011-01-25  18  static void byteblaster_write(int port, int data)
fa766c9be58bd8 drivers/staging/altera-stapl/altera-lpt.c Igor M. Liplianin =
2011-01-25  19  {
fa766c9be58bd8 drivers/staging/altera-stapl/altera-lpt.c Igor M. Liplianin =
2011-01-25 @20  	outb((u8)data, (u16)(port + 0x378));
fa766c9be58bd8 drivers/staging/altera-stapl/altera-lpt.c Igor M. Liplianin =
2011-01-25  21  };
fa766c9be58bd8 drivers/staging/altera-stapl/altera-lpt.c Igor M. Liplianin =
2011-01-25  22  =


:::::: The code at line 20 was first introduced by commit
:::::: fa766c9be58bd872784b081074a7d15a3ce61c5f [media] Altera FPGA firmwar=
e download module

:::::: TO: Igor M. Liplianin <liplianin@me.by>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6030204341770479107==--

