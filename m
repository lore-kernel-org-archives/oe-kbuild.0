Content-Type: multipart/mixed; boundary="===============6524733530960341738=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 550/872] drivers/remoteproc/remoteproc_sysfs.c:244:17-19: WARNING opportunity for min()
Date: Wed, 09 Feb 2022 01:11:54 +0800
Message-ID: <202202090148.vR3UdeMM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6524733530960341738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Wendy Liang <wendy.liang@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   1183ce490adb103e5e569b8ebd74c50c885ddc05
commit: 2b9408d09dc6367fd2f0820f0c7beab69e9aed56 [550/872] remoteproc: Add =
support for peek from remote and acking kick from remote
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20209/202202090148.vR3UdeMM-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/remoteproc/remoteproc_sysfs.c:244:17-19: WARNING opportunity for=
 min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6524733530960341738==--

