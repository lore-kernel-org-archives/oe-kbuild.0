Content-Type: multipart/mixed; boundary="===============5541531524931485645=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/regulator/qcom-labibb-regulator.c:372:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Date: Wed, 09 Mar 2022 22:45:09 +0800
Message-ID: <202203092209.RxJqGxgT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5541531524931485645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Guenter Roeck <linux@roeck-us.net>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

Hi Guenter,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   330f4c53d3c2d8b11d86ec03a964b86dc81452f5
commit: a18b14d8886614b3c7d290c4cfc33389822b0535 riscv: Disable STACKPROTEC=
TOR_PER_TASK if GCC_PLUGIN_RANDSTRUCT is enabled
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/2022030=
9/202203092209.RxJqGxgT-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/qcom-labibb-regulator.c:372:8-33: WARNING: Threaded IR=
Q with no primary handler requested without IRQF_ONESHOT (unless it is nest=
ed IRQ)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5541531524931485645==--

