Content-Type: multipart/mixed; boundary="===============0847475314157952254=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/cs35l41.c:1103:60: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Wed, 26 Jan 2022 10:28:14 +0800
Message-ID: <202201260938.2jmFi6mS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0847475314157952254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: fe1024d50477becf35128f3ef03bf3525a2cd140 ASoC: cs35l41: Combine adj=
acent register writes
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
compiler: nds32le-linux-gcc (GCC) 11.2.0

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
>> sound/soc/codecs/rt5682s.c:2297:40: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
      a_map.m_bp << RT5682S_PLLA_M_BP_SFT |
                                          ^
   sound/soc/codecs/rt5682s.c:2315:44: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
      b_map.sel_ps << RT5682S_PLLB_SEL_PS_SFT |
                                              ^
   sound/soc/codecs/rt5682s.c:2316:44: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
      b_map.byp_ps << RT5682S_PLLB_BYP_PS_SFT |
                                              ^
   sound/soc/codecs/rt5682s.c:2317:40: warning: Boolean result is used in b=
itwise operation. Clarify expression with parentheses. [clarifyCondition]
      b_map.m_bp << RT5682S_PLLB_M_BP_SFT |
                                          ^

vim +1103 sound/soc/codecs/cs35l41.c

6450ef559056886 David Rhodes   2021-09-07  1094  =

6450ef559056886 David Rhodes   2021-09-07  1095  static int cs35l41_irq_gpi=
o_config(struct cs35l41_private *cs35l41)
6450ef559056886 David Rhodes   2021-09-07  1096  {
6450ef559056886 David Rhodes   2021-09-07  1097  	struct cs35l41_irq_cfg *i=
rq_gpio_cfg1 =3D &cs35l41->pdata.irq_config1;
6450ef559056886 David Rhodes   2021-09-07  1098  	struct cs35l41_irq_cfg *i=
rq_gpio_cfg2 =3D &cs35l41->pdata.irq_config2;
6450ef559056886 David Rhodes   2021-09-07  1099  	int irq_pol =3D IRQF_TRIG=
GER_NONE;
6450ef559056886 David Rhodes   2021-09-07  1100  =

fe1024d50477bec Charles Keepax 2021-09-14  1101  	regmap_update_bits(cs35l4=
1->regmap, CS35L41_GPIO1_CTRL1,
fe1024d50477bec Charles Keepax 2021-09-14  1102  			   CS35L41_GPIO_POL_MAS=
K | CS35L41_GPIO_DIR_MASK,
fe1024d50477bec Charles Keepax 2021-09-14 @1103  			   irq_gpio_cfg1->irq_p=
ol_inv << CS35L41_GPIO_POL_SHIFT |
fe1024d50477bec Charles Keepax 2021-09-14  1104  			   !irq_gpio_cfg1->irq_=
out_en << CS35L41_GPIO_DIR_SHIFT);
fe1024d50477bec Charles Keepax 2021-09-14  1105  =

fe1024d50477bec Charles Keepax 2021-09-14  1106  	regmap_update_bits(cs35l4=
1->regmap, CS35L41_GPIO2_CTRL1,
fe1024d50477bec Charles Keepax 2021-09-14  1107  			   CS35L41_GPIO_POL_MAS=
K | CS35L41_GPIO_DIR_MASK,
fe1024d50477bec Charles Keepax 2021-09-14  1108  			   irq_gpio_cfg1->irq_p=
ol_inv << CS35L41_GPIO_POL_SHIFT |
fe1024d50477bec Charles Keepax 2021-09-14  1109  			   !irq_gpio_cfg1->irq_=
out_en << CS35L41_GPIO_DIR_SHIFT);
fe1024d50477bec Charles Keepax 2021-09-14  1110  =

fe1024d50477bec Charles Keepax 2021-09-14  1111  	regmap_update_bits(cs35l4=
1->regmap, CS35L41_GPIO_PAD_CONTROL,
fe1024d50477bec Charles Keepax 2021-09-14  1112  			   CS35L41_GPIO1_CTRL_M=
ASK | CS35L41_GPIO2_CTRL_MASK,
fe1024d50477bec Charles Keepax 2021-09-14  1113  			   irq_gpio_cfg1->irq_s=
rc_sel << CS35L41_GPIO1_CTRL_SHIFT |
fe1024d50477bec Charles Keepax 2021-09-14  1114  			   irq_gpio_cfg2->irq_s=
rc_sel << CS35L41_GPIO2_CTRL_SHIFT);
6450ef559056886 David Rhodes   2021-09-07  1115  =

6450ef559056886 David Rhodes   2021-09-07  1116  	if ((irq_gpio_cfg2->irq_s=
rc_sel =3D=3D
6450ef559056886 David Rhodes   2021-09-07  1117  			(CS35L41_GPIO_CTRL_ACTV=
_LO | CS35L41_VALID_PDATA)) ||
6450ef559056886 David Rhodes   2021-09-07  1118  		(irq_gpio_cfg2->irq_src_=
sel =3D=3D
6450ef559056886 David Rhodes   2021-09-07  1119  			(CS35L41_GPIO_CTRL_OPEN=
_INT | CS35L41_VALID_PDATA)))
6450ef559056886 David Rhodes   2021-09-07  1120  		irq_pol =3D IRQF_TRIGGER=
_LOW;
6450ef559056886 David Rhodes   2021-09-07  1121  	else if (irq_gpio_cfg2->i=
rq_src_sel =3D=3D
6450ef559056886 David Rhodes   2021-09-07  1122  			(CS35L41_GPIO_CTRL_ACTV=
_HI | CS35L41_VALID_PDATA))
6450ef559056886 David Rhodes   2021-09-07  1123  		irq_pol =3D IRQF_TRIGGER=
_HIGH;
6450ef559056886 David Rhodes   2021-09-07  1124  =

6450ef559056886 David Rhodes   2021-09-07  1125  	return irq_pol;
6450ef559056886 David Rhodes   2021-09-07  1126  }
6450ef559056886 David Rhodes   2021-09-07  1127  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0847475314157952254==--

