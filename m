Content-Type: multipart/mixed; boundary="===============7650170689551262850=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 541/923] drivers/iio/adc/xilinx-ams.c:917:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 923.
Date: Mon, 14 Feb 2022 20:34:22 +0800
Message-ID: <202202142056.7QsyMcEo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7650170689551262850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Rajnikant Bhojani <rajnikant.bhojani@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Hyun Kwon <hyun.kwon@xilinx.com>
CC: Shubhrajyoti Datta <shubhraj@xilinx.com>
CC: "Jean-Francois Dagenais" <jeff.dagenais@gmail.com>
CC: Olivier Dugas <dugaso@sonatest.com>
CC: Manish Narani <mnarani@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   966124532656bc95d781abf57531e4cd4f962237
commit: d073b83d3f8f3ba83c59f7502371b1cf9eb35e92 [541/923] iio: adc: Add Xi=
linx AMS driver
:::::: branch date: 4 days ago
:::::: commit date: 13 days ago
config: alpha-randconfig-c024-20220208 (https://download.01.org/0day-ci/arc=
hive/20220214/202202142056.7QsyMcEo-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/iio/adc/xilinx-ams.c:917:1-23: WARNING: Function "for_each_child=
_of_node" should have of_node_put() before return around line 923.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7650170689551262850==--

