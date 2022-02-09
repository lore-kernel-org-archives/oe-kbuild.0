Content-Type: multipart/mixed; boundary="===============7299375843813441594=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 543/907] drivers/iio/adc/versal-sysmon.c:876:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 879.
Date: Thu, 10 Feb 2022 03:45:33 +0800
Message-ID: <202202100352.j4CqVkcK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7299375843813441594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Dragan Cvetic <dragan.cvetic@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   423a108a01e05e84b59a4c4885c16bf3cd8c90c7
commit: 1459646ab280aa68c3c4fa1d9552ea21f15d7a2d [543/907] iio: versal-sysm=
on: add driver for Versal Sysmon
:::::: branch date: 10 hours ago
:::::: commit date: 9 days ago
config: alpha-randconfig-c024-20220208 (https://download.01.org/0day-ci/arc=
hive/20220210/202202100352.j4CqVkcK-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/iio/adc/versal-sysmon.c:876:1-23: WARNING: Function "for_each_ch=
ild_of_node" should have of_node_put() before return around line 879.
   drivers/iio/adc/versal-sysmon.c:876:1-23: WARNING: Function "for_each_ch=
ild_of_node" should have of_node_put() before return around line 883.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7299375843813441594==--

