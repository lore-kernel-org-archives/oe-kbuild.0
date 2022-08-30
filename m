Content-Type: multipart/mixed; boundary="===============7613004357120474423=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/team/team.c:2303:3-10: WARNING: NULL check before dev_{put, hold} functions is not needed.
Date: Tue, 30 Aug 2022 22:52:30 +0800
Message-ID: <202208302221.QsOUmd3e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7613004357120474423==
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
head:   dcf8e5633e2e69ad60b730ab5905608b756a032f
commit: bbd5c96850d9de535a83a3a3842dec2169cb31d1 scripts/coccinelle/free: a=
dd NULL test before dev_{put, hold} functions
date:   6 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 weeks ago
config: sparc64-randconfig-c032-20220830 (https://download.01.org/0day-ci/a=
rchive/20220830/202208302221.QsOUmd3e-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/net/team/team.c:2303:3-10: WARNING: NULL check before dev_{put, =
hold} functions is not needed.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7613004357120474423==--

