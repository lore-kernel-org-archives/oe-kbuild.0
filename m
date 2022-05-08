Content-Type: multipart/mixed; boundary="===============4806062674683414190=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/thermal/thermal_sysfs.c:792:22-23: WARNING opportunity for max()
Date: Mon, 09 May 2022 02:29:02 +0800
Message-ID: <202205090246.oJQBzerq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4806062674683414190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: 0day robot <lkp@intel.com>
CC: Junwen Wu <wudaemon@163.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220508-2326=
00/Zhang-Rui/thermal-thermal_stats-skip-broken-trans_table/20220419-165035
head:   a9158ddd9f2a97e356583d0bdb81c4e6822e6ad7
commit: a9158ddd9f2a97e356583d0bdb81c4e6822e6ad7 thermal/core: change mm al=
loc method to avoid kernel warning
date:   3 hours ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: microblaze-randconfig-c023-20220508 (https://download.01.org/0day-c=
i/archive/20220509/202205090246.oJQBzerq-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/thermal/thermal_sysfs.c:792:22-23: WARNING opportunity for max()
>> drivers/thermal/thermal_sysfs.c:791:22-23: WARNING opportunity for min()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4806062674683414190==--

