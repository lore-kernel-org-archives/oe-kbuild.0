Content-Type: multipart/mixed; boundary="===============6093199612140858434=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 857/872] drivers/spi/spi-zynqmp-gqspi.c:1393:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before break around line 1398.
Date: Sat, 05 Feb 2022 03:10:20 +0800
Message-ID: <202202050352.NmProVgV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6093199612140858434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   1183ce490adb103e5e569b8ebd74c50c885ddc05
commit: f0fcd7d140361b1f54cfd76afb8c3afc9bf218a5 [857/872] spi: spi-zynqmp-=
gqspi: Fix suspend/resume
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c002-20220131 (https://download.01.org/0day-ci/ar=
chive/20220205/202202050352.NmProVgV-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-zynqmp-gqspi.c:1393:1-33: WARNING: Function "for_each_av=
ailable_child_of_node" should have of_node_put() before break around line 1=
398.
   drivers/spi/spi-zynqmp-gqspi.c:1405:1-33: WARNING: Function "for_each_av=
ailable_child_of_node" should have of_node_put() before break around line 1=
410.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6093199612140858434==--

