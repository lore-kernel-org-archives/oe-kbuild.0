Content-Type: multipart/mixed; boundary="===============4212981533502880804=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:master 30/530] drivers/remoteproc/remoteproc_sysfs.c:244:17-19: WARNING opportunity for min()
Date: Sun, 08 May 2022 05:36:08 +0800
Message-ID: <202205080552.Hfeod1Th-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4212981533502880804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   d7d99e0d1629b249f6b118eb6a8e492e4334b1ea
commit: 9b62852ec04b7d48971ce8016b13c27403929908 [30/530] Merge tag 'v5.15'=
 into master
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20508/202205080552.Hfeod1Th-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/remoteproc/remoteproc_sysfs.c:244:17-19: WARNING opportunity for=
 min()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4212981533502880804==--

