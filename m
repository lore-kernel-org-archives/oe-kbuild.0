Content-Type: multipart/mixed; boundary="===============2906215932253658466=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/offload.c:122:2-9: WARNING: NULL check before dev_{put, hold} functions is not needed.
Date: Tue, 23 Aug 2022 19:17:54 +0800
Message-ID: <202208231911.mVAkGTV8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2906215932253658466==
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
head:   072e51356cd5a4a1c12c1020bc054c99b98333df
commit: bbd5c96850d9de535a83a3a3842dec2169cb31d1 scripts/coccinelle/free: a=
dd NULL test before dev_{put, hold} functions
date:   5 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20823/202208231911.mVAkGTV8-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/offload.c:122:2-9: WARNING: NULL check before dev_{put, hold}=
 functions is not needed.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2906215932253658466==--

