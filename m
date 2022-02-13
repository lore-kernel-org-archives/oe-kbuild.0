Content-Type: multipart/mixed; boundary="===============6119729547228128118=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 635/923] drivers/gpu/drm/xlnx/xlnx_sdi.c:1311:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before goto around lines 1325.
Date: Sun, 13 Feb 2022 13:44:51 +0800
Message-ID: <202202131335.2EfKfFom-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6119729547228128118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Saurabh Sengar <saurabh.singh@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Hyun Kwon <hyun.kwon@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   966124532656bc95d781abf57531e4cd4f962237
commit: eedc9b61ce549e6a1af512cc21dfd7fa487d0823 [635/923] drm: xlnx: sdi: =
Adding sdi-tx driver
:::::: branch date: 3 days ago
:::::: commit date: 12 days ago
config: alpha-randconfig-c024-20220208 (https://download.01.org/0day-ci/arc=
hive/20220213/202202131335.2EfKfFom-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:1311:1-23: WARNING: Function "for_each_c=
hild_of_node" should have of_node_put() before goto around lines 1325.
   drivers/gpu/drm/xlnx/xlnx_sdi.c:1311:1-23: WARNING: Function "for_each_c=
hild_of_node" should have of_node_put() before goto around lines 1333.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6119729547228128118==--

