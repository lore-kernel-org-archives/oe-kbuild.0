Content-Type: multipart/mixed; boundary="===============0206750425340207694=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [axboe-block:for-5.20/io_uring 2/171] io_uring/io-wq.c:401:6-25: atomic_dec_and_test variation before object free at line 408.
Date: Mon, 18 Jul 2022 05:30:19 +0800
Message-ID: <202207180515.FwmrXKZ7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0206750425340207694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-5.20/io_uring
head:   004523ebfe6de8dd664ddf6fc26c47801b3bdaf5
commit: 239b2db7c7ca96b3b7dc883ca90d3b0244e238cd [2/171] io_uring: move to =
separate directory
:::::: branch date: 9 days ago
:::::: commit date: 7 days ago
config: s390-randconfig-c043-20220717 (https://download.01.org/0day-ci/arch=
ive/20220718/202207180515.FwmrXKZ7-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> io_uring/io-wq.c:401:6-25: atomic_dec_and_test variation before object f=
ree at line 408.
--
>> io_uring/io_uring.c:2891:5-10: WARNING: NULL check before some freeing f=
unctions is not needed.
   io_uring/io_uring.c:4228:2-7: WARNING: NULL check before some freeing fu=
nctions is not needed.
   io_uring/io_uring.c:6185:2-7: WARNING: NULL check before some freeing fu=
nctions is not needed.
   io_uring/io_uring.c:5933:2-7: WARNING: NULL check before some freeing fu=
nctions is not needed.
   io_uring/io_uring.c:4331:2-7: WARNING: NULL check before some freeing fu=
nctions is not needed.
--
>> io_uring/io_uring.c:12479:1-7: preceding lock on line 12425

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0206750425340207694==--

