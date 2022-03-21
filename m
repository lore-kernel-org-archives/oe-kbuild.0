Content-Type: multipart/mixed; boundary="===============3206152340995857011=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/sibyte/common/sb_tbprof.c:462:19-20: WARNING opportunity for min()
Date: Mon, 21 Mar 2022 20:01:37 +0800
Message-ID: <202203211936.Ym0Bumni-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3206152340995857011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f443e374ae131c168a065ea1748feac6b2e76613
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-c003-20220321 (https://download.01.org/0day-ci/arch=
ive/20220321/202203211936.Ym0Bumni-lkp(a)intel.com/config)
compiler: mipsel-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> arch/mips/sibyte/common/sb_tbprof.c:462:19-20: WARNING opportunity for m=
in()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3206152340995857011==--

