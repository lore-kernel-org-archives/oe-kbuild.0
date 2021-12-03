Content-Type: multipart/mixed; boundary="===============5868932894955729056=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4129/4921] drivers/net/ethernet/marvell/prestera/prestera_hw.c:446:35-40: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Date: Fri, 03 Dec 2021 09:32:16 +0800
Message-ID: <202112030943.TW7xScmd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5868932894955729056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Volodymyr Mytnyk <vmytnyk@marvell.com>
CC: Serhiy Boiko <serhiy.boiko@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   9606f9efb1cec7f8f5912326f182fbfbcad34382
commit: 6e36c7bcb4611414b339173cdc33fdcb55c08f9e [4129/4921] net: prestera:=
 add counter HW API
:::::: branch date: 19 hours ago
:::::: commit date: 3 days ago
config: sparc64-randconfig-c003-20211202 (https://download.01.org/0day-ci/a=
rchive/20211203/202112030943.TW7xScmd-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/prestera/prestera_hw.c:446:35-40: WARNING u=
se flexible-array member instead (https://www.kernel.org/doc/html/latest/pr=
ocess/deprecated.html#zero-length-and-one-element-arrays)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5868932894955729056==--

