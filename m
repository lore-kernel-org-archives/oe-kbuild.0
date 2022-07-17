Content-Type: multipart/mixed; boundary="===============7747371246218755665=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:axboe/linux-block/for-next 12/112] drivers/block/ublk_drv.c:102:16-19: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Date: Sun, 17 Jul 2022 17:26:27 +0800
Message-ID: <202207171700.n2nF1Xe6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7747371246218755665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Ming Lei <ming.lei@redhat.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/for-ne=
xt
head:   b1fc9e8ad3d2d294d15e87d57af00890cd23cfc4
commit: 71f28f3136aff5890cd56de78abc673f8393cad9 [12/112] ublk_drv: add io_=
uring based userspace block driver
:::::: branch date: 21 hours ago
:::::: commit date: 3 days ago
config: sparc64-randconfig-c031-20220715 (https://download.01.org/0day-ci/a=
rchive/20220717/202207171700.n2nF1Xe6-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/block/ublk_drv.c:102:16-19: WARNING use flexible-array member in=
stead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-=
length-and-one-element-arrays)
--
>> drivers/block/ublk_drv.c:1400:2-3: Unneeded semicolon
   drivers/block/ublk_drv.c:1461:2-3: Unneeded semicolon

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7747371246218755665==--

