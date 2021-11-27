Content-Type: multipart/mixed; boundary="===============7031062393788139274=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/pinctrl-apple-gpio.c:39:4-11: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Date: Sun, 28 Nov 2021 01:33:32 +0800
Message-ID: <202111280135.35v5bdRk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7031062393788139274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Joey Gouly <joey.gouly@arm.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Stan Skowronek <stan@corellium.com>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: a0f160ffcb83de6a04fa75f9e7bdfe969f2863f7 pinctrl: add pinctrl/GPIO =
driver for Apple SoCs
date:   5 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 weeks ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/2021112=
8/202111280135.35v5bdRk-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-apple-gpio.c:39:4-11: WARNING use flexible-array=
 member instead (https://www.kernel.org/doc/html/latest/process/deprecated.=
html#zero-length-and-one-element-arrays)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7031062393788139274==--

