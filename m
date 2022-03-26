Content-Type: multipart/mixed; boundary="===============7131580870523378651=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 550/1029] drivers/remoteproc/remoteproc_sysfs.c:244:17-19: WARNING opportunity for min()
Date: Sat, 26 Mar 2022 08:47:46 +0800
Message-ID: <202203260836.0xy9451H-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7131580870523378651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Wendy Liang <wendy.liang@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: 2b9408d09dc6367fd2f0820f0c7beab69e9aed56 [550/1029] remoteproc: Add=
 support for peek from remote and acking kick from remote
:::::: branch date: 35 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20326/202203260836.0xy9451H-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

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
--===============7131580870523378651==--

