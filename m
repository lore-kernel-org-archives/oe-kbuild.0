Content-Type: multipart/mixed; boundary="===============8137396715453953854=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 848/872] drivers/spi/spi-zynqmp-gqspi.c:1331:2-9: line 1331 is redundant because platform_get_irq() already prints an error
Date: Sat, 05 Feb 2022 00:06:59 +0800
Message-ID: <202202050012.ev9HmPhu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8137396715453953854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   1183ce490adb103e5e569b8ebd74c50c885ddc05
commit: ad3ea50420b2f1742f84afbb0de7dd0b355298c2 [848/872] spi: spi-zynqmp-=
gqspi: Add dual parallel and stacked mode support in driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c002-20220131 (https://download.01.org/0day-ci/ar=
chive/20220205/202202050012.ev9HmPhu-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-zynqmp-gqspi.c:1331:2-9: line 1331 is redundant because =
platform_get_irq() already prints an error

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8137396715453953854==--

