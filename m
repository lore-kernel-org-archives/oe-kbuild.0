Content-Type: multipart/mixed; boundary="===============6540790876739027948=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2018/3632] drivers/net/dsa/ocelot/felix_vsc9959.c:1388:26-33: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Date: Fri, 26 Nov 2021 01:18:31 +0800
Message-ID: <202111260143.hi7uK4V1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6540790876739027948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f81e94e91878bded599cc60f2881cfd50991aeb9
commit: 23ae3a7877718931474684ef4fbbaf1d1511ee84 [2018/3632] net: dsa: feli=
x: add stream gate settings for psfp
:::::: branch date: 12 hours ago
:::::: commit date: 7 days ago
config: mips-randconfig-c024-20211124 (https://download.01.org/0day-ci/arch=
ive/20211126/202111260143.hi7uK4V1-lkp(a)intel.com/config)
compiler: mipsel-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/dsa/ocelot/felix_vsc9959.c:1388:26-33: WARNING use flexible-=
array member instead (https://www.kernel.org/doc/html/latest/process/deprec=
ated.html#zero-length-and-one-element-arrays)
--
>> drivers/net/dsa/ocelot/felix_vsc9959.c:1855:22-25: ERROR: reference prec=
eded by free on line 1865

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6540790876739027948==--

