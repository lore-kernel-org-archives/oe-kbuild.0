Content-Type: multipart/mixed; boundary="===============0248598098800165130=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 861/872] drivers/spi/spi-xilinx.c:692:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before return around line 697.
Date: Tue, 08 Feb 2022 19:28:57 +0800
Message-ID: <202202081907.UgCHaFan-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0248598098800165130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
CC: Tejas Prajapati Rameshchandra <tejaspra@xilinx.com>
CC: Naga Sureshkumar Relli <nagasure@xilinx.com>
CC: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   1183ce490adb103e5e569b8ebd74c50c885ddc05
commit: 3973536c456079bf3d09e9a97bf33d29422b183f [861/872] spi: spi-xilinx:=
 Updated axi-qspi controller driver
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-c002-20220207 (https://download.01.org/0day-ci/ar=
chive/20220208/202202081907.UgCHaFan-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-xilinx.c:692:1-33: WARNING: Function "for_each_available=
_child_of_node" should have of_node_put() before return around line 697.
>> drivers/spi/spi-xilinx.c:692:1-33: WARNING: Function "for_each_available=
_child_of_node" should have of_node_put() before break around line 703.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0248598098800165130==--

