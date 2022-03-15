Content-Type: multipart/mixed; boundary="===============1197310546365155234=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/cs35l41.c:1103:60: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Tue, 15 Mar 2022 22:36:57 +0800
Message-ID: <202203152258.nCo1I8qU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1197310546365155234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: fe1024d50477becf35128f3ef03bf3525a2cd140 ASoC: cs35l41: Combine adj=
acent register writes
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/codecs/cs35l41.c:1103:60: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
         irq_gpio_cfg1->irq_pol_inv << CS35L41_GPIO_POL_SHIFT |
                                                              ^
   sound/soc/codecs/cs35l41.c:1108:60: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
         irq_gpio_cfg1->irq_pol_inv << CS35L41_GPIO_POL_SHIFT |
                                                              ^

vim +1103 sound/soc/codecs/cs35l41.c

6450ef55905688 David Rhodes   2021-09-07  1094  =

6450ef55905688 David Rhodes   2021-09-07  1095  static int cs35l41_irq_gpio=
_config(struct cs35l41_private *cs35l41)
6450ef55905688 David Rhodes   2021-09-07  1096  {
6450ef55905688 David Rhodes   2021-09-07  1097  	struct cs35l41_irq_cfg *ir=
q_gpio_cfg1 =3D &cs35l41->pdata.irq_config1;
6450ef55905688 David Rhodes   2021-09-07  1098  	struct cs35l41_irq_cfg *ir=
q_gpio_cfg2 =3D &cs35l41->pdata.irq_config2;
6450ef55905688 David Rhodes   2021-09-07  1099  	int irq_pol =3D IRQF_TRIGG=
ER_NONE;
6450ef55905688 David Rhodes   2021-09-07  1100  =

fe1024d50477be Charles Keepax 2021-09-14  1101  	regmap_update_bits(cs35l41=
->regmap, CS35L41_GPIO1_CTRL1,
fe1024d50477be Charles Keepax 2021-09-14  1102  			   CS35L41_GPIO_POL_MASK=
 | CS35L41_GPIO_DIR_MASK,
fe1024d50477be Charles Keepax 2021-09-14 @1103  			   irq_gpio_cfg1->irq_po=
l_inv << CS35L41_GPIO_POL_SHIFT |
fe1024d50477be Charles Keepax 2021-09-14  1104  			   !irq_gpio_cfg1->irq_o=
ut_en << CS35L41_GPIO_DIR_SHIFT);
fe1024d50477be Charles Keepax 2021-09-14  1105  =

fe1024d50477be Charles Keepax 2021-09-14  1106  	regmap_update_bits(cs35l41=
->regmap, CS35L41_GPIO2_CTRL1,
fe1024d50477be Charles Keepax 2021-09-14  1107  			   CS35L41_GPIO_POL_MASK=
 | CS35L41_GPIO_DIR_MASK,
fe1024d50477be Charles Keepax 2021-09-14  1108  			   irq_gpio_cfg1->irq_po=
l_inv << CS35L41_GPIO_POL_SHIFT |
fe1024d50477be Charles Keepax 2021-09-14  1109  			   !irq_gpio_cfg1->irq_o=
ut_en << CS35L41_GPIO_DIR_SHIFT);
fe1024d50477be Charles Keepax 2021-09-14  1110  =

fe1024d50477be Charles Keepax 2021-09-14  1111  	regmap_update_bits(cs35l41=
->regmap, CS35L41_GPIO_PAD_CONTROL,
fe1024d50477be Charles Keepax 2021-09-14  1112  			   CS35L41_GPIO1_CTRL_MA=
SK | CS35L41_GPIO2_CTRL_MASK,
fe1024d50477be Charles Keepax 2021-09-14  1113  			   irq_gpio_cfg1->irq_sr=
c_sel << CS35L41_GPIO1_CTRL_SHIFT |
fe1024d50477be Charles Keepax 2021-09-14  1114  			   irq_gpio_cfg2->irq_sr=
c_sel << CS35L41_GPIO2_CTRL_SHIFT);
6450ef55905688 David Rhodes   2021-09-07  1115  =

6450ef55905688 David Rhodes   2021-09-07  1116  	if ((irq_gpio_cfg2->irq_sr=
c_sel =3D=3D
6450ef55905688 David Rhodes   2021-09-07  1117  			(CS35L41_GPIO_CTRL_ACTV_=
LO | CS35L41_VALID_PDATA)) ||
6450ef55905688 David Rhodes   2021-09-07  1118  		(irq_gpio_cfg2->irq_src_s=
el =3D=3D
6450ef55905688 David Rhodes   2021-09-07  1119  			(CS35L41_GPIO_CTRL_OPEN_=
INT | CS35L41_VALID_PDATA)))
6450ef55905688 David Rhodes   2021-09-07  1120  		irq_pol =3D IRQF_TRIGGER_=
LOW;
6450ef55905688 David Rhodes   2021-09-07  1121  	else if (irq_gpio_cfg2->ir=
q_src_sel =3D=3D
6450ef55905688 David Rhodes   2021-09-07  1122  			(CS35L41_GPIO_CTRL_ACTV_=
HI | CS35L41_VALID_PDATA))
6450ef55905688 David Rhodes   2021-09-07  1123  		irq_pol =3D IRQF_TRIGGER_=
HIGH;
6450ef55905688 David Rhodes   2021-09-07  1124  =

6450ef55905688 David Rhodes   2021-09-07  1125  	return irq_pol;
6450ef55905688 David Rhodes   2021-09-07  1126  }
6450ef55905688 David Rhodes   2021-09-07  1127  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1197310546365155234==--

