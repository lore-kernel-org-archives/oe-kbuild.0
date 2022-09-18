Content-Type: multipart/mixed; boundary="===============1545990248685400607=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/team/team.c:2303:3-10: WARNING: NULL check before dev_{put, hold} functions is not needed.
Date: Sun, 18 Sep 2022 08:03:25 +0800
Message-ID: <202209180724.snnNdD8K-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1545990248685400607==
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
head:   a335366bad1364a07f49df9da1fdfa6d411a5f39
commit: bbd5c96850d9de535a83a3a3842dec2169cb31d1 scripts/coccinelle/free: a=
dd NULL test before dev_{put, hold} functions
date:   9 weeks ago
:::::: branch date: 28 hours ago
:::::: commit date: 9 weeks ago
config: powerpc-randconfig-c031-20220918 (https://download.01.org/0day-ci/a=
rchive/20220918/202209180724.snnNdD8K-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/net/team/team.c:2303:3-10: WARNING: NULL check before dev_{put, =
hold} functions is not needed.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1545990248685400607==--

