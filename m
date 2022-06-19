Content-Type: multipart/mixed; boundary="===============0732292394016087029=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 550/1181] drivers/remoteproc/remoteproc_sysfs.c:244:17-19: WARNING opportunity for min()
Date: Sun, 19 Jun 2022 21:34:00 +0800
Message-ID: <202206192126.xAUNQOxi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0732292394016087029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Wendy Liang <wendy.liang@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   59523b5c4aca0174f1f8cba2a07d3b3328b7c80e
commit: 2b9408d09dc6367fd2f0820f0c7beab69e9aed56 [550/1181] remoteproc: Add=
 support for peek from remote and acking kick from remote
:::::: branch date: 4 days ago
:::::: commit date: 5 months ago
config: s390-randconfig-c024-20220619 (https://download.01.org/0day-ci/arch=
ive/20220619/202206192126.xAUNQOxi-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/remoteproc/remoteproc_sysfs.c:244:17-19: WARNING opportunity for=
 min()

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0732292394016087029==--

