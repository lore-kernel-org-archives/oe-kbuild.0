Content-Type: multipart/mixed; boundary="===============1007287057962123584=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/tlv320adc3xxx.c:845:55: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Wed, 26 Jan 2022 15:39:14 +0800
Message-ID: <202201261506.aULQ6Ya2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1007287057962123584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ricard Wanderlof <ricardw@axis.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: e9a3b57efd28fe889a98171bdc1e9e0dd7eb9a50 ASoC: codec: tlv320adc3xxx=
: New codec driver
date:   5 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 weeks ago
compiler: nds32le-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/codecs/tlv320adc3xxx.c:845:55: warning: Boolean result is used=
 in bitwise operation. Clarify expression with parentheses. [clarifyConditi=
on]
         ADC3XXX_GPIO_GPO << ADC3XXX_GPIO_CTRL_CFG_SHIFT |
                                                         ^

vim +845 sound/soc/codecs/tlv320adc3xxx.c

e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  834  =

e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  835  static int adc3xxx_gpio_d=
irection_out(struct gpio_chip *chip,
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  836  				      unsigned int of=
fset, int value)
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  837  {
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  838  	struct adc3xxx *adc3xxx =
=3D gpiochip_get_data(chip);
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  839  =

e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  840  	/* Set GPIO output funct=
ion. */
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  841  	return regmap_update_bit=
s(adc3xxx->regmap,
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  842  				  adc3xxx_gpio_ctrl_r=
eg[offset],
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  843  				  ADC3XXX_GPIO_CTRL_C=
FG_MASK |
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  844  				  ADC3XXX_GPIO_CTRL_O=
UTPUT_CTRL_MASK,
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15 @845  				  ADC3XXX_GPIO_GPO <<=
 ADC3XXX_GPIO_CTRL_CFG_SHIFT |
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  846  				  !!value << ADC3XXX_=
GPIO_CTRL_OUTPUT_CTRL_SHIFT);
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  847  }
e9a3b57efd28fe8 Ricard Wanderlof 2021-12-15  848  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1007287057962123584==--

