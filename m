Content-Type: multipart/mixed; boundary="===============2698932285982117327=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1350/3682] drivers/thermal/thermal_of.c:1297:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before break around line 1300.
Date: Sat, 27 Aug 2022 06:44:43 +0800
Message-ID: <202208270622.0O59UTN1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2698932285982117327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Daniel Lezcano <daniel.lezcano@linexp.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8d0c42c9e80791e8baba2932d2cbd2dcead50d47
commit: 3fd6d6e2b4e80fe45bfd1c8f01dff7d30a0f9b53 [1350/3682] thermal/of: Re=
work the thermal device tree initialization
:::::: branch date: 15 hours ago
:::::: commit date: 9 days ago
config: mips-randconfig-c003-20220827 (https://download.01.org/0day-ci/arch=
ive/20220827/202208270622.0O59UTN1-lkp(a)intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/thermal/thermal_of.c:1297:1-23: WARNING: Function "for_each_chil=
d_of_node" should have of_node_put() before break around line 1300.
   drivers/thermal/thermal_of.c:668:1-23: WARNING: Function "for_each_child=
_of_node" should have of_node_put() before goto around lines 671.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2698932285982117327==--

