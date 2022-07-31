Content-Type: multipart/mixed; boundary="===============7785650576541808535=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [thermal:thermal/next 28/36] drivers/thermal/thermal_of.c:689:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before goto around lines 692.
Date: Sun, 31 Jul 2022 10:35:03 +0800
Message-ID: <202207311043.WDsouQI6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7785650576541808535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Lezcano <daniel.lezcano@linexp.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git the=
rmal/next
head:   d0c75fa2c17f082b32a5f26ff40bf378b12952de
commit: a3193edcbdf9a8ae73b6e1f2da96e920582c1849 [28/36] thermal/of: Replac=
e device node match with device node search
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-c033-20220729 (https://download.01.org/0day-ci/arc=
hive/20220731/202207311043.WDsouQI6-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/thermal/thermal_of.c:689:1-23: WARNING: Function "for_each_child=
_of_node" should have of_node_put() before goto around lines 692.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7785650576541808535==--

