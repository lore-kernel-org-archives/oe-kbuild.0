Content-Type: multipart/mixed; boundary="===============4369513189153406933=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/offload.c:122:2-9: WARNING: NULL check before dev_{put, hold} functions is not needed.
Date: Fri, 19 Aug 2022 22:50:17 +0800
Message-ID: <202208192220.E2CgYB6t-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4369513189153406933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ziyang Xuan <william.xuanziyang@huawei.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

scripts/coccinelle/free/ifnulldev_put.cocci
tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4c2d0b039c5cc0112206a5b22431b577cb1c57ad
commit: bbd5c96850d9de535a83a3a3842dec2169cb31d1 scripts/coccinelle/free: a=
dd NULL test before dev_{put, hold} functions
date:   5 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 weeks ago
config: openrisc-randconfig-c031-20220819 (https://download.01.org/0day-ci/=
archive/20220819/202208192220.E2CgYB6t-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/offload.c:122:2-9: WARNING: NULL check before dev_{put, hold}=
 functions is not needed.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4369513189153406933==--

