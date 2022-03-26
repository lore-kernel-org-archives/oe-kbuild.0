Content-Type: multipart/mixed; boundary="===============5744596726298039600=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 541/1029] drivers/iio/adc/xilinx-ams.c:917:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 923.
Date: Sat, 26 Mar 2022 08:47:42 +0800
Message-ID: <202203260819.6o9L0nMg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5744596726298039600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Rajnikant Bhojani <rajnikant.bhojani@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Hyun Kwon <hyun.kwon@xilinx.com>
CC: Shubhrajyoti Datta <shubhraj@xilinx.com>
CC: "Jean-Francois Dagenais" <jeff.dagenais@gmail.com>
CC: Olivier Dugas <dugaso@sonatest.com>
CC: Manish Narani <mnarani@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: d073b83d3f8f3ba83c59f7502371b1cf9eb35e92 [541/1029] iio: adc: Add X=
ilinx AMS driver
:::::: branch date: 35 hours ago
:::::: commit date: 8 weeks ago
config: sparc64-randconfig-c023-20220324 (https://download.01.org/0day-ci/a=
rchive/20220326/202203260819.6o9L0nMg-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/iio/adc/xilinx-ams.c:917:1-23: WARNING: Function "for_each_child=
_of_node" should have of_node_put() before return around line 923.

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5744596726298039600==--

