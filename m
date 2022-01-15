Content-Type: multipart/mixed; boundary="===============4769355352826304423=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/regulator/qcom_smd-regulator.c:1318:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before return around line 1321.
Date: Sat, 15 Jan 2022 12:48:29 +0800
Message-ID: <202201151222.2xt6Lcxp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4769355352826304423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Konrad Dybcio <konrad.dybcio@somainline.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   112450df61b7373529b0fe4c122ad13b89d80a8a
commit: 14e2976fbabdacb01335d7f91eeebbc89c67ddb1 regulator: qcom_smd: Align=
 probe function with rpmh-regulator
date:   9 days ago
:::::: branch date: 13 hours ago
:::::: commit date: 9 days ago
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20220115/=
202201151222.2xt6Lcxp-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/qcom_smd-regulator.c:1318:1-33: WARNING: Function "for=
_each_available_child_of_node" should have of_node_put() before return arou=
nd line 1321.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4769355352826304423==--

