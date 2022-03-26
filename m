Content-Type: multipart/mixed; boundary="===============2821034434131796760=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 840/1029] drivers/mtd/spi-nor/core.c:2037:10-11: WARNING opportunity for min()
Date: Sat, 26 Mar 2022 08:27:10 +0800
Message-ID: <202203260808.cODP9Z29-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2821034434131796760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: 2747bc2106aa429773d9a932c799aa6229595148 [840/1029] mtd: spi-nor: A=
dd dual parallel and stacked mode support
:::::: branch date: 34 hours ago
:::::: commit date: 8 weeks ago
config: sparc-randconfig-c024-20220324 (https://download.01.org/0day-ci/arc=
hive/20220326/202203260808.cODP9Z29-lkp(a)intel.com/config)
compiler: sparc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/spi-nor/core.c:2037:10-11: WARNING opportunity for min()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2821034434131796760==--

