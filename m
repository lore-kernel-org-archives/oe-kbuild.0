Content-Type: multipart/mixed; boundary="===============8872685123261579839=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/ulp/ipoib/ipoib_main.c:333:2-10: WARNING: NULL check before dev_{put, hold} functions is not needed.
Date: Mon, 05 Sep 2022 04:03:07 +0800
Message-ID: <202209050446.bsQvAgZl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8872685123261579839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ziyang Xuan <william.xuanziyang@huawei.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5995497296ade7716c8e70899e02235f2b6d9f5d
commit: bbd5c96850d9de535a83a3a3842dec2169cb31d1 scripts/coccinelle/free: a=
dd NULL test before dev_{put, hold} functions
date:   7 weeks ago
:::::: branch date: 88 minutes ago
:::::: commit date: 7 weeks ago
config: parisc-randconfig-c44-20220904 (https://download.01.org/0day-ci/arc=
hive/20220905/202209050446.bsQvAgZl-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/infiniband/ulp/ipoib/ipoib_main.c:333:2-10: WARNING: NULL check =
before dev_{put, hold} functions is not needed.
   drivers/infiniband/ulp/ipoib/ipoib_main.c:2007:2-9: WARNING: NULL check =
before dev_{put, hold} functions is not needed.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8872685123261579839==--

