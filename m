Content-Type: multipart/mixed; boundary="===============8663237388405721591=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 797/872] drivers/gpu/drm/xlnx/zynqmp_disp.c:132:19-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Date: Sat, 05 Feb 2022 22:59:04 +0800
Message-ID: <202202052203.TDerbJwb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8663237388405721591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Jianqiang Chen <jianqiang.chen@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   1183ce490adb103e5e569b8ebd74c50c885ddc05
commit: 2d2fa5c476daa40a5aac243bd776cab2568c7111 [797/872] drm: xlnx: Updat=
e DP subsystem with downstream version
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-c023-20220131 (https://download.01.org/0day-ci/arc=
hive/20220205/202202052203.TDerbJwb-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xlnx/zynqmp_disp.c:132:19-22: WARNING use flexible-array=
 member instead (https://www.kernel.org/doc/html/latest/process/deprecated.=
html#zero-length-and-one-element-arrays)
--
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:1965:1-23: WARNING: Function "for_each_=
child_of_node" should have of_node_put() before break around line 1970.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8663237388405721591==--

