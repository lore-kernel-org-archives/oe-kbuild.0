Content-Type: multipart/mixed; boundary="===============6313802168727856580=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/core/lag.c:98:2-10: WARNING: NULL check before dev_{put, hold} functions is not needed.
Date: Mon, 29 Aug 2022 01:21:25 +0800
Message-ID: <202208290104.4Goz5Ji3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6313802168727856580==
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
head:   10d4879f9ef01cc6190fafe4257d06f375bab92c
commit: bbd5c96850d9de535a83a3a3842dec2169cb31d1 scripts/coccinelle/free: a=
dd NULL test before dev_{put, hold} functions
date:   6 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 weeks ago
config: sparc64-randconfig-c032-20220828 (https://download.01.org/0day-ci/a=
rchive/20220829/202208290104.4Goz5Ji3-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/infiniband/core/lag.c:98:2-10: WARNING: NULL check before dev_{p=
ut, hold} functions is not needed.
   drivers/infiniband/core/lag.c:107:2-9: WARNING: NULL check before dev_{p=
ut, hold} functions is not needed.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6313802168727856580==--

