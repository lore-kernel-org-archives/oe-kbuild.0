Content-Type: multipart/mixed; boundary="===============2545001610777762809=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/ingenic/cgu.c:39:3: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses.
Date: Thu, 22 Oct 2020 02:01:13 +0800
Message-ID: <202010220207.v9doNXlA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2545001610777762809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Stephen Boyd <sboyd@kernel.org>
CC: Paul Cercueil <paul@crapouillou.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c4d6fe7311762f2e03b3c27ad38df7c40c80cc93
commit: cd94eade0b2ab7673a97223d09406abf668b7f73 clk: ingenic: Allow driver=
s to be built with COMPILE_TEST
date:   11 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 11 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/ingenic/cgu.c:39:3: warning: Boolean result is used in bitwi=
se operation. Clarify expression with parentheses. [clarifyCondition]
     ^ info->clear_to_gate;
     ^

vim +39 drivers/clk/ingenic/cgu.c

b066303fb3e72a9 Paul Burton   2015-05-24  23  =

b066303fb3e72a9 Paul Burton   2015-05-24  24  /**
b066303fb3e72a9 Paul Burton   2015-05-24  25   * ingenic_cgu_gate_get() - g=
et the value of clock gate register bit
b066303fb3e72a9 Paul Burton   2015-05-24  26   * @cgu: reference to the CGU=
 whose registers should be read
b066303fb3e72a9 Paul Burton   2015-05-24  27   * @info: info struct describ=
ing the gate bit
b066303fb3e72a9 Paul Burton   2015-05-24  28   *
b066303fb3e72a9 Paul Burton   2015-05-24  29   * Retrieves the state of the=
 clock gate bit described by info. The
b066303fb3e72a9 Paul Burton   2015-05-24  30   * caller must hold cgu->lock.
b066303fb3e72a9 Paul Burton   2015-05-24  31   *
b066303fb3e72a9 Paul Burton   2015-05-24  32   * Return: true if the gate b=
it is set, else false.
b066303fb3e72a9 Paul Burton   2015-05-24  33   */
b066303fb3e72a9 Paul Burton   2015-05-24  34  static inline bool
b066303fb3e72a9 Paul Burton   2015-05-24  35  ingenic_cgu_gate_get(struct i=
ngenic_cgu *cgu,
b066303fb3e72a9 Paul Burton   2015-05-24  36  		     const struct ingenic_c=
gu_gate_info *info)
b066303fb3e72a9 Paul Burton   2015-05-24  37  {
7ef3844fc519806 Paul Cercueil 2018-05-20  38  	return !!(readl(cgu->base + =
info->reg) & BIT(info->bit))
7ef3844fc519806 Paul Cercueil 2018-05-20 @39  		^ info->clear_to_gate;
b066303fb3e72a9 Paul Burton   2015-05-24  40  }
b066303fb3e72a9 Paul Burton   2015-05-24  41  =


:::::: The code at line 39 was first introduced by commit
:::::: 7ef3844fc5198065dbe8776798206c10859d209e clk: ingenic: Add support f=
or clocks whose gate bit is inverted

:::::: TO: Paul Cercueil <paul@crapouillou.net>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2545001610777762809==--

