Content-Type: multipart/mixed; boundary="===============3662583251240643653=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 541/924] drivers/iio/adc/xilinx-ams.c:917:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 923.
Date: Wed, 16 Feb 2022 01:52:26 +0800
Message-ID: <202202160105.8dD9xXcn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3662583251240643653==
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

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   392586c95ba817468e81d14a767a94f3b43a2898
commit: d073b83d3f8f3ba83c59f7502371b1cf9eb35e92 [541/924] iio: adc: Add Xi=
linx AMS driver
:::::: branch date: 28 hours ago
:::::: commit date: 2 weeks ago
config: alpha-randconfig-c024-20220208 (https://download.01.org/0day-ci/arc=
hive/20220216/202202160105.8dD9xXcn-lkp(a)intel.com/config)
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
--===============3662583251240643653==--

