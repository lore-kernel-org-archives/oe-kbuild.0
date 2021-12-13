Content-Type: multipart/mixed; boundary="===============0046861400657890190=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/um/os-Linux/sigio.c:81:28-29: WARNING opportunity for swap()
Date: Tue, 14 Dec 2021 01:04:31 +0800
Message-ID: <202112140113.RM7VjE3T-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0046861400657890190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2585cf9dfaaddf00b069673f27bb3f8530e2039c
commit: 7845daa8bd72efa8bbc1de122edfce6e058bbe41 coccinelle: misc: add swap=
 script
date:   8 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 months ago
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20211214=
/202112140113.RM7VjE3T-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> arch/um/os-Linux/sigio.c:81:28-29: WARNING opportunity for swap()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0046861400657890190==--

