Content-Type: multipart/mixed; boundary="===============5724955497906755942=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 840/872] drivers/mtd/spi-nor/core.c:2037:10-11: WARNING opportunity for min()
Date: Wed, 09 Feb 2022 05:07:49 +0800
Message-ID: <202202090528.gbvHGW2s-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5724955497906755942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   1183ce490adb103e5e569b8ebd74c50c885ddc05
commit: 2747bc2106aa429773d9a932c799aa6229595148 [840/872] mtd: spi-nor: Ad=
d dual parallel and stacked mode support
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: ia64-randconfig-c023-20220208 (https://download.01.org/0day-ci/arch=
ive/20220209/202202090528.gbvHGW2s-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/spi-nor/core.c:2037:10-11: WARNING opportunity for min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5724955497906755942==--

