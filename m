Content-Type: multipart/mixed; boundary="===============4744940257683443394=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 861/1181] drivers/spi/spi-xilinx.c:692:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before return around line 697.
Date: Tue, 21 Jun 2022 01:25:40 +0800
Message-ID: <202206210106.TM0vtap0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4744940257683443394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
CC: Tejas Prajapati Rameshchandra <tejaspra@xilinx.com>
CC: Naga Sureshkumar Relli <nagasure@xilinx.com>
CC: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   59523b5c4aca0174f1f8cba2a07d3b3328b7c80e
commit: 3973536c456079bf3d09e9a97bf33d29422b183f [861/1181] spi: spi-xilinx=
: Updated axi-qspi controller driver
:::::: branch date: 5 days ago
:::::: commit date: 5 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
621/202206210106.TM0vtap0-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-xilinx.c:692:1-33: WARNING: Function "for_each_available=
_child_of_node" should have of_node_put() before return around line 697.
>> drivers/spi/spi-xilinx.c:692:1-33: WARNING: Function "for_each_available=
_child_of_node" should have of_node_put() before break around line 703.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4744940257683443394==--

