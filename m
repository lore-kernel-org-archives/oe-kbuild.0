Content-Type: multipart/mixed; boundary="===============0244130865764601252=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 635/907] drivers/gpu/drm/xlnx/xlnx_sdi.c:1311:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before goto around lines 1325.
Date: Thu, 10 Feb 2022 11:03:33 +0800
Message-ID: <202202101047.pC57aeLz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0244130865764601252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Saurabh Sengar <saurabh.singh@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Hyun Kwon <hyun.kwon@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   423a108a01e05e84b59a4c4885c16bf3cd8c90c7
commit: eedc9b61ce549e6a1af512cc21dfd7fa487d0823 [635/907] drm: xlnx: sdi: =
Adding sdi-tx driver
:::::: branch date: 17 hours ago
:::::: commit date: 9 days ago
config: alpha-randconfig-c024-20220208 (https://download.01.org/0day-ci/arc=
hive/20220210/202202101047.pC57aeLz-lkp(a)intel.com/config)
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
--===============0244130865764601252==--

